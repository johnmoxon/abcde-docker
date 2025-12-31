# Dockerized abcde CD Ripper

A robust, containerized implementation of the `abcde` (A Better CD Encoder) tool. This setup allows you to rip audio CDs to high-quality FLAC or MP3 formats directly from your host's command line while maintaining proper hardware access and file permissions.

## Features

* **Global Alias:** Run the `rip` command from any directory on your system.


* **Local Output:** Ripped files are saved directly into your current working directory.


* **Hardware Access:** Pre-configured to communicate with the host optical drive at `/dev/sr0`.


* **Metadata & Art:** Automatically fetches track names and album art using MusicBrainz and `glyrc`.


* **Permission Safe:** Files are owned by your host user (UID 1000) rather than root.



## Installation

### 1. Clone the Repository

Clone this project into your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/abcde-docker.git ~/abcde-docker
cd ~/abcde-docker
```

### 2. Set Up the Global Alias

Add the following line to your `~/.bashrc` (or `~/.zshrc` for Zsh users). This alias handles the complex Docker environment mapping automatically:

```bash
alias rip='UID=$(id -u) GID=$(id -g) PWD=$(pwd) docker compose -f "${HOME}/abcde-docker/docker-compose.yml" --project-directory "${HOME}/abcde-docker" run --rm abcde'
```

*After saving, reload your shell:* `source ~/.bashrc`

<!-- ### 3. Build the Image

Build the local Docker image:

```bash
docker compose build

``` -->

## Usage

1. **Insert an audio CD** into your drive.
2. **Open a terminal** in the folder where you want the music files to be saved.
3. **Execute the rip:**
```bash
rip
```



## Configuration

The `abcde.conf` file is mapped from the project directory. You can modify it to change encoding bitrates, naming conventions, or output formats:

* **Location:** `~/abcde-docker/abcde.conf`
* **Default Format:** `${ARTISTFILE}/${ALBUMFILE}/${TRACKNUM}.${TRACKFILE}` 
* **Default Codec:** FLAC 

## Troubleshooting

* **User Identity:** The setup maps `/etc/passwd` to ensure the container recognizes your username.
* **Hardware Permission:** If the drive isn't detected, ensure your user is in the `cdrom` group: `sudo usermod -aG cdrom $USER`.

