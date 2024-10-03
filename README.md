CGate Server
============

![Docker Pulls](https://img.shields.io/docker/pulls/steppinghat/cgate-server?logo=docker)

This docker image installs the Clipsal CGate Server for use with CBus applicances.

## Install

Easy installation can be achieved if you already have the XML version of the project file.
Place this file in the `/tag` directory

Access to the server is goverened by a file named access.txt
If this file does not already exist, create it in `/config` and follow the doco

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=cgate-server \
  -p 20023:20023 \
  -p 20024:20024 \
  -p 20025:20025 \
  -p 20026:20026 \
  -p 20123:20123 \
  -v <path-to-config-dir>:/config \
  -v <path-to-tag-dir>:/tag \
  -v <path-to-logs-dir>:/logs \
  --restart unless-stopped \
  steppinghat/cgate-server
```

### docker compose

```
services:
  cgate-server:
    image: steppinghat/cgate-server
    container_name: cgate-server
    ports:
        - 20023:20023
        - 20024:20024
        - 20025:20025
        - 20026:20026
        - 20123:20123
    volumes:
        - [path-to-config-dir]:/config
        - [path-to-tag-dir]:/tag
        - [path-to-logs-dir]:/logs
    restart: unless-stopped
```

### Version tags

| Tag | Description |
| --- | ----------- |
| latest | Releases from the latest stable branch |
| 2.11 | Releases from the 2.11.x branch |
        

### Parameters

| Parameter | Function |
| --------- | -------- |
| `-p 20023` | CGate Command port |
| `-p 20024` | CGate Event port |
| `-p 20025` | CGate Load Change port |
| `-p 20026` | CGate Config Change port |
| `-p 20123` | CGate Secure Command port |
| `-v :/config` | CGate config directory (`access.txt` goes here) |
| `-v :/tag` | CGate tag directory (XML project files go here) |
| `-v :/logs` | CGate logs directory |

## Development

### Downloading CGate server

CGate server is downloaded from the Clipsal website during the build process.

The exact download URL is set by the `CGATE_DOWNLOAD_URL` ARG in the Dockerfile.

One thing to note, is that some download links have multiple files in the URL. The Clipsal
website will zip these files into a single archive, which we don't want as we only want the
zip file for cgate itself.

Make sure that the URL only has one file specified, for example:

```
/files?p_File_Name=cgate-2.11.8_3282.zip
# Will only download the cgate zip file


/files?p_Doc_Ref=C-Gate-V2.11.8&p_enDocType=Software+-+Release&p_File_Name=cgate-2.11.8_3282.zip
# Will download the release notes and the cgate zip file, bundled together in a single zip
```

### Building the container

Build the container using the following command:

```bash
docker build -t steppinghat/cgate-server .
```

Verify the build works by running it:

```bash
docker run steppinghat/cgate-server
```

_Written by Javan Eskander @SteppingHat_
