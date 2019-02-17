class Video < ApplicationRecord
  belongs_to :view

  validates_presence_of :name, :url

  validate :type_of_video

  paginates_per 10

  def type_of_video
    if url.split('.').last != 'm3u8' 
        errors.add(:url ,'Type of video is not valid')
    end
  end

end
