def compare_lines

  duplicates = []
  priorities_sum = 0
  score_hash = Hash.new
  i = 1

  # automatically creates a hash of scores for each letter.
  ("a".."z").each do |l|
    score_hash[l] = i
    i += 1
  end

  ("A".."Z").each do |l|
    score_hash[l] = i
    i += 1
  end

  # Splits each line
  # Loops through first string looking for matches in the second string.
  # If there's a match, the letter is thrown into a duplicates array and loop breaks.

  File.readlines("data.csv").each do |line|

    line_length = line.chomp.length
    line_half = line_length / 2

    first_comp = line[0, line_half].split("")
    second_comp = line[line_half, line.length].split("")

    first_comp.each do |a|
      if second_comp.include? a
        duplicates << a
        break
      end
    end
  end

  # Loops through the found duplicates and checks their values against the score_hash
  # The priorities sum is updated with each score

  duplicates.each do |d|
    priorities_sum += score_hash[d]
  end

  puts "This is the total: #{priorities_sum}"

end

compare_lines