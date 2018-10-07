FROM node:8.12.0-stretch
MAINTAINER Michael Ben-Nes <miki@epoch.co.il>

# support multiarch: i386 architecture
# install essential tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y lib64ncurses5 libc6-i386 libstdc++6 lib32gcc1 libncurses5 lib32z1 zlib1g && \
    apt-get install -y --no-install-recommends xfce4 xfce4-goodies xfonts-base tightvncserver locales openssh-server vim git wget zip supervisor

# set the environment variables
ENV JAVA_HOME /opt/jdk
ENV GRADLE_HOME /opt/gradle
ENV ANDROID_HOME /opt/android-sdk
#ENV KOTLIN_HOME /opt/kotlinc
ENV PATH ${PATH}:${GRADLE_HOME}/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${JAVA_HOME}/bin
#ENV _JAVA_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap

RUN locale-gen en en_US en_US.UTF-8
RUN echo "export PATH=${PATH}" >> /etc/profile

RUN mkdir /run/sshd
ADD etc /etc
ADD root /root

CMD ["/usr/bin/supervisord"]

