module "Jenkins" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Jenkins-SG"
  description = "Security group for ssh for custom ports open in VPC"
  vpc_id      = module.vpc.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
]
egress_rules                                             = ["all-all"]
  egress_cidr_blocks                                       = ["0.0.0.0/0"]
}
