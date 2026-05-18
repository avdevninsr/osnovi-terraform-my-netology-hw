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
  family = local.vm_common.image_family
}

# ВМ №1
resource "yandex_compute_instance" "platform_web" {
  name        = local.vm_web_name
  platform_id = local.vm_common.platform_id
  zone        = var.vm_web_zone
  resources {
    cores         = local.vms_resources_map.web.cores
    memory        = local.vms_resources_map.web.memory
    core_fraction = local.vms_resources_map.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vms_resources_map.web.hdd_size
      type     = local.vms_resources_map.web.hdd_type
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
    sserial-port-enable = local.vms_metadata.serial_port_enable
    ssh-keys           = local.vms_metadata.ssh_keys
  }
}

# Новая ВМ №2
resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name
  platform_id = local.vm_common.platform_id
  zone        = var.vm_db_zone
  resources {
    cores         = local.vms_resources_map.db.cores
    memory        = local.vms_resources_map.db.memory
    core_fraction = local.vms_resources_map.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = local.vms_resources_map.db.hdd_size
      type     = local.vms_resources_map.db.hdd_type
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
    serial-port-enable = local.vms_metadata.serial_port_enable
    ssh-keys           = local.vms_metadata.ssh_keys
  }
}