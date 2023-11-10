local turn = true
local positions = { " ", " ", " ", " ", " ", " ", " ", " ", " " }
local x_won = false
local o_won = false
local moves = 0
local draw = false
local in_game = true

local function print_board()
	print("      1     2     3\n")
	print("1  |  " .. positions[1] .. "  |  " .. positions[2] .. "  |  " .. positions[3] .. "  |  3")
	print("   -------------------")
	print("4  |  " .. positions[4] .. "  |  " .. positions[5] .. "  |  " .. positions[6] .. "  |  6")
	print("   -------------------")
	print("7  |  " .. positions[7] .. "  |  " .. positions[8] .. "  |  " .. positions[9] .. "  |  9\n")
	print("      7     8     9\n")
end

print("A game of Tic Tac Toe\n")

print_board()

print("Single or two player? [1/2]")
local single_or_two = io.read()
print()
single_or_two = tonumber(single_or_two)

local function tic_tac_toe()
	if single_or_two == 1 then
		if turn == true then
			print("X's turn")
			print("Pick a position from 1-9 \n")
			local user_input = io.read()
			user_input = tonumber(user_input)
			for options = 1, #positions, 1 do
				if user_input == options and positions[options] == " " then
					positions[options] = "X"
					moves = moves + 1
					turn = false
					print_board()
					print("O's turn\n")
				elseif user_input == options and positions[options] ~= " " then
					print("That position is already taken, pick again\n")
				end
			end
			if type(user_input) ~= "number" then
				print("That's an invalid input\n")
			end
		elseif turn == false then
			local computer_choice = math.random(1, #positions)
			os.execute("sleep 1")
			for options = 1, #positions do
				if computer_choice == options and positions[options] == " " then
					positions[options] = "O"
					moves = moves + 1
					turn = true
					print_board()
				end
			end
		end
	elseif single_or_two == 2 then
		if turn == true then
			print("X's turn")
			print("Pick a position from 1-9 \n")
			local user_input = io.read()
			user_input = tonumber(user_input)
			for options = 1, #positions, 1 do
				if user_input == options and positions[options] == " " then
					positions[options] = "X"
					moves = moves + 1
					print_board()

					turn = false
				elseif user_input == options and positions[options] ~= " " then
					print("That position is already taken, pick again\n")
				end
			end
			if type(user_input) ~= "number" then
				print("That's an invalid input\n")
			end
		elseif turn == false then
			print("O's turn")
			print("Pick a position from 1-9 \n")
			local user_input = io.read()
			user_input = tonumber(user_input)
			for options = 1, #positions, 1 do
				if user_input == options and positions[options] == " " then
					positions[options] = "O"
					moves = moves + 1
					print_board()

					turn = true
				elseif user_input == options and positions[options] ~= " " then
					print("That position is already taken, pick again\n")
				end
			end
			if type(user_input) ~= "number" then
				print("That's an invalid input\n")
			end
		end
	end

	if
		(positions[1] == "X" and positions[2] == "X" and positions[3] == "X")
		or (positions[4] == "X" and positions[5] == "X" and positions[6] == "X")
		or (positions[7] == "X" and positions[8] == "X" and positions[9] == "X")
		or (positions[1] == "X" and positions[4] == "X" and positions[7] == "X")
		or (positions[2] == "X" and positions[5] == "X" and positions[8] == "X")
		or (positions[3] == "X" and positions[6] == "X" and positions[9] == "X")
		or (positions[1] == "X" and positions[5] == "X" and positions[9] == "X")
		or (positions[3] == "X" and positions[5] == "X" and positions[7] == "X")
	then
		x_won = true
		print("X wins\n")
	elseif
		(positions[1] == "O" and positions[2] == "O" and positions[3] == "O")
		or (positions[4] == "O" and positions[5] == "O" and positions[6] == "O")
		or (positions[7] == "O" and positions[8] == "O" and positions[9] == "O")
		or (positions[1] == "O" and positions[4] == "O" and positions[7] == "O")
		or (positions[2] == "O" and positions[5] == "O" and positions[8] == "O")
		or (positions[3] == "O" and positions[6] == "O" and positions[9] == "O")
		or (positions[1] == "O" and positions[5] == "O" and positions[9] == "O")
		or (positions[3] == "O" and positions[5] == "O" and positions[7] == "O")
	then
		o_won = true
		print("O wins\n")
	elseif moves == #positions and x_won ~= true and o_won ~= true then
		draw = true
		print("It's a draw\n")
	end
end

local function game()
	repeat
		tic_tac_toe()
	until x_won == true or o_won == true or draw == true
end

game()

repeat
	print("Do you want to play again? [Y/N]")
	local user_input = io.read()
	print()
	user_input = string.lower(user_input)
	if user_input == "y" then
		print("Single or two player? [1/2]")
		single_or_two = io.read()
		print()
		single_or_two = tonumber(single_or_two)
		turn = true
		positions = { " ", " ", " ", " ", " ", " ", " ", " ", " " }
		x_won = false
		o_won = false
		moves = 0
		draw = false

		print("A game of Tic Tac Toe\n")

		print_board()

		game()
	elseif user_input == "n" then
		print("Game Over")
		in_game = false
	else
		print("That isn't a valid response\n")
	end
until in_game == false
