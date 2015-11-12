class Series
  def initialize(string)
    @string = string.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @string.size
    series = []
    @string.size.times do
      if @string.size >= slice_size
        series << @string.first(slice_size)
        @string.shift
      end
    end
    series
  end
end
