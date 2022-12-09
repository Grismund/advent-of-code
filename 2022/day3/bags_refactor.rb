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

  def compare_lines
    File.readlines("data.csv").each do |line|
      rucksack = Rucksack.new(line)

      rucksack.first_compartment.each do |item|
        if rucksack.second_compartment.include? item
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
bag.run