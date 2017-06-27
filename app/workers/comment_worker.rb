class CommentWorker
  include Sidekiq::Worker

  def perform(start_date, end_date)
    puts "SIDEKIQ IS GENERATING A COMMENT FROM #{start_date} TO #{end_date}..."
  end
end
