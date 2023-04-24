package confluent.deny_topic_deletion

# ------------------------------------------------------------
# Name:     deny_topic_deletion.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Prevent any topics from being deleted. Although it is
# possible in terraform to include
#     lifecycle {
#       prevent_destroy = true
#     }
# in order to prevent deletion, this can be removed from 
# the config and result in topic deletion.
# This policy can act as an additional safeguard.
# ------------------------------------------------------------

deny[msg] {
  # All deleted topics
  rc = input.plan.resource_changes[_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "delete"

  # Deny
  msg := sprintf(
    "Cannot deletion of topic (%s)",
    [rc.name]
  )
}
