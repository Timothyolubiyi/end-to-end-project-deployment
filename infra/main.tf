resource "aws_instance" "ansible-controller" {

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Timtee"
  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("ansible.sh")
  tags = {
    Name = "${var.env_prefix}-ansible-controller"
  }
}
resource "aws_instance" "remote-jenkins" {

  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Timtee"
  subnet_id                   = aws_subnet.myapp-subnet-2.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("jenkins.sh")

  tags = {
    Name = "${var.env_prefix}-remote-jenkins"
  }
}
resource "aws_instance" "kubernetes-server" {
  #ami                         = data.aws_ami.latest-amazon-linux-image.id
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Timtee"
  subnet_id                   = aws_subnet.myapp-subnet-3.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  user_data                   = file("install.sh")

  tags = {
    Name = "${var.env_prefix}-kubernetes-server"
  }
}
