package confluent

import future.keywords.if
import future.keywords.in

# ------------------------------------------------------------
# Name:     allow_topic_custom_retention_period.rego
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

topic_retention_period_min := 1
topic_retention_period_max := 604800123

# `or` condition
is_bad(topic) {
  to_number(topic.change.after.config["retention.ms"]) < topic_retention_period_min
}
is_bad(topic) {
  to_number(topic.change.after.config["retention.ms"]) > topic_retention_period_max
}

deny[msg] {
  # All new topics
  rc = input.resource_changes[_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # If using the default, retention.ms is not defined
  # Defaults are always allowed to no need to check further
  # Check if retention.ms is defined, pass if not defined
  rc.change.after.config["retention.ms"]
  # now check if retention.ms fails either condition
  is_bad(rc)

  # Deny
  msg := sprintf(
    "Topic (%s) does not meet retention.ms requirements",
    [rc.change.after.topic_name],
  )
}