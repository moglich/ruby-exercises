class Series
  def initialize(slice_string)
    @string_slices = slice_string.chars.map(&:to_i)
  end

  def slices(slice_size)
    raise ArgumentError "Slice size is bigger than string!" if slice_size > @string_slices.size
    series = []
    @string_slices.size.times do
      if @string_slices.size >= slice_size
        series << @string_slices.first(slice_size)
        @string_slices.shift
      end
    end
    series
  end
end
