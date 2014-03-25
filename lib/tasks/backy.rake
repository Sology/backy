  namespace :backy do

  	config   = Rails.configuration.database_configuration
	host     = config[Rails.env]["host"]
	database = config[Rails.env]["database"]
	username = config[Rails.env]["username"]
	password = config[Rails.env]["password"]

	desc 'dumps database into db/backy.sql file'
    task :dump => :environment do
    	abort("only PostgreSQL compatible") if ActiveRecord::Base.connection.adapter_name != "PostgreSQL" 

    	puts "invoking pg_dump ..."
      	system( "export PGPASSWORD=#{password}" )
    	system( "pg_dump -U #{username} --no-password --file='db/backy.sql' #{database}" )
    	system( "unset PGPASSWORD" )
    end

    desc 'recovers database from db/backy.sql file'
    task :load => :environment do
    	abort("only PostgreSQL compatible") if ActiveRecord::Base.connection.adapter_name != "PostgreSQL" 

    	print "#{database}:#{username}:#{password}\n"
    	puts "invoking db:drop ..."
    	Rake::Task["db:drop"].invoke
    	puts "invoking db:create ..."
    	Rake::Task["db:create"].invoke
    	puts "loading db/backy.sql ..."
      	system( "export PGPASSWORD=#{password}" )
      	system( "rails db < db/backy.sql" )
      	system( "unset PGPASSWORD" )
    end
  end