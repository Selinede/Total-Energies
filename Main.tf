# Main VPC

resource "aws_vpc" "success_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "success_vpc"
  }
}

# Public Subnet 


resource "aws_subnet" "Public-Subnet1" {
  vpc_id     = aws_vpc.success_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Public-Subnet1"
  }
}


# Public Subnet-2 


resource "aws_subnet" "Public-Subnet2" {
  vpc_id     = aws_vpc.success_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "Public-Subnet2"
  }
}


# Private Subnet-1


resource "aws_subnet" "Private-Subnet1" {
  vpc_id     = aws_vpc.success_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "Private-Subnet1"
  }
}

# Private Subnet-2


resource "aws_subnet" "Private-Subnet2" {
  vpc_id     = aws_vpc.success_vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "Private-Subnet2"
  }
}


# Private Subnet-3


resource "aws_subnet" "Private-Subnet3" {
  vpc_id     = aws_vpc.success_vpc.id
  cidr_block = "10.0.5.0/24"

  tags = {
    Name = "Private-Subnet3"
  }
}


# Public Route Table-1

resource "aws_route_table" "Pub-Routetable-1" {
  vpc_id = aws_vpc.success_vpc.id

  

  tags = {
    Name = "Pub-Routetable-1"
  }
}




# Private Route Table-1

resource "aws_route_table" "Pri-Routetable-1" {
  vpc_id = aws_vpc.success_vpc.id

  

  tags = {
    Name = "Pri-Routetable-1"
  }
}




# Public-Route-Table-Subnet-Association-1

resource "aws_route_table_association" "Pub-RTA1" {
  subnet_id      = aws_subnet.Public-Subnet1.id
  route_table_id = aws_route_table.Pub-Routetable-1.id
}  
  

# Public-Route-Table-Subnet-Association-2

resource "aws_route_table_association" "Pub-RTA2" {
  subnet_id      = aws_subnet.Public-Subnet2.id
  route_table_id = aws_route_table.Pub-Routetable-1.id
}  



# Private-Route-Table-Subnet-Association-1

resource "aws_route_table_association" "Pri-RTA1" {
  subnet_id      = aws_subnet.Private-Subnet1.id
  route_table_id = aws_route_table.Pri-Routetable-1.id
}  



# Private-Route-Table-Subnet-Association-2

resource "aws_route_table_association" "Pri-RTA2" {
  subnet_id      = aws_subnet.Private-Subnet2.id
  route_table_id = aws_route_table.Pri-Routetable-1.id
}  


# Private-Route-Table-Subnet-Association-3

resource "aws_route_table_association" "Pri-RTA3" {
  subnet_id      = aws_subnet.Private-Subnet3.id
  route_table_id = aws_route_table.Pri-Routetable-1.id
}  

# Internet-Gateway

resource "aws_internet_gateway" "GW-Alero" {
  vpc_id = aws_vpc.success_vpc.id

  tags = {
    Name = "GW-Alero"
  }
}


# Connection of Internet Gateway and the Route

resource "aws_route" "IGW-Route" {
  route_table_id            = aws_route_table.Pub-Routetable-1.id
  destination_cidr_block    = "0.0.0.0/0"



 gateway_id                 =     aws_internet_gateway.GW-Alero.id
}












