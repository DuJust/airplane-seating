module AirplaneSeating
  module Util
    class Matrix

      attr_accessor :matrix, :row_size, :col_size

      def initialize(options = {}, &block)
        @row_size = options[:row_size]
        @col_size = options[:col_size]
        @matrix = options[:matrix] || Array.new(row_size) { Array.new(col_size, &block) }
      end

      def [](row, col)
        return nil if row > row_size.size
        matrix[row][col]
      end

      def []=(row, col, val)
        matrix[row][col] = val
      end

      def +(other)
        return other.clone if row_size == 0
        cloned_matrix = clone
        other.rows.each_with_index do |row, index|
          cloned_matrix.rows[index] = matrix[index] + row if row_size > index
          cloned_matrix.rows << create_row_with_nil_columns(other, index) if row_size <= index
        end
        cloned_matrix.row_size = [row_size, other.row_size].max
        cloned_matrix.col_size = col_size + other.col_size
        cloned_matrix
      end

      def create_row_with_nil_columns(other, index)
        Array.new(col_size) { nil } + other.row(index)
      end

      def row(index)
        matrix[index]
      end

      def rows
        matrix
      end

      def column(col)
        matrix.map { |row| row[col] }
      end

      def each(&block)
        matrix.each do |row|
          row.each { |element| block.call(element) unless element.nil? }
        end
      end

      def map!(&block)
        matrix.map! { |row| block.call(row) }
      end

      def each_with_index(*args)
        matrix.send(:each_with_index, *args)
      end

      def clone
        cloned_matrix = matrix.map { |row| row.clone }
        self.class.new(row_size: row_size, col_size: col_size, matrix: cloned_matrix)
      end

      def to_s
        matrix.collect do |row|
          row.collect { |element| element.nil? ? '   ' : sprintf('%3s', element.to_s) }.join + "\n"
        end.join
      end
    end
  end
end
