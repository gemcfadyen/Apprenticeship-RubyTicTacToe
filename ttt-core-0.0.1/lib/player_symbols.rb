class PlayerSymbols
  X = :X
  O = :O

  def self.opponent(symbol)
    symbol == X ? O : X
  end

  def self.all
    [X.to_s, O.to_s]
  end

  def self.to_symbol(value)
    value == X.to_s ? X : O
  end
end
