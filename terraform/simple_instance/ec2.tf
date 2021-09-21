provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "9c10b5288113a7c615d881f76de27658265502eb"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 18:42:12"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "c98b8009-e107-4475-a4b1-a35dfa246ecb"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "9c10b5288113a7c615d881f76de27658265502eb"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 18:42:12"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "b22f3c9a-698d-4ddf-952c-8e4a3e4cd1cc"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
