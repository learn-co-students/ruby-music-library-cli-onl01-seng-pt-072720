require 'bundler'
Bundler.require

module Concerns
end

require_all 'lib'


# Dir[File.join(File.dirname(__File__), "..app/concerns", "*.rb")].each { |f| require f}
# Dir[File.join(File.dirname(__File__), "..app/models", "*.rb")].each { |f| require f}
