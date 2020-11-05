class TicTacToe
  attr_accessor :board
      WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
      def initialize(board = nil)
        @board = board || Array.new(9, " ")
      end
      def current_player
        turn_count % 2 == 0 ? "X" : "O"
      end
      def turn_count
        @board.count{|token| token == "X" || token == "O"}
      end
      def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end
      def input_to_index(str)
          str
          str.to_i-1
      end
      def move(index, player)
          @board[index]=player
      end
      def position_taken?(index)
          #board = ["X", " ", " ", " ", " ", " ", " ", " ", "O"]
          @board[index] != " "
        # if @board [index] == 'X' || 'O'
        # true
        # else
        # false
        # end
      end
      def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
          #board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
      end
      def turn
       puts "Enter a number for your turn!"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
        move(index, current_player)
        else 
        turn 
        end
        display_board
      end
    
      def won?
        WIN_COMBINATIONS.detect {|combination| (@board[combination[0]] == @board[combination[1]] && @board[combination[2]] == @board[combination[0]] && @board[combination[0]] != " ") }
        # WIN_COMBINATIONS.each do |combination|
        #   if (@board[combination[0]] == @board[combination[1]] && @board[combination[2]] == @board[combination[0]] && @board[combination[0]] != " ") 
        #   return combination
        #   end
        #   end
        #   nil
      end
      
        def full?
          @board.all?{|square| square != " " }
        end

        def draw? 
          full? && !won?
        end

        def over?
          if draw? || won?
          true
          else false
          end
        end

        def winner
          !won? ? nil : @board[won?[0]]
        end
      


        def play
          display_board
          until over? do 
            turn
          end
          puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
        end
 

    end
