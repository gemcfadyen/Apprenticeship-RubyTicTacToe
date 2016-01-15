#!/usr/bin/env ruby

##Setup Load Path
$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'command_line_app.rb'
require 'command_line_ui.rb'
require 'board_factory.rb'
require 'player_factory.rb'
require 'prompt_writer.rb'
require 'prompt_reader.rb'
require 'game.rb'
require 'board.rb'
require 'player_symbols.rb'
require 'human_player.rb'

writer = PromptWriter.new($stdout)
reader = PromptReader.new($stdin)
command_line_ui = CommandLineUI.new(writer, reader)

board_factory = BoardFactory.new
player_factory = PlayerFactory.new

command_line_app = CommandLineApp.new(command_line_ui, board_factory, player_factory)
command_line_app.setup
