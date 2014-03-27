  namespace :backy do

  config   = Rails.configuration.database_configuration
	@host     = config[Rails.env]["host"]
	@database = config[Rails.env]["database"]
	@username = config[Rails.env]["username"]
	@password = config[Rails.env]["password"]

	desc 'dumps database into db/backy.sql file'

    task :dump => :environment do
      case ActiveRecord::Base.connection.adapter_name
      when "PostgreSQL" 
        postgresql_dump
      when "Mysql2" 
        mysql2_dump
    	else 
        abort("only PostgreSQL, Mysql2 compatible")
      end

    end

    desc 'recovers database from db/backy.sql file'
    task :load => :environment do

      case ActiveRecord::Base.connection.adapter_name
      when "PostgreSQL" 
        postgresql_load
      when "Mysql2" 
        mysql2_load
      else 
      else 
        abort("only PostgreSQL, Mysql2 compatible")
      end

    end

  def postgresql_load
      puts "adapter: #{ActiveRecord::Base.connection.adapter_name}"
      puts "invoking db:drop ..."
      Rake::Task["db:drop"].invoke
      puts "invoking db:create ..."
      Rake::Task["db:create"].invoke
      puts "loading db/backy.sql ..."
      system( "export PGPASSWORD=#{@password}" )
      system( "rails db < db/backy.sql" )
      system( "unset PGPASSWORD" )
  end

  def postgresql_dump
      puts "adapter: #{ActiveRecord::Base.connection.adapter_name}"
      puts "invoking pg_dump ..."
      system( "export PGPASSWORD=#{@password}" )
      system( "pg_dump -U'#{@username}' --no-password --file='db/backy.sql' #{@database}" )
      system( "unset PGPASSWORD" )
  end

  def mysql2_load
      puts "adapter: #{ActiveRecord::Base.connection.adapter_name}"
      puts "loading db/backy.sql ..."
      system( "mysql -u'#{@username}' -p'#{@password}' '#{@database}' < db/backy.sql" )
  end

  def mysql2_dump
      puts "adapter: #{ActiveRecord::Base.connection.adapter_name}"
      puts "invoking mysqldump ..."
      system( "mysqldump -u'#{@username}' -p'#{@password}' '#{@database}' > db/backy.sql" )
  end

  end