#!/usr/bin/env bash

# Port 2222 - ssh - for emulator
# Port 5032 - Android ADB server
# For Ionic add:
# Port 8100, 35729 - http - app as web
# For React Native:
# Port 8081 - http - app as web

docker run -d --name android-xfce -it -h node --privileged \
-v /project/dir:/srv/proj \
-v ~/Android/jdk1.8.0_144:/opt/jdk \
-v ~/Android/Sdk:/opt/android-sdk \
-v /opt/gradle/gradle-4.1:/opt/gradle \
-p 2222:22 -p 5037:5037 gcr.io/epoch-906/android-xfce:1
