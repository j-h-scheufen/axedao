# Atlas configuration for Drizzle integration
# This configuration uses Drizzle ORM schema as the source of truth
# and Atlas for migration planning and execution

# External schema data source using Drizzle Kit export
data "external_schema" "drizzle" {
  program = [
    "npx",
    "drizzle-kit",
    "export"
  ]
}

# Local development environment
env "local" {
  # Target database to apply migrations to
  # Uses DATABASE_URL from environment
  url = getenv("DATABASE_URL")

  # Dev database for Atlas schema operations
  # Atlas uses this to plan and validate migrations
  dev = "docker://postgres/17/dev?search_path=public"

  # Schema source from Drizzle export
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory for Atlas-generated migrations
  migration {
    dir = "file://atlas/migrations"
  }
}

# Staging environment (Supabase)
env "staging" {
  # Staging database connection
  url = getenv("STAGING_DATABASE_URL")

  # Schema source from Drizzle export
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory
  migration {
    dir = "file://atlas/migrations"
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
    backward_incompatible {
      error = true
    }
  }
}

# Production environment (Supabase)
env "production" {
  # Production database connection
  url = getenv("PRODUCTION_DATABASE_URL")

  # Schema source from Drizzle export
  schema {
    src = data.external_schema.drizzle.url
  }

  # Migration directory
  migration {
    dir = "file://atlas/migrations"
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
    backward_incompatible {
      error = true
    }
  }
}
