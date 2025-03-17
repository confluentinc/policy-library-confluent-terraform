# Confluent Sentinel Policies for Terraform

This library, provides prescriptive Sentinel policies that can be used to
establish well managed Terraform configuration for Confluent resources.
Terraform Cloud/Enterprise users can use the policies in this library to
establish an initial policy-as-code framework as they onboard new and
additional use-cases in Confluent.

The policies primarily resources created and managed by the [Confluent Provider](https://registry.terraform.io/providers/confluentinc/confluent/latest).

> **NOTE:**
>
> This Policy Library is not an exhaustive list of all of possible policies for
> Confluent Cloud configuration.  If you have questions, comments, or have
> identified ways for us to improve this library, please create [a new GitHub
> issue](https://github.com/confluentinc/policy-library-confluent-terraform/issues/new/choose).
>
> We also welcome any contributions that improve the quality of this library!
> To learn more about contributing and suggesting changes to this library,
> refer to the [contributing
> guide](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/CONTRIBUTING.md).

## Policies included

- API Keys should have a valid name ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_apikey_valid_name.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_apikey_valid_name/allow_apikey_valid_name.sentinel))
- Only approved RBAC Roles may be assigned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_approved_rbac.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_approved_rbac/allow_approved_rbac.sentinel))
- Only approved resources may be provisioned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_approved_resources.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_approved_resources/allow_approved_resources.sentinel))
- New clusters should only be created in specified cloud providers ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_clusters_in_approved_clouds.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_clusters_in_approved_clouds/allow_clusters_in_approved_clouds.sentinel))
- New clusters should only be created in specified cloud regions ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_clusters_in_approved_regions.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_clusters_in_approved_regions/allow_clusters_in_approved_regions.sentinel))
- Only specified Connectors may be provisioned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_connectors_approved.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_connectors_approved/allow_connectors_approved.sentinel))
- All new Service Accounts should have a valid and descriptive name ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_service_account_valid_name.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_service_account_valid_name/allow_service_account_valid_name.sentinel))
- Topics should have a partition count in a specified range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_topic_custom_partition_count.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_topic_custom_partition_count/allow_topic_custom_partition_count.sentinel))
- Topics should have a `retention.ms` of a specified range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_topic_custom_retention_period.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_topic_custom_retention_period/allow_topic_custom_retention_period.sentinel))
- Topics should have a `retention.bytes` of a specified range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_topic_custom_retention_size.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_topic_custom_retention_size/allow_topic_custom_retention_size.sentinel))
- Topic names should follow an appropriate standard ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/allow_topic_valid_name.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/allow_topic_valid_name/allow_topic_valid_name.sentinel))
- Brokers may not create topics automatically, `auto.create.topics.enable` should be `false` ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/deny_auto_create_topics.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/deny_auto_create_topics/deny_auto_create_topics.sentinel))
- Prevent the creation of Dedicated clusters, only Basic or Standard clusters ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/deny_dedicated_cluster_creation.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/deny_dedicated_cluster_creation/deny_dedicated_cluster_creation.sentinel))
- Prevent the deletion of topics ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/docs/policies/deny_topic_deletion.md) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/master/policies/deny_topic_deletion/deny_topic_deletion.sentinel))

---
