package confluent.deny_auto_create_topics

# ------------------------------------------------------------
# Name:     deny_auto_create_topics.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Do not allow cluster configuration to enable
# auto.create.topics
# ------------------------------------------------------------

deny[msg] {
  # All new cluster configs
  rc = input.plan.resource_changes[_]
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
