class Song < ApplicationRecord
  belongs_to :user
  has_many :playlists
  has_many :likers, through: :playlists, source: :user
  validates :artist, :presence => true, :length => { minimum:2 }
  validates :title, :presence => true, :length => { minimum:2 }
end
