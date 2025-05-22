locals { 
    ingress_rules_obj = merge(
        flatten([
           for sg, sg_data in var.secG : {
            for irule in sg_data.ingress_rules:
                "${sg}-${index(sg_data.ingress_rules, irule )}" => merge(
                    irule, {security_group_name = sg}
                ) 
            }  
        ])...)
    
    egress_rules_obj = merge(
        flatten(
            [for sg, sg_data in var.secG : {
                for erule in sg_data.egress_rules:
                    "${sg}-${index(sg_data.egress_rules, erule )}" => merge(
                        erule, {security_group_name = sg}
                    )
            }
        ])...)
    
    }