package confluent.allow_apikey_owned_by_service_account

# ------------------------------------------------------------
# Name:     allow_apikey_owned_by_service_account.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new API keys should be owned by Service Accounts, not
# User accounts.
# ------------------------------------------------------------

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All new API keys
  rc = resource_changes[_][_]
  rc.type == "confluent_api_key"
  rc.mode == "managed"
  rc.change.actions[_] == "create"
  apikey = rc.change.after.description

  # Keep API keys owned by user accounts
  owner := rc.change.after.owner[_]
  owner.kind == "User"

  print(apikey, owner.id)
  # Deny
  msg := sprintf(
    "API Key (%s) is owned by a User account (%s)",
    [apikey, owner.id]
  )
}

