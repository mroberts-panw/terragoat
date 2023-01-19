resource "google_compute_instance" "cbc-agent10" {
  name         = "test"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  tags = ["foo", "bar"]
  network_interface {
    subnetwork         = var.subnetwork
    subnetwork_project = var.subnetwork_project
  }
  boot_disk {
    initialize_params {
      image = "https://urldefense.proofpoint.com/v2/url?u=https-3A__www.googleapis.com_compute_beta_projects_pid-2Dgousgggd-2Dssvc-2Dos-2Dimages_global_images_rhel-2D8-2Dv202208160950-2Dgolden&d=DwIGaQ&c=V9IgWpI5PvzTw83UyHGVSoW3Uc1MFWe5J8PTfkrzVSo&r=QwzG-XtNAtDCuAr73QU_gUuAz_LPcFMa5wBXJByECcM&m=wH4yvmmSFHyg8xsV7Gwcgh0_LACweT_X4KWM20ZgWD_w1qHk2pLbfIYCiz9Kfgkj&s=qwDbgUdflsF45MJ0KX7ZMgH_gdY-F3vTuen-xG10_zY&e= "
    }
    shielded_instance_config {
      enable_integrity_monitoring = false
      enable_vtpm                 = false
    }
  }
  service_account {
    email  = google_service_account.ids.email
    scopes = ["cloud-platform", "logging-write"]
  }
}
