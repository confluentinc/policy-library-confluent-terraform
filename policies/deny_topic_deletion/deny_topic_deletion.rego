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

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All deleted topics
  rc = resource_changes[_][_]
  rc.type == "confluent_kafka_topic"
  rc.mode == "managed"
  rc.change.actions[_] == "delete"

  # Deny
  msg := sprintf(
    "Cannot deletion of topic (%s)",
    [rc.name]
  )
}
