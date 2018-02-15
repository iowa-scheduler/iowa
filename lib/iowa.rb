# Load dependencies
require 'google/protobuf'
require 'midori'
require 'ohm'
require 'thwait'
require 'yaml'

# Inject midori-contrib
require 'midori-contrib'
require 'midori-contrib/sequel/mysql2'
require 'midori-contrib/redic'

# Init module
require_relative 'iowa/version'

# Inject routes
require_relative 'iowa/routes/manage'
require_relative 'iowa/routes/worker'
require_relative 'iowa/routes/root'

# Load modules
require_relative 'iowa/plugins/server'
