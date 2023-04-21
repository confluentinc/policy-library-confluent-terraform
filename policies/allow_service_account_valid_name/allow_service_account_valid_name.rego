package confluent

# ------------------------------------------------------------
# Name:     allow_service_account_valid_name.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new service accounts should match a specified regex
# ------------------------------------------------------------

service_name_regex := "^app-.*$"


deny[msg] {
  # All new service accounts
  rc = input.resource_changes[_]
  rc.type == "confluent_service_account"
  rc.mode == "managed"
  rc.change.actions[_] == "create"

  # Keep API keys that don't match the regex
  valid_name := regex.match(service_name_regex, rc.change.after.display_name)
  valid_name == false

  # Deny
  msg := sprintf(
    "Service Account (%s) does not match the service_name_regex",
    [rc.change.after.display_name]
  )
}
