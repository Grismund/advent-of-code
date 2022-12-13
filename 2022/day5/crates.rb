

def prog
  final = []
  crates = [
    ["empty"],
    %w[f h b v r q d p],
    %w[l d z q w v],
    %w[h l z q g r p c],
    %w[r d h f j v b],
    %w[z w l c],
    %w[j r p n t g v m],
    %w[j r l v m b s],
    %w[d p j],
    %w[d c n w v]
  ]

  File.readlines("data.csv").each do |line|
    cmd = line.split(" ")

    moves = cmd[1].to_i
    popping_pile = crates[cmd[3].to_i]
    pushing_pile = crates[cmd[5].to_i]

    moves.times do
      moving_item = popping_pile.pop
      pushing_pile.push(moving_item)
    end
  end

  crates.each do |pile|
    final << pile.pop
  end
    puts final
end

prog