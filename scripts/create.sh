#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ftnode \
  --config example-com-scrape.json \
  SourceSerif4Variable*ttf
