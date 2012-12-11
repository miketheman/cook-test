# Some attributes!

case platform_family

when 'debian'
  default['ntp']['service'] = "ntp"
  default['ntp']['packages'] = %w{ ntp ntpdate }

when 'rhel', 'fedora'
  default['ntp']['service'] = "ntpd"
  default['ntp']['packages'] = %w{ ntp }
  if node['platform_version'].to_i >= 6
    default['ntp']['packages'] = %w{ ntp ntpdate }
  end

else
end
