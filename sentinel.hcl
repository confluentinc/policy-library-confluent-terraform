policy "allow_apikey_valid_name" {
  source = "./policies/allow_apikey_valid_name/allow_apikey_valid_name.sentinel"
  enforcement_level = "advisory"
}

policy "allow_approved_rbac" {
  source = "./policies/allow_approved_rbac/allow_approved_rbac.sentinel"
  enforcement_level = "advisory"
}

policy "allow_approved_resources" {
  source = "./policies/allow_approved_resources/allow_approved_resources.sentinel"
  enforcement_level = "advisory"
}

policy "allow_clusters_in_approved_clouds" {
  source = "./policies/allow_clusters_in_approved_clouds/allow_clusters_in_approved_clouds.sentinel"
  enforcement_level = "advisory"
}

policy "allow_clusters_in_approved_regions" {
  source = "./policies/allow_clusters_in_approved_regions/allow_clusters_in_approved_regions.sentinel"
  enforcement_level = "advisory"
}

policy "allow_connectors_approved" {
  source = "./policies/allow_connectors_approved/allow_connectors_approved.sentinel"
  enforcement_level = "advisory"
}

policy "allow_service_account_valid_name" {
  source = "./policies/allow_service_account_valid_name/allow_service_account_valid_name.sentinel"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_partition_count" {
  source = "./policies/allow_topic_custom_partition_count/allow_topic_custom_partition_count.sentinel"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_retention_period" {
  source = "./policies/allow_topic_custom_retention_period/allow_topic_custom_retention_period.sentinel"
  enforcement_level = "advisory"
}

policy "allow_topic_custom_retention_size" {
  source = "./policies/allow_topic_custom_retention_size/allow_topic_custom_retention_size.sentinel"
  enforcement_level = "advisory"
}

policy "allow_topic_valid_name" {
  source = "./policies/allow_topic_valid_name/allow_topic_valid_name.sentinel"
  enforcement_level = "advisory"
}

policy "deny_dedicated_cluster_creation" {
  source = "./policies/deny_dedicated_cluster_creation/deny_dedicated_cluster_creation.sentinel"
  enforcement_level = "advisory"
}

policy "deny_topic_deletion" {
  source = "./policies/deny_topic_deletion/deny_topic_deletion.sentinel"
  enforcement_level = "advisory"
}
