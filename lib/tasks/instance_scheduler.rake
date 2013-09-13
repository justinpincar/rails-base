namespace :scheduler do
  task :start => :environment do
    puts "Starting scheduler..."
    Scheduler.start
  end
end

