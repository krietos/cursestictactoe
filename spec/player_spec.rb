require('rspec')
require('player')
require('game')
require('space')
require('board')

describe('Player') do
  it('should initialize a player with an x or an o') do
    new_player = Player.new('X')
    new_player.should(be_an_instance_of(Player))
  end
  it('should initialize a player with an x or an o') do
    new_player = Player.new('X')
    new_player.symbol.should(eq('X'))
  end
  it('should create a new instance of Player') do
    new_player = Player.create('X')
    new_player.should(be_an_instance_of(Player))
  end
end

describe('Space') do
  it('should initialize a new space with its coordinates and a marked_by variable') do
    new_space = Space.new(1, 1)
    new_space.should(be_an_instance_of(Space))
  end
  it('should initialize a new space with its coordinates and a marked_by variable') do
    new_space = Space.new(1, 1)
    new_space.x.should(eq(1))
    new_space.y.should(eq(1))
    new_space.marked_by.should(eq(:unmarked))
  end
  it('should create a new instance of Space') do
    new_space = Space.create(1, 1)
    new_space.should(be_an_instance_of(Space))
  end
  it('should be able to be marekd with the symbol of a player') do
    new_space = Space.create(1, 1)
    new_space.mark(:X)
    new_space.marked_by.should(eq(:X))
  end
end

describe('Board') do
  before do
    Board.clear
  end
  it('creates a new instance of the class Board') do
    new_board = Board.create
    new_board.should(be_an_instance_of(Board))
  end

  it('should initialize a new instance of board with 9 spaces with the correct coordinates') do
    new_board = Board.create
    new_board.spaces.length.should(eq(9))
    new_board.spaces[0].x.should(eq(1))
    new_board.spaces[0].y.should(eq(1))
    new_board.spaces[8].x.should(eq(3))
  end
  it('should clear out the @@board array') do
    new_board = Board.create
    Board.clear
    new_board.spaces.length.should(eq(0))
  end
  it('should be able to return a space when given its coordinates') do
    new_board = Board.create
    new_board.find(1,1).should(eq(new_board.spaces[0]))
    new_board.find(1,2).should(eq(new_board.spaces[1]))
    new_board.find(3,1).should(eq(new_board.spaces[6]))
  end
  it('should return false if only the top left square is marked and no others') do
    new_board = Board.create
    new_board.spaces[0].mark(:X)
    new_board.winner.should(eq("no winner"))
  end
  it('should know if 3 spaces in a row horizontally have been marked') do
    new_board = Board.create
    new_board.spaces[0].mark(:X)
    new_board.spaces[1].mark(:X)
    new_board.spaces[2].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row horizontally have been marked') do
    new_board = Board.create
    new_board.spaces[3].mark(:X)
    new_board.spaces[4].mark(:X)
    new_board.spaces[5].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row horizontally have been marked') do
    new_board = Board.create
    new_board.spaces[6].mark(:X)
    new_board.spaces[7].mark(:X)
    new_board.spaces[8].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row vertically have been marked') do
    new_board = Board.create
    new_board.spaces[0].mark(:X)
    new_board.spaces[3].mark(:X)
    new_board.spaces[6].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row vertically have been marked') do
    new_board = Board.create
    new_board.spaces[1].mark(:X)
    new_board.spaces[4].mark(:X)
    new_board.spaces[7].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row vertically have been marked') do
    new_board = Board.create
    new_board.spaces[2].mark(:X)
    new_board.spaces[5].mark(:X)
    new_board.spaces[8].mark(:X)
    new_board.winner.should(eq(:X))
  end
  it('should know if 3 spaces in a row diagonally have been marked') do
    new_board = Board.create
    new_board.spaces[0].mark(:X)
    new_board.spaces[4].mark(:X)
    new_board.spaces[8].mark(:X)
    new_board.winner.should(eq(:X))
  end
end
describe('Game') do
  before do
    Board.clear
  end
  it('should create a new instance of Game') do
    new_game = Game.create()
    new_game.should(be_an_instance_of(Game))
  end
  it('should initialize new game with a board and 2 players') do
    new_game = Game.create()
    new_game.player_x.symbol.should(eq(:X))
    new_game.player_y.symbol.should(eq(:Y))
    new_game.new_board.spaces.length.should(eq(9))
  end
  it('should know if there is a winner after each turn') do
    new_game = Game.create()
    new_game.new_board.spaces[0].mark(:X)
    new_game.new_board.spaces[4].mark(:X)
    new_game.new_board.spaces[8].mark(:X)
    new_game.winner.should(eq(:X))
  end
  it('should be able to incriment the turn counter for each turn') do
    new_game = Game.create()
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.inc_turn
    new_game.turn_counter.should(eq(9))
  end
  it('should know whos turn it is') do
    new_game = Game.create()
    new_game.inc_turn
    new_game.current_player.should(eq('O'))
  end
end

