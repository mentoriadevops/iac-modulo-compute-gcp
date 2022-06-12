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

  service_account {
    email  = google_service_account.sa.email
    scopes = ["cloud-platform"]
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
      nat_ip       = google_compute_address.default.address
      network_tier = var.network_tier
    }
  }
}

resource "google_compute_address" "default" {
  project      = var.project
  name         = "ipv4-address-${var.instance_name}"
  network_tier = var.network_tier
}

resource "google_service_account" "sa" {
  account_id   = var.instance_name
  display_name = var.instance_name
}

resource "google_project_iam_binding" "roles" {
  for_each = toset(var.roles)

  project = var.project
  role    = "roles/${trimprefix(each.key, "roles/")}"
  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]

}