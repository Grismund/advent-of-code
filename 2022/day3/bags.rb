def compare_lines

  duplicates = []
  priorities_sum = 0
  score_hash = Hash.new
  i = 1

  ("a".."z").each do |l|
    score_hash[l] = i
    i += 1
  end

  ("A".."Z").each do |l|
    score_hash[l] = i
    i += 1
  end

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

  duplicates.each do |d|
    priorities_sum += score_hash[d]
  end

  puts "This is the total: #{priorities_sum}"

end

compare_lines