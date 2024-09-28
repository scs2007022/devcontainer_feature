#!/bin/bash
apt-get update && apt-get install -y apt-transport-https curl git unzip xz-utils zip libglu1-mesa wget
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --batch --yes --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | tee /etc/apt/sources.list.d/dart_stable.list
apt-get update 
echo "$DART_VERSION"
if [[ "$DART_VERSION" = 'latest' ]];
then
    echo "apt-get install -y dart"
    apt-get install -y dart
else
    echo "apt-get install -y dart=$DART_VERSION"
    apt-get install -y dart=$DART_VERSION
fi
if [[ "$INSTALL_FLUTTER" = true ]];
then
    echo "Installing Flutter SDK"
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
fi
apt-get clean