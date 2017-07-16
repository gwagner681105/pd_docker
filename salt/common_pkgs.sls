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


#base_docker_image:
#  dockerng.image_present:
#    - name: centis
#    - tag: latest

#python-pip:
#  pkg.installed

#docker-py:
#  pip.installed:
#    - require:
#      - pkg: python-pip
