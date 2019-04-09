class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  def play
    display_board
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
  def over?
    won? || draw?
  end
  def won?
    WIN_COMBINATIONS.each do |win_move|
      if win_move.all? {|space| @board[space] == "X"} || win_move.all? {|space| @board[space] == "O"}
        return win_move
        break
      end
    end
    return false
  end
  def draw?
    if !won?
      return full?
    else
      return false
    end
  end
    def full?
    @board.all? {|space| space == "X" || space == "O"}
  end
  def winner
    if won? == false
      return nil
    else
      WIN_COMBINATIONS.each do |win_move|
        if win_move.all? {|space| @board[space] == "X"}
          return "X"
        elsif win_move.all? {|space| @board[space] == "O"}
          return "O"
        end
      end
    end
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(p_move)
    return p_move.to_i - 1
  end
  def move(p_move, x_or_o)
    @board[p_move] = x_or_o
  end
  def position_taken?(index)
    return !(@board[index] == " " || @board[index] == "" ||   @board[index] == nil)
    return (@board[index] == "X" || @board[index] == "O")
  end
  def valid_move?(move)
    return (move >= 0 && move <= 8 && !position_taken?(move))
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index)
      if position_taken?(index)
        puts "Sorry, that position is taken, please select another."
      else
        puts "Sorry, that is not a valid move. Please select a number 1 through 9."
      end
      input = gets.strip
      index = input_to_index(input)
    end
    move(index,current_player)
    display_board
  end
  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
    return count
  end
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
end