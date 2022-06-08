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
  description = "Mapa de labels para nossa instância maneira"
  type        = map(string)
}

variable "tags" {
  description = "Lista de tags de rede associadas à instância"
  type        = list(string)
}

variable "metadata_startup_script" {
  description = "Script executado na inicialização do Sistema Operacional"
  type        = string
  default     = ""
}

variable "ssh_keys" {
  description = "Lista de chaves públicas para criar conta local juntamente com acesso SSH"
  type        = string
  default     = ""
}

variable "network_tier" {
  description = "Nivel de serviço de rede. Opções: PREMIUM ou STANDARD"
  type        = string
  default     = "STANDARD"
}

variable "roles" {
  description = "lista de roles para associar a instância"
  type        = list(string)
  default     = ["roles/compute.viewer"]
}