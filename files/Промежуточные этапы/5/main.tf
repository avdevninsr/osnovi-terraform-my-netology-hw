# Основная сеть
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
# Подсеть для ВМ №1
resource "yandex_vpc_subnet" "develop_web" {
  name           = "${var.vpc_name}-web"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [local.web_cidr]
}
# Подсеть для ВМ №2
resource "yandex_vpc_subnet" "develop_db" {
  name           = "${var.vpc_name}-db"
  zone           = var.vm_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [local.db_cidr]
}
# Образ операционной системы (используется обеими ВМ)
data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

# ВМ №1
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  platform_id = local.vm_common.platform_id
  zone        = var.vm_web_zone
  resources {
    cores         = local.vm_web_resources.cores
    memory        = local.vm_web_resources.memory
    core_fraction = local.vm_web_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = local.vm_common.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_web.id
    nat       = true
  }
  metadata = {
    serial-port-enable = local.vm_common.serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

# Новая ВМ №2
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = local.vm_common.platform_id
  zone        = var.vm_db_zone
  resources {
    cores         = local.vm_db_resources.cores
    memory        = local.vm_db_resources.memory
    core_fraction = local.vm_db_resources.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = local.vm_common.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = true
  }
  metadata = {
    serial-port-enable = local.vm_common.serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}