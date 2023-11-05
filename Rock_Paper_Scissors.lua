local function rock_paper_scissors()
	local objects = { "rock", "paper", "scissors" }
	local total_wins = 0
	local user_wins = 0
	local computer_wins = 0

	print("Rock, paper or scissors, best of 5: \n")
	repeat
		local computer_choice = objects[math.random(3)]
		print("Rock, paper or scissors?")
		local user_choice = io.read()
		user_choice = user_choice.lower(user_choice)
		print()
		print("Computer chose " .. computer_choice)

		if user_choice ~= objects[1] and user_choice ~= objects[2] and user_choice ~= objects[3] then
			print("That's not a valid option \n")
		elseif computer_choice == user_choice then
			print("It's a draw \n")
		elseif computer_choice == "rock" and user_choice == "paper" then
			print("You won \n")
			user_wins = user_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		elseif computer_choice == "paper" and user_choice == "scissors" then
			print("You won \n")
			user_wins = user_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		elseif computer_choice == "scissors" and user_choice == "rock" then
			print("You won \n")
			user_wins = user_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		elseif computer_choice == "rock" and user_choice == "scissors" then
			print("You lost \n")
			computer_wins = computer_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		elseif computer_choice == "paper" and user_choice == "rock" then
			print("You lost \n")
			computer_wins = computer_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		elseif computer_choice == "scissors" and user_choice == "paper" then
			print("You lost \n")
			computer_wins = computer_wins + 1
			print("Current score is, Computer Score: " .. computer_wins .. " " .. "User Score: " .. user_wins .. "\n")
		end
		total_wins = user_wins + computer_wins
	until total_wins == 5 or user_wins >= 3 or computer_wins >= 3
	print("You won " .. user_wins .. " time(s)")
	print("Computer won " .. computer_wins .. " time(s)")
end

rock_paper_scissors()
