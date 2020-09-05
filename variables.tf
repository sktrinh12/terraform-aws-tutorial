variable "region" {
  default = "us-east-1"
}

variable "amis" {
  type = map
	default = {
  "us-east-1" = "ami-02354e95b39ca8dec"
  "us-west-2" = "ami-073247104ee15be9b"
	"us-west-3" = "ami-fc0b939c"
	}
}
