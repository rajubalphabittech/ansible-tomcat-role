## Overview

This is an "*ansible role*" to manage [Tomcat](http://tomcat.apache.org/): installation and configuration.

I tried to keep it as simple as I can

~~~
[ansible-tomcat-role]$ tree
.
├── defaults
│   └── main.yml
├── files
│   ├── hello.war
│   └── tomcat-users.xml
├── handlers
│   └── main.yml
├── README.md
├── tasks
│   ├── debian_tomcat.yml
│   ├── main.yml
│   └── redhat_tomcat.yml
└── templates
    ├── appenv.sh
    ├── ROOT.xml
    ├── server.xml
    ├── setenv.sh
    └── systemd-tomcat.service
~~~

## Tested on

Debian/Ubuntu

## Usage

You can try it with a playbook like this

~~~
$> more helloApp.yml
---
- name: Deploy Hello World Application
  hosts: host1
  vars:
    proj_name: helloApp
    proj_path: "/opt/{{ proj_name }}"
  tasks:
    - name: install apt packages
      apt: name={{ item }} update_cache=yes cache_valid_time=3600
      become: true
      with_items:
        - curl
        - openjdk-8-jdk
    - name: create project path
      file: path={{ proj_path }} state=directory
      become: true
    - name: install and configure Tomcat
      include_role:
        name: ansible-tomcat-role
~~~

Directory hierarchy

~~~
$ tree -L 3
.
├── ansible.cfg
├── hosts
└── playbooks
    └── helloApp
        ├── helloApp.yml
        └── roles
            └── ansible-tomcat-role
~~~

**RUN**:
ansible-playbook playbooks/helloApp/helloApp.yml
