local total_answers = 0
local correctly_ans = 0
local name
local is_playing

print("Do you want to play?")
is_playing = io.read()
is_playing = is_playing.lower(is_playing)
print()

if is_playing ~= "yes" and is_playing ~= "y" then
	os.exit()
end

repeat
	print("What is your name?")
	name = io.read()
until name ~= ""
print()

local function quiz()
	print("What is the biggest mammal in the world?")
	local ans = io.read()
	ans = ans.lower(ans)

	if ans ~= "whale" then
		print("This answer is wrong")
	elseif ans == "whale" then
		print()
		correctly_ans = correctly_ans + 1
	end
	total_answers = total_answers + 1

	print("What is the biggest land mammal in the world?")
	local ans = io.read()
	ans = ans.lower(ans)

	if ans ~= "elephant" then
		print("This answer is wrong")
	elseif ans == "elephant" then
		print()
		correctly_ans = correctly_ans + 1
	end
	total_answers = total_answers + 1
end

local function sum(num1, num2)
	repeat
		print("What is " .. num1 .. " + " .. num2 .. "?")
		local ans = io.read()
		local right_ans = num1 + num2
		if ans == "" then
			print("Answer the question")
			print()
		elseif tonumber(ans) == right_ans then
			print()
			correctly_ans = correctly_ans + 1
		elseif tonumber(ans) ~= right_ans then
			print("This answer is wrong")
			print()
		end
		total_answers = total_answers + 1
	until ans ~= ""
end

quiz()
sum(2, 5)
sum(2, 10)
sum(2, 15)
sum(4, 5)
sum(8, 5)
sum(20, 5)

print("Hello " .. name .. " you answered " .. correctly_ans .. "/" .. total_answers .. " questions correctly")
print("Your grade is " .. correctly_ans / total_answers * 100 .. "%")
