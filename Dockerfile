FROM python:3.8-slim
FROM ubuntu:latest
RUN useradd --create-home --shell /bin/bash app_user

WORKDIR /app
ADD . /app
# Somethinging might be wrong with this part. However it did work
# So I'm not entirely sure
RUN set -xe \
    && apt-get update \
    && apt-get install python3-pip
RUN pip install --upgrade pip

# unsure if this workdir change is needed here
WORKDIR /home/app_user
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
USER app_user
COPY . .
CMD ["bash"]