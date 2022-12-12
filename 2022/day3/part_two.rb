class BagCalc

  def initialize(priorities_sum = 0, i = 1, group_num = 1, queue = 0)
    @duplicates = []
    @groups = Hash.new(0)
    @priorities_sum = priorities_sum
    @score_hash =  Hash.new(0)
    @i = i
    @group_num = 1
    @queue = queue
  end

  def run
    set_score_hash
    compare_lines
    priorities_sum_total
    puts_total
  end

  def run_three
    set_score_hash
    assign_groups
    compare_three
    priorities_sum_total
    puts_total
    puts @group_num
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

  def assign_groups
    File.readlines("data.csv").each do |line|
      if @queue == 0
        @groups[@group_num] = []
        @groups[@group_num] << line.chomp
        @queue += 1
      elsif @queue < 2
        @groups[@group_num] << line.chomp
        @queue += 1
      else
        @groups[@group_num] << line.chomp
        @group_num += 1
        @queue = 0
      end
    end
    pp @groups
  end

  def compare_three
    @groups.each do |key, bags|
      bag1 = bags[0].split("")
      bag2 = bags[1].split("")
      bag3 = bags[2].split("")

      bag1.each do |item|
        if (bag2 & bag3).include? item
          @duplicates << item
          break
        end
      end
    end
  end

  def priorities_sum_total
    @duplicates.each do |d|
      @priorities_sum += @score_hash[d]
    end
  end

  def puts_total
    puts "This is the total: #{@priorities_sum}"
    puts @duplicates.count
  end

end

class Rucksack
  def initialize(value)
    @value = value
  end
  attr_reader :value

  def line_length
    value.chomp.length
  end

  def first_compartment
    value[0, line_length * 0.5].split("")
  end

  def second_compartment
    value[line_length * 0.5, line_length].split("")
  end
end

bag = BagCalc.new
bag.run_three