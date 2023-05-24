package confluent.deny_auto_create_topics

# ------------------------------------------------------------
# Name:     deny_auto_create_topics.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Do not allow cluster configuration to enable
# auto.create.topics
# ------------------------------------------------------------

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All new cluster configs
  rc = resource_changes[_][_]
  rc.type == "confluent_kafka_cluster_config"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # No cluster configs should contain enable auto.reate.topics.enable
  rc.change.after.config["auto.create.topics.enable"] == "true"

  # Deny
  msg := sprintf(
    "Cluster Config (%s) contains auto.create.topics.enable = true",
    [rc.address]
  )
}
