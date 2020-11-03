# class with game board
class TicTacToeBoard
  def initialize
    @board = Array.new(3) { Array.new(3, '-') }
  end

  def show_board
    print "\n\n"
    @board.each_with_index do |_row, i|
      print '              '
      @board[i].each_with_index do |_col, j|
        print " #{@board[i][j]} "
      end
      print "\n\n"
    end
    print "\n"
  end

  def write_cell(xory)
    row, col = 0
    cell = ''
    while cell != '-'
      print 'Enter row (1-3)      : '
      row = gets.chomp.to_i
      next if row > 3 || row < 1

      print 'Enter column (1-3)   : '
      col = gets.chomp.to_i
      next if col > 3 || col < 1

      cell = @board[row - 1][col - 1]
      unless cell == '-'
        show_board
        puts 'Please select a blank cell'
      end
    end

    @board[row - 1][col - 1] = xory

  end

  def check_for_winner

    winner = false
    %w[X O].each do |letter|
      next unless @board[0].count(letter) == 3 || @board[1].count(letter) == 3 || @board[2].count(letter) == 3 ||
                  @board.transpose[0].count(letter) == 3 || @board.transpose[1].count(letter) == 3 || @board.transpose[2].count(letter) == 3 ||
                  @board[0][0] == letter && @board[1][1] == letter && @board[2][2] == letter

      winner = true
    end
    winner
  end

end

play = TicTacToeBoard.new

print 'Enter X player name: '
player1 = gets.chomp
print 'Enter Y player name: '
player2 = gets.chomp

player = player1
count = 0

until play.check_for_winner || count == 9

  count += 1

  puts "\n******************************************************************************************"
  puts "***  #{player} to play"
  puts "******************************************************************************************\n\n"
  player == player1 ? play.write_cell('X') : play.write_cell('O')
  play.show_board

  player = player == player1 ? player2 : player1

end

if play.check_for_winner
  player = player == player1 ? player2 : player1
  puts "#{player} wins!!! GAME OVER\n\n\n"
else
  puts 'NO WINNER. GAME IS A DRAW'
end