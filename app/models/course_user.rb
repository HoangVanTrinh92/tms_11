class CourseUser < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  accepts_nested_attributes_for :user, allow_destroy: true
end
