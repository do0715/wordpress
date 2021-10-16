resource "aws_vpc" "doyun_vpc" {
    cidr_block  =    "192.168.0.0/16"
    instance_tenancy    =   "default"

    tags    =   {
        Name   =   "doyun-vpc"
    }
}