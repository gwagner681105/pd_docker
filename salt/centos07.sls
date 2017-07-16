{% set lvm_mount = '/pd_data' %}
{% set host_graphite_dir = '/pd_data/graphite' %}


pd_lvm_mount_folder:
  file.directory:
    - name: {{lvm_mount}} 
    - name: {{host_graphite_dir}}
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644

selinux_allow_docker_mount_access:
  cmd.run:
    - name: chcon -Rt svirt_sandbox_file_t {{lvm_mount}}

/dev/sdb:
   lvm.pv_present

pd_vg:
   lvm.vg_present:
     - devices: /dev/sdb
     - require:
       - lvm: /dev/sdb

pd_data:
   lvm.lv_present:
     - vgname: pd_vg
     - size: 10G 
     - require:
       - lvm: pd_vg

/dev/pd_vg/pd_data:
   blockdev.formatted:
     - fs_type: ext4
     - require:
       - lvm: pd_data

/pd_data:
   mount.mounted:
     - device: /dev/pd_vg/pd_data
     - fstype: ext4
     - mkmnt: True
     - persist: True
     - opts:
       - defaults

