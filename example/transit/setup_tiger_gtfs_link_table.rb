$: << "../../extension/tiger_gtfs"

require 'graphserver.rb'
require 'link_tiger_gtfs_extend.rb'

DB_PARAMS = { :host => nil,
              :port => nil,
              :options => nil,
              :tty => nil,
              :dbname => 'graphserver',
              :login => nil, #database username
              :password => nil }

gs = Graphserver.new
gs.database_params = DB_PARAMS

gs.remove_link_table! #clean up first
gs.create_link_table!
gs.split_tiger_lines!
gs.link_street_gtfs!