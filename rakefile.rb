require "ceedling"
Ceedling.load_project
require_relative "externalTools/SMC/smc.rb"
require_relative "externalTools/dbcc/dbcc.rb"
require 'fileutils'

task :default => %w[ smc:buildSMC dbc:builddbc test:all gcov:all utils:gcov smc:buildSMCDocs dbc:builddbcDocs autogen:gitlog autogen:doxygen release  ]

namespace :autogen do
 task :doxygen do
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
  #generate dbc html
  #sh ('xsltproc docs/stylesheet_gitlog.xsl build/artifacts/docs/log_pretty.xml > build/artifacts/docs/log.html')
 end
end

driverlib = "/home/markus/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/devices/msp432e4/driverlib/lib/gcc/m4f/libdriver.a"

task :release => "#{driverlib}"

file "#{PROJECT_BUILD_ROOT}/release/project.bin" => :release do |task|
    puts "Creating #{File.basename(task.name)}..."
    sh "arm-none-eabi-objcopy -O binary #{PROJECT_BUILD_ROOT}/release/#{RELEASE_BUILD_OUTPUT} #{task.name}"
end

desc "Load the binary onto the Tiva C Launchpad board"
task :load => "#{PROJECT_BUILD_ROOT}/release/project.bin" do
    puts "Loading to board..."
    sh "lm4flash #{PROJECT_BUILD_ROOT}/release/project.bin"
end

namespace :driverlib do

    driverlib_src_path = "/home/markus/ti/simplelink_msp432e4_sdk_4_20_00_12/source/ti/devices/msp432e4/driverlib/lib/gcc/m4f"

    desc "Build Peripheral Driver Library"
    task :build => "#{driverlib}"
    #ENV['GCC_ARMCOMPILER'] = '/home/markus/ti/gcc-arm-none-eabi-9-2019-q4-major'

    file "#{driverlib}" do |task| 
        puts "Building #{File.basename(task.name)}..."
        Dir.chdir("#{driverlib_src_path}") do
            sh "echo $PWD"
            sh "make"
        end
    end

    desc "Clean TivaWare Peripheral Driver Library"
    task :clean do |task|
        puts "Cleaning #{File.basename(task.name)}..."
        Dir.chdir("#{driverlib_src_path}") do
            sh "make clean"
        end
    end

end
