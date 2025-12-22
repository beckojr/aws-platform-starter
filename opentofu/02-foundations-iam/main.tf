data "aws_caller_identity" "current" {}

resource "aws_iam_role" "hub_tofu_role" {
  name = "PlatformDeploymentRole"
  assume_role_policy = core::jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
  provider = aws.hub
}

resource "aws_iam_role_policy_attachment" "hub_admin" {
  role       = aws_iam_role.hub_tofu_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  provider   = aws.hub
}

resource "aws_iam_role" "platform_tofu_role" {
  name = "PlatformDeploymentRole"
  assume_role_policy = core::jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
  provider = aws.platform
}

resource "aws_iam_role_policy_attachment" "platform_admin" {
  role       = aws_iam_role.platform_tofu_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  provider   = aws.platform
}

resource "aws_iam_role" "observability_tofu_role" {
  name = "PlatformDeploymentRole"
  assume_role_policy = core::jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      }
      Action = "sts:AssumeRole"
    }]
  })
  provider = aws.observability
}

resource "aws_iam_role_policy_attachment" "observability_admin" {
  role       = aws_iam_role.observability_tofu_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  provider   = aws.observability
}

resource "aws_iam_role" "dev_tofu_role" {
  name = "PlatformDeploymentRole"
  assume_role_policy = core::jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root", "arn:aws:iam::${var.platform_account_id}:root"]
      }
      Action = "sts:AssumeRole"
    }]
  })
  provider = aws.dev
}

resource "aws_iam_role_policy_attachment" "dev_admin" {
  role       = aws_iam_role.dev_tofu_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  provider   = aws.dev
}

resource "aws_iam_role" "prod_tofu_role" {
  name = "PlatformDeploymentRole"
  assume_role_policy = core::jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        AWS = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:root", "arn:aws:iam::${var.platform_account_id}:root"]
      }
      Action = "sts:AssumeRole"
    }]
  })
  provider = aws.prod
}

resource "aws_iam_role_policy_attachment" "prod_admin" {
  role       = aws_iam_role.prod_tofu_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  provider   = aws.prod
}
