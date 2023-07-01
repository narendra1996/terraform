variable "ingress_ports" {
  type = list(string)
  default = ["9200","8300","8080","443"]
}