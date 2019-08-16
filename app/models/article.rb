class Article < ApplicationRecord
  include PermissionsConcern 
  has_many :has_categories, dependent: :delete_all
  has_many :categories, through: :has_categories
  has_many :comments
  after_create :categories 
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, :body, presence: true
  #validate :validate_categories 
  scope :ultimos, -> {order("created_at DESC")} 
  scope :otro, -> {where(title: "Fotografía historica")}
  scope :titulo, -> (search){where("title like ?","%#{search}%")}

  def categories=(value)
    @categories = value
    save_categories
  end

  def getCategories
    @categories
  end

  private
  def save_categories
    @categories.each do |category_id|
      HasCategory.create(category_id: category_id, article_id: self.id)
    end
  end

  def validate_categories
    if self.getCategories.blank?
      errors.add(:categories, "debe agregar una categoría...")
    end
  end
end
