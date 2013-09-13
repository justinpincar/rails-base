class InstanceScheduler
  require "rufus/scheduler"

  def self.start(options={})
    instance_scheduler = Rufus::Scheduler.start_new

    instance_scheduler.every '1d', :first_in => '0s' do
      # Do some task
    end

    puts "Instance scheduler started"
    instance_scheduler.join unless options[:exit]

    instance_scheduler
  end
end

