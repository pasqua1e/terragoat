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
    git_commit           = "2efce009a7ced32f46e012861f0ff2aaa005e2e2"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 16:20:19"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "f1143d87-aaf4-4ad6-b303-a145b2f66c35"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "2efce009a7ced32f46e012861f0ff2aaa005e2e2"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 16:20:19"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "b684375d-9f34-46f0-82c9-b83f56e9d661"
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
