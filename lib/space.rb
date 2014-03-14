class Space

  attr_reader(:x, :y, :marked_by)

  def initialize(x, y)
    @x = x
    @y = y
    @marked_by = :unmarked
  end

  def Space.create(x,y)
    new_space = Space.new(x, y)
  end

  def mark(symbol)
    @marked_by = symbol
  end
end
