# A Guardfile
# More info at https://github.com/guard/guard#readme

guard "foodcritic" do
  watch(%r{metadata.rb$})
  watch(%r{attributes/.+\.rb$})
  watch(%r{providers/.+\.rb$})
  watch(%r{recipes/.+\.rb$})
  watch(%r{resources/.+\.rb$})
  watch(%r{templates/.+\.rb$})
end

# This 
spec_paths = Dir.glob(File.join("cookbooks", "**", "spec"))
guard 'rspec',
  :version => 2,
  :cli => '--color --format nested',
  :spec_paths => spec_paths do

  watch(%r{^cookbooks/.+/spec/.+_spec\.rb$})
  watch(%r{^cookbooks/.+/spec/spec_helper.rb$})  { "spec" }

  # Chef paths example
  watch(%r{cookbooks/.+/metadata.rb$})
  watch(%r{cookbooks/.+/attributes/.+\.rb$})
  watch(%r{cookbooks/.+/providers/.+\.rb$})
  watch(%r{cookbooks/.+/recipes/.+\.rb$})
  watch(%r{cookbooks/.+/resources/.+\.rb$})
  watch(%r{cookbooks/.+/templates/.+\.rb$})
end
