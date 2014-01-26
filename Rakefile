require 'fileutils'
namespace :chef do
  task :prepare do
    FileUtils.mkdir_p '/etc/chef/roles'
    File.write('/etc/chef/roles/box.rb', <<-RUBY)
name 'box'
run_list(
  "recipe[rbenv::default]",
  "recipe[rbenv::ruby_build]",
  "recipe[rbenv::box]",
)
RUBY

    # I understand this is terrible; guess the right way is to make a
    # separate cookbook.
    File.write('/etc/chef/cookbooks/rbenv/recipes/box.rb', <<-RUBY)
include_recipe "rbenv::ruby_build"
rbenv_ruby("1.9.3-p484") { global true }
RUBY
  end
end
