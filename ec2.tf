module "Node" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"
  
  name = "Node-app2"    
  
  ami                    = var.image_id
  instance_type          = var.instance_type     
  key_name               = "node"
  monitoring             = true
  vpc_security_group_ids = [module.node-app.security_group_id]
  subnet_id              = module.vpc.public_subnets[0] 
  iam_instance_profile   = "terra-jenkins-instance-profile"       

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_iam_instance_profile""instance-profile" {
  name = "terra-jenkins-instance-profile"
  role = module.iam-role.name

  }
   
  
    
   
