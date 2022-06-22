#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

scrape \
  --delay 500 \
  --max-iterations 5 \
  https://markoskon.com
