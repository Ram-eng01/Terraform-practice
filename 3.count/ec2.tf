resource "aws_instance" "app" {

  # count = 3
  count = length(var.instance_names)
  ami           = var.ami_id
  instance_type = var.instance_names == "db" ? "t2.micro" : "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = {
    Name = var.instance_names[count.index] 
  }

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

