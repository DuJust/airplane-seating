$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))

Dir['../lib/**/*.rb'].each { |f| require f }