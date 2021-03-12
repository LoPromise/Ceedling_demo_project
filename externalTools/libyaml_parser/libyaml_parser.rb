require "ceedling"
require "net/http"

namespace :yamlCgen do
 rule '.yaml' => ['.yaml'] do |t|
  puts "build " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do 
    sh "(#{current_root}/dbccc #{filename})"
  end
 end
 
 task :buildyaml do
  puts "Compiling dbc to C Language"
  files = FileList["src/**/*.yaml"].ext(".yaml")
  Rake::Task[files].execute
 end
end
