class Urlshort < ActiveRecord::Base
  belongs_to :user
  has_one    :urlview, dependent: :destroy

  after_create :generate_short_url_value
  before_create :generate_token
  before_create :smart_add_url_protocol

  def generate_short_url_value
    self.shorturl = generate_token
    self.save
  end

  protected

  def generate_token
    self.shorturl = SecureRandom.urlsafe_base64
    generate_token if Urlshort.exists?(shorturl: self.shorturl)
  end

  def smart_add_url_protocol
    unless self.originalurl[/\Ahttp:\/\//] || self.originalurl[/\Ahttps:\/\//]
      self.originalurl = "http://#{self.originalurl}"
    end
  end

end
