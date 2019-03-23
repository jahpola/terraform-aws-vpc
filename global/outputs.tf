output "bastion-sg" {
  value = "${module.bastion-instance-sg.this_security_group_id}"
}

output "alerts-nonprod" {
  value = "${aws_sns_topic.alerts_nonprod.arn}"
}

output "alerts-prod" {
  value = "${aws_sns_topic.alerts_prod.arn}"
}

output "nat-sg" {
  value = "${aws_security_group.from-nat.id}"
}
