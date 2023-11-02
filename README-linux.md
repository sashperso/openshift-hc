# CER for Fedora and CSB

## Required Components

- git
- An IDE or editor such as one of the following, or any other.:
  - [Atom](http://atom.io/),
  - [VSCodium](https://vscodium.com/),
  - [Visual Studio Code](https://code.visualstudio.com/)
  - [Fedora/RHEL-CSB/MacOS](https://sanctum.geek.nz/arabesque/unix-as-ide-introduction/)
  - vi
- Optional: A container runtime to help creating pdfs.

## Git

### Installation

#### RHEL CSB8

To install Git, open *Applications* -> *Red Hat internal* -> *Internal Software catalog*

![RHEL CSB8 Internal Software catalog Applications menu item](images/Readme/linux-csb8-internal-software-catalog.png)

On *1 - Internet* tab, click on *Install* button near Git item.

![RHEL CSB8 Internal Software catalog Git item](images/Readme/linux-csb8-internal-software-catalog-git.png)

#### Fedora

To install Git, run the following command:

```bash
dnf install git
```

### Configuration

Once installation is successful, please setup a couple parameters to ensure any commits you make are actually yours, using the following commands:

```bash
git config --global user.name "Jane Doe"
git config --global user.email "janedoe@redhat.com"
```

**Set this to your own username and email address, not Jane Doe.**

> NOTE: If you've done this already or want to configure this later per repository this is also fine, you know how it works.

## IDE

As mentioned, any IDE will do. Please follow the suggestions above.

## How to initialize a new CER

Please see [Initialize a new CER](README-initialize-a-new-CER.md) for details on starting a new CER.

## Write your new CER

Please see the [writing README](README-writing.md) for more generic details on how to write your CER!

## Generate your CER

CERs are delivered as PDFs. The AsciiDoc files are put together into one file with all the mark-up needed and rendered into the PDF. It is recommended to create PDFs often to ensure it works flawlessly.

The software component used is called [asciidoctor-pdf](https://asciidoctor.org/docs/asciidoctor-pdf/). A container has been setup and is used locally and on GitLab. This ensures the outcome is always the same.

## CER generating locally on linux platforms

As this is about linux, there will be choice. It is possible to use the container as mentioned, but it is also possible to use a local binary. Therefor, we recommend using the container image above for template generation consistency.

- Podman [RHEL CSB8]
  - Open *Applications* -> *Red Hat internal* -> *Internal Software catalog*
     On *6 - Development* tab, click on *Install* button near podman item.
     ![RHEL CSB8 Internal Software catalog podman item](images/Readme/linux-csb8-internal-software-catalog-podman.png)

- Podman [Fedora 31+, RHEL8]
  - Install podman on your system
    - `sudo dnf -y install podman`

- Podman [RHEL7.6+]
  - Install podman on your system
    - `sudo yum -y install podman`
    - Configure to be rootless: <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux_atomic_host/7/html/managing_containers/finding_running_and_building_containers_with_podman_skopeo_and_buildah#running_containers_as_root_or_rootless>

- Docker [RHEL7]
  - Install docker on your system
    - RHEL7: `sudo yum -y install docker`

- RPM [Fedora]
  - Install the RPM
    - `sudo dnf -y install rubygem-asciidoctor-pdf-doc`

- Ruby Installer [Fedora, RHEL, macOS]  

    > NOTE: Ruby 3.0 or greater is recommended. However, you may have success using Ruby 2.7 or greater. The container image is built with Ruby 3.0.

  Select one of the following methods:  

  - `sudo gem install asciidoctor-pdf asciidoctor-diagram rouge`

    > NOTE: On RHEL 7 CSB, you *cannot* get a recent enough version through Red Hat Software Collections, you have to install [RVM](https://rvm.io) instead to manage Ruby installed versions or follow the NPM method below.

  - `npm install asciidoctor-pdf`

- Other distributions
  - See <https://podman.io/getting-started/installation>

### Run the pdf generation script

```bash
./generate-pdf
```

### Known issues

- Generating a pdf has to be done from the *real* directory, on a [symlink](https://gitlab.consulting.redhat.com/customer-success/consulting-engagement-reports/cer-template/-/issues/132) it will fail.

- If the directory used is not group writeable, `./generate-pdf` will fail too. To resolve this, change privileges on the directory by either using [setfacl](https://gitlab.consulting.redhat.com/customer-success/consulting-engagement-reports/-/issues/129#note_105410) or chmod on the directory.
  - `setfacl -m u:101000:rwx .`

## Use GitLabs runners

When the changes are pushed to GitLab, using `git push`, a runner will start and the pdf will be generated. See [the runner README](README-runner.md) for more details.
