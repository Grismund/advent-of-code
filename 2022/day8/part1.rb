
@tree_rows = []
@tree_columns = []


File.readlines("data.csv").each do |line|
  @tree_rows << line.chomp.split("")
end

def sort_tree_columns
    column_index = 0
    tree_index = 0

    @tree_rows.each do |row|
        row.each do |tree|

            # TODO: Needs a conditionl... if nested array doesn't exist, create one then shove tree
            # TODO: otherwise, if it does exist, just shove the tree.
            @tree_columns[column_index] = Array.new(tree_index) { tree }
            column_index += 1
        end
        tree_index += 1
        column_index = 0
    end

end

sort_tree_columns
pp @tree_columns
