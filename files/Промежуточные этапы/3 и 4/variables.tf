variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}
variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCskHjRSnQVbmPRmfeh0sLktdIEv4FUg5q8nsG8UZlaF7ML9PXuEE2Sqf1M6yeCYk7tFrdjQrhLrjDsFuwVzbcghxJnFsbJe5TrnBl1dJ9wHktdgZx5w85s1ZLbnq7Ws6hZvmGWFxgem/NKRQ1zLe33pHT6NyA9YMdSWLsVEjNYGvgdD902YP1pN2u4hTGp2vva9R2zaCMIhLpx1wo1a+NN01xMx5t+oH6uaoheF49hmt6rR4ZNmv7245QaIFd5V6oKGPxO3bUOBv0J1S7Xt7Gl5nR7SRv76b79WdSt2wSzNr1J14GDiJhoWWk3fAO/XdvV/dqctd923dljNisPTmKh"
  description = "ssh-rsa открытый ключ"
}
variable "token" {
  type        = string
}