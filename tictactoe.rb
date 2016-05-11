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

		def new_game
			game = Tictactoe::Game.new
			game.play_game
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
					mark_grid
					turn_swap
				end
			end
			puts
			puts "Play again? (y/n)"
			answer = gets.chomp.downcase
			if answer == "y"
				new_game
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
			puts "- #{@player_one.name} VS. #{@player_two.name} -"
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

		def mark_grid
			puts
			puts "#{@active_player.name.upcase}'s TURN"
			print "Choose a cell: "
			choice = gets.chomp.downcase
			if @@marks[choice] != " "
				puts
				puts "Already occupied! Choose an empty cell."
				mark_grid
			elsif choice == "all"
				@@marks["a1"] = "O"
				@@marks["a2"] = "O"
				@@marks["a3"] = "O"
				@@marks["b1"] = "O"
				@@marks["b2"] = "O"
				@@marks["b3"] = "O"
				@@marks["c1"] = "O"
				@@marks["c2"] = "O"
				@@marks["c3"] = "O"
			else
				@@marks[choice] = @active_player.mark
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