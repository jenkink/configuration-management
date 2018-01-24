provider "aws" 

resource "aws_instance" "example" {
  ami           = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  provisioner "local-exec"{
      command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
  }
  depends_on = ["aws_s3_bucket.example"]
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
  depends_on = ["aws_instance.example"]
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}

resource "aws_s3_bucket" "example" {
  bucket = "kj-profile-terraform"
  acl    = "private"
}