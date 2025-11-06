You are conducting a comprehensive security audit of the codebase to identify vulnerabilities, security misconfigurations, and compliance issues.

## Mission

Systematically review the codebase for security vulnerabilities using specialized security agents and produce a detailed security audit report with prioritized findings and remediation guidance.

## Audit Scope

Ask the user to specify scope if not provided:
- **Full audit** - Entire codebase (thorough but time-consuming)
- **Targeted audit** - Specific components or features
- **Pre-deployment audit** - Review recent changes before production
- **Compliance audit** - Focus on regulatory requirements (GDPR, HIPAA, SOC2, PCI-DSS)
- **Penetration test simulation** - Attempt to find exploitable vulnerabilities

## Security Audit Phases

### Phase 1: Reconnaissance and Planning (5 minutes)

**Objective**: Understand the application architecture and attack surface

Use the **security-auditor** agent to:
1. Identify application type and technology stack
2. Map external interfaces (APIs, web interfaces, integrations)
3. Identify sensitive data flows
4. Determine authentication/authorization mechanisms
5. Review third-party dependencies

Use the **Explore** agent (medium thoroughness) to:
1. Understand codebase structure
2. Locate security-critical components
3. Find configuration files
4. Identify API endpoints and routes

**Create threat model:**
- What assets need protection?
- Who are the threat actors?
- What are the attack vectors?
- What's the impact of compromise?

### Phase 2: Authentication and Authorization (10-15 minutes)

**Objective**: Verify identity and access controls

Use the **security-auditor** agent to check:

#### Authentication Issues:
- [ ] Weak password policies
- [ ] Missing password complexity requirements
- [ ] No account lockout after failed attempts
- [ ] Insecure password storage (not hashed/salted)
- [ ] Hard-coded credentials in source code
- [ ] Weak JWT secrets or insecure JWT implementation
- [ ] Missing multi-factor authentication (MFA)
- [ ] Session tokens not properly secured
- [ ] Session fixation vulnerabilities
- [ ] Missing CSRF protection

**Search patterns:**
```python
# Look for hardcoded credentials
password = "..."
api_key = "..."
secret = "..."

# Look for weak hashing
md5()
sha1()

# Look for insecure token generation
random.random()
Math.random()
```

#### Authorization Issues:
- [ ] Missing authorization checks
- [ ] Insecure direct object references (IDOR)
- [ ] Privilege escalation possibilities
- [ ] Broken access control
- [ ] Missing role-based access control (RBAC)
- [ ] Overly permissive permissions

**Check for:**
- Authorization checks before sensitive operations
- Proper user ownership validation
- Role/permission verification
- API endpoint protection

### Phase 3: Input Validation and Injection Attacks (15-20 minutes)

**Objective**: Find injection vulnerabilities

Use the **security-auditor** agent to check for:

#### SQL Injection:
```python
# Vulnerable patterns
execute("SELECT * FROM users WHERE id = " + user_id)
query = f"SELECT * FROM {table} WHERE ..."
cursor.execute("SELECT * FROM users WHERE name = '%s'" % name)
```

- [ ] String concatenation in SQL queries
- [ ] Missing parameterized queries
- [ ] Dynamic table/column names from user input
- [ ] ORM misuse allowing SQL injection

#### NoSQL Injection:
```javascript
// Vulnerable patterns
db.users.find({ username: req.body.username })
collection.find({ $where: userInput })
```

#### Command Injection:
```python
# Vulnerable patterns
os.system("command " + user_input)
subprocess.call("ls " + directory, shell=True)
eval(user_input)
exec(user_input)
```

#### XSS (Cross-Site Scripting):
```javascript
// Vulnerable patterns
innerHTML = userInput
document.write(userInput)
dangerouslySetInnerHTML={{ __html: userInput }}
```

- [ ] Unescaped user input in HTML
- [ ] Missing Content Security Policy (CSP)
- [ ] Unsafe use of eval() or Function()
- [ ] DOM-based XSS vulnerabilities

#### Path Traversal:
```python
# Vulnerable patterns
open(user_supplied_path)
send_file(request.args.get('file'))
os.path.join(base_dir, user_path)
```

#### XML/XXE Injection:
- [ ] XML parsing without disabling external entities
- [ ] SOAP endpoint vulnerabilities

Use the **error-detective** agent to:
- Search for dangerous functions
- Find input validation gaps
- Locate user input handling

### Phase 4: Data Protection (10-15 minutes)

**Objective**: Ensure sensitive data is protected

Use the **security-auditor** agent to check:

#### Encryption:
- [ ] Sensitive data stored unencrypted
- [ ] Weak encryption algorithms (DES, RC4, MD5)
- [ ] Hard-coded encryption keys
- [ ] Missing encryption in transit (HTTPS)
- [ ] Insecure TLS configuration (old TLS versions)
- [ ] Missing certificate validation

**Look for:**
```python
# Weak encryption
DES.new(key)
Cipher(algorithms.RC4(key))
hashlib.md5()
hashlib.sha1()

# Hardcoded keys/secrets
SECRET_KEY = "hardcoded-secret"
API_KEY = "sk-..."
```

#### Sensitive Data Exposure:
- [ ] Credentials in logs
- [ ] PII in error messages
- [ ] Secrets in environment variables (without proper protection)
- [ ] API keys in client-side code
- [ ] Sensitive data in URL parameters
- [ ] Verbose error messages exposing internals

**Check configuration files:**
- .env files for secrets
- Config files with credentials
- Database connection strings
- API keys and tokens

Use **search-for-pattern** tool to find:
- Patterns like "password", "secret", "api_key", "token"
- Credit card patterns
- SSN patterns
- Email addresses in unusual places

#### Compliance Issues:
For GDPR/HIPAA/PCI-DSS:
- [ ] Missing data retention policies
- [ ] No data anonymization
- [ ] Missing audit logs
- [ ] No data deletion capability
- [ ] Missing consent mechanisms
- [ ] Inadequate access controls for sensitive data

### Phase 5: Configuration and Deployment (10 minutes)

**Objective**: Find security misconfigurations

Use the **security-auditor** and **devops-troubleshooter** agents to check:

#### Server Configuration:
- [ ] Debug mode enabled in production
- [ ] Directory listing enabled
- [ ] Default credentials not changed
- [ ] Unnecessary services exposed
- [ ] Missing security headers
- [ ] Permissive CORS policy
- [ ] Insecure cookie settings (missing Secure, HttpOnly, SameSite)

**Security headers to check:**
```
X-Frame-Options
X-Content-Type-Options
Strict-Transport-Security
Content-Security-Policy
X-XSS-Protection
Referrer-Policy
Permissions-Policy
```

#### Container/Infrastructure Security:
- [ ] Running containers as root
- [ ] Privileged containers
- [ ] Mounted sensitive directories
- [ ] Exposed management interfaces
- [ ] Missing network segmentation
- [ ] Overly permissive IAM roles

#### Dependency Security:
- [ ] Outdated dependencies with known vulnerabilities
- [ ] Unused dependencies
- [ ] Packages from untrusted sources
- [ ] Missing dependency pinning
- [ ] No vulnerability scanning in CI/CD

Use appropriate agent to check dependencies:
- **python-pro** - Check requirements.txt, Pipfile, pyproject.toml
- **javascript-pro** - Check package.json, yarn.lock
- **golang-pro** - Check go.mod
- **rust-pro** - Check Cargo.toml

### Phase 6: API Security (10-15 minutes)

**Objective**: Secure API endpoints

Use the **security-auditor** and **backend-architect** agents to check:

#### API Vulnerabilities:
- [ ] Missing rate limiting
- [ ] No API authentication
- [ ] Missing input validation
- [ ] Verbose error messages
- [ ] Missing API versioning
- [ ] Insecure deserialization
- [ ] Mass assignment vulnerabilities
- [ ] Missing API gateway/firewall

#### GraphQL-Specific (if applicable):
- [ ] Excessive query depth
- [ ] Missing query complexity limits
- [ ] Introspection enabled in production
- [ ] Missing field-level authorization

Use the **graphql-architect** agent for GraphQL applications.

#### REST API Best Practices:
- [ ] Proper HTTP method usage
- [ ] Idempotency for critical operations
- [ ] Request/response validation
- [ ] Proper status codes
- [ ] API documentation security notes

### Phase 7: Business Logic Vulnerabilities (10 minutes)

**Objective**: Find logic flaws

Use the **security-auditor** agent to check:

- [ ] Race conditions in critical operations
- [ ] Integer overflow/underflow
- [ ] Price/quantity manipulation
- [ ] Workflow bypass vulnerabilities
- [ ] Time-of-check/time-of-use (TOCTOU) issues
- [ ] Missing rate limiting on expensive operations
- [ ] Insufficient anti-automation

**Common patterns:**
- Payment processing logic
- Discount/coupon code handling
- Refund/credit logic
- Multi-step workflows
- State machine transitions

### Phase 8: Code Quality and Security Patterns (10 minutes)

**Objective**: Review secure coding practices

Use the **code-reviewer** agent to check:

- [ ] Error handling revealing sensitive info
- [ ] Missing input sanitization
- [ ] Unsafe deserialization
- [ ] Use of dangerous functions
- [ ] Missing security logging
- [ ] Insufficient logging for security events
- [ ] Exception handling bypassing security checks

Use the **architect-review** agent to:
- Review security architecture patterns
- Check separation of concerns
- Verify defense in depth
- Assess blast radius of vulnerabilities

### Phase 9: Third-Party and Supply Chain (5-10 minutes)

**Objective**: Assess third-party risks

Use the **security-auditor** agent to:

1. **Inventory Dependencies:**
   - List all third-party libraries
   - Check for known vulnerabilities (CVEs)
   - Review dependency licenses
   - Check for abandoned/unmaintained packages

2. **Supply Chain Security:**
   - [ ] No dependency pinning
   - [ ] Missing integrity checks (checksums)
   - [ ] No SBOM (Software Bill of Materials)
   - [ ] Untrusted package sources

3. **Third-Party Integrations:**
   - [ ] Insecure API calls to external services
   - [ ] Missing certificate validation
   - [ ] Overly permissive API keys
   - [ ] No timeout handling

### Phase 10: Reporting and Remediation (10-15 minutes)

**Objective**: Document findings and provide remediation guidance

Use the **security-auditor** agent to compile findings into a comprehensive report.

## Security Audit Report Template

```markdown
# Security Audit Report

**Date**: [Date]
**Auditor**: Claude Code Security Audit
**Scope**: [Description of what was audited]
**Duration**: [Time spent]

## Executive Summary

**Overall Security Posture**: [Critical / High Risk / Medium Risk / Low Risk]

**Total Findings**: [Number]
- Critical: [Number]
- High: [Number]
- Medium: [Number]
- Low: [Number]
- Informational: [Number]

**Key Recommendations**:
1. [Most critical recommendation]
2. [Second most critical]
3. [Third most critical]

## Critical Findings (P0)

### [CRITICAL-001] [Vulnerability Title]

**Severity**: Critical
**CVSS Score**: [Score] (if applicable)
**Category**: [e.g., Injection, Authentication, Encryption]

**Description**:
[Detailed description of the vulnerability]

**Location**:
- File: [file path:line number]
- Component: [Component name]

**Proof of Concept**:
```[language]
[Code demonstrating the vulnerability]
```

**Impact**:
[What could happen if exploited]
- Confidentiality: [High/Medium/Low]
- Integrity: [High/Medium/Low]
- Availability: [High/Medium/Low]

**Exploitation Difficulty**: [Easy/Medium/Hard]

**Remediation**:
```[language]
[Corrected code or configuration]
```

**Steps to Fix**:
1. [Step 1]
2. [Step 2]
3. [Step 3]

**References**:
- [OWASP guideline]
- [CWE-XXX]
- [CVE if applicable]

---

[Repeat for each critical finding]

## High Severity Findings (P1)

[Same format as critical]

## Medium Severity Findings (P2)

[Same format, can be more concise]

## Low Severity Findings (P3)

[Brief descriptions and recommendations]

## Informational Findings

[Security best practices and recommendations]

## Positive Findings

**Security Strengths Observed**:
- [Things done well]
- [Good security practices found]

## Compliance Assessment

### GDPR Compliance
- [ ] Right to access
- [ ] Right to deletion
- [ ] Data minimization
- [ ] Consent management
- [ ] Data breach notification

### OWASP Top 10 Coverage
- [x] A01: Broken Access Control - [Status]
- [x] A02: Cryptographic Failures - [Status]
- [x] A03: Injection - [Status]
- [x] A04: Insecure Design - [Status]
- [x] A05: Security Misconfiguration - [Status]
- [x] A06: Vulnerable Components - [Status]
- [x] A07: Authentication Failures - [Status]
- [x] A08: Software and Data Integrity - [Status]
- [x] A09: Security Logging Failures - [Status]
- [x] A10: Server-Side Request Forgery - [Status]

## Risk Scorecard

| Category | Finding Count | Risk Level |
|----------|---------------|------------|
| Authentication | [N] | [High/Med/Low] |
| Authorization | [N] | [High/Med/Low] |
| Input Validation | [N] | [High/Med/Low] |
| Cryptography | [N] | [High/Med/Low] |
| Configuration | [N] | [High/Med/Low] |
| Dependencies | [N] | [High/Med/Low] |
| API Security | [N] | [High/Med/Low] |

## Remediation Roadmap

### Immediate (This Week)
1. [Critical fix 1]
2. [Critical fix 2]

### Short Term (This Month)
1. [High priority fix 1]
2. [High priority fix 2]

### Medium Term (This Quarter)
1. [Medium priority improvements]
2. [Architecture changes]

### Long Term (Ongoing)
1. [Security culture improvements]
2. [Process improvements]

## Security Testing Recommendations

1. **Automated Security Scanning**
   - Implement SAST (Static Analysis)
   - Implement DAST (Dynamic Analysis)
   - Dependency vulnerability scanning

2. **Manual Security Testing**
   - Penetration testing schedule
   - Code review process enhancements
   - Security training for developers

3. **Continuous Monitoring**
   - WAF implementation
   - Intrusion detection
   - Security event logging
   - Anomaly detection

## Appendices

### A. Methodology
[Tools and techniques used]

### B. Scope Limitations
[What was not tested]

### C. Reference Materials
[Security standards and guidelines referenced]

---

**Prepared by**: Claude Code Security Audit
**Report Version**: 1.0
```

## Agent Orchestration

### Phase 1-3 (Run in Parallel):
- **security-auditor** - Overall security assessment
- **Explore** agent - Code structure understanding
- **error-detective** - Find dangerous patterns

### Phase 4-6 (Run in Parallel):
- **security-auditor** - Data protection and configs
- **devops-troubleshooter** - Infrastructure security
- Language-specific agent - Dependency analysis

### Phase 7-8 (Run in Parallel):
- **security-auditor** - Business logic review
- **code-reviewer** - Code quality and patterns
- **architect-review** - Architecture security

### Phase 9 (Sequential):
- **security-auditor** - Supply chain analysis

### Phase 10 (Sequential):
- **security-auditor** - Compile report

## Security Tools Integration

If available, integrate with:
- **Snyk** - Dependency vulnerability scanning
- **Trivy** - Container scanning
- **SonarQube** - Static analysis
- **OWASP ZAP** - Dynamic analysis
- **Bandit/Semgrep** - Code security scanning

## Best Practices

✅ **Do:**
- Take a methodical, structured approach
- Prioritize findings by severity and exploitability
- Provide actionable remediation guidance
- Include code examples for fixes
- Consider business context in risk assessment
- Document false positives
- Focus on systemic issues, not just individual bugs

❌ **Don't:**
- Don't test in production without permission
- Don't perform destructive testing
- Don't ignore low-severity findings (they can chain)
- Don't provide generic recommendations
- Don't skip positive findings
- Don't forget compliance requirements

## Output During Audit

Provide progress updates:
```
## Security Audit Progress

**Phase**: [Current phase]
**Progress**: [X of Y phases complete]

### Findings So Far:
- Critical: [N]
- High: [N]
- Medium: [N]
- Low: [N]

### Current Focus:
[What you're currently auditing]

### Next:
[What's coming next]
```

## Now, Begin!

Ask the user to confirm the audit scope, then proceed with the comprehensive security assessment using the specialized agents.

**Remember**: Security is not about finding every possible issue, but about identifying the most critical risks and providing practical remediation guidance.
