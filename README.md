# vagrant-foomo-scaffold

A project scaffold to build a vagrant and docker based foomo application.

## usage

1. create your own project vagrant repositoy
2. download this repo as zip into your repo and unzip: https://github.com/zitrusmedia/vagrant-foomo-scaffold/archive/master.zip
3. copy your permanent foomo configs into provisioning/files/project/foomo/config/...
4. rename and update the project name
  - change directory name: provisioning/files/project
  - change directory name: www/project
  - change variable: PROJECT_NAME in provisioning/shell/00-bootstrap.sh
5. initialize a foomo project in www/YOUR-PROJECT-NAME or add a existing foomo project repository as submodule
6. start the machine with "vagrant up"
