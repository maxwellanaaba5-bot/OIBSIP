# SQL Injection Vulnerability Demonstration using DVWA

## 1. Project Title
SQL Injection Attack Simulation on DVWA (Low Security Level)

---

## 2. Objective
The objective of this project is to demonstrate how SQL Injection vulnerabilities occur in web applications when user input is not properly validated or sanitized. The experiment is performed in a controlled environment using DVWA (Damn Vulnerable Web Application).

---

## 3. Environment Setup

The following tools and technologies were used:

- Operating System: Kali Linux / Windows (for GitHub upload)
- Web Server: Apache2
- Database: MariaDB
- Application: DVWA (Damn Vulnerable Web Application)
- Browser: Chrome / Firefox

---

## 4. Steps Performed

### Step 1: System Setup
- Started Apache and MariaDB services.
- Verified that the DVWA application was running on the local server.

### Step 2: Login to DVWA
- Accessed DVWA via browser using: http://localhost/DVWA

- Logged in using default credentials.

### Step 3: Security Configuration
- Navigated to **DVWA Security**
- Set security level to **Low**
- Submitted the configuration

### Step 4: SQL Injection Module
- Opened the **SQL Injection** module from the left menu.
- Tested normal input to observe expected behavior.

### Step 5: Normal Input Test
- Entered:1

- Observed that a single user record was returned.

### Step 6: SQL Injection Attack
- Entered the following payload:1' OR '1'='1

- Observed that multiple user records were returned due to altered SQL query logic.

---

## 5. Vulnerability Explanation

The application directly incorporates user input into SQL queries without using prepared statements or input validation.

The injected payload:
1' OR '1'='1


modifies the SQL WHERE clause to always evaluate as TRUE. As a result, the database returns all available records instead of a single user.

This demonstrates a classic SQL Injection vulnerability.

---

## 6. Impact of the Vulnerability

If exploited in real-world applications, SQL Injection can lead to:

- Unauthorized access to data
- Bypassing authentication systems
- Data leakage or modification
- Full database compromise

---

## 7. Recommended Mitigation

To prevent SQL Injection vulnerabilities:

- Use prepared statements (parameterized queries)
- Validate and sanitize all user inputs
- Apply least privilege access for database users
- Avoid displaying raw database errors to users

---

## 8. Evidence

All screenshots of the testing process are included in the `screenshots` folder. These include:

- Login page
- Security configuration
- SQL Injection input page
- Normal query result
- Injection payload execution
- Final output showing multiple records

---

## 9. Conclusion

This project demonstrates how simple input manipulation can exploit insecure SQL queries. It highlights the importance of secure coding practices and proper input handling in web applications.

---

## Author
Anaaba Maxwell Apuswini
