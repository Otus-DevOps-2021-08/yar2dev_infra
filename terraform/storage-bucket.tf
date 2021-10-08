provider "yandex" {

  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}



resource "yandex_storage_bucket" "terraform_bucket" {
  bucket     = "terraform-state-storage-yar2dev"
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
}
