class User < ApplicationRecord
  has_secure_password
  has_many :songs
  has_many :playlists
  has_many :liked_songs, through: :playlists, source: :song
  validates :first_name, :presence => true, :length => { minimum:2 }
  validates :last_name, :presence => true, :length => { minimum:2 }
  validates :email, :presence => true, :format => /\w+@\w+\.{1}[a-zA-Z]{2,}/, :uniqueness => true
  validates :password, :presence => true, :length => { minimum: 6 }
  before_validation { self.email.downcase! }
end
