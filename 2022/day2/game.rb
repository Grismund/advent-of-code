class Game

  attr_accessor :result, :my_score, :elf, :me, :elf_score, :my_choice, :elf_choice

  def initialize (result = "", my_score = 0, elf = "", me = "", elf_score = 0, my_choice = 0, elf_choice = 0)
    @result = result
    @my_score = my_score
    @elf_score = elf_score
    @elf = elf
    @me = me
    @my_choice = my_choice
    @elf_choice = elf_choice
  end

  def letter_to_rps
    @elf = "rock" if @elf == "A"
    @elf = "paper" if @elf =="B"
    @elf = "scissors" if @elf == "C"

    @me = "rock" if @me == "X"
    @me = "paper" if @me == "Y"
    @me = "scissors" if @me == "Z"
    puts "Elf's #{ @elf } vs My #{ @me }"
  end

  def choice_points
    @elf_choice = 1 if @elf == "rock"
    @elf_choice = 2 if @elf =="paper"
    @elf_choice = 3 if @elf == "scissors"

    @my_choice = 1 if @me == "rock"
    @my_choice = 2 if @me == "paper"
    @my_choice = 3 if @me == "scissors"
  end

  def compare
    if @elf == @me
      @result = "tie"
    elsif
    (@elf == "rock" && @me == "paper") ||
    (@elf == "paper" && @me == "scissors") ||
    (@elf == "scissors" && @me == "rock")
      @result = "win"
    else
      @result = "loss"
    end
  end

  def award_points
    case result
    when "win"
      @my_score += @my_choice + 6
      @elf_score += @elf_choice
      puts "I win with #{@my_choice + 6} points!\n\n"
    when "tie"
      @my_score += @my_choice + 3
      @elf_score += @elf_choice + 3
      puts "We tied with #{@my_choice + 3 } points!\n\n"
    when "loss"
      @my_score += @my_choice
      @elf_score += @elf_choice + 6
      puts "Elf won with #{@elf_choice + 6} points! BOO!!!\n\n"
    end
  end

  def execute_game
    File.readlines("turns.csv").each do |line|
      @elf = line[0]
      @me = line[2]

      letter_to_rps
      choice_points
      compare
      award_points

    end

    puts "\nFinal score is:\n
Elf: #{@elf_score}
Me: #{@my_score}"
  end
end
