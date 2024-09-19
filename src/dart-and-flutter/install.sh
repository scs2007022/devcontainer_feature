sudo apt-get update && sudo apt-get install apt-transport-https curl git unzip xz-utils zip libglu1-mesa
wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub 
sudo gpg  --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main'
sudo tee /etc/apt/sources.list.d/dart_stable.list
sudo apt-get update 
if [$DART_VERSION -ne 'latest']
then
    sudo apt-get install -y dart
else
    sudo apt-get install -y dart=$DART_VERSION
fi
if [$FLUTTER]
    git clone https://github.com/flutter/flutter.git -b stable --depth 1 /flutter
    export PATH="/flutter/bin:$PATH"
fi
RUN apt-get clean