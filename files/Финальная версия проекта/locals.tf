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
  # Ресурсы для обеих ВМ
  vm_web_resources = local.vms_resources_map.web
  vm_db_resources  = local.vms_resources_map.db
  # Единая карта ресурсов из переменной
  vms_resources_map = var.vms_resources
  # Общие metadata для всех ВМ
  vms_metadata = var.vms_metadata
}