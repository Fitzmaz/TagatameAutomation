local Table = {}

function Table.length(t)
	local count = 0
    for _ in pairs(t) do
        count = count + 1
    end
	return count
  end

function Table.toString(t)
	local s = {"{ "}
	local length = Table.length(t)
	for k, v in pairs(t) do
		if #s < length then
			s[#s+1] = k..": "..v..", "
		else
			s[#s+1] = k..": "..v
		end
	end
	s[#s+1] = " }"
	s = table.concat(s)
	return s
end

return Table