# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DBCForum::Application.initialize!



# memcache_options = {
#   :c_threshold => 10_000,
#   :compression => true,
#   :debug => false,
#   :namespace => 'my_rails_app',
#   :readonly => false,
#   :urlencode => false
# }

# CACHE = MemCache.new memcache_options
# CACHE.servers = 'localhost:11211'