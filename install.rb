require "fileutils"

files = Dir["*"] - [File.basename(__FILE__)]
files.each do |file|
  begin
    FileUtils.ln_s(File.expand_path(file), File.expand_path("~/.#{file}"))
    puts "linked #{file}"
  rescue Errno::EEXIST
    puts "#{file} already linked, skipped"
  end
end
