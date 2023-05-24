package confluent.allow_connectors_approved

import future.keywords.in

# ------------------------------------------------------------
# Name:     allow_connectors_approved.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# Provide a list of Connectors that may be created. Connectors
# not in this last may not be created.
# ------------------------------------------------------------

# Array of approved Connectors
approved_connectors := [ "DatagenSource", "S3_SINK", "SqlServerCdcSource" ]

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All new connectors
  rc = resource_changes[_][_]
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
