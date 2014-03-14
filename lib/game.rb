require('./lib/player.rb')
require('./lib/board.rb')
class Game
  attr_reader(:player_x, :player_y, :new_board, :turn_counter, :current_player)

  def initialize
    @player_x = Player.create(:X)
    @player_y = Player.create(:Y)
    @new_board = Board.create()
    @turn_counter = 1
    @current_player = 'X'
  end

  def Game.create
    @new_game = Game.new()
  end

  def winner
    @new_board.winner
  end

  def inc_turn
    @turn_counter += 1
    if @current_player == 'X'
      @current_player = 'O'
    else
      @current_player = 'X'
    end
  end



end
