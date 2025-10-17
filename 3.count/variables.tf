#1. command line variables   
#2. .tfvars
#3. ENV variable
#4. default variable values




variable "ami_id" {
    type = string
    default = "ami-0341d95f75f311023"
    description = "AMAZON LINUX AMI ID"
}

variable "instance_type" {
    type = string
    default = "t3.small"
}


variable "instance_names" {
    type = list
    default = ["db","backned","frontend","load"]
  
}



variable "sg_name" {
    default = "allow_SSH"
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
   default = 22
}

variable "protocal" {
    default = "tcp"
}

variable "allowed_cidrs" {
    type = list(string)
    default = ["0.0.0.0/0"]
}