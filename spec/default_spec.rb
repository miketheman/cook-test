require 'chefspec'

describe 'cook-test::default' do
  let (:chef_run) { ChefSpec::ChefRunner.new.converge 'cook-test::default' }

  it 'should install the ntp package' do
    chef_run.should install_package 'ntp'
  end

  it 'should enable the ntp service' do
    chef_run.should set_service_to_start_on_boot 'ntp'
  end

  it 'should have a configuration file' do
    chef_run.should create_file '/etc/ntp.conf'
  end

end
