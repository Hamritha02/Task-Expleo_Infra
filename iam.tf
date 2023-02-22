 module "iam-role" {
      source              = "clouddrove/iam-role/aws"
      version             = "1.3.0"

      name                = "Task-IAMaccess"
      application         = "clouddrove"
      environment         = "dev"
      label_order         = ["environment", "name"]
      assume_role_policy  = data.aws_iam_policy_document.default.json
      managed_policy_arns = arn:aws:iam::002936919350:instance-profile/Task-IAMaccess
      policy_enabled      = true
      policy              = data.aws_iam_policy_document.iam-policy.json
    }

      data "aws_iam_policy_document" "default" {
      statement {
      effect  = "Allow"
      actions = ["sts:AssumeRole"]
      principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
      }
      }
    }

      data "aws_iam_policy_document" "iam-policy" {
      statement {
      actions = [
      "ssm:UpdateInstanceInformation",
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"    ]
      effect    = "Allow"
      resources = ["*"]
      }
    }
