class User < ActiveRecord::Base
  include ActiveModel::Validations

  attr_accessor :password

  validates :email, length: { minimum: 8 }

  def authenticate?(password)
    @password = password

    validate
    validates_length_of :password, minimum: 8, allow_blank: false

    errors.empty?
  end
end
