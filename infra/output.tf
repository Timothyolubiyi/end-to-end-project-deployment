output "ansible-controler_ip" {
  value = aws_instance.ansible-controller.public_ip
}
output "remote-jenkins-ip" {
  value = aws_instance.remote-jenkins.public_ip
}
output "kubernetes-server-ip" {
  value = aws_instance.kubernetes-server.public_ip
}