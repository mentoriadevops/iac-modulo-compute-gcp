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
    network_ip         = var.private_ip

    dynamic "access_config" {
      for_each = var.public_ip == "" ? [] : [var.public_ip]
      iterator = ip
      content {
        nat_ip       = ip.value == "ephemeral" ? "" : ip.value
        network_tier = var.network_tier
      }
    }
  }
}

resource "google_service_account" "sa" {
  account_id   = var.instance_name
  display_name = var.instance_name
}

resource "google_project_iam_member" "roles" {
  for_each = toset(var.roles)

  project = var.project
  role    = "roles/${trimprefix(each.key, "roles/")}"
  member  = "serviceAccount:${google_service_account.sa.email}"
}
