locals {
  # Общие настройки проекта
  project_name    = "netology-develop"
  environment     = "platform"
  # Имена ВМ с интерполяцией нескольких переменных
  vm_web_name = "${local.project_name}-${local.environment}-web"
  vm_db_name  = "${local.project_name}-${local.environment}-db"
  # CIDR блоки для подсетей
  web_cidr = "10.0.1.0/24"
  db_cidr  = "10.0.2.0/24" 
  # Общие настройки для всех ВМ
  vm_common = {
    platform_id       = "standard-v3"
    image_family      = "ubuntu-2004-lts"
    preemptible       = true
    serial_port_enable = 1
  }  
  # Ресурсы для WEB ВМ
  vm_web_resources = {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  } 
  # Ресурсы для DB ВМ
  vm_db_resources = {
    cores         = var.vm_db_cores
    memory        = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }
}