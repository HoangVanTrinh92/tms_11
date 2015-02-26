class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save {self.email = email.downcase}
  validates :name,  presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, length: {minimum: 6}, allow_blank: true

  has_many :course_users, dependent: :destroy
  has_many :courses, through: :course_users

  has_many :assignments, dependent: :destroy
  has_many :courses, through: :assignments

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes!(remember_digest: User.digest(remember_token))
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attributes! remember_digest: nil
  end
  
  scope :is_admin, ->{where(admin: true)}
  scope :free_user, ->{includes(:assignments).where(assignments: {user_id: nil})} 
  scope :in_course, ->(course) {includes(:assignments)
    .where(assignments: {course: course, status: [0, 1]})}
  scope :finished_all_courses, ->{includes(:assignments)
    .where(assignments: {status: 2})}
  scope :assignable, ->(course) {User.in_course(course) 
    + User.free_user 
    + User.finished_all_courses}
end