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
  
    create_iam_instance_profile = true
  iam_role_description        = "IAM role for EC2 instance"
  iam_role_policies = {
    AdministratorAccess = "arn:aws:iam::aws:policy/AdministratorAccess"
    AmazonEC2FullAccess = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
    EC2InstanceProfileForImageBuilderECRContainerBuilds = "arn:aws:iam::aws:policy/EC2InstanceProfileForImageBuilderECRContainerBuilds"
    AmazonElasticContainerRegistryPublicFullAccess = "arn:aws:iam::aws:policy/AmazonElasticContainerRegistryPublicFullAccess"
  }
   
  tags = { 
    Terraform   = "true"
    Environment = "dev"
  }   
}
    
   
