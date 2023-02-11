module "Jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins"

  ami                    = "ami-00874d747dde814fa"
  instance_type          = "t2.micro"
  key_name               = "god1"
  monitoring             = true
  vpc_security_group_ids = [module.Private_SG.security_group_id]
  subnet_id              = module.vpc.private_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
