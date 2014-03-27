if Capistrano::Configuration.instance(false)

  Capistrano::Configuration.instance(true).load do |instance|

    # require File.expand_path("#{File.dirname(__FILE__)}/util")
    # require File.expand_path("#{File.dirname(__FILE__)}/database")
    # require File.expand_path("#{File.dirname(__FILE__)}/asset")

    instance.set :local_rails_env, ENV['RAILS_ENV'] || 'development' unless exists?(:local_rails_env)
    instance.set :rails_env, 'production' unless exists?(:rails_env)
    instance.set :db_local_clean, false unless exists?(:db_local_clean)
    instance.set :assets_dir, 'system' unless exists?(:assets_dir)
    instance.set :local_assets_dir, 'public' unless exists?(:local_assets_dir)

namespace :backy do
      desc 'dumps the database using backy gem and downloads to local'
      task :down do
        remote_file = "#{current_path}/db/backy.sql"
        output_file = "db/backy.sql"
        run "cd #{current_path} && rake backy:dump"
        self.get remote_file, output_file
      end

      desc 'uploads sql and loads using backy'
      task :up do
        remote_file = "#{current_path}/db/backy.sql"
        output_file = "db/backy.sql"
        self.upload output_file, remote_file
        run "cd #{current_path} && rake backy:load"
      end
end

    end



end
