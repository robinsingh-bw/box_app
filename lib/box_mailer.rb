require_relative 'user'

class BoxMailer
  def initialize(users)
    @users = users.map { |u| User.new(u[:name], u[:received_contents]) }
  end

  def find_unreceived_boxes(boxes)
    @users.map do |u|
      {
        user: u.name,
        boxes: boxes.reject{ |b| u.has_received_any?(b[:contents]) }.map{ |b| b[:code] }
      }
    end
  end
end
