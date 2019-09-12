provider "aws" {
  region = "${var.region}"
}


resource "aws_launch_configuration" "default" {
  name_prefix         = "sagar-asg-conf"
  image_id            = "${var.web_ami}"
  instance_type       = "${var.ec2_instance_type}"
  key_name            = "${var.ec2_keyname}"
  security_groups     = ["${var.security_group}"]
}

resource "aws_autoscaling_group" "default" {
  name                           = "sagar-asg"
  max_size                       = "${var.max_size}"
  min_size                       = "${var.min_size}"
  desired_capacity               = "${var.desired_capacity}"
 # health_check_grace_period     = 300
 # health_check_type             = "ELB"
 # load_balancers                = ["${aws_elb.my_vpc_elb.name}"]
  force_delete                   = true
  launch_configuration           = "${aws_launch_configuration.default.name}"
  vpc_zone_identifier            = ["${var.subnet}"]
}

