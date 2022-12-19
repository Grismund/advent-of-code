# transpose


@tree_rows = []
@tree_columns = [[]]


File.readlines("data.csv").each do |line|
  @tree_rows << line.chomp.split("")
end

def sort_tree_columns
    column_index = 0
    tree_index = 0

    @tree_rows.each do |row|
        row.each do |tree|

            @tree_columns[column_index] ||= Array.new(tree_index) { tree }


            if @tree_columns[column_index][tree_index]
                @tree_columns[column_index][tree_index] = tree
                column_index += 1
            else
                @tree_columns[column_index] = Array.new(tree_index) { tree }
                column_index += 1
            end
        end
        tree_index += 1
        column_index = 0
    end

end

sort_tree_columns
pp @tree_columns
