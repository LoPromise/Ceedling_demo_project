require "ceedling"
require "net/http"

namespace :dbc do
 rule '.dbc' => ['.dbc'] do |t|
  puts "build " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do 
    sh "(#{current_root}/dbccc #{filename})"
  end
 end
 
 task :builddbc do
  puts "Compiling dbc to C Language"
  files = FileList["src/**/*.dbc"].ext(".dbc")
  Rake::Task[files].execute
 end
 
 rule '.dbcdoc' => ['.dbc'] do |t|
  puts "compiling Docs for " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do
    sh "(#{current_root}/dbccc -x #{filename})"
  end
  #generate dbc html
  sh ("xsltproc #{PROJECT_ROOT}/docs/stylesheet_dbc.xsl #{path}/#{filenameNoEnding}.xml > build/artifacts/docs/dbc.html")
 end
 
 task :builddbcDocs do
  puts "Compiling dbcDocs"
  FileUtils.mkdir_p 'build/artifacts/docs'
  files = FileList["src/**/*.dbc"].ext(".dbcdoc")
  Rake::Task[files].execute
 end
end
