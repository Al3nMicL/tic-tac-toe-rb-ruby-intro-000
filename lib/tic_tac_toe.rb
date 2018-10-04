

# Define win combinations
WIN_COMBINATIONS = [
  [0,1,2], # Top horizontal
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom horizontal
  [0,3,6], # Left vertical
  [1,4,7], # Middle vertical
  [2,5,8], # Right vertical
  [0,4,8], # \ diagonal
  [2,4,6] # / diagonal
]

# Define the board display
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 

def display_board(board)
  line = lambda { |x,y,z| " %s | %s | %s " % [x,y,z] }
  dashes = "-"*11
  
  puts line[ board[0], board[1], board[2] ]
  puts dashes
  puts line[ board[3], board[4], board[5] ]
  puts dashes
  puts line[ board[6], board[7], board[8] ] 
end

# Convert user input to valid board index
def input_to_index(d)
  digit = d.to_i
  digit -= 1
  return digit
end

# Allows the player to make a move
def move(board, index, char)
  board[index] = char
end

# Checks to see if the given board position is available
def position_taken?(board, index)
  (board[index] == " ") || (board[index] == "") || (board[index] == nil) ? false : true
end

# Checks to see if the move submitted by the user is valid
def valid_move?(board,index)
  if index.between?(0,8)
    if !position_taken?(board, index)
      true
    else
      false
    end
  end
end

# Allows the user to take a turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  go = input_to_index(input)
  if (valid_move?(board, go))
    move(board, go, 'X')
    display_board(board)
  else
    turn(board)
  end
end
