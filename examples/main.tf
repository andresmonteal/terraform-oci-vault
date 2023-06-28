// Copyright (c) 2018, 2021, Oracle and/or its affiliates.

module "vault" {
  source = "../"

  for_each = var.vaults

  tenancy_ocid            = var.tenancy_ocid
  compartment             = lookup(each.value, "compartment", null)
  name                    = each.key
  key_management_endpoint = each.value["key_endpoint"]
}