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
  sha256sums['community']['3.14.0.2'] = 'a026d34487cf470de0b1b85f2e08e7edc1ee016cbea6e34a21cb40990ff7d361'
  sha256sum = sha256sums[edition][version]
  raise "sha256sum is missing for aerospike tarball edition #{edition} version #{version}" unless sha256sum
  sha256sum
end

def package_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu12.04' => {},
      'debian6' => {},
      'debian7' => {},
      'el6' => {}
    },
    'enterprise' => {
      'ubuntu12.04' => {},
      'debian6' => {},
      'debian7' => {},
      'el6' => {}
    }
  }

  sha256sums['community']['ubuntu12.04']['3.6.3'] = 'd47ae90cf53058e756833ddcfa57c80601e62e6756fd2f333a6e9edd1234a6c0'
  sha256sums['community']['debian6']['3.6.3'] = '8d78bde99e81efd7359cbbfc88596b4dfd8ff55258688c9bdce111e38a23ddc6'
  sha256sums['community']['debian7']['3.6.3'] = '6bd5d425af19bd13ece1890b38cdce2a4941eff4764374774c767b04031bebda'
  sha256sums['community']['el6']['3.6.3'] = '3ca3ac402beeda4a5cb2b8e45448214f1357b49ae86d3c44ff1407a406acfd5f'

  sha256sums['enterprise']['ubuntu12.04']['3.6.3'] = 'ef9e97b3ba52468a4ecb816b7f4315704ead09269c6d21e952e6aafebc758c61'
  sha256sums['enterprise']['debian6']['3.6.3'] = 'daab59ac2157c7f4a69cc7bf73bfeacc09c0d5672880884faebb4228b7538b6a'
  sha256sums['enterprise']['debian7']['3.6.3'] = 'e15f5c5f8d6df56dfd9a4bea56cc0ad748dffffb3bfc82d9bbfd5280901321d3'
  sha256sums['enterprise']['el6']['3.6.3'] = '7916da7af3347e85a6839d4bbf69e58a6dce2a89297c421a5cf4ddc596b7c844'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end

def tools_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu14' => {},
      'debian7' => {},
      'debian8' => {},
      'el6' => {},
      'el7' => {}
    }
  }

  sha256sums['community']['ubuntu14']['3.13.0.1'] = '431b3b76fa00d1fb0b55657b1bd784e4c7ecd116404b524d632f5fba654ae2df'
  sha256sums['community']['debian7']['3.10.2'] = 'd662d5655794acf5163b93116db192475d62c55c17d240b2cc0b5d43f8b9b163'
  sha256sums['community']['debian8']['3.10.2'] = '5a1714b982bf5a01b299a2c686b484a53997ef6bc9619473fcb89eff93a22fef'
  sha256sums['community']['el6']['3.10.2'] = 'a631cdb02874c982fe0e045a96891219474c383ec87c09233a9bd84062d7dc5b'
  sha256sums['community']['el7']['3.10.2'] = '9889fd4ed441e238b0c74484c374f843a0fab77366f933afa2de5e514c1347a4'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end

def amc_package_sha256sum(edition, version, os)
  sha256sums = {
    'community' => {
      'ubuntu14' => {},
      'ubuntu12' => {},
      'debian6' => {},
      'el6' => {}
    },
    'enterprise' => {
      'ubuntu12' => {},
      'debian6' => {},
      'el6' => {}
    }
  }
  
  sha256sums['community']['ubuntu12']['4.0.13'] = 'dfccbfb3f712e66baa1bde3e7fbeae4955bf33dcb518b496eb780e01dc3a8e98'
  sha256sums['community']['ubuntu12']['3.6.3'] = 'c1d6692cb15a7088b947a27b9f862d44d64ba4976626ee0463a196e008b90547'
  sha256sums['community']['debian6']['3.6.3'] = 'c1d6692cb15a7088b947a27b9f862d44d64ba4976626ee0463a196e008b90547'
  sha256sums['community']['el6']['3.6.3'] = '9a160f59f7a815106a39c4cf28043665383986977d14e11a681ff0f29215ace5'

  sha256sums['enterprise']['ubuntu12']['3.6.3'] = 'd52ad1d5bbb82c46ad3679272d2e6952c4f16a33c22a0b247e13cda1e18b8b0b'
  sha256sums['enterprise']['debian6']['3.6.3'] = 'd52ad1d5bbb82c46ad3679272d2e6952c4f16a33c22a0b247e13cda1e18b8b0b'
  sha256sums['enterprise']['el6']['3.6.3'] = '3e69911adb03b5a9c75e2425adc706bdfdaab064097264c406194907f1fdf27e'

  sha256sum = sha256sums[edition][os][version]
  raise "sha256sum is missing for aerospike package edition #{edition} version #{version} os #{os}" unless sha256sum
  sha256sum
end
