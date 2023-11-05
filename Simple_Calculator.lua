print("A simple calculator\n")
print("Input number")
local num1 = tonumber(io.read())
print("What modifier do wish to use [/,*,-,+,^]")
local possible_modifiers = { "/", "*", "-", "+", "^" }
local modifier = io.read()
print("Input number")
local num2 = tonumber(io.read())
print()
local result = 0
local done = false

local function calculator()
	for options = 1, #possible_modifiers do
		if modifier == "/" then
			result = num1 / num2
		elseif modifier == "*" then
			result = num1 * num2
		elseif modifier == "-" then
			result = num1 - num2
		elseif modifier == "+" then
			result = num1 + num2
		elseif modifier == "^" then
			result = num1 ^ num2
		elseif modifier ~= possible_modifiers[options] then
			print("That's an invalid modifier")
			os.exit()
		end
	end

	print(num1 .. " " .. modifier .. " " .. num2 .. " = " .. result .. "\n")
end

calculator()

repeat
	print("Do you wish to calculate again? [Y/N]")
	local user_input = io.read()
	user_input = user_input:lower()
	print()
	if user_input == "y" then
		print("Do you wish to calculate using the current result [Y/N]")
		user_input = io.read()
		user_input = user_input:lower()
		print()
		if user_input == "y" then
			num1 = result
			print("What modifier do wish to use [/,*,-,+,^]")
			possible_modifiers = { "/", "*", "-", "+", "^" }
			modifier = io.read()
			print("Input number")
			num2 = tonumber(io.read())
			calculator()
		elseif user_input == "n" then
			print("Input number")
			num1 = tonumber(io.read())
			print("What modifier do wish to use [/,*,-,+,^]")
			possible_modifiers = { "/", "*", "-", "+", "^" }
			modifier = io.read()
			print("Input number")
			num2 = tonumber(io.read())
			result = 0
			calculator()
		end
	elseif user_input == "n" then
		done = true
	end
until done == true
