require 'pry'

module BestSellingBooks::Collectable

  def create_and_collect_books
    self::Scraper.scrape_book_list.each do |hash|
      instance = BestSellingBooks::Books.new
      instance.title = hash[:Title]
      instance.author = hash[:Author]
      instance.author_bio = hash[:Author_Bio]
      instance.price = hash[:Price]
      instance.format = hash[:Format]
      instance.rating = hash[:Rating]
      instance.link = hash[:Link]
      instance.rank = hash[:Rank]
      self.all_books << instance
    end
  end

  def list_best_sellers
    puts self.name + "'s Top 20"
    self.all_books.each {|instance| puts "#{instance.rank}. #{instance.title} by #{instance.author}"}
  end
end
