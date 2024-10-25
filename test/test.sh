set -e

source dev-container-features-test-lib

check "flutter doctor" flutter doctor

reportResults