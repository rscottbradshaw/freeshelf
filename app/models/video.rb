class Video < ActiveRecord::Base
  paginates_per 15
  acts_as_taggable

  validates :title, presence: true
  validates :contributor, presence: true
  validates :slug, presence: true

  extend FriendlyId
  friendly_id :slug_candidates, :use => :slugged

  def slug_candidates
    [:title, [:title, :contributor]]
  end
end
