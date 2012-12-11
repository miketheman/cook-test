require 'spec_helper'

describe 'cook-test::default' do

  context 'when using a debian-family distro' do
    before do
      Fauxhai.mock(platform: 'ubuntu', version: '12.04')
    end

    let (:chef_run) { ChefSpec::ChefRunner.new.converge 'cook-test::default' }

    it 'installs the ntp package' do
      chef_run.should install_package 'ntp'
    end

    it 'installs the ntpdate package' do
      chef_run.should install_package 'ntpdate'
    end

    it 'enables and starts the ntp service' do
      chef_run.should set_service_to_start_on_boot 'ntp'
      chef_run.should start_service 'ntp'
    end

    it 'creates a configuration file' do
      chef_run.should create_file '/etc/ntp.conf'
    end
  end

  context 'when using a redhat-family distro above 6.x' do
    before do
      Fauxhai.mock(platform: 'centos', version: '6.3')
    end

    let (:chef_run) { ChefSpec::ChefRunner.new.converge 'cook-test::default' }

    it 'installs the ntp package' do
      chef_run.should install_package 'ntp'
    end

    it 'installs the ntpdate package' do
      chef_run.should install_package 'ntpdate'
    end

    it 'enables and starts the ntpd service' do
      chef_run.should set_service_to_start_on_boot 'ntpd'
      chef_run.should start_service 'ntpd'
    end

    it 'creates a configuration file' do
      chef_run.should create_file '/etc/ntp.conf'
    end
  end

end
