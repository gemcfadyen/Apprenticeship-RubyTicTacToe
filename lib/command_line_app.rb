class CommandLineApp

  def initialize(command_line_ui, board_factory, player_factory)
    @command_line_ui = command_line_ui
    @board_factory = board_factory
    @player_factory = player_factory
  end

  def setup
    replay_option = true 
    while replay_option == true
      play_tic_tac_toe
      replay_option = command_line_ui.replay?
    end
  end

  def start(game)
    final_board = game.play
    command_line_ui.print_game_status(final_board)
  end

  private 

  attr_reader :game, :command_line_ui, :board_factory, :player_factory

  def play_tic_tac_toe
    game = Game.new(board_factory.create_board, player_factory.create_human_vs_human_players(command_line_ui)) 
    start(game)
  end
end
