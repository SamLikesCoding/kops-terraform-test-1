locals {
  cluster_name                 = "ip-172-31-43-193.k8s.local"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-ap-south-1b-masters-ip-172-31-43-193-k8s-local.id]
  master_security_group_ids    = [aws_security_group.masters-ip-172-31-43-193-k8s-local.id]
  masters_role_arn             = aws_iam_role.masters-ip-172-31-43-193-k8s-local.arn
  masters_role_name            = aws_iam_role.masters-ip-172-31-43-193-k8s-local.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-ip-172-31-43-193-k8s-local.id]
  node_security_group_ids      = [aws_security_group.nodes-ip-172-31-43-193-k8s-local.id]
  node_subnet_ids              = [aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id]
  nodes_role_arn               = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.arn
  nodes_role_name              = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.name
  region                       = "ap-south-1"
  route_table_public_id        = aws_route_table.ip-172-31-43-193-k8s-local.id
  subnet_ap-south-1b_id        = aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id
  vpc_cidr_block               = aws_vpc.ip-172-31-43-193-k8s-local.cidr_block
  vpc_id                       = aws_vpc.ip-172-31-43-193-k8s-local.id
}

output "cluster_name" {
  value = "ip-172-31-43-193.k8s.local"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-ap-south-1b-masters-ip-172-31-43-193-k8s-local.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-ip-172-31-43-193-k8s-local.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-ip-172-31-43-193-k8s-local.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-ip-172-31-43-193-k8s-local.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-ip-172-31-43-193-k8s-local.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-ip-172-31-43-193-k8s-local.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.name
}

output "region" {
  value = "ap-south-1"
}

output "route_table_public_id" {
  value = aws_route_table.ip-172-31-43-193-k8s-local.id
}

output "subnet_ap-south-1b_id" {
  value = aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id
}

output "vpc_cidr_block" {
  value = aws_vpc.ip-172-31-43-193-k8s-local.cidr_block
}

output "vpc_id" {
  value = aws_vpc.ip-172-31-43-193-k8s-local.id
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_autoscaling_attachment" "master-ap-south-1b-masters-ip-172-31-43-193-k8s-local" {
  autoscaling_group_name = aws_autoscaling_group.master-ap-south-1b-masters-ip-172-31-43-193-k8s-local.id
  elb                    = aws_elb.api-ip-172-31-43-193-k8s-local.id
}

resource "aws_autoscaling_group" "master-ap-south-1b-masters-ip-172-31-43-193-k8s-local" {
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_configuration = aws_launch_configuration.master-ap-south-1b-masters-ip-172-31-43-193-k8s-local.id
  max_size             = 1
  metrics_granularity  = "1Minute"
  min_size             = 1
  name                 = "master-ap-south-1b.masters.ip-172-31-43-193.k8s.local"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "ip-172-31-43-193.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-ap-south-1b.masters.ip-172-31-43-193.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-south-1b"
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-ap-south-1b"
  }
  tag {
    key                 = "kubernetes.io/cluster/ip-172-31-43-193.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-ip-172-31-43-193-k8s-local" {
  enabled_metrics      = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_configuration = aws_launch_configuration.nodes-ip-172-31-43-193-k8s-local.id
  max_size             = 2
  metrics_granularity  = "1Minute"
  min_size             = 2
  name                 = "nodes.ip-172-31-43-193.k8s.local"
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "ip-172-31-43-193.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes.ip-172-31-43-193.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes"
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes"
  }
  tag {
    key                 = "kubernetes.io/cluster/ip-172-31-43-193.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id]
}

resource "aws_ebs_volume" "b-etcd-events-ip-172-31-43-193-k8s-local" {
  availability_zone = "ap-south-1b"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "b.etcd-events.ip-172-31-43-193.k8s.local"
    "k8s.io/etcd/events"                               = "b/b"
    "k8s.io/role/master"                               = "1"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  type = "gp2"
}

resource "aws_ebs_volume" "b-etcd-main-ip-172-31-43-193-k8s-local" {
  availability_zone = "ap-south-1b"
  encrypted         = false
  size              = 20
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "b.etcd-main.ip-172-31-43-193.k8s.local"
    "k8s.io/etcd/main"                                 = "b/b"
    "k8s.io/role/master"                               = "1"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  type = "gp2"
}

resource "aws_elb" "api-ip-172-31-43-193-k8s-local" {
  cross_zone_load_balancing = false
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "SSL:443"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port      = 443
    instance_protocol  = "TCP"
    lb_port            = 443
    lb_protocol        = "TCP"
    ssl_certificate_id = ""
  }
  name            = "api-ip-172-31-43-193-k8s--s174bc"
  security_groups = [aws_security_group.api-elb-ip-172-31-43-193-k8s-local.id]
  subnets         = [aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id]
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "api.ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-ip-172-31-43-193-k8s-local" {
  name = "masters.ip-172-31-43-193.k8s.local"
  role = aws_iam_role.masters-ip-172-31-43-193-k8s-local.name
}

resource "aws_iam_instance_profile" "nodes-ip-172-31-43-193-k8s-local" {
  name = "nodes.ip-172-31-43-193.k8s.local"
  role = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.name
}

resource "aws_iam_role_policy" "masters-ip-172-31-43-193-k8s-local" {
  name   = "masters.ip-172-31-43-193.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.ip-172-31-43-193.k8s.local_policy")
  role   = aws_iam_role.masters-ip-172-31-43-193-k8s-local.name
}

resource "aws_iam_role_policy" "nodes-ip-172-31-43-193-k8s-local" {
  name   = "nodes.ip-172-31-43-193.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.ip-172-31-43-193.k8s.local_policy")
  role   = aws_iam_role.nodes-ip-172-31-43-193-k8s-local.name
}

resource "aws_iam_role" "masters-ip-172-31-43-193-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.ip-172-31-43-193.k8s.local_policy")
  name               = "masters.ip-172-31-43-193.k8s.local"
}

resource "aws_iam_role" "nodes-ip-172-31-43-193-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.ip-172-31-43-193.k8s.local_policy")
  name               = "nodes.ip-172-31-43-193.k8s.local"
}

resource "aws_internet_gateway" "ip-172-31-43-193-k8s-local" {
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_key_pair" "kubernetes-ip-172-31-43-193-k8s-local-979172cdc4c39ae0f3f0b04a57a11edf" {
  key_name   = "kubernetes.ip-172-31-43-193.k8s.local-97:91:72:cd:c4:c3:9a:e0:f3:f0:b0:4a:57:a1:1e:df"
  public_key = file("${path.module}/data/aws_key_pair_kubernetes.ip-172-31-43-193.k8s.local-979172cdc4c39ae0f3f0b04a57a11edf_public_key")
}

resource "aws_launch_configuration" "master-ap-south-1b-masters-ip-172-31-43-193-k8s-local" {
  associate_public_ip_address = true
  enable_monitoring           = false
  iam_instance_profile        = aws_iam_instance_profile.masters-ip-172-31-43-193-k8s-local.id
  image_id                    = "ami-049ab28ed3bb03bc9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.kubernetes-ip-172-31-43-193-k8s-local-979172cdc4c39ae0f3f0b04a57a11edf.id
  lifecycle {
    create_before_destroy = true
  }
  name_prefix = "master-ap-south-1b.masters.ip-172-31-43-193.k8s.local-"
  root_block_device {
    delete_on_termination = true
    volume_size           = 64
    volume_type           = "gp2"
  }
  security_groups = [aws_security_group.masters-ip-172-31-43-193-k8s-local.id]
  user_data       = file("${path.module}/data/aws_launch_configuration_master-ap-south-1b.masters.ip-172-31-43-193.k8s.local_user_data")
}

resource "aws_launch_configuration" "nodes-ip-172-31-43-193-k8s-local" {
  associate_public_ip_address = true
  enable_monitoring           = false
  iam_instance_profile        = aws_iam_instance_profile.nodes-ip-172-31-43-193-k8s-local.id
  image_id                    = "ami-049ab28ed3bb03bc9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.kubernetes-ip-172-31-43-193-k8s-local-979172cdc4c39ae0f3f0b04a57a11edf.id
  lifecycle {
    create_before_destroy = true
  }
  name_prefix = "nodes.ip-172-31-43-193.k8s.local-"
  root_block_device {
    delete_on_termination = true
    volume_size           = 128
    volume_type           = "gp2"
  }
  security_groups = [aws_security_group.nodes-ip-172-31-43-193-k8s-local.id]
  user_data       = file("${path.module}/data/aws_launch_configuration_nodes.ip-172-31-43-193.k8s.local_user_data")
}

resource "aws_route_table_association" "ap-south-1b-ip-172-31-43-193-k8s-local" {
  route_table_id = aws_route_table.ip-172-31-43-193-k8s-local.id
  subnet_id      = aws_subnet.ap-south-1b-ip-172-31-43-193-k8s-local.id
}

resource "aws_route_table" "ip-172-31-43-193-k8s-local" {
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
    "kubernetes.io/kops/role"                          = "public"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ip-172-31-43-193-k8s-local.id
  route_table_id         = aws_route_table.ip-172-31-43-193-k8s-local.id
}

resource "aws_security_group_rule" "all-master-to-master" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-master-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "all-node-to-node" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "api-elb-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-ip-172-31-43-193-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "https-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-ip-172-31-43-193-k8s-local.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.api-elb-ip-172-31-43-193-k8s-local.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-ip-172-31-43-193-k8s-local.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "master-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-egress" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "node-to-master-tcp-1-2379" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-2382-4000" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  source_security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-ip-172-31-43-193-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-ip-172-31-43-193-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group" "api-elb-ip-172-31-43-193-k8s-local" {
  description = "Security group for api ELB"
  name        = "api-elb.ip-172-31-43-193.k8s.local"
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "api-elb.ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_security_group" "masters-ip-172-31-43-193-k8s-local" {
  description = "Security group for masters"
  name        = "masters.ip-172-31-43-193.k8s.local"
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "masters.ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_security_group" "nodes-ip-172-31-43-193-k8s-local" {
  description = "Security group for nodes"
  name        = "nodes.ip-172-31-43-193.k8s.local"
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "nodes.ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_subnet" "ap-south-1b-ip-172-31-43-193-k8s-local" {
  availability_zone = "ap-south-1b"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "ap-south-1b.ip-172-31-43-193.k8s.local"
    "SubnetType"                                       = "Public"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
    "kubernetes.io/role/elb"                           = "1"
  }
  vpc_id = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_vpc_dhcp_options_association" "ip-172-31-43-193-k8s-local" {
  dhcp_options_id = aws_vpc_dhcp_options.ip-172-31-43-193-k8s-local.id
  vpc_id          = aws_vpc.ip-172-31-43-193-k8s-local.id
}

resource "aws_vpc_dhcp_options" "ip-172-31-43-193-k8s-local" {
  domain_name         = "ap-south-1.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
}

resource "aws_vpc" "ip-172-31-43-193-k8s-local" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    "KubernetesCluster"                                = "ip-172-31-43-193.k8s.local"
    "Name"                                             = "ip-172-31-43-193.k8s.local"
    "kubernetes.io/cluster/ip-172-31-43-193.k8s.local" = "owned"
  }
}

terraform {
  required_version = ">= 0.12.0"
}
