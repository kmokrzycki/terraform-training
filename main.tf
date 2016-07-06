#

# DO NOT DELETE THESE LINES!

#

# Your subnet ID is:

#

#     subnet-9e15f8f6

#

# Your security group ID is:

#

#     sg-dca200b4

#

# Your AMI ID is:

#

#     ami-74ee001b

#

# Your Identity is:

#

#     totaljobs-70efdf2ec9b086079795c442636b55fb

#

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "eu-central-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami           = "ami-74ee001b"
  instance_type = "t2.micro"
  count         = 1

  subnet_id              = "subnet-9e15f8f6"
  vpc_security_group_ids = ["sg-dca200b4"]

  tags {
    Identity = "totaljobs-70efdf2ec9b086079795c442636b55fb"
    Owner    = "Kris"
    Company  = "Jobsite"
  }
}

output "public_ip" {{
  value = "${join(", ",aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ",aws_instance.web.*.public_dns)}"
}
