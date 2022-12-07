class Elf
  CALORIES = []

  data = File.read("data.csv")
  data_split = @data_split
  @data_split = data.split("\n")

  def count_my_cals

  end

  def print
    puts data_split
  end


end
