FROM ghcr.io/bluesky-social/pds:main

# Optional: install bash or tools if needed
RUN apk add --no-cache bash

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["node", "./bin.js"]
