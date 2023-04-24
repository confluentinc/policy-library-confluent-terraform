package confluent.allow_apikey_owned_by_service_account

# ------------------------------------------------------------
# Name:     allow_apikey_owned_by_service_account.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new API keys should be owned by Service Accounts, not
# User accounts.
# ------------------------------------------------------------

deny[msg] {
  # All new API keys
  rc = input.plan.resource_changes[_]
  rc.type == "confluent_api_key"
  rc.mode == "managed"
  rc.change.actions[_] == "create"
  apikey = rc.change.after.description

  # Keep API keys owned by user accounts
  owner := rc.change.after.owner[_]
  owner.kind == "User"

  # Deny
  msg := sprintf(
    "API Key (%s) is owned by a User account (%s)", 
    [apikey, owner.id]
  )
}

