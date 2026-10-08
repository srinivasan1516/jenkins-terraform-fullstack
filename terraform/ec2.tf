resource "aws_instance" "fullstack_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = data.aws_subnets.default.ids[0]

  vpc_security_group_ids = [
    aws_security_group.fullstack_sg.id
  ]

  user_data = file("${path.module}/user_data.sh")

  user_data_replace_on_change = true

  tags = {
    Name = var.project_name
  }
}
