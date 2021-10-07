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

variable service_account_key_file {
  description = "key .json"
}

variable bucket_secret_key {
  description = "Yandex Cloud bucket secret key"
  default     = ""
}

variable bucket_access_key {
  description = "Yandex Cloud access_key"
  default     = ""
}
