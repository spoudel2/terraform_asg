resource "aws_autoscaling_policy" "AddInstancesPolicy" {
  name                   = "AddInstancesPolicy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.default.name}"
}

resource "aws_autoscaling_policy" "RemoveInstancesPolicy" {
  name                   = "RemoveInstancesPolicy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = "${aws_autoscaling_group.default.name}"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-high" {
alarm_name = "sagar-cpu-alarm"
alarm_description = "sagar-cpu-alarm"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "60"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.default.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.AddInstancesPolicy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-low" {
alarm_name = "sagar-cpu-alarm-low"
alarm_description = "sagar-cpu-alarm-low"
comparison_operator = "LessThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "CPUUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "30"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.default.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.RemoveInstancesPolicy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "memory-high" {
alarm_name = "sagar-memory-alarm"
alarm_description = "sagar-memory-alarm"
comparison_operator = "GreaterThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "MemoryUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "50"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.default.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.AddInstancesPolicy.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "memory-low" {
alarm_name = "sagar-memory-alarm"
alarm_description = "sagar-memory-alarm"
comparison_operator = "LessThanOrEqualToThreshold"
evaluation_periods = "2"
metric_name = "MemoryUtilization"
namespace = "AWS/EC2"
period = "120"
statistic = "Average"
threshold = "20"
dimensions = {
"AutoScalingGroupName" = "${aws_autoscaling_group.default.name}"
}
actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.AddInstancesPolicy.arn}"]
}

