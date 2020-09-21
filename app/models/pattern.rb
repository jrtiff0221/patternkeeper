class Pattern < ApplicationRecord
    validates :title, :author, :category, :difficulty, :description, :name, :user_id,  presence: true

    has_many :comments, dependent: :destroy
    has_many :users, through: :comments


    scope :crocheting, -> {where(category: "Crocheting")}
    scope :knitting, -> {where(category: "Knitting")}
    scope :macrame, -> {where(category: "Macrame")}
    scope :sewing, -> {where(category: "Sewing")}

    scope :easy, -> {where(difficulty: "1 Easy")}
    scope :intermediate, -> {where(difficulty: "2 Intermediate")}
    scope :advanced, -> {where(difficulty: "3 Advanced")}

    scope :ordered, -> {order('created_at ASC')}
    
end