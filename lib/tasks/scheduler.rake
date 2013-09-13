namespace :instance_scheduler do
  task :start => :environment do
    puts "Starting instance scheduler..."
    InstanceScheduler.start
  end
end

