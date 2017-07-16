base:              # Apply SLS files from the directory root for the 'base' environment
  '*':             # All minions with a minion_id that begins with 'web'
#     - create_lvm   # Apply the state file named 'apache.sls'
     - {{ grains['host'] }}
     - common_pkgs

