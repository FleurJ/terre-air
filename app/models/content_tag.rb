class ContentTag < ApplicationRecord
  belongs_to :tags
  belongs_to :contents
end
