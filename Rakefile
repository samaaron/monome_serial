begin
  require 'spec/rake/spectask'
rescue LoadError
  puts 'Please install rspec to run the specs'
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "monome_serial"
    gemspec.summary = "Ruby serial library for communicating with a monome."
    gemspec.description = "Communicate directly with your monome with this handy Ruby library."
    gemspec.email = "samaaron@gmail.com"
    gemspec.homepage = "http://sam.aaron.name/projects/ruby_monome_serial.html"
    gemspec.authors = ["Sam Aaron"]
    gemspec.add_dependency 'activesupport', '>= 2.3.4'
    gemspec.add_dependency 'arika-ruby-termios', '>= 0.9.6'
  end
rescue LoadError
  puts "Oops, Jeweler isn't available. Install it with: gem install jeweler"
end

desc "Run the specs under spec"
Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', File.dirname(__FILE__) + "/spec/spec.opts"]
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.fail_on_error = false
  t.libs << 'lib'
end
