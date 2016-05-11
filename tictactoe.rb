module Tictactoe

	class PlayerOne
		attr_accessor :name

		def initialize(name)
			@name = name
		end

		def name
			@name
		end

		def mark
			"X"
		end
	end

	class PlayerTwo < PlayerOne

		def mark
			"O"
		end
	end


	class Game
		
		def initialize(player_one, player_two)
			clear_grid
			@game_over = false
			@player_one = player_one
			@player_two = player_two
			@active_player = @player_one
			@waiting_player = @player_two
			play_game
		end

		def turn_swap
			@active_player, @waiting_player = @waiting_player, @active_player
		end

		def play_game
			until @game_over == true
				show_grid
				if @@marks.values.none? {|cell| cell == " "}
					puts "Game Over!"
					@game_over = true
				else
					take_turn
					check_for_victory
					turn_swap
				end
			end
			rematch
		end

		def rematch
			puts
			puts "Play again? (y/n)"
			answer = gets.chomp.downcase
			if answer == "y"
				initialize(@loser, @winner)
			else
				puts
				puts "Thanks for playing!"
			end
		end

		def clear_grid
			@@marks = {
				"a1" => " ", 	"a2" => " ", 	"a3" => " ",	# top row
				"b1" => " ", 	"b2" => " ", 	"b3" => " ",	# middle row
				"c1" => " ", 	"c2" => " ", 	"c3" => " "		# bottom row
			}
		end

		def show_grid
			vertical =		"       |     |    "
			# 					 X  |  O  |  X
			horizontal =	"  _____|_____|_____"

			system "cls"
			puts "[#{@player_one.mark}] #{@player_one.name} VS. #{@player_two.name} [#{@player_two.mark}]"
			puts
			puts "    1     2     3  "
			puts vertical
			puts "A   #{@@marks["a1"]}  |  #{@@marks["a2"]}  |  #{@@marks["a3"]}  "
			puts horizontal
			puts vertical
			puts "B   #{@@marks["b1"]}  |  #{@@marks["b2"]}  |  #{@@marks["b3"]}  "
			puts horizontal
			puts vertical
			puts "C   #{@@marks["c1"]}  |  #{@@marks["c2"]}  |  #{@@marks["c3"]}  "
			puts vertical
		end

		def take_turn
			puts
			puts "#{@active_player.name.upcase}'s TURN"
			print "Place your #{@active_player.mark}: "
			choice = gets.chomp.downcase
			if choice == "all"
				@@marks["a1"] = @active_player.mark
				@@marks["a2"] = @active_player.mark
				@@marks["a3"] = @active_player.mark
				@@marks["b1"] = @active_player.mark
				@@marks["b2"] = @active_player.mark
				@@marks["b3"] = @active_player.mark
				@@marks["c1"] = @active_player.mark
				@@marks["c2"] = @active_player.mark
				@@marks["c3"] = @active_player.mark
			elsif choice == "top"
				@@marks["a1"] = @active_player.mark
				@@marks["a2"] = @active_player.mark
				@@marks["a3"] = @active_player.mark
			elsif @@marks[choice] != " "
				puts
				puts "Invalid choice, choose an empty cell."
				take_turn
			else
				@@marks[choice] = @active_player.mark
			end
			show_grid
		end

		def check_for_victory
			victory = false

			# Horizontal victories
			if ((@@marks["a1"] == @active_player.mark) && (@@marks["a2"] == @active_player.mark) && (@@marks["a3"] == @active_player.mark))
				victory = true
			elsif
				((@@marks["b1"] == @active_player.mark) && (@@marks["b2"] == @active_player.mark) && (@@marks["b3"] == @active_player.mark)) 
				victory = true
			elsif
				((@@marks["c1"] == @active_player.mark) && (@@marks["c2"] == @active_player.mark) && (@@marks["c3"] == @active_player.mark)) 
				victory = true

			# Vertical victories
			elsif
				((@@marks["a1"] == @active_player.mark) && (@@marks["b1"] == @active_player.mark) && (@@marks["c1"] == @active_player.mark)) 
				victory = true
			elsif
				((@@marks["a2"] == @active_player.mark) && (@@marks["b2"] == @active_player.mark) && (@@marks["c2"] == @active_player.mark)) 
				victory = true
			elsif
				((@@marks["a3"] == @active_player.mark) && (@@marks["b3"] == @active_player.mark) && (@@marks["c3"] == @active_player.mark)) 
				victory = true

			# Diagonal victories
			elsif
				((@@marks["a1"] == @active_player.mark) && (@@marks["b2"] == @active_player.mark) && (@@marks["c3"] == @active_player.mark)) 
				victory = true
			elsif
				((@@marks["a3"] == @active_player.mark) && (@@marks["b2"] == @active_player.mark) && (@@marks["c1"] == @active_player.mark)) 
				victory = true
			end

			if victory
				puts
				puts "Game Over!"
				puts "Winner: #{@active_player.name}"
				@game_over = true
				@winner = @active_player
				@loser = @waiting_player
			end
		end
	end
	system "cls"
	puts "Welcome to Tictactoe!"
	puts
	puts "Player One, please enter your name:"
	name = gets.chomp.to_s
	player_one = Tictactoe::PlayerOne.new(name)
	system "cls"
	puts "Welcome to Tictactoe!"
	puts
	puts "Player Two, please enter your name:"
	name = gets.chomp.to_s
	player_two = Tictactoe::PlayerTwo.new(name)
	system "cls"
	game = Tictactoe::Game.new(player_one, player_two)
end