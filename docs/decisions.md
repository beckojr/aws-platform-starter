# AWS Platform Starter Design Decisions

AWS Platform Starter is production-ready lab project that spins up a ready to use platform with guardrails to deploys AWS resources.

This documents records the design decisions made during its conception.

## 1. Organizations

Following AWS best-practices, the platform leverages the AWS recommended multi-account framework. The use of the multi-account framework provides the following benefits in this use case:

- Separation of duties between accounts: each account containing specialized workload that serve the same kind of purpose
- Workloads and data isolation: using the principle of least privilege, the right level of access is provided to the principals that need it
- Incident blast-radius reduction: Incident in an account is constrained within that account and doesn't affect other accounts

## 2. Organizational Units

Three AWS Organizational Units organize the accounts. This provides a higher level of scoping to apply service control policies.

The following Organizational Units are created:

- Management OU: regroups accounts that contains shared resources and control pane of the platform
- Development OU: stores development accounts
- Production OU: contains production accounts

## 3. Accounts

### Management OU

#### Hub Account

Home of shared network services and resources. The main entry point for on-premises or multi-cloud connection.

**Resources**

| Resource            | Usage                                                                                                                                                    |
| ------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| AWS Transit Gateway | Connection point between the VPCs. Also can serve to connect to on-premises or multi-cloud setup                                                         |
| Development VPC     | Shared VPC that defines the networking structure and rules of the development environments. Subnets are created and used by accounts for their workloads |
| Production VPC      | Shared VPC that defines the networking structure and rules of the production environments. Subnets are created and used by accounts for their workloads  |
