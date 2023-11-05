local password_length_multiplier = 4
local ran = 0
local password = ""
local special_characters = { "@", "#", "$", "%", "&", "*" }
local letters = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
}

repeat
	password = password
		.. letters[math.random(1, #letters)]
		.. special_characters[math.random(1, #special_characters)]
		.. math.random(1, 9)
		.. string.lower(letters[math.random(1, #letters)])
	ran = ran + 1
until ran == password_length_multiplier

print("Your generated password is: " .. password)
print("The password is ".. string.len(password) .. " characters long")
