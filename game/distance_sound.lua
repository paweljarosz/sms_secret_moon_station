local M = {}

local data = require ("main.data")

local sounds_locked = {}

function M.play(sound_name, on)
	if on then -- and not sounds_locked[sound_name] then
		local pos = data.world2tile(data.playerpos)
		local pos2 = data.world2tile(go.get_position())
		local gain = 1.2 - (data.dist(pos.x, pos.y, pos2.x, pos2.y) / 5)
		if gain < 0.1 then gain = 0 end
		if (sounds_locked[sound_name] and (gain > sounds_locked[sound_name]))
		or not sounds_locked[sound_name] then
			sounds_locked[sound_name] = gain
			sound.play("main:/sound#"..sound_name, {gain = gain}, function()
				sounds_locked[sound_name] = false
			end)
		end
		
	elseif not on and sounds_locked[sound_name] then
		sound.stop("main:/sound#"..sound_name)
		sounds_locked[sound_name] = false
	end
end

return M