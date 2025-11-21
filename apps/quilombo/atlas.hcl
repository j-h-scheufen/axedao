# Atlas configuration for Drizzle integration
# This configuration uses Drizzle ORM schema as the source of truth
# and Atlas for migration planning and execution

# External schema data source: Drizzle ORM schema with PostGIS extensions
# The wrapper script ensures Atlas dev database has extensions enabled during validation
data "external_schema" "drizzle" {
  program = [
    "bash",
    "db/atlas/export-with-extensions.sh"
  ]
}

# Local development environment
env "local" {
  # Target database to apply migrations to
  # Uses DATABASE_URL from environment
  url = getenv("DATABASE_URL")

  # Dev database for Atlas schema operations
  # Atlas uses this to plan and validate migrations
  # Using postgis image for geometry type support (ARM64 compatible)
  dev = "docker://postgis/17-3.5/dev"

  # Schema source: Drizzle ORM schema
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory for Atlas-generated migrations
  migration {
    dir = "file://db/atlas/migrations"
  }
}

# Staging environment (Supabase)
env "staging" {
  # Staging database connection
  url = getenv("STAGING_DATABASE_URL")

  # Dev database for Atlas schema operations
  dev = "docker://postgis/17-3.5/dev"

  # Schema source: Drizzle ORM schema
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory
  migration {
    dir = "file://db/atlas/migrations"
    revisions_schema = "atlas_schema_revisions"
  }

  # Enable linting for safety
  lint {
    # Detect destructive operations (DROP TABLE, DROP COLUMN, etc.)
    destructive {
      error = true
    }

    # Detect data-dependent changes (adding NOT NULL to nullable columns, etc.)
    data_depend {
      error = true
    }

    # Detect backward incompatible changes (renaming columns, changing types)
    incompatible {
      error = true
    }
  }
}

# Production environment (Supabase)
env "production" {
  # Production database connection
  url = getenv("PRODUCTION_DATABASE_URL")

  # Dev database for Atlas schema operations
  dev = "docker://postgis/17-3.5/dev"

  # Schema source: Drizzle ORM schema
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory
  migration {
    dir = "file://db/atlas/migrations"
    revisions_schema = "atlas_schema_revisions"
  }

  # Strict linting for production
  lint {
    # Detect destructive operations
    destructive {
      error = true
    }

    # Detect data-dependent changes
    data_depend {
      error = true
    }

    # Detect backward incompatible changes
    incompatible {
      error = true
    }
  }
}
