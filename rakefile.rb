require "ceedling"
Ceedling.load_project
require_relative "externalTools/SMC/smc.rb"
require_relative "externalTools/dbcc/dbcc.rb"
require 'fileutils'

task :default => %w[ smc:buildSMC dbc:builddbc test:all gcov:all utils:gcov smc:buildSMCDocs dbc:builddbcDocs autogen:gitlog autogen:doxygen release  ]

namespace :autogen do
 task :doxygen => %w[gitlog] do
  puts "generating Doxygen"
  sh ('xsltproc docs/stylesheet_report.xsl build/artifacts/test/report.xml > build/artifacts/test/report.html')
  #get current Commit to add as VersionNumber
  buildNumber= %x[git log -1 --pretty="format:%h %cd"]
  puts buildNumber
  ENV['PROJECT_NUMBER'] = buildNumber
  sh "doxygen Doxyfile"
 end
 task :gitlog do
  puts "extracting git log"
  FileUtils.mkdir_p 'build/artifacts/docs'
  #export git log as csv
  sh ('git log --pretty=format:"%h,%an,%aD,%s" > build/artifacts/docs/log.csv')
  #export git log as xml
  sh ('(echo "<?xml version=\'1.0\' encoding=\'utf-8\' ?>\n<Data>" ; git log --pretty=format:"<line><commit>%H</commit><UserName>%an</UserName><timestamp>%aD</timestamp><Message>%s</Message></line>"; echo "\n</Data>") > build/artifacts/docs/log.xml')
  #Tag xmlData
  sh ('xsltproc docs/Filtering.xsl build/artifacts/docs/log.xml > build/artifacts/docs/log_pretty.xml')
  #generate HTMl from xml
  sh ('xsltproc docs/stylesheet_gitlog.xsl build/artifacts/docs/log_pretty.xml > build/artifacts/docs/log.html')
 end
end
