# Create CDO users
resource "cdo_user" "user-1" {
  name             = "mohandas@example.com"
  role             = "ROLE_SUPER_ADMIN"
  is_api_only_user = false
}

resource "cdo_user" "user-2" {
  name             = "vallabbhai@example.com"
  role             = "ROLE_ADMIN"
  is_api_only_user = false
}

resource "cdo_user" "user-3" {
  name             = "jawaharlal@example.com"
  role             = "ROLE_SUPER_ADMIN"
  is_api_only_user = false
}

resource "cdo_user" "user-4" {
  name             = "abulkalamazad@example.com"
  role             = "ROLE_READ_ONLY"
  is_api_only_user = false
}

resource "cdo_user" "my-api-only-user" {
  name             = "api-only-user"
  role             = "ROLE_ADMIN"
  is_api_only_user = true
}
