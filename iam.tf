module "iam-role" {
      source              = "clouddrove/iam-role/aws"
      version             = "1.3.0"

      name                = "iam-role"
      environment         = "dev"  
      label_order         = ["environment", "name"]
      assume_role_policy  = data.aws_iam_policy_document.default.json
      managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess",
                             "arn:aws:iam::aws:policy/AdministratorAccess",
                             "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
                            ]
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
      "ecr-public:*",
      "sts:GetServiceBearerToken" ]
      effect = "Allow"
      resources = ["*"]
      }
      }
