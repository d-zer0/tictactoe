def play
	until game_over


def game_over
	until Grid.marks.all? = " "
		game_over = false
	end
end

class Grid

	@@vertical		= "       |     |    "
	#          	           X  |  O  |  X
	@@horizontal	= "  _____|_____|_____"

	@@marks = {
		"a1" => " ", 	"a2" => " ", 	"a3" => " ",	# rop row
		"b1" => " ", 	"b2" => " ", 	"b3" => " ",	# middle row
		"c1" => " ", 	"c2" => " ", 	"c3" => " "		# bottom row
	}

	def show
		puts "    1     2     3  "
		puts @@vertical
		puts "A   #{@@marks["a1"]}  |  #{@@marks["a2"]}  |  #{@@marks["a3"]}  "
		puts @@horizontal
		puts @@vertical
		puts "B   #{@@marks["b1"]}  |  #{@@marks["b2"]}  |  #{@@marks["b3"]}  "
		puts @@horizontal
		puts @@vertical
		puts "C   #{@@marks["c1"]}  |  #{@@marks["c2"]}  |  #{@@marks["c3"]}  "
		puts @@vertical
	end

	def mark
		player_one = true

		puts "Which cell?"
		choice = gets.chomp.downcase

		if player_one
			@@marks[choice] = "O"
		elsif player_two
			@@marks[choice] = "X"
		end
	end

end

my_grid = Grid.new
my_grid.show
my_grid.mark
my_grid.show