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
variable "token" {
  type        = string
}