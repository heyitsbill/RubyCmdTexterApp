class User < ActiveRecord::Base
    has_many :userchatrooms
    has_many :chatrooms, through: :userchatrooms
    has_many :messages
    
    # checks if user with given username exists
    def self.username_taken(username)
        return !!(User.find_by(username: username))
    end

    def full_name
        self.first_name+ " " + self.last_name
    end

    # return user with the most activity (most messages sent)
    def name_and_username
        "#{self.first_name} #{self.last_name} (#{self.username})"
    end
    
    def self.check_login(username:, password:)
        User.find_by(username: username, password: password)
    end

end