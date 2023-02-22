module "Node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Node-server"    
  
  ami                    = var.image_id
  instance_type          = var.instance_type    
  key_name               = "node"
  monitoring             = true
  vpc_security_group_ids = [module.node-app.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  //create_iam_instance_profile = true
 iam_role_description   = "IAM role for EC2 instance"
 iam_role_path          = "arn:aws:iam::002936919350:instance-profile/Task-IAMaccess"
   
 module "iam_assumable_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

  trusted_role_arns = [
    "arn:aws:iam::002936919350:role/Task-IAMaccess"
    ]

  create_role = true

  role_name         = "Task_IAMaccess"
  role_requires_mfa = true

  custom_role_policy_arns = [
    "arn:aws:iam::002936919350:role/Task-IAMaccess",
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
    "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess",
  ]
  number_of_custom_role_policy_arns = 4
}
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }   
}
    
   
