package confluent.allow_topic_custom_retention_size

import future.keywords.in

# ------------------------------------------------------------
# Name:     allow_topic_custom_retention_size.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Allow topics to specify the retention period, given
# a minimum and maximum range
# TODO: This is a fixed range of retention periods for all
# topics, but there may be cases where some prefixed topics
# can have different ranges. Maybe introduce this if there 
# demand.
# ------------------------------------------------------------

topic_retention_size_min := 1
topic_retention_size_max := 1048576

# `or` condition
is_bad(topic) {
  to_number(topic.change.after.config["retention.bytes"]) < topic_retention_size_min
}
is_bad(topic) {
  to_number(topic.change.after.config["retention.bytes"]) > topic_retention_size_max
}

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All new topics
  rc = resource_changes[_][_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # If using the default, retention.bytes is not defined
  # Defaults are always allowed to no need to check further
  # Check if retention.bytes is defined, pass if not defined
  rc.change.after.config["retention.bytes"]
  # now check if retention.bytes fails either condition
  is_bad(rc)

  # Deny
  msg := sprintf(
    "Topic (%s) does not meet retention.bytes requirements",
    [rc.change.after.topic_name],
  )
}
