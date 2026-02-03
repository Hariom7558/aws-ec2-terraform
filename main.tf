resource "aws_instance" "terraform_ubuntu" {
  ami           = "ami-0f58b397bc5c1f2e8"  # Ubuntu 22.04 LTS
  instance_type = "t3.micro"
  key_name      = "Manual-key"            # Make sure this key exists in AWS

  tags = {
    Name = "terraform-ubuntu-ec2"
  }
}
