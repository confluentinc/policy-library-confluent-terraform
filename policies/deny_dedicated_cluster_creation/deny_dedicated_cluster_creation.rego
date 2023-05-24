package confluent.deny_dedicated_cluster_creation

# ------------------------------------------------------------
# Name:     deny_dedicated_cluster_creation.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Prevent the creation of a dedicated cluster, but allow
# standard and basic
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
  rc.type == "confluent_kafka_cluster"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # No cluster configs should contain non-empty dedicated stanza,
  # cku must also be defined, [{"cku": 1}]
  rc.change.after.dedicated[0].cku

  # Deny
  msg := sprintf(
    "Cluster Config (%s) is defined as a dedicated cluster",
    [rc.change.after.display_name]
  )
}
