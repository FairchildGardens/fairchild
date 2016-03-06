class Task < ActiveRecord::Base

  belongs_to :hunt

  has_many :user_tasks
  has_many :users, through: :user_tasks

  before_save :remove_parens

  def remove_parens
    p self.geo

    self.geo = self.geo.gsub('(', '').gsub(')', '')
  end

  def self.hunt_options
    hunts = []
    Hunt.find_each do |hunt|
      hunts << [hunt.name, hunt.id]
    end
    hunts
  end

  def self.claim_types
    ["plant code", "image match", "QR"]
  end

  def searchWiki(query)
    begin
      excerptUrl = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&&exintro=1&explaintext=1&titles=%s'
      excerptQuery = sprintf(excerptUrl, query)
      excerpt = HTTParty.get(URI.escape(excerptQuery))
      imageNameUrl = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=images&titles=%s'
      imageNameQuery = sprintf(imageNameUrl, query)
      imageName = HTTParty.get(URI.escape(imageNameQuery))
      firstImage = imageName['query']['pages'].first()[1]['images'].first['title']
      imageUrl = 'https://en.wikipedia.org/w/api.php?action=query&format=json&prop=imageinfo&titles=%s&iiprop=url'
      imageUrlQuery = sprintf(imageUrl, firstImage)
      image = HTTParty.get(URI.escape(imageUrlQuery))['query']['pages'].first[1]['imageinfo'].first['url']
      success = excerpt['query']['pages']['-1'].blank?
    rescue
      success = false
      excerpt = ''
      image = ''
    end
      {"success" => success, "excerpt" => excerpt, "image" => image}
  end
end
