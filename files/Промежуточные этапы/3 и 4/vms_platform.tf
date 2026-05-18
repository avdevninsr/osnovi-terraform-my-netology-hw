### Переменные для ВМ №1
variable "cidr_1" {
  type		  = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образов ОС для ВМ №1"
}
variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Имя для ВМ №1"
}
variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID для ВМ №1"
}
variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Количество ядер ЦПУ для ВМ №1"
}
variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Количество ОЗУ для ВМ №1"
}
variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "Baseline CPU performance для ВМ №1"
}
variable "vm_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона размещения ВМ №1"
}

### Переменные для новой ВМ №2
variable "cidr_2" {
  type		  = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Семейство образов ОС для ВМ №2"
}
variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Имя ВМ №2"
}
variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID для ВМ №2"
}
variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Количество ядер ЦПУ для ВМ №2"
}
variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Количество ОЗУ для ВМ №2"
}
variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Baseline CPU performance для ВМ №2"
}
variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Зона размещения ВМ №2"
}