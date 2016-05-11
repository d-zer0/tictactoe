module Tictactoe

	class Game
		
		@game_over = false

			@@marks = {
				"a1" => " ", 	"a2" => " ", 	"a3" => " ",	# top row
				"b1" => " ", 	"b2" => " ", 	"b3" => " ",	# middle row
				"c1" => " ", 	"c2" => " ", 	"c3" => " "		# bottom row
			}

		def play_game
			until @game_over == true
				show_grid
				if @@marks.values.none? {|cell| cell == " "}
					puts "Game Over!"
					@game_over = true
				else
					mark_grid
				end
			end
		end

		def show_grid

			vertical =		"       |     |    "
			# 					 X  |  O  |  X
			horizontal =	"  _____|_____|_____"


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
			puts "Which cell?"
			choice = gets.chomp.downcase
			if choice == "all"
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
				@@marks[choice] = "O"
			end
		end
	end
end

game = Tictactoe::Game.new
game.play_game