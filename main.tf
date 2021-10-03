resource "google_compute_instance" "default" {
  project      = var.project
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone
  labels       = var.labels
  tags         = var.tags

  metadata_startup_script = var.metadata_startup_script

  metadata = {
    ssh-keys = var.ssh_keys
  }

  boot_disk {
    initialize_params {
      image = var.instance_image
    }
  }

  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork
    subnetwork_project = var.project
    access_config {
      nat_ip = google_compute_address.default.address
      network_tier = var.network_tier
    }
  }
}

resource "google_compute_address" "default" {
  project      = var.project
  name = "ipv4-address-${var.instance_name}"
  network_tier = var.network_tier
}
