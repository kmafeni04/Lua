local function game()
	local number_of_guesses = 1
	local correct_ans = math.random(10) -- sets the number to guess to a random number

	print("Guess the number")

	repeat
		local ans_input = io.read() -- collects user input
		local ans = tonumber(ans_input)
		if type(ans) ~= "number" then -- checks if answer is a number
			print("This is not a number, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans > correct_ans then -- checks if answer is greater than the correct answer
			print("Your answer is greater than, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans < correct_ans then -- checks if answer is less than the correct answer
			print("Your answer is less than, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans == correct_ans then -- if answer is correct, print the total number of attempts and that the answer is correct
			print("Your answer is correct")
			print("It took you " .. number_of_guesses .. " attempt(s)")
		end
	until ans == correct_ans

	print("Do you want to play again? (yes or no)")
	local response = io.read()
	response = response.lower(response) -- converts response to all lowercase

	if response == "yes" or response == "y" then -- Restarts the function or exits
		game()
	else
		os.exit()
	end
end

game()
