#!/bin/bash
sudo apt-get install rubygems
sudo apt-get install vagrant
sudo gem install bundler
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'test-kitchen', '~>1.0'" >> Gemfile
echo "gem 'kitchen-ansible', '~>0.44'" >> Gemfile
echo "gem 'kitchen-vagrant', '~>0.11'" >> Gemfile
echo "gem 'kitchen-docker', '~>2.5'" >> Gemfile
echo "gem 'serverspec', '~>2.36'" >> Gemfile
bundle install --path vendor/bundle
echo "---" > .kitchen.yml
echo "driver:" >> .kitchen.yml
echo "  name: docker" >> .kitchen.yml
echo "  use_sudo: false" >> .kitchen.yml
echo "provisioner:" >> .kitchen.yml
echo "  name: ansible_playbook" >> .kitchen.yml
echo "  playbook: playbook.yml" >> .kitchen.yml
echo "  hosts: all" >> .kitchen.yml
echo "  require_chef_for_busser: false" >> .kitchen.yml
echo "  require_ruby_for_busser: true" >> .kitchen.yml
echo "platforms:" >> .kitchen.yml
echo "  - name: ubuntu" >> .kitchen.yml
echo "    driver_config:" >> .kitchen.yml
echo "      box: \"ubuntu/trusty64\"" >> .kitchen.yml
echo "suites:" >> .kitchen.yml
echo "  - name: default" >> .kitchen.yml
echo "verifier:" >> .kitchen.yml
echo "  ruby_bindir: '/usr/bin'" >> .kitchen.yml

mkdir -p test/integration/default/serverspec
cd test/integration/default/serverspec
echo "require 'serverspec'" >> spec_helper.rb
echo "set :backend, :exec" >> spec_helper.rb

