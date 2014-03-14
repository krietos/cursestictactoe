require('./lib/game')
require('curses')

def tic_tac_toe
  @cursor_x = 1
  @cursor_y = 2
  Curses.noecho
  Curses.init_screen
  Curses.stdscr.keypad(true)
  system "clear"
  Curses.addstr("-------------\n")
  Curses.addstr("|   |   |   |\n")
  Curses.addstr("-------------\n")
  Curses.addstr("|   |   |   |\n")
  Curses.addstr("-------------\n")
  Curses.addstr("|   |   |   |\n")
  Curses.addstr("-------------\n")
  Curses.setpos(10, 0)
  Curses.addstr("Use the arrow keys to move the cursor and the spacebar to mark a space\n")
  Curses.setpos(1, 2)
  begin

  new_game = Game.create

  while new_game.winner == "no winner" && new_game.turn_counter < 10 do
    case Curses.getch
    when Curses::Key::UP
      if @cursor_x != 1
        Curses.setpos(@cursor_x -= 2, @cursor_y)
      end
    when Curses::Key::DOWN
      if @cursor_x != 5
        Curses.setpos(@cursor_x +=2 , @cursor_y)
      end
    when Curses::Key::RIGHT
      if @cursor_y != 10
        Curses.setpos(@cursor_x, @cursor_y += 4)
      end
    when Curses::Key::LEFT
      if @cursor_y != 2
        Curses.setpos(@cursor_x, @cursor_y-=4)
      end
    when " "
      mark_space([@cursor_x, @cursor_y], new_game)
    end
    end
  end
  Curses.setpos(15, 0)
  new_game.inc_turn()
  if new_game.winner != "no winner"
    Curses.addstr("#{new_game.current_player} Wins!")
    Curses.setpos(16, 0)
  else
    Curses.addstr("Interesting game, the only winning move is not to play.")
  end
  Curses.getch
end

def mark_space(cursor, game)
  if cursor == [1, 2]
    if game.new_board.spaces[0].marked_by == :unmarked
      game.new_board.spaces[0].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [1, 6]
    if game.new_board.spaces[1].marked_by == :unmarked
      game.new_board.spaces[1].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [1, 10]
    if game.new_board.spaces[2].marked_by == :unmarked
      game.new_board.spaces[2].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [3, 2]
    if game.new_board.spaces[3].marked_by == :unmarked
      game.new_board.spaces[3].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [3, 6]
    if game.new_board.spaces[4].marked_by == :unmarked
      game.new_board.spaces[4].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [3, 10]
    if game.new_board.spaces[5].marked_by == :unmarked
      game.new_board.spaces[5].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [5, 2]
    if game.new_board.spaces[6].marked_by == :unmarked
      game.new_board.spaces[6].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [5, 6]
    if game.new_board.spaces[7].marked_by == :unmarked
      game.new_board.spaces[7].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end
  if cursor == [5, 10]
    if game.new_board.spaces[8].marked_by == :unmarked
      game.new_board.spaces[8].mark(game.current_player)
      Curses.addch(game.current_player)
      Curses.setpos(@cursor_x, @cursor_y)
      game.inc_turn()
    end
  end

end

tic_tac_toe
