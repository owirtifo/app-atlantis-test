terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "netology-bucket"
    region     = "ru-central1"
    key        = "netology/terraform.tfstate"
    workspace_key_prefix = "netology"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  zone = "ru-central1-a"
}

data "terraform_remote_state" "default" {
  backend = "s3"
  config = {
    endpoint                = "storage.yandexcloud.net"
    bucket                  = "netology-bucket"
    region                  = var.YC_DEFAULT_REGION
    key                     = "default/terraform.tfstate"
    access_key = var.bk_access_key
    secret_key = var.bk_secret_key

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

locals {
  folder_id = data.terraform_remote_state.default.outputs.folder_id
}

locals {
  service_account_id = data.terraform_remote_state.default.outputs.service_account_id
}

locals {
  folder_iam_member = data.terraform_remote_state.default.outputs.folder_iam_member
}


