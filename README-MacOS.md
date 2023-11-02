# PDF for MacOS

## Required Components

- git
- An IDE such as one of the following, or any other.:
  - [Atom](http://atom.io/),
  - [VSCodium](https://vscodium.com/),  
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Fedora/RHEL-CSB/MacOS](https://sanctum.geek.nz/arabesque/unix-as-ide-introduction/)
- Optional: A container runtime to help creating pdfs.

## Git

Git is, or should be, installed by default on MacOS.

Setup a couple parameters to ensure any commits you make are actually yours, using the following commands:

```bash
git config --global user.name "Jane Doe"
git config --global user.email "janedoe@redhat.com"
```

Do set this to your own username, not Jane Doe.

> NOTE: If you've done this already or want to configure this later per repository this is also fine, you know how it works.

# How to initialize a new PDF

Please see [Initialize a new CER](README-initialize-a-new-CER.md) for details on starting a new PDF.

# Generate your PDF

 The AsciiDoc files are put together into one file with all the mark-up needed and rendered into the PDF. 

The software component used is called [asciidoctor-pdf](https://asciidoctor.org/docs/asciidoctor-pdf/). A container has been setup and is used locally and on GitLab. This ensures the outcome is always the same.

## PDF generating locally for MacOS

### Use Docker

To setup Docker on a mac, go to [Docker's website](https://docs.docker.com/docker-for-mac/install/) which explains how to use it.

Go to [Docker hub](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) to get the community edition of Docker Desktop for Mac.

Ensure you download the stable version. Open the DMG, ignore any warnings, and drag Docker into programs. Then, go to 'Apps' and open Docker. It will now configure itself. Once this is completed, the whale in the menubar will show it's doing stuff by being animated. You can use Terminal to run Docker commands. Try `docker ps` again. If this works, run `./generate-pdf -d` enforcing the use of Docker to generate the pdf.

A popup will show, asking for permissions for Docker to write in the directory you're in. For this test, the repo was in `Documents` - so this is where it wants permissions for. Ignore any hesitation you have and grand the permission. Now, the pdf can be generated inside the container:

```bash
MBP-van-Martijn:test-mac mtenheuv$ ./generate-pdf
Generating pdf using docker...
Unable to find image 'quay.io/redhat-cop/ubi8-asciidoctor:v1.6' locally
v1.6: Pulling from redhat-cop/ubi8-asciidoctor
c4d668e2xxxx: Pull complete
ec1681b6xxxx: Pull complete
d0303343xxxx: Pull complete
3eefb58fxxxx: Pull complete
352966daxxxx: Pull complete
cdeebdd5xxxx: Pull complete
ee5ca262xxxx: Pull complete
Digest: sha256:0601710d91f4b8a20bdb0bf58c2c43924877e9900b963bf73408a4edecxxxxxx
Status: Downloaded newer image for quay.io/redhat-cop/ubi8-asciidoctor:v1.6
Generated: cer-mac-2020-09-23-11-20-40.pdf
```

The PDF is in the current directory and can be reviewed.

### Known issues

It seems many people run into the issue of installing the program ***docker*** and have no Docker daemon after that.

```
$ docker ps
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

This can be caused by many issues, but to produce the error above, Docker was installed like this:

```bash
brew install docker
```

This installs the docker commandline, but not the daemon, so the issue it is reporting is correct. In brew, the formula and the cask have the same name and brew defaults to treating it as a formula.

Instead, if you want to use brew to install Docker Desktop, make sure to install the docker cask:

```bash
brew install homebrew/cask/docker
```