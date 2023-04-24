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

deny[msg] {
  # All new topics
  rc = input.plan.resource_changes[_]
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
