require 'erb'
require 'optparse'
require 'fileutils'
require 'find'

# Define default values for variables
options = {
  port: ENV['PORT'] || '80',
  server_name: ENV['SERVER_NAME'] || 'example.com',
  backend_host: ENV['BACKEND_HOST'] || 'localhost',
  backend_port: ENV['BACKEND_PORT'] || '3000',
  input_directory: 'templates',
  output_directory: 'transformed'
}

# Parse runtime arguments
OptionParser.new do |opts|
  opts.banner = "Usage: transform_config.rb [options]"

  opts.on("-iDIRECTORY", "--input=DIRECTORY", "Input directory containing .erb files") do |input_directory|
    options[:input_directory] = input_directory
  end

  opts.on("-oDIRECTORY", "--output=DIRECTORY", "Output directory for transformed files") do |output_directory|
    options[:output_directory] = output_directory
  end

  opts.on("--port=PORT", "Port to listen on") do |port|
    options[:port] = port
  end

  opts.on("--server-name=SERVER_NAME", "Server name") do |server_name|
    options[:server_name] = server_name
  end

  opts.on("--backend-host=BACKEND_HOST", "Backend host") do |backend_host|
    options[:backend_host] = backend_host
  end

  opts.on("--backend-port=BACKEND_PORT", "Backend port") do |backend_port|
    options[:backend_port] = backend_port
  end
end.parse!

# Assign variables to be used in the templates
@port = options[:port]
@server_name = options[:server_name]
@backend_host = options[:backend_host]
@backend_port = options[:backend_port]

puts "Transforming ERB templates in #{options[:input_directory]} to #{options[:output_directory]}"

# Iterate through all .erb files in the input directory recursively
Find.find(options[:input_directory]) do |path|
  next unless path =~ /\.erb$/

  # Derive the output file name by removing the .erb extension
  output_file = path.sub(/\.erb$/, '').sub(options[:input_directory], options[:output_directory])

  puts " #{path} → #{output_file}"

  # Create the directory for the output file if it doesn't exist
  FileUtils.mkdir_p(File.dirname(output_file))

  # Read the ERB template
  template = File.read(path)

  # Create an ERB object
  erb = ERB.new(template)

  # Transform the template with the defined variables
  result = erb.result(binding)

  # Write the transformed content to the new configuration file
  File.open(output_file, 'w') do |file|
    file.write(result)
  end
end