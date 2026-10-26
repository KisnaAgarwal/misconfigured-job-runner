
FROM debian:stable-slim

# Install required utilities and text editors
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        bash \
        sudo \
        nano \
        vim-tiny \
        coreutils \
        findutils \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Create the participant and internal investigation directories
RUN useradd --create-home --shell /bin/bash challenger && \
    mkdir -p /opt/nexus/config \
             /opt/nexus/logs \
             /opt/nexus/intel \
             /opt/nexus/scripts

# Install the privileged execution chain
COPY challenge/archive-sync.sh /opt/nexus/archive-sync.sh
COPY challenge/nightly-dispatch /usr/local/bin/nightly-dispatch

# Store investigation clues under /opt/nexus
COPY challenge/config/ice-engine.conf /opt/nexus/config/ice-engine.conf
COPY challenge/logs/security-audit.log /opt/nexus/logs/security-audit.log
COPY challenge/intel/operator-memo.txt /opt/nexus/intel/operator-memo.txt
COPY challenge/intel/artifact-inventory.txt /opt/nexus/intel/artifact-inventory.txt
COPY challenge/scripts/ice-cleaner.sh /opt/nexus/scripts/ice-cleaner.sh

# Copy the mission brief and introductory files
COPY challenge/mission-brief.md /home/challenger/MISSION_BRIEF.md
COPY challenge/WELCOME.txt /home/challenger/WELCOME.txt
COPY challenge/incident-report.txt /home/challenger/incident-report.txt

# Configure the sudo rule
COPY config/sudoers /etc/sudoers.d/nightcorp-runner

# Set permissions and create the protected artifact
RUN chown root:root /usr/local/bin/nightly-dispatch && \
    chmod 755 /usr/local/bin/nightly-dispatch && \
    chown root:challenger /opt/nexus/archive-sync.sh && \
    chmod 770 /opt/nexus/archive-sync.sh && \
    chown -R root:root /opt/nexus/config \
                       /opt/nexus/logs \
                       /opt/nexus/intel \
                       /opt/nexus/scripts && \
    chmod 755 /opt/nexus \
              /opt/nexus/config \
              /opt/nexus/logs \
              /opt/nexus/intel \
              /opt/nexus/scripts && \
    chmod 644 /opt/nexus/config/ice-engine.conf \
              /opt/nexus/logs/security-audit.log \
              /opt/nexus/intel/operator-memo.txt \
              /opt/nexus/intel/artifact-inventory.txt \
              /opt/nexus/scripts/ice-cleaner.sh && \
    chown root:root /etc/sudoers.d/nightcorp-runner && \
    chmod 440 /etc/sudoers.d/nightcorp-runner && \
    chown challenger:challenger \
        /home/challenger/WELCOME.txt \
        /home/challenger/MISSION_BRIEF.md \
        /home/challenger/incident-report.txt && \
    chmod 644 \
        /home/challenger/WELCOME.txt \
        /home/challenger/MISSION_BRIEF.md \
        /home/challenger/incident-report.txt && \
    printf '%s\n' \
        'The retrieved fragment is:' \
        '$ Kisna is so cool wow $' \
        > /root/black-ice-fragment.txt && \
    chmod 600 /root/black-ice-fragment.txt && \
    visudo -cf /etc/sudoers.d/nightcorp-runner

# Start as the unprivileged participant
USER challenger
WORKDIR /home/challenger

CMD ["/bin/bash"]
