# OPERATION: BLACK VEIL

**NEXUS DYNAMICS — Internal Security Incident**

## Mission

You have obtained access to a low-privilege maintenance account on a NEXUS DYNAMICS workstation. An internal report suggests that the workstation's automated archive service may be improperly configured.

Your objective is to investigate the environment, identify any security weakness that permits unauthorized privilege escalation, and recover the protected protocol fragment.

## Rules of engagement

- Work only inside the supplied Docker challenge.
- Do not attempt to access the host operating system.
- Investigate files, ownership, permissions, logs, and permitted commands.
- Do not assume that a suspicious-looking file is necessarily vulnerable.
- Document the evidence that supports your conclusions.

## Required submission

1. The commands used to investigate the workstation.
2. The relevant files and permission settings discovered.
3. An explanation of the vulnerability and its impact.
4. The recovered proof token.
5. A recommended remediation to remove the vulnerability.

## Assessment

Credit is awarded for accurate evidence, a clear explanation of the root cause, and a practical remediation—not merely for identifying suspicious filenames.

**Incident designation:** BLACK VEIL  
**Environment:** Debian Linux container  
**Starting account:** `challenger`