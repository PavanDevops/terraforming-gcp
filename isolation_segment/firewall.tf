resource "google_compute_firewall" "isoseg-cf-ingress" {
  name    = "${var.env_name}-isoseg-cf-ingress"
  network = "${var.network_name}"

  direction     = "INGRESS"
  source_ranges = ["${var.pas_subnet_cidr}"]

  allow {
    protocol = "tcp"
    ports    = ["1801", "8853"]
  }
}

resource "google_compute_firewall" "isoseg-cf-egress" {
  name    = "${var.env_name}-isoseg-cf-egress"
  network = "${var.network_name}"

  direction          = "EGRESS"
  destination_ranges = ["${var.pas_subnet_cidr}"]

  allow {
    protocol = "tcp"

    ports = [
      "9090",
      "9091",
      "8082",
      "8300",
      "8301",
      "8302",
      "8889",
      "8443",
      "3000",
      "4443",
      "8080",
      "3457",
      "9023",
      "9022",
      "4222",
      "8844",
      "8853",
    ]
  }

  allow {
    protocol = "udp"
    ports    = ["8301", "8302", "8600"]
  }
}
