module "awsvm" {
  source = "./module/awsvm"


  aws_access_key = "${var.aws_access_key}"
  aws_secret_key = "${var.aws_secret_key}"
  aws_region = "${var.aws_region}"
  aws_ami           = "${var.aws_ami}"
  aws_key      = "${var.aws_key}"
  aws_instancetype = "${var.aws_instancetype}"
  aws_user     = "${var.aws_user}"
  aws_VPCcidr    = "${var.aws_VPCcidr}"
  aws_subnetcidr ="${var.aws_subnetcidr}"
  aws_connectiontype="${var.aws_connectiontype}"
}

output "aws_vm_publicip"{
    value = "${format("http://%s%s",module.awsvm.publicip,":8080/openmrs/")}"
}