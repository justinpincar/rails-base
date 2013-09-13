class Authorization < ActiveRecord::Base
  ROLES = [:admin]
  class << self
    ROLES.each do |role|
      define_method("#{role}".to_sym) { role.to_s }
    end
  end

  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:role]
  validates_presence_of :role
  symbolize :role, :in => Authorization::ROLES
end

