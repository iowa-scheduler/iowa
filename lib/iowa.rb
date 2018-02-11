# Load dependencies
require 'google/protobuf'
require 'midori'
require 'ohm'
require 'yaml'

# Inject midori-contrib
require 'midori-contrib'
require 'midori-contrib/sequel/mysql2'
require 'midori-contrib/redic'

# Load module
require_relative 'iowa/version'
require_relative 'iowa/boot'
