# lookup AMI ID based on the region

data "aws_ami" "aws_amzn_graviton" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-arm64-gp2"] # Graviton
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  owners = ["amazon"] # Replace with "self" for your account or the AWS owner ID
}

