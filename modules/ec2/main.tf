# create a single EC2 instance

resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.aws_amzn_graviton.id
  instance_type = var.environment == "prod" ? "m5.large" : "t3.micro"
  key_name      = var.key_name
  tags          = local.tags
}