FROM ubuntu:latest

# تحديث القوائم وتثبيت المكتبات الأساسية
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    libyaml-dev \
    && rm -rf /var/lib/apt/lists/*

# تحديث pip لآخر إصدار
RUN pip3 install --upgrade pip

# تثبيت PyYAML
RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
