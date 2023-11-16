terraform {
      required_providers {
        google = {
          source  = "hashicorp/google"
          version = "4.51.0"
        }
      }
    }
    
    provider "google" {
      credentials = file("/Users/johnf/School/learn-terraform-gcp/terraform-gcp-test-12345-37f477c5d787.json")
      project     = "terraform-gcp-test-12345"
      region      = "us-central1"
    }
    
    resource "google_sql_database_instance" "sql_server_instance" {
      name             = "sqlservergcppp0930"
      region           = "us-central1"
      database_version = "SQLSERVER_2017_STANDARD"
      root_password = "password"
    
      settings {
        tier = "db-custom-2-7680"
    
        backup_configuration {
          enabled = true
        }
    
        ip_configuration {
          ipv4_enabled = true
          authorized_networks {
            name  = "all"
            value = "0.0.0.0/0"
          }
        }
        deletion_protection = false
      }
    }
    
    resource "google_sql_user" "default" {
      name     = "sqlserver"
      instance = google_sql_database_instance.sql_server_instance.name
      password = "jfjfjf"
    }