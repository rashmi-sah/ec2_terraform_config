
resource "null_resource" "do_nothing" {
  count = 1

  connection {
    type="ssh"
    user = "ubuntu"
    host="54.159.111.52"
    private_key=file("/home/runner/work/ec2_terraform_config_remote_exec/ec2_terraform_config_remote_exec/prv_key.ppk")
    #agent = true
    timeout = "4m"
  }

  provisioner "file" {
    source      = "/home/runner/work/ec2_terraform_config_remote_exec/ec2_terraform_config_remote_exec/install_python.sh"
    destination = "/tmp/install_python.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner > hello.txt",
      "echo hello Rashmi >> hello.txt",
      "sh /tmp/install_python.sh >> /tmp/output_install_python.txt"
    ]
  }
}

