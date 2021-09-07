variable "project" {
  description = "Nome do projeto existente na Google Cloud"
  type        = string
}

variable "instance_name" {
  description = "Nome da instância na Google Cloud"
  type        = string
}

variable "instance_image" {
  description = "Nome da instância na Google Cloud"
  type        = string
}


variable "machine_type" {
  description = "Tipo de máquina na Google Cloud"
  type        = string
}

variable "zone" {
  description = "Zona na Google Cloud"
  type        = string
}

variable "network" {
  description = "Nome da rede existente na GCP"
  type        = string
}

variable "subnetwork" {
  description = "Nome da subrede existente na GCP * foi definido o valor padrão para caso passe a NETWORK com o valor 'default'"
  type        = string
  default     = ""
}

variable "labels" {
  description = "Lista de labels para nossa instância maneira"
  type        = map(string)
}

variable "metadata_startup_script" {
  description = "Script executado na inicialização do Sistema Operacional"
  type        = string
  default     = ""
}
