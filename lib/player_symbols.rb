class PlayerSymbols
  X = :X
  O = :O

  def self.opponent(symbol)
    symbol == X ? O : X
  end

  def self.all
    [X, O]
  end

  def self.to_symbol(value)
    value == X.to_s ? X : O
  end
end
