FROM ubuntu:noble AS builder

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl software-properties-common sudo git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo ubuntu && \
    echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/ubuntu-nopasswd && \
    chmod 0440 /etc/sudoers.d/ubuntu-nopasswd

USER ubuntu
WORKDIR /home/ubuntu

COPY --chown=ubuntu:ubuntu --chmod=755 install.sh /home/ubuntu/
RUN /home/ubuntu/install.sh

COPY --chown=ubuntu:ubuntu . /home/ubuntu/.local/share/chezmoi
RUN /home/ubuntu/.local/bin/mise x chezmoi -- chezmoi apply

FROM ubuntu:noble

RUN useradd -m -s /bin/bash ubuntu && \
    mkdir -p /home/ubuntu && \
    chown -R ubuntu:ubuntu /home/ubuntu

USER ubuntu
WORKDIR /home/ubuntu

COPY --from=builder --chown=ubuntu:ubuntu /home/ubuntu/ /home/ubuntu/

CMD [ "/bin/bash", "-l" ]
