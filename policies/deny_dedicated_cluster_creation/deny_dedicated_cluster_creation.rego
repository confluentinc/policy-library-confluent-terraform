package confluent

# ------------------------------------------------------------
# Name:     deny_dedicated_cluster_creation.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Prevent the creation of a dedicated cluster, but allow
# standard and basic
# ------------------------------------------------------------

deny[msg] {
  # All new cluster configs
  rc = input.plan.resource_changes[_]
  rc.type == "confluent_kafka_cluster"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # No cluster configs should contain non-empty dedicated stanza,
  # cku must also be defined, [{"cku": 1}]
  rc.change.after.dedicated[0].cku

  # Deny
  msg := sprintf(
    "Cluster Config (%s) is defined as a dedicated cluster",
    [rc.name]
  )
}
