
require 'pry'

class TicTacToe
    
    attr_accessor :board

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]


    def initialize
        @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
        # @board = ["X", "O", "O", " ", "X", " ", " ", " ", "X"]
    end

    def display_board       
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} "
        puts "-----------"
        puts " #{self.board[3]} | #{self.board[4]} | #{self.board[5]} "
        puts "-----------"
        puts " #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(string)
            index = string.to_i
            index - 1
    end

    def move(index, token="X")
        self.board[index.to_i] = token
    end
    
    def position_taken?(index)
        self.board[index] == " " ? false : true
    end

    def valid_move?(position)
       if position >=0 && position < 10 && self.position_taken?(position) == false
            true
       else
            false
       end
    end

    def turn_count
        count = 0
        self.board.each do |pos|
            if pos != " "
                count += 1
            end
        end
        count
    end
  
    def current_player
        if self.turn_count%2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Specify position between 1-9"
        user_position = gets.chomp
        index = self.input_to_index(user_position)

        if self.valid_move?(index) == true
            self.move(index, current_player)
            self.display_board
        else
            self.turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
                return combo
            end
        end    
        return false 
    end

    def full?
        board.include?(" ") ? false : true
    end

    def draw?
        if self.full? && self.won? == false
            return true
        else
            return false
        end
    end

    def over?
        if self.won? != false || self.full? == true
            true
        else
            false
        end
    end

    def winner
        if self.won? == false
            return nil
        else
            winning_array = self.won?
            return board[winning_array[1]]
        end
    end

#-----------------------------------

    def play
        
        until self.over? == true ||self.draw? == true
            self.turn
        end

        if self.won? != false
            puts "Congratulations #{self.winner}!"
        elsif self.draw? 
            puts "Cat\'s Game!"
        end

    end



end

# game = TicTacToe.new

# binding.pry