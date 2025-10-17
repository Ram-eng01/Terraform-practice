resource "aws_instance" "app" {
  
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = var.tags  

}
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

# this is block
ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.protocal
    cidr_blocks      = var.allowed_cidrs
    
  }

  egress {
    from_port        = 0 # from 0 to 0 means, opening all protocols
    to_port          = 0
    protocol         = "-1" # -1 all protocals
    cidr_blocks      = ["0.0.0.0/0"]
  }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Ram"
    }

}

