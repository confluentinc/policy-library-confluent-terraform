package confluent.allow_topic_valid_name

# ------------------------------------------------------------
# Name:     allow_topic_valid_name.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All topics should have a display name that matches the
# apikey_name_regex.
# ------------------------------------------------------------

# Regex for topic names
topic_name_regex := "^Owner:.*"

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
  topic_name = rc.change.after.topic_name

  # Keep topics that don't match the regex
  valid_name := regex.match(topic_name_regex, topic_name)
  valid_name == false

  # Deny
  msg := sprintf(
    "Topic (%s) does not match the topic_name_regex",
    [topic_name]
  )
}
