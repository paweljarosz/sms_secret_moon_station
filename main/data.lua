local M = {}

M.show = hash("show")
M.hide = hash("hide")
M.trigger = hash("trigger_response")
M.contact = hash("contact_point_response")
M.left = hash("left")
M.right = hash("right")
M.action = hash("action")
M.hazard = hash("hazard")

M.SKIN = 1

M.WM = false

M.MAX_LIVES = 9

M.FIRST_LEVEL = 2

M.unlocked_level = {}
M.unlocked_level[1] = true
M.unlocked_level[2] = false
M.unlocked_level[3] = false
M.unlocked_level[4] = false
M.unlocked_level[5] = false

M.level = 1
M.lives = M.MAX_LIVES

M.STATE_MENU = 1
M.STATE_CONTENT = 2
M.STATE_GETREADY  = 3
M.STATE_PLAYING = 4
M.STATE_LEVELCLEAR = 5
M.STATE_GAMEOVER = 6
M.STATE_COMPLETE = 7
M.STATE_DEATH = 8

M.state = M.STATE_MENU

M.TILE_SIZE = 16
M.PIXEL_SIZE = 4

M.ICE = false
M.FIRE = false
M.GEM_DETECT = false

M.totalgems = 0
M.gems = 0

M.keys = 0 

M.offset = vmath.vector3(1280/(M.PIXEL_SIZE * 2), 720/(M.PIXEL_SIZE * 2), 0)
M.playerpos = vmath.vector3(0,0,0)
M.spawnpos = vmath.vector3(0,0,0)
M.camera_speed = 1

function M.world2tile(p)
	return vmath.vector3(math.floor((p.x + M.TILE_SIZE) / M.TILE_SIZE), math.floor((p.y + M.TILE_SIZE) / M.TILE_SIZE), p.z)
end

function M.tile2world(p)
	return vmath.vector3((p.x * M.TILE_SIZE) - (M.TILE_SIZE / 2), (p.y * M.TILE_SIZE) - (M.TILE_SIZE / 2), p.z)
end

function M.dist(x1, y1, x2, y2)
	return ((x2-x1)^2+(y2-y1)^2)^0.5
end

return M