class Stack
  def initialize
    @buffer = []
  end

  def push(value)
    @buffer.push value
    self
  end

  def pop
    raise StandardError if empty?

    @buffer.pop
  end

  def length
    @buffer.length
  end

  def empty?
    return false if length > 0
    true
  end
end
