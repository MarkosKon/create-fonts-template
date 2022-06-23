FROM node:18.4.0-bullseye

USER root:root
RUN apt update && \
  apt install -y \
  python3-pip

# See https://bugs.chromium.org/p/chromium/issues/detail?id=1228625
# See Dockerfile in downloads
# See https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-on-alpine

# See https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-puppeteer-in-docker
# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
# RUN apt-get update \
#     && apt-get install -y wget gnupg \
#     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
#     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
#     && apt-get update \
#     && apt-get install -y google-chrome-stable fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
#       --no-install-recommends \
#     && rm -rf /var/lib/apt/lists/*

# RUN usermod --groups audio,video --append node
# RUN chown -R node:node /usr/bin/google-chrome-stable /usr/bin/google-chrome
# ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
#     PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

USER node:node
ENV PATH="/home/node/.local/bin:${PATH}"
WORKDIR /app

RUN npm config set prefix '~/.local/' && \
  npm install \
  --global \
  "@markoskon/ftnode" \
  "@markoskon/scrape-url-node" \
  # glyphhanger \
  unicode-utilities

RUN pip install \
  brotli \
  fonttools \
  zopfli




