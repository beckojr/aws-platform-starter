locals {
  organizational_units = {
    management = {
      tags = { env = "prod" }
    }
    development = {
      tags = { env = "dev" }
    }
    production = {
      tags = { env = "prod" }
    }
  }
  accounts = {
    hub = {
      parent = "management"
      email  = "platform-hub@outlook.com"
      tags   = { env = "prod" }
    }
    platform = {
      parent = "management"
      email  = "platform-acc@outlook.com"
      tags   = { env = "prod" }
    }
    observability = {
      parent = "management"
      email  = "platform-obs@outlook.com"
      tags   = { env = "prod" }
    }
    dev = {
      parent = "development"
      email  = "platform-dev@outlook.com"
      tags   = { env = "dev" }
    }
    prod = {
      parent = "production"
      email  = "platform-prod@outlook.com"
      tags   = { env = "prod" }
    }
  }
}

resource "aws_organizations_organizational_unit" "ous" {
  for_each  = local.organizational_units
  name      = "${each.key}-ou"
  parent_id = var.root_ou_id
  tags      = merge(each.value.tags, { project = var.project_name })
}

resource "aws_organizations_account" "accounts" {
  for_each          = local.accounts
  name              = "${each.key}-account"
  parent_id         = aws_organizations_organizational_unit.ous[each.value.parent].id
  email             = each.value.email
  close_on_deletion = true
  tags              = merge(each.value.tags, { project = var.project_name })
}

# resource "aws_iam_role" "tofu_role" {
#   for_each = local.accounts
#   name =
# }

output "ou_ids" {
  value       = { for k, v in aws_organizations_organizational_unit.ous : k => v.id }
  description = "IDs of the organization units"
}

output "account_ids" {
  value = { for k, v in aws_organizations_account.accounts : k => v.id }
}
