class Tree

  attr_accessor :row, :column, :height, :visible

  def initialize(row, column, height, visible = false)
    @row = row
    @column = column
    @height = height
    @visible = visible
  end

end


class Calculator

  def initialize(data = File.read("data.csv").split)
    @data = data
    @forest_array = []
    @trees_array = []
  end

  def calculate
    set_data
    assign_tree_properties
    set_edges_visible
    left_to_right
  end

  def set_data
    @data.each { |line| @forest_array << line }
  end

  def assign_tree_properties
    @forest_array.each_with_index do |row_of_trees, row_index|
      row_split = row_of_trees.split("")

      row_split.each_with_index do |tree_height, col_index|
        tree = Tree.new(@row, @column, @height, @visible)
        tree.row = row_index.to_i
        tree.column = col_index.to_i
        tree.height = tree_height.to_i

        @trees_array << tree

      end
    end

  end

  def set_edges_visible
    @trees_array.each do |tree|
      # if (tree.row || tree.column) == (0 || 4)
      if (tree.row == 0) || (tree.row == 4) || (tree.column == 0) || (tree.column == 4)
        tree.visible = true
      end
    end
  end

  def left_to_right
    current_group = 0
    tallest_so_far = -1

    @trees_array.each do |tree|
      selected = @trees_array.select { |other_tree|
        other_tree.row == tree.row 
      }
      pp selected
      break

    end

      # .any? is a problem here because it only looks at a tree in isolation, not in the context of all the other trees on the row.
      # tree.visible = @trees_array.any? { |other_tree| other_tree.row == tree.row and other_tree.column <= tree.column and other_tree.height < tree.height }


      # if tree.height > tallest_so_far & current_group == tree.row
      #   tree.visible = true
      #   tallest_so_far = tree.height
      # end
  end

  def print_things

  end

  def right_to_left

  end

  def top_to_bot

  end

  def bot_to_top

  end

end

run = Calculator.new
run.calculate