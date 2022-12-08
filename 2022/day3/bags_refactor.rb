class BagCalc

  def initialize(priorities_sum = 0, i = 1)
    @duplicates = []
    @priorities_sum = priorities_sum
    @score_hash =  Hash.new(0)
    @i = i
  end

  def run
    set_score_hash
    compare_lines
    priorities_sum_total
    puts_total
  end

  def set_score_hash
    ("a".."z").each do |l|
      @score_hash[l] = @i
      @i += 1
    end

    ("A".."Z").each do |l|
      @score_hash[l] = @i
      @i += 1
    end
  end

  # def compare_lines
  #   File.readlines("data.csv").each do |line|
  #
  #     line_length = line.chomp.length
  #     line_half = line_length / 2
  #
  #     first_comp = line[0, line_half].split("")
  #     second_comp = line[line_half, line.length].split("")
  #
  #     first_comp.each do |a|
  #       if second_comp.include? a
  #         @duplicates << a
  #         break
  #       end
  #     end
  #   end
  # end

  # ____________________________________________

  def compare_lines
    File.readlines("data.csv").each do |line|

      determine_line_length

      first_comp = line[0, line_half].split("")
      second_comp = line[line_half, line.length].split("")

      first_comp.each do |a|
        if second_comp.include? a
          @duplicates << a
          break
        end
      end
    end
  end

  def determine_line_length
    line_length = line.chomp.length
    line_half = line_length / 2
  end

  #________________________________________________

  def priorities_sum_total
    @duplicates.each do |d|
      @priorities_sum += @score_hash[d]
    end
  end

  def puts_total
    puts "This is the total: #{@priorities_sum}"
  end

end

bag = BagCalc.new
bag.run