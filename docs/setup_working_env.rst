================================
How to setup working environment
================================

Note that this could take a little long time for the first time of setup, you should prepare yourself a cup of coffee then :-). 

Setup working environment on Ubuntu
-----------------------------------

1. It's recommended to install Ubuntu 12.04 as it's currently the mass development environment of our interested open source projects that we will work on it.

2. To start develop Python applications, you need to:

- setup workspace directory: ``$HOME/workspace/$USER``, ``$HOME/workspace/teracy``, ``$HOME/workspace/readonly``.

    In which:

    ``teracy`` directory should contain teracy's projects from official github or bitbucket repository (usually read and pull request only).

    ``$USER`` directory should contain your full control projects (your cloned projects, your own projects)

    ``readonly`` directory should contain projects that you have read only access permission (usually offical opensource projects)


- install ``git``

- install Python development packages: ``libpq-dev``, ``python-dev``

- install ``setuptools``, ``pip``, ``virtualenv``, ``virtualenvwrapper``

- install additional tools such as ``vim``, etc.

- generate ssh key if not yet generated

3. To make it easy, a bash script is provided to do all the things above. Run the following commands to download the bash script to setup working environment:
::
    $ cd ~/Downloads
    $ wget https://raw.github.com/teracy-official/dev/master/scripts/setup_working_env.sh
    $ chmod +x setup_working_env.sh
    $ ./setup_working_env.sh


------------------------------------
Setup working environment on Mac OSX
------------------------------------