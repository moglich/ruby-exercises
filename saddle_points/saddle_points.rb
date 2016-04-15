class Matrix

  attr_accessor :rows, :columns
  def initialize(string)
    @matrix = extract_array(string)
  end

  def rows
    @matrix
  end

  def columns
    @matrix.transpose
  end

  def saddle_points
    saddle_points_coords = []
    rows.each_with_index do |row, x|
      columns.each_with_index do |col, y|
        if saddle_point?(x,y)
          saddle_points_coords << [x, y]
        end
      end
    end
    saddle_points_coords
  end

  private

  def extract_array(array_string)
    matrix = array_string.split("\n")
    matrix.map! do |row| 
      row.split.map(&:to_i)
    end

    matrix
  end

  def saddle_point?(x, y)
    value = @matrix[x][y]
    value == rows[x].max && value == columns[y].min
  end
end
