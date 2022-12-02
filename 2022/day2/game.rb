class Game

  attr_accessor :result, :my_score, :elf, :me

  def initialize (result = "", my_score = 0, elf = "", me = "")
    @result = result
    @my_score = my_score
    @elf = elf
    @me = me
  end

    elf_rock = "A"
    elf_paper = "B"
    elf_scissors = "C"
    me_rock = "X"
    me_paper = "Y"
    me_scissors = "Z"
  def execute_game
    File.readlines("turns.csv").each do |line|
      puts line


      (@elf = "rock") if (line[0] == "A")
      (@elf = "paper") if (line[0] =="B")
      (@elf = "scissors") if (line[0] == "C")

      (@me = "rock") if (line[0] == "X")
      (@me = "paper") if (line[0] == "Y")
      (@me = "scissors") if (line[0] == "Z")

      # @elf == @me ? puts "tie" : "someone won."
      puts "#{@elf} vs #{@me}"
      # round
    end
  end

  def round
    if @elf == me
      result = "tie"
    elsif (elf == rock && me == paper) ||
      (elf == paper && me == scissors) ||
      (elf == scissors && me == rock)
      result = "win"
    else
      result = "loss"
    end
  end



  def score
    case result

    when "win"
      my_score += points
    when "tie"
      my_score += points
    when "loss"
      my_score += points
    end


  end
end