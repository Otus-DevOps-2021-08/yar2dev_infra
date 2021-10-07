terraform {


  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-state-storage-yar2dev"
    region     = "us-east-1"
    key        = "terraform-prod.tfstate"
    access_key = "80-8Y5VpLUK-POoeHBb_"
    secret_key = "pCdoKyzIGbTadWBfCqImNPtNgxOmN7ytq9eybqNE"

    skip_region_validation      = true
    skip_credentials_validation = true
  }

}
