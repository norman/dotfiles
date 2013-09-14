require "fileutils"

files = Dir["*"] - [File.basename(__FILE__)]
files.each do |file|
  FileUtils.ln_s(File.expand_path(file), File.expand_path("~/.#{file}"))
end
