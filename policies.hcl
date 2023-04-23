# Testing format of policy stanzas

policy "must-fail-1.rego" {
  query = "data.confluent.deny"
  enforcement_level = "mandatory"
}

policy "policies/must-fail-2.rego" {
  query = "data.confluent.deny"
  enforcement_level = "mandatory"
}

policy "policies/must-fail-3/must-fail-3.rego" {
  query = "data.confluent.deny"
  enforcement_level = "mandatory"
}

policy "policies/must-fail-4/must-fail-4" {
  query = "data.confluent.deny"
  enforcement_level = "mandatory"
}






policy "./policies/allow_apikey_owned_by_service_account/allow_apikey_owned_by_service_account.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_apikey_valid_name/allow_apikey_valid_name.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_approved_rbac/allow_approved_rbac.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_approved_resources/allow_approved_resources.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_clusters_in_approved_clouds/allow_clusters_in_approved_clouds.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_clusters_in_approved_regions/allow_clusters_in_approved_regions.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_connectors_approved/allow_connectors_approved.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_service_account_valid_name/allow_service_account_valid_name.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_partition_count/allow_topic_custom_partition_count.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_retention_period/allow_topic_custom_retention_period.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_retention_size/allow_topic_custom_retention_size.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_valid_name/allow_topic_valid_name.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/deny_dedicated_cluster_creation/deny_dedicated_cluster_creation.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}

policy "./policies/deny_topic_deletion/deny_topic_deletion.rego" {
  query = "data.confluent.deny"
  enforcement_level = "advisory"
}
