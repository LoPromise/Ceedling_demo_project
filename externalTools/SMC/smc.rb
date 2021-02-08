require "ceedling"
require "net/http"

namespace :smc do
 task :fetch do
   Dir.chdir("externalTools/SMC/") do
    sh "wget https://sourceforge.net/projects/smc/files/SMC%207.2.0/Library/C/statemap.h"
    sh "wget https://sourceforge.net/projects/smc/files/SMC%207.2.0/Bin/Smc.jar"
   end
 end
 rule '.smc' => ['.sm'] do |t|
  puts "build " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do 
    sh "(java -jar #{current_root}/Smc.jar -c #{filename})"
  end
 end
 
 task :buildSMC do
  puts "Compiling SMC to C Language"
  files = FileList["src/**/*.sm"].ext(".smc")
  Rake::Task[files].execute
 end
 
 rule '.smcdoc' => ['.sm'] do |t|
  puts "compiling Docs for " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do
    sh "(java -jar #{current_root}/Smc.jar -graph -glevel 2 #{filename})"
  end
  sh "dot -Tpng #{path}/#{filenameNoEnding}_sm.dot > #{path}/#{filenameNoEnding}_sm.png"
 end
 
 task :buildSMCDocs do
  puts "Compiling SMCDocs"
  files = FileList["src/**/*.sm"].ext(".smcdoc")
  Rake::Task[files].execute
 end
end
