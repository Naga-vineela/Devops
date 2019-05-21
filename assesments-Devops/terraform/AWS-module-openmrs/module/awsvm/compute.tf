resource "aws_instance" "web" {
  ami           = "${var.aws_ami}"
  instance_type = "${var.aws_instancetype}"

  subnet_id = "${aws_subnet.SubnetTF.id}"

  associate_public_ip_address = true
  key_name                    = "${var.aws_key}"
  vpc_security_group_ids    = ["${aws_security_group.allow_all.id}"]
  connection {
    type     = "${var.aws_connectiontype}"
    user     = "${var.aws_user}"
    private_key = "${file("./mynewkeypair.pem")}"
  }
  provisioner "file" {
  source      = "./openmrs.yml"
  destination = "/home/ubuntu/openmrs.yml"

  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt-add-repository ppa:ansible/ansible -y",
      "sudo apt-get update -y",
      "sudo apt-get install ansible -y",
      "sleep 50",
      "cd /home/ubuntu",
      "sudo ansible-playbook openmrs.yml"]
    }
  
}


