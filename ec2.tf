module "Jenkins" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "Jenkins"

  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  key_name               = "loc"
  monitoring             = true
  vpc_security_group_ids = [module.bastion.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
