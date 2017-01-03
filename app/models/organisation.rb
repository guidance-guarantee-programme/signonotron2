# encoding = utf-8

class Organisation < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  has_ancestry

  has_many :users

  validates :slug, presence: true, uniqueness: true
  validates :content_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :organisation_type, presence: true

  scope :allowed_parents, ->(org) do
    exclude_ids = [org.id]
    exclude_ids += org.descendant_ids unless org.new_record?
    order(:name).where.not(id: exclude_ids)
  end

  def name_with_abbreviation
    if abbreviation.present? && abbreviation != name
      return_value = "#{name} – #{abbreviation}"
    else
      return_value = name
    end

    return_value += " (closed)" if closed?

    return_value
  end
end
