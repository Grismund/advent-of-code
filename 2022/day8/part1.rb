# transpose
class TreeCounter
    def initialize
        @formatted_data = []
        @tree_rows = []
        @tree_columns = [[]]
        @tree_count = 0

    end

    def run
        # format_data
        # tree_row_assignment
        chomp_data

        # tree_row_assignment
        # puts "\n -------------------------------------------- \n#{@tree_rows}"
        # @tree_rows.each do |tree|
        #     on_edge(tree, index)
        #     # puts "#{tree index}"
        # end
        # pp @tree_rows
    end

    def format_data
        chomped_data = @formatted_data
        # pp chomped_data
        chomped_data.each do |line|
            line.split("\n")
        end
        # pp @formatted_data
    end

    def chomp_data
        File.readlines("data.csv").each do |line|
            chomped_data = line.chomp
            @formatted_data << chomped_data
        end
        pp @formatted_data
    end
    def tree_row_assignment
        # @tree_rows.transpose
        # pp @formatted_data
    end

    def tree_column_assignment
        @tree_columns = @tree_rows.transpose
    end

    def on_edge(tree, index)
        @tree_count += 1 if index == 0
    end

    def tallest_from_edge

    end

    def uncount_single_tallest
        if tree_row.tallest_tree.uniq
            tree_count - 1
        end
    end


    def count_visible
        on_edge
        tallest_from_edge
    end

end


run = TreeCounter.new
run.run

