resource "aws_instance" "app" {
  
  ami           = "ami-0341d95f75f311023"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]

  tags = {
    Name = "HelloWorld"
  }
}  

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing ssh access"
ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
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

