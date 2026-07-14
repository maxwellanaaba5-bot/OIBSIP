# Research Report: Social Engineering Attacks

**Prepared for:** Oasis Infobyte Cybersecurity Internship
**Author:** Anaaba Maxwell Apuswini
**Note:** This report was researched and drafted with the assistance of AI, then reviewed by the author.

---

## 1. Objective

This report examines social engineering as an attack category, covering its major techniques (phishing, pretexting, and baiting, among related variants), real-world case studies that illustrate the organizational impact of these attacks, and practical recommendations for prevention and mitigation.

---

## 2. Introduction

Social engineering is the manipulation of human psychology — rather than technical exploitation of software or hardware — to gain unauthorized access to systems, data, or funds. Unlike malware or exploit-based attacks, social engineering targets people: their trust, urgency, fear, curiosity, or desire to be helpful. Security professionals consistently identify people as the weakest link in an organization's defenses, because even well-configured technical controls can be bypassed if an attacker convinces the right employee to click a link, hand over credentials, or approve a wire transfer.

---

## 3. Types of Social Engineering Attacks

### 3.1 Phishing
Phishing is the use of fraudulent emails, messages, or websites that impersonate a trusted entity to trick victims into revealing credentials, financial details, or installing malware. Variants include:
- **Spear phishing** — highly targeted phishing aimed at a specific individual or small group, often using personal or organizational details to appear credible.
- **Whaling** — spear phishing directed at senior executives (CEOs, CFOs) because of their authority and access to funds.
- **Vishing** — voice-based phishing conducted over phone calls.
- **Smishing** — phishing conducted via SMS text messages.

### 3.2 Pretexting
Pretexting involves fabricating a believable scenario or false identity (a "pretext") to persuade a target to divulge information or perform an action they normally would not. Common pretexts include posing as IT support, a vendor, a new employee, or an auditor. Pretexting often forms the opening move of a larger attack chain, establishing trust before the attacker asks for something sensitive.

### 3.3 Baiting
Baiting lures victims with the promise of something enticing — a free download, a gift card, or a found USB drive — to get them to compromise their own security. A classic example is leaving malware-laden USB drives in a parking lot or lobby, relying on human curiosity to get someone to plug the device into a corporate machine.

### 3.4 Other Related Techniques
- **Quid pro quo** — offering a service or benefit (e.g., "free IT support") in exchange for information or access.
- **Tailgating/piggybacking** — physically following an authorized person into a restricted area without proper credentials.
- **Business Email Compromise (BEC)** — a hybrid of phishing and pretexting where attackers impersonate executives or vendors to redirect payments.

---

## 4. Case Studies

### 4.1 The 2020 Twitter Bitcoin Scam (Vishing + Pretexting)
On July 15, 2020, attackers compromised roughly 130 high-profile Twitter accounts, including those of major public figures, to promote a cryptocurrency scam. According to Twitter's own account of the incident and a subsequent New York State regulatory investigation, the attack began the previous day when the perpetrators <cite index="8-1">called several Twitter employees while posing as Twitter's IT help desk, claiming to be responding to a VPN issue that was common among the company's newly remote workforce</cite>. This pretext directed employees to a phishing page designed to capture their credentials. The attackers first compromised <cite index="7-1">lower-level employees without access to administrative tools, then used those initial credentials to reach and compromise individuals who did have such access</cite>. Using stolen access to internal support tools, the attackers took over accounts and posted messages asking followers to send Bitcoin, promising to double any amount received. <cite index="5-1">Within minutes, one account alone received over 320 deposits worth more than $110,000 before Twitter could remove the fraudulent posts.</cite>

**Impact:** Beyond the direct financial loss, the incident caused significant reputational damage and raised concerns about platform security given the accounts' potential use for spreading misinformation. In response, <cite index="5-1">Twitter introduced stronger background checks for employees with access to sensitive user data, deployed phishing-resistant security keys, and required customer-support staff to undergo social engineering awareness training</cite>.

### 4.2 The RSA SecurID Breach (Spear Phishing, 2011)
In March 2011, RSA Security — a major provider of two-factor authentication tokens — was breached via a two-stage spear phishing campaign. <cite index="15-1">Attackers sent two small batches of emails carrying the subject line "2011 Recruitment Plan" to two small groups of employees, each with a malicious Excel spreadsheet attached</cite>. When opened, the spreadsheet <cite index="10-1">triggered a script exploiting a then-unknown (zero-day) vulnerability in Adobe Flash, giving the attackers a foothold on the employee's machine</cite>. From there, the attackers deployed the Poison Ivy remote-access backdoor, harvested credentials from memory, and moved laterally through RSA's network until they reached data related to the SecurID token seed values.

**Impact:** Because SecurID tokens were used by numerous organizations — including defense contractors — for network authentication, the breach undermined trust in the technology industry-wide and reportedly led RSA to spend <cite index="14-1">upwards of $66 million on remediation and customer support</cite>. The case is frequently cited as proof that even security-focused companies remain vulnerable to comparatively unsophisticated social engineering.

### 4.3 Crelan Bank CEO Fraud / BEC (2016)
In January 2016, Belgian bank Crelan lost <cite index="18-1">€70 million (about $75.8 million) to a Business Email Compromise scam, also known as CEO fraud or a whaling attack</cite>. Attackers impersonated a senior executive and convinced someone in the finance department to authorize large wire transfers. <cite index="19-1">The fraud was uncovered only during a routine internal audit, and the perpetrators were never identified</cite>.

**Impact:** While Crelan's reserves absorbed the loss without affecting customers, the case remains one of the largest publicly disclosed CEO fraud incidents and is widely used to illustrate how a single well-crafted, authority-impersonating email can bypass an organization's financial controls without any malware or network intrusion at all.

### 4.4 Baiting via USB Drop Attacks
Academic research on baiting has repeatedly shown how effective the technique is against human curiosity. Field experiments — most notably a study from the University of Illinois Urbana-Champaign — dropped unmarked and labeled USB drives across a campus and found that a large majority were picked up and plugged into a computer, with many users opening files on the drive out of curiosity, despite the obvious risk of the drive being malicious. Corporate red-team exercises frequently replicate this test in office parking lots and lobbies with similarly high success rates, underscoring that baiting remains effective even where employees have received general security awareness training.

**Impact:** Baiting demonstrates that technical controls alone (e.g., disabling USB ports) are often necessary because human curiosity reliably overrides caution, especially when devices are labeled in an enticing way (e.g., "Payroll 2024" or "Confidential").

---

## 5. Cross-Case Observations

| Case | Technique(s) | Entry Point | Approx. Impact |
|---|---|---|---|
| Twitter (2020) | Vishing, pretexting | Phone call impersonating IT help desk | 130 accounts compromised; ~$110K in fraud; reputational damage |
| RSA SecurID (2011) | Spear phishing | Malicious Excel attachment | ~$66M remediation cost; industry-wide trust impact |
| Crelan Bank (2016) | BEC / whaling | Spoofed executive email | $75.8M direct financial loss |
| USB baiting studies | Baiting | Physical media (USB drives) | High compromise rate in controlled studies |

A common thread across these cases is that the initial compromise rarely involved breaking through a technical control. Instead, attackers exploited routine human behaviors: answering a phone call from "IT," opening a file that looked like a normal business document, trusting an email that appeared to come from a boss, or picking up a found USB drive. In every case, the technical damage (account takeovers, malware installation, fraudulent wire transfers) followed only after the social engineering step succeeded.

---

## 6. Recommendations for Prevention

1. **Security Awareness Training** — Conduct regular, scenario-based training so employees can recognize phishing emails, unexpected phone requests, and suspicious physical media. Twitter's post-incident response specifically added recurring training for staff with access to sensitive tools.
2. **Verification Procedures for Sensitive Requests** — Require out-of-band verification (e.g., a phone call to a known number) before acting on requests involving credential resets, access changes, or financial transfers — especially those marked "urgent."
3. **Least-Privilege Access Controls** — Limit administrative tool access to only the employees who need it, and segment access so that compromising one account does not automatically expose critical systems, as happened in the Twitter case.
4. **Phishing-Resistant Multi-Factor Authentication** — Favor hardware security keys or FIDO2-based MFA over SMS or app-based codes, since these are harder to phish or relay in real time.
5. **Email Authentication and Filtering** — Deploy SPF, DKIM, and DMARC to reduce email spoofing, combined with attachment sandboxing to catch malicious files like the Excel exploit used against RSA.
6. **Financial Control Segregation** — Require dual approval for large wire transfers or vendor payment changes, particularly when a request originates from an unusual channel or diverges from established process, to guard against BEC/CEO fraud.
7. **Physical Security Controls** — Disable auto-run on removable media, restrict USB ports where feasible, and train staff never to plug in unknown devices, directly addressing baiting risks.
8. **Incident Response Readiness** — Maintain a tested incident response plan so that, as in the Twitter case, compromised accounts or fraudulent transactions can be identified and contained quickly.
9. **Simulated Social Engineering Exercises** — Periodically run internal phishing simulations, pretext phone tests, and USB drop exercises to measure and improve employee resilience over time.

---

## 7. Conclusion

Social engineering remains one of the most consistently effective attack categories because it targets human trust rather than software vulnerabilities. The case studies above — spanning a major social media platform, a leading security vendor, and a large European bank — show that organizations of every size and sophistication level are susceptible when an attacker successfully manipulates the right individual. Effective defense therefore requires a layered approach that combines technical safeguards (MFA, email authentication, access segmentation) with sustained human-focused measures (training, verification procedures, and simulated exercises). No single control is sufficient; resilience against social engineering comes from consistently reinforcing both.

---

## 8. References

- New York State Department of Financial Services, *Twitter Investigation Report* (2020)
- Wikipedia, "2020 Twitter account hijacking"
- Zoho Workplace, "Email breach chronicles: RSA's infiltration—the spear phishing incident of 2011"
- Threatpost, "RSA: SecurID Attack Was Phishing Via an Excel Spreadsheet"
- DarkReading, "RSA Details SecurID Attack Mechanics"
- Help Net Security, "Belgian bank Crelan loses €70 million to BEC scammers" (2016)
- CyberSecurityCaseStudies.com, "Case study of Crelan where Belgian Bank loses 70 million to CEO scam"
- Journal of Cybersecurity Education, Research and Practice, "The 2020 Twitter Hack – So Many Lessons to Be Learned"
