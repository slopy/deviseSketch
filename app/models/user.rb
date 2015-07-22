class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  # :recoverable, :registerable

    devise :database_authenticatable, :rememberable, :trackable, :validatable

    belongs_to :role

    before_create :set_default_role

    validates_presence_of :role

    def full_name
        if self.name.present? && self.surname.present?
            self.name + " " + self.surname 
        else 
            self.email
        end
    end

    def name
        if self.read_attribute(:name).nil? 
            return ""
        end        
    end

    def surname
        if self.read_attribute(:surname).nil? 
            return ""
        end        
    end

    def set_role(role)
        self.role = Role.find_by_name(role)
        self.save
    end

    def admin?
        self.role.name == 'admin'
    end

    private

    def set_default_role
        self.role ||= Role.find_by_name('registered')
    end

end
