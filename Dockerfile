# https://github.com/ComplianceAsCode/content/blob/master/Dockerfiles/fedora
FROM fedora:latest

RUN dnf -y update && dnf -y upgrade && \
    dnf -y install cmake ninja-build openscap-utils python3-jinja2 python3-PyYAML && \
    dnf clean all

ENTRYPOINT /bin/bash