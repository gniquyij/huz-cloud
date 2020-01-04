output "huz_instance_id" {
  value = "${aws_instance.huz_instance.id}"
}

output "huz_instance_public_ip" {
  value = "${aws_instance.huz_instance.public_ip}"
}
