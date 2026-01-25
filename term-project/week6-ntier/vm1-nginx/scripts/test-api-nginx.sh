#!/bin/bash
# Test API via Nginx (HTTPS)

HTTPS_URL="https://taskboard.local/api"
PASSED=0
FAILED=0

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

test_endpoint() {
    name="$1"
    url="$2"
    expected="$3"

    echo -n "Testing: $name... "
    response=$(curl -k -s "$url")

    if echo "$response" | grep -q "$expected"; then
        echo -e "${GREEN}✓ PASSED${NC}"
        ((PASSED++))
    else
        echo -e "${RED}✗ FAILED${NC}"
        echo "Response: $response"
        ((FAILED++))
    fi
}

echo "=== VM1: Nginx HTTPS Test ==="

test_endpoint "HTTPS Health" "$HTTPS_URL/health" "healthy"
test_endpoint "HTTPS Get Tasks" "$HTTPS_URL/tasks" "success"

echo "Result: $PASSED passed, $FAILED failed"
