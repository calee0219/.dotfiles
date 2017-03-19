# Bazel
yes | sudo add-apt-repository ppa:webupd8team/java
yes | sudo apt-get update
yes | sudo apt-get install oracle-java8-installer
echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
yes | sudo apt-get update && sudo apt-get install bazel
yes | sudo apt-get upgrade bazel

# gRPC
yes | sudo apt update && yes | sudo apt install -y\
    build-essential\
    curl\
    git\
    libfreetype6-dev\
    libpng12-dev\
    libzmq3-dev\
    pkg-config\
    python-dev\
    python-numpy\
    python-pip\
    software-properties-common\
    swig\
    zip\
    zliblg-dev

