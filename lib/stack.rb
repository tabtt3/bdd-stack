class Stack
  def initialize
    @buffer = []
  end

  def push(value)
    @buffer.push(value)
    self
  end

  def length
    @buffer.length
  end
end
