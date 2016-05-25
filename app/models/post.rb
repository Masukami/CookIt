class Post < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 140 } #max title length
  validates :description, presence: true
  validates :image, presence: true
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  default_scope -> { order(created_at: :desc) } #Newest Post First
end
