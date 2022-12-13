
@tree_rows = []
@tree_columns = []

File.readlines("data.csv").each do |line|
    tree_rows << line.chomp.split("")
end

def sort_tree_columns
    index = 0

    @tree_rows.each do |row|
        if row
            @tree_columns[index] << row[index]
        else
            index += 1
    end



end


pp tree_rows
