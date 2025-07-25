#!/usr/bin/env bash
set -e

echo "Updating package list..."
sudo apt update -y

echo "Installing Java 17 JDK..."
sudo apt install -y openjdk-17-jdk

echo "Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins apt repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating apt cache again..."
sudo apt update -y

echo "Installing Jenkins..."
sudo apt install -y jenkins

echo "Enabling and starting Jenkins service..."
sudo systemctl enable --now jenkins

echo "Waiting for Jenkins to initialize..."
sleep 10
