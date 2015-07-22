class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable 
  # :recoverable, :registerable

    devise :database_authenticatable, :rememberable, :trackable, :validatable

    belongs_to :role

    before_create :set_default_role

    def full_name
        self.name + " " + self.surname
    end

    def set_role(role)
        Role.find_by_name('admin')
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
