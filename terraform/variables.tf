variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}
variable private_key_path {
  description = "ubuntu private key"
}
variable zone_app {
  description = "Zone app"
  default     = "ru-central1-a"
}

variable "instance_app_name" {

  default = "app"
}
variable "instance_db_name" {

  default = "app"
}


variable "instance_count" {
  default = "1"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable bucket_secret_key {
  description = "Yandex Cloud bucket secret key"
  default     = ""
}

variable access_key {
  description = "Yandex Cloud access_key"
  default     = ""
}
variable tf_state_file {
  description = "Yandex Cloud tf_state_file"
  default     = "terraform.tfstate"
}

variable tf_bucket {
  description = "Yandex Cloud tf_bucket"
  default     = ""
}