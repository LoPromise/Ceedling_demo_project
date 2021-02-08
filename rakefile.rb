require "ceedling"
Ceedling.load_project
require_relative "externalTools/SMC/smc.rb"

task :default => %w[ smc:buildSMC test:all gcov:all utils:gcov smc:buildSMCDocs autogen:doxygen release  ]

namespace :autogen do
 task :doxygen do
  puts "generating Doxygen"
  sh ('xsltproc docs/stylesheet.xsl build/artifacts/test/report.xml > build/artifacts/test/report.html')
  #get current Commit to add as VersionNumber
  buildNumber= %x[git log -1 --pretty="format:%h %cd"]
  puts buildNumber
  ENV['PROJECT_NUMBER'] = buildNumber
  sh "doxygen Doxyfile"
 end
end
