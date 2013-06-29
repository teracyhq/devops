=========================
teracy's develoment stuff
=========================

Setup working environment on ubuntu
-----------------------------------

1. It's recommended to install Ubuntu 12.04 as it's currently the mass development environment of other our interested open source projects.

2. The bash script below will:

- setup workspace directory: ``$HOME/workspace/$USER``, ``$HOME/workspace/teracy``, ``$HOME/workspace/readonly``.

    In which:

    ``teracy`` directory should contain teracy's projects from official github or bitbucket repository (usually read and pull request only).

    ``$USER`` directory should contain your full control projects (your cloned projects, your own projects)

    ``readonly`` directory should contain projects that you have read only access permission (usually offical opensource projects)


- install ``git``

- install ``setuptools``, ``pip``, ``virtualenv``, ``virtualenvwrapper``

- generate ssh key if not yet generated

3. Run the following commands to download the bash script to setup working environment:
::
    $ cd ~/Downloads
    $ wget https://raw.github.com/teracy-official/dev/master/scripts/setup_working_env.sh
    $ chmod +x setup_working_env.sh
    $ ./setup_working_env.sh

