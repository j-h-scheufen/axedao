#!/bin/bash
# Master pipeline script to process Capoeira groups data
# Runs all three phases sequentially

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  Capoeira Groups Data Processing Pipeline                     ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Check if tsx is available
if ! command -v tsx &> /dev/null; then
    echo "Error: tsx is not installed."
    echo "Please install it globally: npm install -g tsx"
    echo "Or use: pnpm add -g tsx"
    exit 1
fi

# Parse command line arguments
SKIP_PHASE_1=false
SKIP_PHASE_2=false
SKIP_PHASE_3=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --skip-phase-1)
      SKIP_PHASE_1=true
      shift
      ;;
    --skip-phase-2)
      SKIP_PHASE_2=true
      shift
      ;;
    --skip-phase-3)
      SKIP_PHASE_3=true
      shift
      ;;
    --phase-2-only)
      SKIP_PHASE_1=true
      SKIP_PHASE_3=true
      shift
      ;;
    --phase-3-only)
      SKIP_PHASE_1=true
      SKIP_PHASE_2=true
      shift
      ;;
    --help)
      echo "Usage: $0 [OPTIONS]"
      echo ""
      echo "Options:"
      echo "  --skip-phase-1      Skip quality filtering"
      echo "  --skip-phase-2      Skip website validation"
      echo "  --skip-phase-3      Skip geocoding"
      echo "  --phase-2-only      Run only Phase 2 (website validation)"
      echo "  --phase-3-only      Run only Phase 3 (geocoding)"
      echo "  --help              Show this help message"
      echo ""
      echo "Phases:"
      echo "  1. Quality Filtering - Filter groups by name, location, website/leader"
      echo "  2. Website Validation - Validate URLs and extract contact info"
      echo "  3. Geocoding - Convert addresses to GeoJSON coordinates"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use --help for usage information"
      exit 1
      ;;
  esac
done

# Phase 1: Quality Filtering
if [ "$SKIP_PHASE_1" = false ]; then
  echo "────────────────────────────────────────────────────────────────"
  echo "Phase 1: Quality Filtering"
  echo "────────────────────────────────────────────────────────────────"
  bash "$SCRIPT_DIR/01-filter-quality.sh"
  echo ""
else
  echo "⊘ Skipping Phase 1: Quality Filtering"
  echo ""
fi

# Phase 2: Website Validation
if [ "$SKIP_PHASE_2" = false ]; then
  echo "────────────────────────────────────────────────────────────────"
  echo "Phase 2: Website Validation & Data Enrichment"
  echo "────────────────────────────────────────────────────────────────"
  tsx "$SCRIPT_DIR/02-validate-websites.ts"
  echo ""
else
  echo "⊘ Skipping Phase 2: Website Validation"
  echo ""
fi

# Phase 3: Geocoding
if [ "$SKIP_PHASE_3" = false ]; then
  echo "────────────────────────────────────────────────────────────────"
  echo "Phase 3: Geocoding Addresses to GeoJSON"
  echo "────────────────────────────────────────────────────────────────"
  tsx "$SCRIPT_DIR/03-geocode-locations.ts"
  echo ""
else
  echo "⊘ Skipping Phase 3: Geocoding"
  echo ""
fi

echo "╔════════════════════════════════════════════════════════════════╗"
echo "║  Pipeline Complete!                                            ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "Output directories:"
if [ "$SKIP_PHASE_1" = false ]; then
  echo "  • Phase 1: $(dirname "$SCRIPT_DIR")/out/01-filtered/"
fi
if [ "$SKIP_PHASE_2" = false ]; then
  echo "  • Phase 2: $(dirname "$SCRIPT_DIR")/out/02-validated/"
fi
if [ "$SKIP_PHASE_3" = false ]; then
  echo "  • Phase 3: $(dirname "$SCRIPT_DIR")/out/03-geocoded/"
fi
echo ""
echo "Reports:"
if [ "$SKIP_PHASE_1" = false ]; then
  echo "  • Phase 1: $(dirname "$SCRIPT_DIR")/out/01-filter-report.json"
fi
if [ "$SKIP_PHASE_2" = false ]; then
  echo "  • Phase 2: $(dirname "$SCRIPT_DIR")/out/02-validation-report.json"
fi
if [ "$SKIP_PHASE_3" = false ]; then
  echo "  • Phase 3: $(dirname "$SCRIPT_DIR")/out/03-geocode-report.json"
fi
echo ""
