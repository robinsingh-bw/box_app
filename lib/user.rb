class User
  attr_reader :name, :received_contents

  def initialize(name, received_contents)
    @name, @received_contents = name, received_contents
  end

  def has_received_any?(contents)
    received_contents.any? { |c| contents.include?(c) }
  end
end
