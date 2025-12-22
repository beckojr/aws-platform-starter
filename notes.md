18.12

- From the console, create the AWS organization using the root account
- Enable IAM Identity Center, create admin user and group
- Create a permission set with Admin policies
- Assign the admin group to the management account of the organization with admin permission set

Configure aws CLI with Identity Center

- run `aws configure sso` to launch the wizard
- Enter the following info
  - Session name
  - SSO URL Starter
  - SSO region
  - SSO registration scopes

Once done, tofu automatically picks it up to authenticate and deploy resources.

SSO URL Starter and SSO region depends on the permission set that you use for your environment.
In the login page, select access keys of your permission set. In the popup, you'll have the values for SSO URL Starter and SSO region.

19.12

The management resources bootstraping must create the required roles for
