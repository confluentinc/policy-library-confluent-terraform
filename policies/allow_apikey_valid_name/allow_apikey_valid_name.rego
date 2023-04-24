package confluent.allow_apikey_valid_name

# ------------------------------------------------------------
# Name:     allow_apikey_valid_name.rego
# Author:   Simon Duff <sduff@confluent.io>
# Provider: confluentinc/confluent
# ------------------------------------------------------------
# All api-keys should have a display name that matches the
# apikey_name_regex.
# ------------------------------------------------------------

# Regex for API key names
apikey_name_regex := "^Owner:.*"

deny[msg] {
  # All new API keys
  rc = input.plan.resource_changes[_]
  rc.type == "confluent_api_key"
  rc.mode == "managed"
  rc.change.actions[_] == "create"
  apikey = rc.change.after.description

  # Keep API keys that don't match the regex
  valid_name := regex.match(apikey_name_regex, apikey)
  valid_name == false

  # Deny
  msg := sprintf(
    "API Key (%s) does not match the apikey_name_regex",
    [apikey]
  )
}
