resource "yandex_compute_instance" "db" {

  name = "${var.instance_db_name}"
  labels = {
    tags = "${var.instance_db_name}"
  }


  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }


  resources {
    cores  = 2
    memory = 2

  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }

  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }


 # provisioner "remote-exec" {
 #   inline = [
 #     "sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf",
 #     "sudo systemctl restart mongod"
 #   ]
 # }


  connection {
    type  = "ssh"
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)

  }



}
