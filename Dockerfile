FROM debian:bookworm-slim

# Install abcde and common dependencies/codecs
RUN apt-get update && apt-get install -y \
    abcde \
    cd-paranoia \
    flac \
    lame \
    vorbis-tools \
    eject \
    id3v2 \
    eyed3 \
    wget \
    nano \
    glyrc \ 
    imagemagick \ 
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to where the music will be ripped
WORKDIR /data

# Default command
ENTRYPOINT ["abcde"]