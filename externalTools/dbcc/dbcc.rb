require "ceedling"
require "net/http"

namespace :dbc do
 task :fetch do
   Dir.chdir("externalTools/dbcc") do
    sh "git clone https://github.com/howerj/dbcc.git"
    Dir.chdir("dbcc") do
      sh "make -j4"
      sh "cp dbcc ../dbccc"
    end
   end
 end
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
 end
 
 task :builddbcDocs do
  puts "Compiling dbcDocs"
  files = FileList["src/**/*.dbc"].ext(".dbcdoc")
  Rake::Task[files].execute
 end
end
