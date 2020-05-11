class ReportWorker
    include Sidekiq::ReportWorker
    sidekiq_options retry:false

    def perform(s,e)
        puts "testttttting"
    end

end