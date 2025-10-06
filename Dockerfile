FROM quay.io/fedora/fedora-toolbox:latest

# Add "steam-devices" from core
RUN dnf update -y && dnf install -y steam-devices

# Install rpm-fusion free and non-free
RUN dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 

# Enable openh264
RUN dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Install rpm-fusion repositories
RUN dnf update -y && dnf install -y steam

