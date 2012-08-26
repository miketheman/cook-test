#!/usr/bin/env rake
require 'foodcritic'

task :default => [:foodcritic]

require 'tailor/rake_task' # https://github.com/turboladen/tailor
Tailor::RakeTask.new do |task|
  task.file_set('attributes/**/*.rb', "attributes") do |style|
    style.max_line_length 100, level: :warn
  end
  task.file_set('definitions/**/*.rb', "definitions")
  task.file_set('libraries/**/*.rb', "libraries")
  task.file_set('metadata.rb', "metadata")
  task.file_set('providers/**/*.rb', "providers")
  task.file_set('recipes/**/*.rb', "recipes") do |style|
    style.max_line_length 100, level: :warn
  end
  task.file_set('resources/**/*.rb', "resources")
  # task.file_set('templates/**/*.erb', "templates")
end

FoodCritic::Rake::LintTask.new do |t|
  t.options = {:fail_tags => ['correctness']}
end
