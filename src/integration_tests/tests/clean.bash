# Creates a clean unconfigured environment for testing awscli-login.

setup() {
    load '../test_helper/bats-support/load'
    load '../test_helper/bats-assert/load'
    load '../test_helper/bats-file/load'

    TEST_TEMP_DIR="$(temp_make)"
    export AWS_CONFIG_FILE="$TEST_TEMP_DIR/.aws/config"
    export AWS_SHARED_CREDENTIALS_FILE="$TEST_TEMP_DIR/.aws/credentials"
    export AWSCLI_LOGIN_ROOT="$TEST_TEMP_DIR"
}

teardown() {
  temp_del "$TEST_TEMP_DIR"
}

if [[ ! -z "$AWSCLI_LOGIN_WINDOWS_TEST" ]]; then
    export CR=`printf '\r'`
else
    export CR=""
fi
