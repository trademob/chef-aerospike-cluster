def line_intend(count)
  (1..count).map { ' ' }.join
end

def as_config_generator(object, intend = 2)
  raise "expecting a Hash, but got '#{object.inspect}'" unless object.is_a?(Hash)
  data = ''
  object.each do |key, value|
    if %w(mesh-seed-address-port device).include?(key)
      raise "expecting an Array for attribute #{key}" unless value.is_a?(Array)
      # array attributes
      value.uniq.each do |v|
        data << line_intend(intend) + key + ' ' + v + "\n"
      end
      next
    end

    if value.is_a?(Hash)
      data << line_intend(intend) + key + " { \n"
      data << as_config_generator(value, intend + 2)
      data << line_intend(intend) + "} \n"
    else
      data << line_intend(intend) + key + ' ' + value.to_s + "\n"
    end
  end
  data
end

def tarball_sha256sum(edition, version)
  sha256sums = { 'community' => {}, 'enterprise' => {} }
  sha256sums['community']['3.16.0.4'] = '516ec19485998a8b74d036f1d6082985faab32ad70cbf4009a9a554ecae4b7df'
  sha256sum = sha256sums[edition][version]
  raise "sha256sum is missing for aerospike tarball edition #{edition} version #{version}" unless sha256sum
  sha256sum
end

def package_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu14.04' => {}

    },
    'enterprise' => {
      'ubuntu14.04' => {}

    }
  }

  sha256sums['community']['ubuntu14.04']['3.16.0.4'] = '9493496e20903e10f11c0776ead9a04e19d4e676dadf829a3b79bf5fc3f63df0'

  sha256sums['enterprise']['ubuntu14.04']['3.16.0.4'] = '9493496e20903e10f11c0776ead9a04e19d4e676dadf829a3b79bf5fc3f63df0'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end

def tools_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu14' => {}

    }
  }

  sha256sums['community']['ubuntu14']['3.15.2.1'] = 'aa61de5488107aad08403f5cba9ec2d50708a75d3fe9e87ddd35b94bfe883ed2'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end

def amc_package_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu14' => {},


    },
    'enterprise' => {
      'ubuntu14' => {}

    }
  }

  sha256sums['community']['ubuntu14']['4.0.15'] = 'aa61de5488107aad08403f5cba9ec2d50708a75d3fe9e87ddd35b94bfe883ed2'

  sha256sums['enterprise']['ubuntu14']['4.0.15'] = 'aa61de5488107aad08403f5cba9ec2d50708a75d3fe9e87ddd35b94bfe883ed2'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end
