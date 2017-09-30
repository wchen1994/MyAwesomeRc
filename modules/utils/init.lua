utils = {}

function execute_return_stdout(arg)
	os.execute(arg .. ' > tmp')
	file = io.open('tmp', 'r')
	stdout = {}
	out = file:read()
	while out
	do
		table.insert(stdout, out)
		out = file:read()
	end
	file:close()
	return stdout
end

return utils
