class Series
  def initialize(slice_string)
    @slice_string = slice_string.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @slice_string.size
    series = []
    @slice_string.size.times do
      if @slice_string.size >= slice_size
        series << @slice_string.first(slice_size)
        @slice_string.shift
      end
    end
    series
  end
end
