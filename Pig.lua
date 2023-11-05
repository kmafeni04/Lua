local player_score1 = 0
local player_turn_score1 = 0
local player_score2 = 0
local player_turn_score2 = 0
local final_score = 30
local turn = true

local function player1()
	local dice = math.random(1, 6)
	print("Are you ready to roll Player 1 [Y/N]")
	local user_input = io.read()
	user_input = string.lower(user_input)
	print()
	if user_input == "y" then
		if turn == true and dice ~= 1 then
			player_turn_score1 = player_turn_score1 + dice
			print("Player 1 rolled " .. dice)
			print("Player 1's turn score is " .. player_turn_score1 .. "\n")
			print("Do you wish to roll again?  [Y/N]")
			user_input = io.read()
			print()
			user_input = string.lower(user_input)
			if user_input == "y" then
			elseif user_input == "n" then
				player_score1 = player_score1 + player_turn_score1
				print("Player 1's total score is " .. player_score1 .. "\n")
				turn = false
			end
		elseif turn == true and dice == 1 then
			player_turn_score1 = 0
							player_score1 = player_score1 + player_turn_score1
			print("Oops, you rolled a 1, score reset")
			print("Player 1's turn score is " .. player_turn_score1)
			print("Player 1's total score is " .. player_score1 .. "\n")
			turn = false
		end
	elseif user_input == "n" then
		turn = false
	end
end

local function player2()
	local dice = math.random(1, 6)
	print("Are you ready to roll Player 2 [Y/N]")
	local user_input = io.read()
	user_input = string.lower(user_input)
	print()
	if user_input == "y" then
		if turn == false and dice ~= 1 then
			player_turn_score2 = player_turn_score2 + dice
			print("Player 2 rolled " .. dice)
			print("Player 2's turn score is " .. player_turn_score2 .. "\n")
			print("Do you wish to roll again?  [Y/N]")
			user_input = io.read()
			print()
			user_input = string.lower(user_input)
			if user_input == "y" then
			elseif user_input == "n" then
				player_score2 = player_score2 + player_turn_score2
				print("Player 2's total score is " .. player_score2 .. "\n")
				turn = true
			end
		elseif turn == false and dice == 1 then
			player_turn_score2 = 0
			player_score2 = player_score2 + player_turn_score2
			print("Oops, you rolled a 1, score reset")
			print("Player 2's turn score is " .. player_turn_score2)
			print("Player 2's total score is " .. player_score2 .. "\n")
			turn = true
		end
	elseif user_input == "n" then
		turn = true
	end
end

local function pig()
	if turn == true then
		player1()
	else
		player2()
	end
end

repeat
	pig()
until player_score1 >= final_score or player_score2 >= final_score

print("Player 1's final score was " .. player_score1)
print("Player 2's final score was " .. player_score2)
if player_score1 > player_score2 then
	print("Player 2 is a pig")
else
	print("Player 1 is a pig")
end
