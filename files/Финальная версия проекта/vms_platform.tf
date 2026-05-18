### Переменные для ВМ №1
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID для ВМ №1"
}
variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона размещения ВМ №1"
}

### Переменные для новой ВМ №2
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID для ВМ №2"
}
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона размещения ВМ №2"
}
### Общие переменные
variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
  description = "Конфигурация для обеих ВМ"
  default = {
    web = {
      cores         = 2
      memory        = 1
      core_fraction = 20
      hdd_size      = 5
      hdd_type      = "network-hdd"
    }
    db = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      hdd_size      = 5
      hdd_type      = "network-hdd"
    }
  }
}
variable "vms_metadata" {
  type = object({
    serial_port_enable = string
    ssh_keys           = string
  })
  description = "Common metadata configuration for all VMs"
  default = {
    serial_port_enable = "1"
    ssh_keys           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCskHjRSnQVbmPRmfeh0sLktdIEv4FUg5q8nsG8UZlaF7ML9PXuEE2Sqf1M6yeCYk7tFrdjQrhLrjDsFuwVzbcghxJnFsbJe5TrnBl1dJ9wHktdgZx5w85s1ZLbnq7Ws6hZvmGWFxgem/NKRQ1zLe33pHT6NyA9YMdSWLsVEjNYGvgdD902YP1pN2u4hTGp2vva9R2zaCMIhLpx1wo1a+NN01xMx5t+oH6uaoheF49hmt6rR4ZNmv7245QaIFd5V6oKGPxO3bUOBv0J1S7Xt7Gl5nR7SRv76b79WdSt2wSzNr1J14GDiJhoWWk3fAO/XdvV/dqctd923dljNisPTmKh"
  }
}