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
    git_commit           = "79f5e352df8b678c797eccb0f44fba6003b516cc"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 18:36:29"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "0b54c47e-b4fc-4429-a0d1-ebf9e3705af4"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "79f5e352df8b678c797eccb0f44fba6003b516cc"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-09-21 18:36:29"
    git_last_modified_by = "31853954+pasqua1e@users.noreply.github.com"
    git_modifiers        = "31853954+pasqua1e"
    git_org              = "pasqua1e"
    git_repo             = "terragoat"
    yor_trace            = "b17a8e94-dc61-449a-9981-18df937bf3a9"
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
