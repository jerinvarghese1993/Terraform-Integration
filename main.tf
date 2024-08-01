provider "aws" {
    region = "us-east-1"
}
# Resource to create an EC2 instance
resource "aws_instance" "ubuntu_instance" {
    count = var.instance-count
  ami           = var.instance-ami
  instance_type = var.instance-aws  # Change this as needed
  vpc_security_group_ids = [var.instance-sg]
  

  tags = {
    Name = "instance-${count.index}"
  }
}

# Output the public IP addresses of the instances
output "instance_public_ip" {
  value = aws_instance.ubuntu_instance.*.public_ip
}

