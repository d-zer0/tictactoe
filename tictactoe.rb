class Game

	class Player
		
		def initialize (name)
			@name = name
		end
		
	end

	class Grid
		def initialize
			@@grid = {
				top_left: "_____|", top_mid: "_____", top_right: "|_____",
				mid_left: "_____|", mid_mid: "_____", mid_right: "|_____",
				btm_left: "     |", btm_mid: "     ", btm_right: "|     "
			}
			
			@@marks = {
				top_left: "     |", top_mid: "     ", top_right: "|     ",
				mid_left: "     |", mid_mid: "     ", mid_right: "|     ",
				btm_left: "     |", btm_mid: "     ", btm_right: "|     "
			}
		end

		def show
			vertical	= "     |     |    "
			horizontal	= "_____|_____|_____"
			
			grid_arr = @@grid.values.to_a
				grid_top = grid_arr[0..2].join
				grid_mid = grid_arr[3..5].join
				grid_btm = grid_arr[6..8].join
			
			marks_arr = @@marks.values.to_a
				marks_top = marks_arr[0..2].join
				marks_mid = marks_arr[3..5].join
				marks_btm = marks_arr[6..8].join
			
			@@marks = {
				top_left: "     |", top_mid: "     ", top_right: "|     ",
				mid_left: "     |", mid_mid: "     ", mid_right: "|     ",
				btm_left: "     |", btm_mid: "     ", btm_right: "|     "
			}


			puts vertical
			puts "  #{@@marks[top_left]}  |  #{@@marks[top_mid]}  |  #{@@marks[top_left]}  "
			puts horizontal
			puts vertical
			puts "  #{@@marks[mid_left]}  |  #{@@marks[mid_mid]}  |  #{@@marks[mid_left]}  "
			puts horizontal
			puts vertical
			puts "  #{@@marks[btm_left]}  |  #{@@marks[btm_mid]}  |  #{@@marks[btm_left]}  "
			puts horizontal
		end
	end
end

my_grid = Game::Grid.new
my_grid.show