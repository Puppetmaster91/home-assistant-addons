FROM ghcr.io/bluesky-social/pds:main

# Add bash (if needed by run.sh)
RUN apk add --no-cache bash

# Copy startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Use shell-style CMD so environment variables expand
CMD /run.sh
