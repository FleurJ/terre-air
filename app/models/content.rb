class Content < ApplicationRecord
  ALLOWED_STATUSES = %w[draft published archived].freeze

  belongs_to :user

  has_one_attached :img_header
  has_one_attached :img_thumbnail
  has_many_attached :file
  #has_many :content_tags, dependent: :destroy
  #has_many :tags, through: :content_tags
  has_rich_text :body
  has_rich_text :teaser

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: ALLOWED_STATUSES,
                                                  message: "%{value} n'est pas un statut valide" }
end
