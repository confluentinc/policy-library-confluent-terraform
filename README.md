# Confluent Cloud Sentinel Policies for Terraform

This library, provides prescriptive Sentinel policies that can be used to
establish well managed Terraform configuration for Confluent Cloud resources.
Terraform Cloud/Enterprise users can use the policies in this library to
establish an initial policy-as-code framework as they onboard new and
additional use-cases in Confluent Cloud.

> **NOTE:**
>
> This Policy Library is not an exhaustive list of all of possible policies for
> Confluent Cloud configuration.  If you have questions, comments, or have
> identified ways for us to improve this library, please create [a new GitHub
> issue](https://github.com/confluentinc/policy-library-confluent-cloud-terraform/issues/new/choose).
>
> We also welcome any contributions that improve the quality of this library!
> To learn more about contributing and suggesting changes to this library,
> refer to the [contributing
> guide](https://github.com/confluentinc/policy-library-confluent-cloud-terraform/blob/main/CONTRIBUTING.md).

## Policies included

- All new API Keys should be owned by Service Accounts, not Users ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_apikey_owned_by_service_account) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_apikey_owned_by_service_account))
- API Keys should have a valid name ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_apikey_valid_name) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_apikey_valid_name))
- Only approved RBAC Roles may be assigned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_approved_rbac) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_approved_rbac))
- Only approved resources may be provisioned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_approved_resources) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_approved_resources))
- New clusters should only be created in specified cloud providers ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_clusters_in_approved_clouds) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_clusters_in_approved_clouds))
- New clusters should only be created in specified cloud regions ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_clusters_in_approved_regions) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_clusters_in_approved_regions))
- Only specified Connectors may be provisioned ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_connectors_approved) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_connectors_approved))
- All new Service Accounts should have a valid and descriptive name ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_service_account_valid_name) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_service_account_valid_name))
- Topics should have a partition count in a specified range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_topic_custom_partition_count) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_topic_custom_partition_count))
- Topics should have a `retention.ms` of a speficied range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_topic_custom_retention_period) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_topic_custom_retention_period))
- Topics should have a `retention.bytes` of a specified range ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_topic_custom_retention_size) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_topic_custom_retention_size))
- Topic names should follow an appropriate standard ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/allow_topic_valid_name) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/allow_topic_valid_name))
- Brokers may not create topics automatically, `auto.create.topics.enable` should be `false` ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/deny_auto_create_topics) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/deny_auto_create_topics))
- Prevent the creation of Dedicated clusters, only Basic or Standard clusters ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/deny_dedicated_cluster_creation) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/deny_dedicated_cluster_creation))
- Prevent the deletion of topics ([docs](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/docs/policies/deny_topic_deletion) | [code](https://github.com/confluentinc/policy-library-confluent-terraform/blob/main/policies/deny_topic_deletion))

---
