class Scheduler
  require "rufus/scheduler"

  def self.start(options={})
    scheduler = Rufus::Scheduler.start_new

    instance_scheduler.every '1d', :first_in => '0s' do
      # Do some task
    end

    puts "Scheduler started"
    scheduler.join unless options[:exit]

    scheduler
  end
end

