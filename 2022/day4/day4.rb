class Elf
  def initialize(assignment = Hash.new(0))
    @assignment = assignment
  end

  def assign
    total = 0
    File.readlines("data.csv").each do |line|
      elf1_assignment, elf2_assignment = line.split(',')
      elf1_assignment_format = elf1_assignment.split('-')
      elf2_assignment_format = elf2_assignment.split('-')

      elf1_start = elf1_assignment_format[0].to_i
      elf1_end = elf1_assignment_format[1].to_i
      elf2_start = elf2_assignment_format[0].to_i
      elf2_end = elf2_assignment_format[1].to_i

      elf1_range = Range.new(elf1_start, elf1_end)
      elf2_range = Range.new(elf2_start, elf2_end)

      if elf1_range.cover?(elf2_range) || elf2_range.cover?(elf1_range)
        total += 1
      end
    end
    puts total
  end

end

elf1 = Elf.new
elf1.assign