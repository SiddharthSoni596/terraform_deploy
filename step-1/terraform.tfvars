project_id = "burner-sidsoni1"
server_name = "foreach"

network = "my-network"

subnets = {
  south-carolina = { "region" : "us-central1", "ip_cidr_range" : "192.168.2.0/26" },
  iowa           = { "region" : "us-central1", "ip_cidr_range" : "192.168.1.0/26" },
  singapore      = { "region" : "us-central1", "ip_cidr_range" : "192.168.3.0/26" },
}

firewall = [
  {
    "name" : "allow-all-internal",
    "direction" : "INGRESS",
    "allow" : {
      "protocol" : "all",
      "ports" : []
    },
    "source_ranges" : ["192.168.0.0/16"],
    "target_tags" : [],
  },
  {
    "name" : "allow-http",
    "direction" : "INGRESS",
    "allow" : {
      "protocol" : "tcp",
      "ports" : ["80"]
    },
    "source_ranges" : ["0.0.0.0/0"],
    "target_tags" : ["http-server"],
  },
]