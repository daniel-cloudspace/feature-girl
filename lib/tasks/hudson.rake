require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

namespace :hudson do
  def report_path
    "features/reports/"
  end

  task :report_setup do
    rm_rf report_path
    mkdir_p report_path
  end

  Cucumber::Rake::Task.new({'cucumber'  => [:report_setup]}) do |t|
    t.cucumber_opts = %{--profile default  --format junit --out #{report_path}}
  end

end



