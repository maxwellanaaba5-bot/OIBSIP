# Research Report on Common Network Security Threats

## 1. Executive Summary

Network security threats have grown increasingly sophisticated over the past decade, with attackers leveraging automation, botnets, and encrypted channels to bypass traditional defenses. This report examines three categories of network-level attacks that continue to pose significant risks to organizations worldwide: Denial of Service (DoS/DDoS) attacks, Man-in-the-Middle (MITM) attacks, and various forms of spoofing.

For each threat, this report outlines the underlying mechanics, documented real-world incidents, measurable impact, and evidence-based mitigation strategies. Organizations that understand both the technical and operational dimensions of these threats are better positioned to build layered defenses that reduce exposure and accelerate incident response.

---

## 2. Introduction

The modern network perimeter is no longer a clearly defined boundary. With the proliferation of cloud services, remote workforces, and Internet of Things (IoT) devices, the attack surface available to adversaries has expanded considerably. Despite advances in detection and prevention technologies, fundamental network-layer attacks remain among the most disruptive and frequently observed threats in security operations centers worldwide.

Three threat categories stand out for their persistence and adaptability:

- **DoS/DDoS attacks** overwhelm infrastructure with traffic or requests, denying legitimate users access to services.
- **Man-in-the-Middle attacks** silently intercept and potentially alter communications between two parties.
- **Spoofing attacks** manipulate identity information at various protocol layers to deceive systems and users.

Understanding these threats in technical depth — not merely at a conceptual level — is essential for architects, engineers, and security practitioners responsible for designing and maintaining resilient networks.

---

## 3. Denial of Service (DoS) and Distributed Denial of Service (DDoS) Attacks

### 3.1 Overview

A Denial of Service attack is any deliberate attempt to make a computer system, network, or service unavailable to its intended users by exhausting resources — bandwidth, processing power, memory, or connection state tables. When the attack traffic originates from a large number of geographically distributed sources (typically a botnet), the attack is classified as a Distributed Denial of Service (DDoS) attack.

### 3.2 How DoS/DDoS Attacks Work

DoS and DDoS attacks are generally categorized into three functional classes:

**Volumetric Attacks**
Aim to saturate the target's available bandwidth. Examples include UDP flood attacks, ICMP floods, and DNS amplification attacks. In an amplification attack, an attacker sends a small spoofed request to a publicly accessible server (such as an open DNS resolver or an NTP server), which then sends a response that is orders of magnitude larger to the victim's IP address. DNS amplification can achieve amplification factors exceeding 50:1, meaning each byte of attacker traffic generates 50 bytes directed at the victim.

**Protocol Attacks**
These exploit weaknesses in how networking protocols manage state. The SYN flood attack is a classic example: a client initiates many TCP handshakes by sending SYN packets but never completes the handshake, filling the server's connection state table until it can accept no new connections. Ping of Death attacks exploited a vulnerability in IP fragmentation reassembly to crash systems by sending malformed oversized packets.

**Application Layer Attacks (Layer 7)**
These target web servers, APIs, and application logic. Rather than flooding bandwidth, they send a moderate volume of requests that are computationally expensive to process — complex database queries, large file uploads, or SSL handshake floods. These attacks are harder to distinguish from legitimate traffic and are increasingly used in combination with other attack types.

### 3.3 Real-World Examples

| Year | Incident |
|------|----------|
| 2016 | **Mirai Botnet** — Struck Dyn (DNS provider) using compromised IoT devices, peaking at ~1.2 Tbps. Disrupted Twitter, Netflix, Reddit, and GitHub across North America and Europe. |
| 2018 | **GitHub DDoS** — 1.35 Tbps attack exploiting misconfigured Memcached servers (amplification ratio up to 51,000:1). Mitigated by Akamai Prolexic within ~20 minutes. |
| 2020 | **AWS DDoS** — 2.3 Tbps attack, the largest ever recorded at the time, using CLDAP reflection, targeting an unidentified AWS customer. |
| 2021 | **Belgian Belnet Attack** — Sustained DDoS disrupted parliamentary meetings, government websites, and scientific institutions simultaneously for several hours. |

### 3.4 Impact

- **Financial loss:** Prolonged downtime translates directly to lost revenue. Cloudflare estimates the average cost at over $50,000 per hour of downtime.
- **Reputational damage:** Publicly visible outages erode customer trust and can have lasting effects on brand perception.
- **Distraction tactic:** DDoS attacks are frequently used as a smokescreen while a concurrent intrusion or data exfiltration campaign proceeds undetected.
- **Extortion:** "Ransom DDoS" (RDDoS) involves attackers threatening sustained attacks unless a cryptocurrency payment is made.

### 3.5 Mitigation Strategies

- **Rate limiting and traffic shaping** — Configure network equipment to limit request rates from any single source.
- **Anycast network diffusion** — Distribute incoming traffic across multiple geographically dispersed nodes.
- **Upstream scrubbing centers** — Partner with DDoS mitigation providers (Cloudflare Magic Transit, Akamai Prolexic, AWS Shield Advanced).
- **Ingress filtering (BCP38)** — Implement RFC 2827 ingress filtering to prevent IP spoofing, which underlies amplification attacks.
- **SYN cookies** — Enable SYN cookie support on servers and firewalls to eliminate SYN flood vulnerability.
- **Blackhole routing** — As a last resort, null-route all traffic to a targeted IP address.
- **Web Application Firewalls (WAF)** — For application-layer attacks, WAFs can identify and block request patterns characteristic of Layer 7 floods.

---

## 4. Man-in-the-Middle (MITM) Attacks

### 4.1 Overview

A Man-in-the-Middle attack occurs when an attacker secretly positions themselves between two communicating parties, with each party believing they are communicating directly and exclusively with the other. The attacker may passively eavesdrop on the communication, actively alter the transmitted data, or inject entirely new content into the session.

### 4.2 How MITM Attacks Work

MITM attacks typically involve two stages: interception and decryption.

**ARP Spoofing (ARP Cache Poisoning)**
The Address Resolution Protocol (ARP) resolves IP addresses to MAC addresses on local area networks and has no built-in authentication mechanism. An attacker on the same LAN broadcasts crafted ARP reply packets associating their own MAC address with a legitimate IP address (such as the default gateway). Hosts that accept these replies update their ARP cache accordingly, redirecting their traffic through the attacker's machine, while the interception remains invisible to both parties.

**DNS Spoofing (DNS Cache Poisoning)**
An attacker corrupts a DNS resolver's cache with false records, causing domain name queries to resolve to attacker-controlled IP addresses. Victims connecting to what appears to be a legitimate domain are instead directed to an impersonator site. The Kaminsky attack (2008) demonstrated a practical technique for poisoning DNS caches at scale within seconds.

**SSL Stripping**
Introduced by security researcher Moxie Marlinspike, SSL stripping downgrades a victim's HTTPS connection to HTTP, allowing plaintext interception. The attacker maintains an HTTPS connection to the server on behalf of the victim while serving the victim an unencrypted HTTP version of the site.

**Rogue Wi-Fi Access Points**
An attacker deploys a wireless access point mimicking a legitimate network (identical or similar SSID) in a public location. Devices that connect automatically, or users who select the rogue network, have all their unencrypted traffic routed through the attacker.

**BGP Hijacking**
Border Gateway Protocol (BGP) lacks strong authentication. An attacker or misconfigured router can announce more specific prefixes for an IP range it does not own, causing global routers to direct traffic through attacker-controlled infrastructure. This technique has been used to intercept traffic at a massive scale.

### 4.3 Real-World Examples

| Year | Incident |
|------|----------|
| 2015 | **Superfish (Lenovo)** — Pre-installed adware performed MITM interception of all HTTPS traffic on consumer laptops, breaking certificate trust chains for millions of users. |
| 2018 | **BGP Hijacking of Amazon Route 53** — Attackers hijacked ~1,300 Amazon Route 53 IP addresses, redirecting MyEtherWallet traffic to a fraudulent server. Approximately $17 million in Ethereum was stolen. |
| 2011 | **DigiNotar CA Compromise** — Fraudulent SSL certificates were issued for high-profile domains including google.com, used to intercept encrypted communications of Iranian users. DigiNotar subsequently filed for bankruptcy. |

### 4.4 Impact

- **Credential theft:** Login credentials, session tokens, and authentication cookies captured in transit grant attackers direct account access.
- **Data exfiltration:** Sensitive communications, financial transactions, medical records, or intellectual property may be intercepted without the knowledge of either party.
- **Session hijacking:** Capturing and reusing authentication cookies allows attackers to take over active sessions without needing original credentials.
- **Financial fraud:** MITM attacks have been used to intercept wire transfer communications and modify recipient account details (Business Email Compromise).
- **Malware injection:** Content injected into unencrypted HTTP responses can deliver malicious scripts or redirect users to exploit kits.

### 4.5 Mitigation Strategies

- **Enforce TLS everywhere** — All web services should redirect HTTP to HTTPS and configure HSTS (HTTP Strict Transport Security) headers.
- **HSTS Preloading** — Submit domains to browser HSTS preload lists, ensuring HTTPS is enforced even on first visits.
- **Certificate Pinning** — Applications can be configured to trust only specific certificates or public keys for specific domains.
- **Certificate Transparency (CT)** — CT logs provide a public, auditable record of all issued TLS certificates. Domain owners should monitor CT logs for unauthorized issuance and configure CAA DNS records.
- **Dynamic ARP Inspection (DAI)** — Switches with DAI validate ARP packets against a DHCP snooping binding table, dropping spoofed ARP replies.
- **DNSSEC** — Adds cryptographic authentication to DNS responses, allowing resolvers to verify responses have not been tampered with.
- **Mutual TLS (mTLS)** — For API and service-to-service communication, requiring both parties to present valid certificates prevents silent interception.
- **VPN and encrypted tunnels** — For remote users, VPN connections encrypt all traffic from endpoint to corporate network, preventing Wi-Fi-level interception.

---

## 5. Spoofing Attacks

### 5.1 Overview

Spoofing refers to any technique in which an attacker falsifies identity information to deceive a target system or user. Spoofing attacks occur at multiple layers of the network stack and take many forms, from forging a sender's IP address to impersonating a trusted email domain. Many other attack types — including DDoS amplification and MITM — rely on spoofing as a component.

### 5.2 How Spoofing Attacks Work

**IP Spoofing**
IP packets contain a source address field that is set by the sending host and is not validated by intermediate routers in most configurations. An attacker can craft packets with an arbitrary source IP address — either to impersonate a trusted host, obscure the origin of an attack, or (in reflection attacks) cause responses to be directed at a victim rather than the attacker.

**Email Spoofing**
The Simple Mail Transfer Protocol (SMTP) allows a sender to set any value in the From: header field, meaning an attacker can send messages appearing to originate from any email address. Combined with social engineering, spoofed emails are the backbone of phishing and Business Email Compromise (BEC) campaigns.

**DNS Spoofing**
An attacker who can inject false records into a DNS resolver's cache causes victims to connect to attacker-controlled servers. DNS spoofing can also occur through compromised DNS servers, social engineering of domain registrars, or BGP-level hijacking of the IP addresses hosting DNS infrastructure.

**MAC Address Spoofing**
On local networks, devices are identified at Layer 2 by their MAC address. MAC addresses can be overwritten in software on virtually all modern operating systems. Attackers spoof MAC addresses to bypass MAC-based access controls, impersonate other devices, or avoid tracking and attribution.

**Website Spoofing (Typosquatting / Homograph Attacks)**
Attackers register domain names visually similar to legitimate domains (e.g., paypa1.com) or exploit internationalized domain names that render as visually identical to Latin characters, directing users to fraudulent sites.

### 5.3 Real-World Examples

| Year | Incident |
|------|----------|
| 2020 | **Twitter Bitcoin Scam** — High-profile accounts (Obama, Biden, Musk, Apple) were compromised via social engineering. Spoofed identity posts collected ~$120,000 in Bitcoin within hours. |
| 2016 | **FACC BEC Attack** — Austrian aerospace manufacturer FACC lost approximately €50 million when an attacker spoofed the CEO's email to redirect an urgent wire transfer. Both the CEO and CFO were subsequently terminated. |
| 2014 | **NTP Amplification via IP Spoofing** — Attackers used IP-spoofed packets and NTP monlist commands (amplification ratio ~700:1) to generate attacks exceeding 400 Gbps, targeting European gaming networks. |
| 2020 | **SolarWinds Attack** — Command-and-control infrastructure relied heavily on DNS-based communication using domain generation algorithms and spoofed DNS subdomains. Approximately 18,000 customers were affected, including multiple U.S. government agencies. |

### 5.4 Impact

- **Financial fraud:** Email and caller ID spoofing underpin billions in annual fraud losses through BEC, phishing, and vishing attacks. The FBI IC3 reported BEC losses of over $2.9 billion in 2023 alone.
- **Credential harvesting:** Spoofed websites that convincingly impersonate legitimate services capture usernames, passwords, and MFA codes.
- **Network reconnaissance and exploitation:** IP spoofing can be used to probe networks from seemingly trusted internal addresses or bypass IP-based access controls.
- **Amplification of other attacks:** IP spoofing is a prerequisite for reflection/amplification DDoS attacks.
- **Reputational damage:** Organizations whose domains are successfully spoofed in phishing campaigns suffer brand damage and may see their domains blacklisted by email security systems.

### 5.5 Mitigation Strategies

**For IP Spoofing:**
- **BCP38/RFC 2827 Ingress Filtering** — ISPs and enterprise operators should configure routers to drop packets whose source addresses are inconsistent with the arriving interface.
- **Reverse Path Forwarding (uRPF)** — Router feature that verifies whether the source IP of an incoming packet is reachable via the interface it arrived on.

**For Email Spoofing:**
- **SPF (Sender Policy Framework)** — DNS TXT record specifying which mail servers are authorized to send email on behalf of a domain.
- **DKIM (DomainKeys Identified Mail)** — Cryptographic signing mechanism that attaches a digital signature to outgoing emails, verified using a public key in DNS.
- **DMARC (Domain-based Message Authentication, Reporting & Conformance)** — Allows domain owners to specify policy for messages failing authentication (none, quarantine, or reject) and receive reports on outcomes.
- **BIMI (Brand Indicators for Message Identification)** — Allows organizations to display a verified brand logo in supporting email clients for messages passing DMARC authentication.

**For DNS and Website Spoofing:**
- **DNSSEC** — Signs DNS records with cryptographic signatures, allowing resolvers to verify authenticity.
- **DNS over HTTPS (DoH) / DNS over TLS (DoT)** — Encrypts DNS queries between clients and resolvers, preventing in-path tampering.
- **FIDO2/WebAuthn hardware security keys** — Provide phishing-resistant authentication by binding credentials to the legitimate domain, making them unusable on spoofed sites.

---

## 6. Comparative Threat Analysis

| Attribute | DoS / DDoS | MITM | Spoofing |
|---|---|---|---|
| Primary Goal | Disrupt availability | Intercept/alter communications | Deceive identity verification |
| Typical Target | Servers, networks, infrastructure | Individual sessions, communications | Users, email systems, routing |
| Detection Difficulty | Moderate (traffic anomalies visible) | High (passive interception is silent) | Variable — low (email) to high (BGP) |
| Technical Complexity | Low to moderate | Moderate to high | Low (email) to high (BGP) |
| Primary Defense Layer | Network / Transport | Application / Transport | Protocol / Application |
| Key Protocols Exploited | TCP, UDP, ICMP, DNS, NTP | ARP, DNS, TLS, BGP | SMTP, DNS, IP, ARP |

---

## 7. Organizational Mitigation Framework

Addressing network security threats effectively requires more than technical controls. A comprehensive framework encompasses four dimensions:

### 7.1 Technical Controls

- Deploy and regularly test DDoS mitigation capabilities, including upstream scrubbing service agreements.
- Enforce TLS 1.2 or higher across all services; disable deprecated protocols (SSL 3.0, TLS 1.0, TLS 1.1).
- Implement network segmentation to limit lateral movement in the event of an interception or spoofing-enabled intrusion.
- Maintain current patching cadences for all network equipment, particularly devices exposed to the internet.
- Deploy SIEM systems with correlation rules for detecting ARP anomalies, unusual DNS query patterns, and traffic spikes.

### 7.2 Procedural Controls

- Establish an incident response plan addressing DDoS, MITM, and spoofing scenarios with defined escalation paths and communication templates.
- Conduct regular penetration testing exercises that include network-layer attack scenarios.
- Implement out-of-band verification procedures for high-value financial transactions, particularly those initiated by email.

### 7.3 Human Factors

- Train staff to recognize phishing and spoofed communications, including caller ID spoofing in phone-based social engineering.
- Establish and enforce verification protocols before acting on email-based payment or transfer requests.
- Educate users on public Wi-Fi risks and the importance of VPN usage.

### 7.4 Governance and Supply Chain

- Evaluate third-party vendors and cloud providers for their DDoS resilience and MITM prevention capabilities.
- Include security requirements covering spoofing prevention (SPF/DKIM/DMARC) in vendor contracts.
- Monitor certificate transparency logs for unauthorized certificate issuance for organizational domains.

---

## 8. Conclusion

DoS/DDoS attacks, Man-in-the-Middle attacks, and spoofing remain foundational threats in the network security landscape precisely because they target weaknesses inherent in the design of core internet protocols. These protocols were built for interoperability and performance rather than security, and many of the authentication and integrity mechanisms that now partially address these weaknesses have been retrofitted over decades.

The incidents documented in this report — from the Mirai botnet's disruption of critical DNS infrastructure to the BGP hijacking that drained millions in cryptocurrency — illustrate that these are not theoretical risks. They materialize regularly and at scale. Defenders must therefore treat them as persistent operational concerns, not academic scenarios.

The most effective defenses share common characteristics: they operate at the protocol level rather than relying solely on perimeter devices, they assume that some communications will be intercepted or spoofed rather than trusting network position alone, and they layer cryptographic controls with behavioral monitoring so that technical failure in one control does not mean total compromise.

---

## 9. References

1. Cloudflare. (2023). *DDoS Attack Trends Report Q4 2023*. Cloudflare, Inc.
2. Imperva. (2022). *Global DDoS Threat Landscape Report*. Imperva, Inc.
3. FBI Internet Crime Complaint Center. (2024). *2023 Internet Crime Report*. Federal Bureau of Investigation.
4. Senie, D. & Ferguson, P. (2000). *Network Ingress Filtering: Defeating Denial of Service Attacks which employ IP Source Address Spoofing*. RFC 2827. IETF.
5. Arends, R. et al. (2005). *DNS Security Introduction and Requirements*. RFC 4033. IETF.
6. Klensin, J. (2008). *Simple Mail Transfer Protocol*. RFC 5321. IETF.
7. CISA. (2022). *Understanding and Mitigating Russian State-Sponsored Cyber Threats to U.S. Critical Infrastructure*.
8. Krebs, B. (2016). *Source Code for IoT Botnet 'Mirai' Released*. Krebs on Security.
9. IETF BCP38 Working Group. (2000). *Ingress Filtering for Multihomed Networks*. RFC 3704.
10. NIST. (2020). *Zero Trust Architecture*. Special Publication 800-207.
11. OWASP. (2023). *Transport Layer Security Cheat Sheet*. Open Web Application Security Project.
12. Verizon. (2024). *Data Breach Investigations Report*. Verizon Communications.

*This report is intended for educational and organizational security planning purposes.*
