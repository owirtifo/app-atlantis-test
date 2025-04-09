resource "yandex_vpc_network" "netology-vpc" {
  folder_id   = local.folder_id  
  name = "netology-vpc"
}

resource "yandex_vpc_subnet" "subnet-a" {
  name           = "subnet-a"
  folder_id   = local.folder_id
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.netology-vpc.id
  v4_cidr_blocks = ["192.168.4.0/24"]
}
