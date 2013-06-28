#!/bin/bash

# The bash script to setup working environment on ubuntu for teracy's python projects.
#
# TODO: make this script run on mac osx
# 
#####################__Commands to run this bash script__################################
#
#    cd ~/Downloads
#    wget https://raw.github.com/teracy-official/dev/master/scripts/setup_working_env.sh
#    chmod +x setup_working_env.sh
#   ./setup_working_env.sh
#
#########################################################################################

function command_exists() {
  type "$1" &> /dev/null;
}


function prompt() {
  local msg="$1 (Y/n)? "
  read -p "$msg" -n 1 -r

  if [[ $REPLY =~ ^[Yy]$ ]] ; then
    printf "\nYou choose to continue...\n"
  else
    printf "\nOk, quit...\n"
    exit
  fi
}

# best recommended to work on ubuntu 12.04
function verify_system() {
  echo "verifying the system...."

  if ! command_exists lsb_release ; then
    echo "You're not on Ubuntu. This script is provided to Ubuntu environment only."
    exit
  fi

  local ubuntu_release=$(lsb_release -s -d)

  if [[ "$ubuntu_release" =~ 12.04 ]] ; then
    echo "You're on recommended system: $ubuntu_release."
  else
    prompt "It's recommeneded to use Ubuntu 12.04 for easier development but yours: $ubuntu_release. Are you sure to continue to setup"
  fi

  if ! command_exists python ; then
    echo "Something is wrong. Your system should have python installed. You need to install it first."
    exit
  fi
}

function update_system() {
  echo "updating the system..."
  sudo apt-get update
}

function setup_workspace_directory() {
  echo "setting up workspace directory..."
  cd ~
  mkdir workspace
  cd workspace
  mkdir teracy
  mkdir readonly
  mkdir $USER
}

function setup_git() {
  if command_exists git ; then
    echo "git is already installed."
  else
    echo "setting up git..."
    sudo apt-get install git
  fi
}


function install_setuptools() {
  #TODO check if it's already available
  echo "installing setuptools..."
  wget https://bitbucket.org/pypa/setuptools/raw/0.7.4/ez_setup.py -O - | sudo python
}

function install_pip() {
  if command_exists pip ; then
    echo "pip is already installed."
  else
    echo "installing pip..."
    wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py -O - | sudo python
  fi
}


function setup_virtualenv() {
  echo "setting up virtualenv..."
  cd ~/Downloads # for write access and downloaded stuff
  install_setuptools
  install_pip
  cd ~ # returns to user home
  sudo pip install virtualenv
  sudo pip install virtualenvwrapper
  export PROJECT_HOME=$HOME/workspace/$USER
  source /usr/local/bin/virtualenvwrapper.sh #TODO check if this should be appended to ~/.bash
}

function generate_ssh_key {
  if [ -f ~/.ssh/id_rsa.pub -o -f ~/.ssh/id_dsa.pub ]; then
    echo "You already have ssh key generated on the system."
  else
    echo "generating ssh key for ssh access to ssh remote server like github, bitbucket, hosting server..."
    read -p "What is your email? "
    echo "ssh-keygen -t rsa -C $REPLY"
    ssh-keygen -t rsa -C $REPLY
  fi
}

function verify_setup() {
  # verify if the setup is good
  # TODO
  echo "The development working environment setup is successful. Enjoy hacking!"
  echo "You need to enable git auto complete as describled here: http://ten.ynottony.net/2009/02/enabling-bashgit-auto-completion-in-ubuntu/"
}

verify_system
update_system
setup_workspace_directory
setup_git
setup_virtualenv
generate_ssh_key
verify_setup

