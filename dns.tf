#

# DO NOT DELETE THESE LINES!

#

# Your DNSimple email is:

#

#     sethvargo+terraform@gmail.com

#

# Your DNSimple token is:

#

#     sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF

#

# Your Identity is:

#

#     totaljobs-70efdf2ec9b086079795c442636b55fb

#

provider "dnsimple" {
  token = "sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF"
  email = "sethvargo+terraform@gmail.com"
}

resource "dnsimple_record" "example" {
  domain = "terraform.rocks"
  type   = "A"
  name   = "SirK79"
  value  = "${aws_instance.web.0.public_ip}"
}
