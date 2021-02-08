require "ceedling"
Ceedling.load_project

task :default => %w[ autogen:compileSMC test:all gcov:all utils:gcov autogen:docs release  ]

namespace :autogen do
 task code: [:compileSMC]
 task docs: [:compileSMCDocs,:doxygen]
 
 rule '.smc' => ['.sm'] do |t|
  puts "compiling " + "#{t.source}"
  current_root = __dir__
  path = File.dirname("#{t.source}")
  filename = t.source.pathmap("%f")
  filenameNoEnding = t.source.pathmap("%n")
  Dir.chdir("#{path}") do 
    sh "(java -jar #{current_root}/externalTools/Smc.jar -c #{filename})"
  end
 end
 
 task :compileSMC do
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
    sh "(java -jar #{current_root}/externalTools/Smc.jar -graph -glevel 2 #{filename})"
  end
  sh "dot -Tpng #{path}/#{filenameNoEnding}_sm.dot > #{path}/#{filenameNoEnding}_sm.png"
 end
 
 task :compileSMCDocs do
  puts "Compiling SMCDocs"
  files = FileList["src/**/*.sm"].ext(".smcdoc")
  Rake::Task[files].execute
 end
 
 task :doxygen => [:compileSMC, :compileSMCDocs] do
  puts "generating Doxygen"
  sh "doxygen Doxyfile"
 end
end
