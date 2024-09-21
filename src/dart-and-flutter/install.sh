apt-get update && apt-get install apt-transport-https curl git unzip xz-utils zip libglu1-mesa
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub 
gpg  --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main'
tee /etc/apt/sources.list.d/dart_stable.list
apt-get update 
if [$DART_VERSION -ne 'latest']
then
    apt-get install -y dart
else
    apt-get install -y dart=$DART_VERSION
fi
if [$FLUTTER]
then
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
    export PATH="/flutter/bin:$PATH"
fi
apt-get clean