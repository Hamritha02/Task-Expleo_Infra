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
  //create_iam_instance_profile = false
  iam_instance_profile = "arn:aws:iam::002936919350:instance-profile/Task-IAMaccess"
   
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }   
}
    
   
