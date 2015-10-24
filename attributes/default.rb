default['aerospike']['version'] = '3.6.3'

default['aerospike']['tarball_purge'] = false

default['aerospike']['install_method'] = 'tarball' # options: tarball, package
default['aerospike']['install_edition'] = 'community' # options: community, enterprise

default['aerospike']['packages'] = %w()
default['aerospike']['cookbook'] = 'aerospike-cluster'

default['aerospike']['user']          = 'aerospike'
default['aerospike']['group']         = 'aerospike'
default['aerospike']['setup_user']    = true # for tarball install

default['aerospike']['conf_dir']      = '/etc/aerospike'
default['aerospike']['conf_file']     = ::File.join(node['aerospike']['conf_dir'], 'aerospike.conf')
default['aerospike']['data_dir']      = '/var/lib/aerospike'
default['aerospike']['log_dir']       = '/var/log/aerospike'
default['aerospike']['log_file']      = ::File.join(node['aerospike']['log_dir'], 'aerospike.log')

# source install directory locations
default['aerospike']['parent_dir'] = '/usr/local/aerospike'

default['aerospike']['tarball_url'] = 'auto'

default['aerospike']['service_action'] = [:enable, :start]

default['aerospike']['notify_restart'] = true

default['aerospike']['umask'] = '0022'
default['aerospike']['mode']  = '0755'