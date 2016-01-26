class PlayerSymbols
  X = :X
  O = :O

  def self.opponent(symbol)
    symbol == X ? O : X
  end
end
