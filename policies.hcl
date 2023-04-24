# Testing format of policy stanzas

policy "./policies/allow_apikey_owned_by_service_account/allow_apikey_owned_by_service_account.rego" {
  query = "data.confluent.allow_apikey_owned_by_service_account.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_apikey_valid_name/allow_apikey_valid_name.rego" {
  query = "data.confluent.allow_apikey_valid_name.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_approved_rbac/allow_approved_rbac.rego" {
  query = "data.confluent.allow_approved_rbac.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_approved_resources/allow_approved_resources.rego" {
  query = "data.confluent.allow_approved_resources.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_clusters_in_approved_clouds/allow_clusters_in_approved_clouds.rego" {
  query = "data.confluent.allow_clusters_in_approved_cloud.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_clusters_in_approved_regions/allow_clusters_in_approved_regions.rego" {
  query = "data.confluent.allow_clusters_in_approved_regions.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_connectors_approved/allow_connectors_approved.rego" {
  query = "data.confluent.allow_connectors_approved.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_service_account_valid_name/allow_service_account_valid_name.rego" {
  query = "data.confluent.allow_service_account_valid_name.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_partition_count/allow_topic_custom_partition_count.rego" {
  query = "data.confluent.allow_topic_custom_partition_count.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_retention_period/allow_topic_custom_retention_period.rego" {
  query = "data.confluent.allow_topic_custom_retention_period.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_custom_retention_size/allow_topic_custom_retention_size.rego" {
  query = "data.confluent.allow_topic_custom_retention_size.deny"
  enforcement_level = "advisory"
}

policy "./policies/allow_topic_valid_name/allow_topic_valid_name.rego" {
  query = "data.confluent.allow_topic_valid_name.deny"
  enforcement_level = "advisory"
}

policy "deny_dedicated_cluster_creation" {
  query = "data.confluent.deny_dedicated_cluster_creation.deny"
  enforcement_level = "mandatory"
}

policy "deny_topic_deletion" {
  query = "data.confluent.deny_topic_deletion.deny"
  enforcement_level = "advisory"
}
