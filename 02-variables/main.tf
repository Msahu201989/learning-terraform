resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_router_devtg631416b926e1a0ce001_vr15" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 30
  // CF Property(Matcher) = {
  //   HttpCode = "404"
  // }
  // CF Property(HealthCheckPath) = "/"
  port = "traffic-port"
  target_group_arn = [
    {
      AvailabilityZone = "us-east-1a"
      Port = 8095
      Id = "172.18.83.18"
    }
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 2
  // CF Property(HealthCheckTimeoutSeconds) = 5
  // CF Property(Name) = "Alfresco-Transform-Router-Dev-tg"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_core_dev4e743362478e9a4a00_m_gaql" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 30
  // CF Property(Matcher) = {
  //   HttpCode = "200"
  // }
  // CF Property(HealthCheckPath) = "/"
  port = "traffic-port"
  target_group_arn = [
    {
      AvailabilityZone = "us-east-1b"
      Port = 8090
      Id = "172.18.83.38"
    }
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 2
  // CF Property(HealthCheckTimeoutSeconds) = 5
  // CF Property(Name) = "Alfresco-Transform-Core-Dev"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c35a04706484ccbfb8400_le3y_q" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_router_devtg631416b926e1a0ce001_vr15.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //         DurationSeconds = 3600
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_router_devtg631416b926e1a0ce001_vr15.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8095
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c3571c95f6d2a81489000w_nk_qw" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     Type = "redirect"
  //     RedirectConfig = {
  //       Path = "/#{path}"
  //       Host = "#{host}"
  //       Query = "#{query}"
  //       Protocol = "HTTPS"
  //       StatusCode = "HTTP_301"
  //       Port = "443"
  //     }
  //   }
  // ]
  load_balancer_port = 80
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c35e9fccca4d352d36000_q6_u_pt" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoshare286ff285cd42659000_tn_w4r.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoshare286ff285cd42659000_tn_w4r.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8180
}

resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroupecsalfrescoass71be1cde2ceb308400ey_ebj" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 30
  // CF Property(Matcher) = {
  //   HttpCode = "302,200,404"
  // }
  // CF Property(HealthCheckPath) = "/"
  port = "traffic-port"
  target_group_arn = [
    {
      AvailabilityZone = "us-east-1a"
      Port = 8983
      Id = "172.18.83.12"
    }
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 2
  // CF Property(HealthCheckTimeoutSeconds) = 5
  // CF Property(Name) = "ecs-alfresco-ass"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c3553e7f4cdcb982d2f00_pr_cc_e" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupalfrescosfsdev6627ceaa133228d500lnvw7.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //         DurationSeconds = 3600
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupalfrescosfsdev6627ceaa133228d500lnvw7.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8099
}

resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroupecsalfrescoshare286ff285cd42659000_tn_w4r" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 60
  // CF Property(Matcher) = {
  //   HttpCode = "302"
  // }
  // CF Property(HealthCheckPath) = "/share"
  port = "traffic-port"
  target_group_arn = [
    {
      AvailabilityZone = "us-east-1a"
      Port = 8080
      Id = "172.18.83.21"
    }
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 5
  // CF Property(HealthCheckTimeoutSeconds) = 30
  // CF Property(Name) = "ecs-alfresco-share"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c35728f25e90d3ca65d00xj0_hv" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoass71be1cde2ceb308400ey_ebj.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoass71be1cde2ceb308400ey_ebj.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8083
}

resource "aws_vpc" "ec2_vpc00vpc0a4b28bceae45838200gicq_p" {
  cidr_block = "172.18.83.0/26"
  enable_dns_support = true
  instance_tenancy = "default"
  enable_dns_hostnames = true
  tags = {
    Application = "Control-M|Alfresco"
    Stack = "DEV"
    Name = "vpc_shared_dev"
    Module = "Shared"
  }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c351be59b15405670b200yqhg7" {
  // CF Property(MutualAuthentication) = {
  //   Mode = "off"
  // }
  // CF Property(SslPolicy) = "ELBSecurityPolicy-2016-08"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     FixedResponseConfig = {
  //       ContentType = "text/html"
  //       StatusCode = "503"
  //       MessageBody = "<h1>Error 503</h1> <p>This path is not configured in the listener rules</p> <p> - Shared Dev ALB</p>"
  //     }
  //     Type = "fixed-response"
  //   }
  // ]
  load_balancer_port = 443
  // CF Property(Certificates) = [
  //   {
  //     CertificateArn = "arn:aws:acm:us-east-1:719927028882:certificate/fb1332d4-01e5-41b5-abac-bb3516cfb924"
  //   }
  // ]
  // CF Property(Protocol) = "HTTPS"
}

resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroupalfrescosfsdev6627ceaa133228d500lnvw7" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 30
  // CF Property(Matcher) = {
  //   HttpCode = "404"
  // }
  // CF Property(HealthCheckPath) = "/"
  port = "traffic-port"
  target_group_arn = [
    {
      AvailabilityZone = "us-east-1b"
      Port = 8099
      Id = "172.18.83.52"
    }
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 2
  // CF Property(HealthCheckTimeoutSeconds) = 5
  // CF Property(Name) = "alfresco-sfs-dev"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_subnet" "ec2_subnet00subnet06d5e0f1632765c2700_gz_v_rk" {
  vpc_id = "vpc-0a4b28bceae458382"
  map_public_ip_on_launch = false
  enable_dns64 = false
  availability_zone_id = "use1-az2"
  private_dns_hostname_type_on_launch = {
    EnableResourceNameDnsARecord = false
    HostnameType = "ip-name"
    EnableResourceNameDnsAAAARecord = false
  }
  cidr_block = "172.18.83.32/27"
  ipv6_native = false
  tags = {
    Stack = "Shared"
    Module = "VPC"
    Name = "vpc_shared_dev_pvt_az2"
    Application = "Control-M|Alfresco"
  }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c358f04e2dd2f96702e00rc_nv_e" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_core_dev4e743362478e9a4a00_m_gaql.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //         DurationSeconds = 3600
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroup_alfresco_transform_core_dev4e743362478e9a4a00_m_gaql.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8090
}

resource "aws_lb_target_group_attachment" "elastic_load_balancing_v2_target_group00targetgroupecsalfrescoacsd243437fcde6575900bdvx_w" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(HealthCheckIntervalSeconds) = 60
  // CF Property(Matcher) = {
  //   HttpCode = "200"
  // }
  // CF Property(HealthCheckPath) = "/alfresco/"
  port = "traffic-port"
  target_group_arn = [
  ]
  // CF Property(HealthCheckEnabled) = true
  // CF Property(ProtocolVersion) = "HTTP1"
  // CF Property(UnhealthyThresholdCount) = 5
  // CF Property(HealthCheckTimeoutSeconds) = 30
  // CF Property(Name) = "ecs-alfresco-acs"
  target_id = [
    {
      Value = "lb_cookie"
      Key = "stickiness.type"
    },
    {
      Value = "86400"
      Key = "stickiness.app_cookie.duration_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.count"
    },
    {
      Value = "use_load_balancer_configuration"
      Key = "load_balancing.cross_zone.enabled"
    },
    {
      Value = "86400"
      Key = "stickiness.lb_cookie.duration_seconds"
    },
    {
      Value = "off"
      Key = "target_group_health.dns_failover.minimum_healthy_targets.percentage"
    },
    {
      Value = "false"
      Key = "stickiness.enabled"
    },
    {
      Value = "off"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.percentage"
    },
    {
      Value = "0"
      Key = "slow_start.duration_seconds"
    },
    {
      Value = "300"
      Key = "deregistration_delay.timeout_seconds"
    },
    {
      Value = "1"
      Key = "target_group_health.unhealthy_state_routing.minimum_healthy_targets.count"
    },
    {
      Value = "off"
      Key = "load_balancing.algorithm.anomaly_mitigation"
    },
    {
      Value = ""
      Key = "stickiness.app_cookie.cookie_name"
    },
    {
      Value = "round_robin"
      Key = "load_balancing.algorithm.type"
    }
  ]
  // CF Property(HealthyThresholdCount) = 5
  // CF Property(HealthCheckProtocol) = "HTTP"
  // CF Property(TargetType) = "ip"
  // CF Property(Protocol) = "HTTP"
  // CF Property(tags) = {
  // }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_listener00listenerappalbshareddeve520c88021736c35879cdae8f3334c0700_ag6_az" {
  // CF Property(Protocol) = "HTTP"
  load_balancer_name = aws_load_balancer_listener_policy.elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t.id
  // CF Property(DefaultActions) = [
  //   {
  //     Order = 1
  //     TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoacsd243437fcde6575900bdvx_w.id
  //     Type = "forward"
  //     ForwardConfig = {
  //       TargetGroupStickinessConfig = {
  //         Enabled = false
  //       }
  //       TargetGroups = [
  //         {
  //           TargetGroupArn = aws_lb_target_group_attachment.elastic_load_balancing_v2_target_group00targetgroupecsalfrescoacsd243437fcde6575900bdvx_w.id
  //           Weight = 1
  //         }
  //       ]
  //     }
  //   }
  // ]
  load_balancer_port = 8080
}

resource "aws_subnet" "ec2_subnet00subnet04f1fcc58f2847b21009q8_gr" {
  vpc_id = "vpc-0a4b28bceae458382"
  map_public_ip_on_launch = false
  enable_dns64 = false
  availability_zone_id = "use1-az1"
  private_dns_hostname_type_on_launch = {
    EnableResourceNameDnsARecord = false
    HostnameType = "ip-name"
    EnableResourceNameDnsAAAARecord = false
  }
  cidr_block = "172.18.83.0/27"
  ipv6_native = false
  tags = {
    Stack = "Shared"
    Module = "VPC"
    Name = "vpc_shared_dev_pvt_az1"
    Application = "Control-M|Alfresco"
  }
}

resource "aws_load_balancer_listener_policy" "elastic_load_balancing_v2_load_balancer00loadbalancerappalbshareddeve520c88021736c35004h_zc_t" {
  // CF Property(IpAddressType) = "ipv4"
  // CF Property(SecurityGroups) = [
  //   "sg-00f24c022eeea8446"
  // ]
  // CF Property(LoadBalancerAttributes) = [
  //   {
  //     Value = ""
  //     Key = "access_logs.s3.prefix"
  //   },
  //   {
  //     Value = "append"
  //     Key = "routing.http.xff_header_processing.mode"
  //   },
  //   {
  //     Value = "true"
  //     Key = "routing.http2.enabled"
  //   },
  //   {
  //     Value = "false"
  //     Key = "waf.fail_open.enabled"
  //   },
  //   {
  //     Value = ""
  //     Key = "connection_logs.s3.bucket"
  //   },
  //   {
  //     Value = "false"
  //     Key = "access_logs.s3.enabled"
  //   },
  //   {
  //     Value = "defensive"
  //     Key = "routing.http.desync_mitigation_mode"
  //   },
  //   {
  //     Value = ""
  //     Key = "connection_logs.s3.prefix"
  //   },
  //   {
  //     Value = "false"
  //     Key = "routing.http.x_amzn_tls_version_and_cipher_suite.enabled"
  //   },
  //   {
  //     Value = "false"
  //     Key = "routing.http.preserve_host_header.enabled"
  //   },
  //   {
  //     Value = "true"
  //     Key = "load_balancing.cross_zone.enabled"
  //   },
  //   {
  //     Value = "false"
  //     Key = "routing.http.xff_client_port.enabled"
  //   },
  //   {
  //     Value = ""
  //     Key = "access_logs.s3.bucket"
  //   },
  //   {
  //     Value = "false"
  //     Key = "deletion_protection.enabled"
  //   },
  //   {
  //     Value = "3600"
  //     Key = "client_keep_alive.seconds"
  //   },
  //   {
  //     Value = "false"
  //     Key = "routing.http.drop_invalid_header_fields.enabled"
  //   },
  //   {
  //     Value = "false"
  //     Key = "connection_logs.s3.enabled"
  //   },
  //   {
  //     Value = "60"
  //     Key = "idle_timeout.timeout_seconds"
  //   }
  // ]
  // CF Property(Subnets) = [
  //   aws_subnet.ec2_subnet00subnet06d5e0f1632765c2700_gz_v_rk.id,
  //   aws_subnet.ec2_subnet00subnet04f1fcc58f2847b21009q8_gr.id
  // ]
  // CF Property(Type) = "application"
  // CF Property(Scheme) = "internal"
  // CF Property(EnforceSecurityGroupInboundRulesOnPrivateLinkTraffic) = ""
  load_balancer_name = "alb-shared-dev"
  // CF Property(SubnetMappings) = [
  //   {
  //     SubnetId = aws_subnet.ec2_subnet00subnet06d5e0f1632765c2700_gz_v_rk.id
  //   },
  //   {
  //     SubnetId = aws_subnet.ec2_subnet00subnet04f1fcc58f2847b21009q8_gr.id
  //   }
  // ]
  // CF Property(tags) = {
  //   Module = "Load Balancer"
  //   Application = "Alfresco"
  //   Stack = "DEV"
  // }
}
