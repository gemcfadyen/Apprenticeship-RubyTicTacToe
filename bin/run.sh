#!/usr/bin/env ruby

##Setup Load Path
$LOAD_PATH << File.expand_path("../../lib", __FILE__)

require 'command_line_app'
require 'command_line_ui'
require 'board_factory'
require 'player_factory'
require 'prompt_writer'
require 'prompt_reader'
require 'game'
require 'board'
require 'player_symbols'
require 'human_player'
require 'replay_option'

writer = PromptWriter.new($stdout)
reader = PromptReader.new($stdin)
command_line_ui = CommandLineUI.new(writer, reader)

board_factory = BoardFactory.new
player_factory = PlayerFactory.new

command_line_app = CommandLineApp.new(command_line_ui, board_factory, player_factory)
command_line_app.setup
