class Logic
  def win_set
    [[1, 2, 3], [1, 4, 7], [2, 5, 8], [3, 6, 9], [4, 5, 6], [1, 5, 9], [3, 5, 7], [7, 8, 9]]
  end

  def win_combination1(player1_choices)
    win_set.map { |q| q.intersection(player1_choices) }.select { |b| b.size == 3 }
  end

  def win_combination2(player2_choices)
    win_set.map { |q| q.intersection(player2_choices) }.select { |b| b.size == 3 }
  end

  def win_checker(checker1, checker2)
    if win_set.include? checker1.flatten
      true
    elsif win_set.include? checker2.flatten
      true
    end
  end
end
