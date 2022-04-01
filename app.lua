local pomo = require "pomo"

local remain_active = true;

local function listener()
	io.write('\n=====\nPomo Pomo Pomo!\n=====\n\n')
	io.write('(s)tart a timer\n')
	io.write('(q)uit the program\n')
	io.write('\n* ')
	local external_input = io.read()
	return external_input
end

local function clear_screen()
	os.execute("clear") -- FIXME: this won't work across systems, I don't think
end

local function process_input(input)
	input = string.lower(input)
	if (input == 's' or input == 'p' or input == 'start' or input == 'pomo') then
		pomo()
	elseif (input == 'quit' or input == 'q' or input == 'exit') then
		remain_active = false
	else
		io.write('\nUnknown input, ' .. input .. '"\n')
	end
end

while (remain_active) do
	local person_input = listener()
	clear_screen()
	process_input(person_input)
end