variable "instance_type" {
  type = map(string)
  default = {
    default = "t2.micro"
    dev = "t2.micro"
    prod = "t2.large"
  }
}