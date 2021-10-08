resource "yandex_compute_instance" "app" {


  name = "${var.instance_app_name}"
  labels = {
    tags = "${var.instance_app_name}"
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
      image_id = var.app_disk_image
    }

  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  provisioner "file" {
    source      = "${path.module}/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {

    inline = [
      "sudo sed -i s/127.0.0.1/'${var.db_url}'/g /tmp/puma.service"
    ]
  }



  provisioner "remote-exec" {
    script = "${path.module}/deploy.sh"
  }


  connection {
    type  = "ssh"
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.private_key_path)

  }

}
