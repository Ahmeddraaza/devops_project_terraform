resource "aws_launch_template" "app_lt" {
  name_prefix   = "app-template"
  image_id      = data.aws_ami.amazon_linux_2.id 
  instance_type = "t2.micro"
  key_name      = "devops-key"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ec2_sg.id]
  }

  user_data = base64encode(file("user_data.sh"))
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = ["subnet-014305d3713453d06", "subnet-021fd075d1faedfb1", "subnet-0ae84b4dee2de0fa7"]

  launch_template {
    id      = aws_launch_template.app_lt.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.app_tg.arn]

  tag {
    key                 = "Name"
    value               = "asg-instance"
    propagate_at_launch = true
  }
}
