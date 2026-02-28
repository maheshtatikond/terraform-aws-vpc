resource "aws_vpc" "main"{
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true
    instance_tenancy = "default"

  tags = local.vpc_final_tags
  
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id #vpc association

  tags = local.igw_final_tags

}
#public subnet
resource "aws_subnet" "main" {
  count = length(var.public_subnet_cidrs)  
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  #availabilty zone using data source
  availability_zone = local.availability_zones[count.index]
  map_public_ip_on_launch = true
  

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-public-${local.availability_zones[count.index]}"
    },
    var.public_subnet_tags
    )
  
}