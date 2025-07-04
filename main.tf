resource "azurerm_conditional_access_policy" "block_untrusted_access" {
  display_name = "Block Non-Compliant Devices from Untrusted Locations"
  state        = "enabled"

  conditions {
    users {
      include_groups = ["dc894e28-e65f-453b-b8d3-4c5865b56d72"]
    }

    sign_in_risk_levels = ["medium", "high"]

    client_app_types = ["browser", "mobileAppsAndDesktopClients"]
    platforms {
      include = ["all"]
    }

    locations {
      exclude_locations = ["13936a93-d6a4-47c8-b257-ef109483a433"]
    }

    device_platforms {
      include = ["all"]
    }
  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}
