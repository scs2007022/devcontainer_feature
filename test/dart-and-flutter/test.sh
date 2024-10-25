#!/bin/bash
set -e

source dev-container-features-test-lib

check "flutter --version" flutter --version

reportResults