namespace :db_check do
  desc "Checks to see if the database exists"
  task :exists do
    begin
      # https://stackoverflow.com/questions/17150064/how-to-check-if-the-database-exists-or-not-in-rails-before-doing-a-rake-dbsetup
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue => ActiveRecord::NoDatabaseError
      exit 1
    else
      exit 0
    end
  end
end