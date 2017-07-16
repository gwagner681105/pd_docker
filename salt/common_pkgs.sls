common_packages:
  pkg.installed:
    - pkgs:
      - docker: latest
      - epel-release
      - python2-pip
      - git

docker:
  service.running:
    - enable: True

docker-py:
  pip.installed:
    - name: docker-py


download centos image:
  dockerng.image_present:
    - force: true
    - name: centos:latest

#docker-py:
#  pip.installed:
#    - require:
#      - pkg: python2-pip
