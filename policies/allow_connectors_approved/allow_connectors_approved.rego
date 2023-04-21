package confluent

# ------------------------------------------------------------
# Name:     allow_connectors_approved.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Provide a list of Connectors that may be created. Connectors
# not in this last may not be created.
# ------------------------------------------------------------

# Array of approved Connectors
approved_connectors := [ "xDatagenSource", "S3_SINK", "SqlServerCdcSource" ]

deny[msg] {
  # All new connectors
  rc = input.resource_changes[_]
  rc.type == "confluent_connector"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep connectors that aren't in the approved list
  not rc.change.after.config_nonsensitive["connector.class"] in approved_connectors

  # Deny
  msg := sprintf(
    "New Connector (%s) using non-approved connector (%s)",
    [
     rc.change.after.config_nonsensitive.name,
     rc.change.after.config_nonsensitive["connector.class"]
    ]
  )
}