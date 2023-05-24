package confluent.allow_service_account_valid_name

# ------------------------------------------------------------
# Name:     allow_service_account_valid_name.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All new service accounts should match a specified regex
# ------------------------------------------------------------

# Service Account name RegEx
service_name_regex := "^app-.*$"

# Resource changes
#   input.resource_changes are plans created with terraform show
#   input.plan.resource_changes are planned created from Terraform Cloud
# Need to double dereference this later to access individual changes
resource_changes := { input.resource_changes }
resource_changes := { input.plan.resource_changes }

deny[msg] {
  # All new service accounts
  rc = resource_changes[_][_]
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
