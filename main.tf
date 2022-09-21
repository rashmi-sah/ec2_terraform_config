
resource "null_resource" "do_nothing" {
  count = 1

  connection {
    type="ssh"
    user = "ubuntu"
    host="54.91.187.112"
    private_key=file("/home/runner/work/ec2_terraform_config_remote_exec/ec2_terraform_config_remote_exec/prv_key.ppk")
    #agent = true
    timeout = "4m"
  }

  provisioner "file" {
    source      = "/home/runner/work/ec2_terraform_config_remote_exec/ec2_terraform_config_remote_exec/install_docker.sh"
    destination = "/tmp/install_docker.sh"
  }
  
  provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner > hello.txt",
      "echo hello Rashmi >> hello.txt",
      "sh install_docker.sh >> output_install_docker.txt"
    ]
  }
}

