# Docker coderpair vscode-live

## What is this?

Based on the dockerfile of [linuxserver/code-server](https://github.com/linuxserver/docker-code-server), I wrote a dockerfile to build a docker image for [coderpair/vscode-live](https://github.com/coderpair/vscode-live).
I used the release [Beta 2](https://github.com/coderpair/vscode-live/releases/tag/v1.1.0).

## Motivation

The modification of code-server developped by coderpair to make it collaborative is great. I wanted to dockerize it by following the way linuxserver did.

## Usage

To enable the real time collaboration feature, you need to set up a firebase real time database on the US location (non-US is not supported and give an "unable to parse URL" error).
You can check the setup [here](https://github.com/coderpair/vscode-live#setting-up-firebase).

Then, you can build the docker image:
```
docker build .
```
Fill the `config.yaml`, you can use the `config.example.yaml` as model. Then, run the container or directly use docker-compose:
```
docker-compose up
```
The dashboard to manage the collaborative feature is at: `http://127.0.0.1:8443/dashboard`
