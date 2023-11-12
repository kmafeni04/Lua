local function game()
	local number_of_guesses = 1
	local correct_ans = math.random(10)

	print("Guess the number")

	repeat
		local ans_input = io.read()
		local ans = tonumber(ans_input)
		if type(ans) ~= "number" then
			print("This is not a number, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans > correct_ans then
			print("Your answer is greater than, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans < correct_ans then
			print("Your answer is less than, try again")
			number_of_guesses = number_of_guesses + 1
		elseif ans == correct_ans then
			print("Your answer is correct")
			print("It took you " .. number_of_guesses .. " attempt(s)")
		end
	until ans == correct_ans

	print("Do you want to play again? (yes or no)")
	local response = io.read()
	response = response.lower(response)

	if response == "yes" or response == "y" then
		game()
	else
		os.exit()
	end
end

game()
