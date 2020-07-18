splash = {}


function splash.load()
	splash.dt_temp = 0
end


function splash.draw()
	love.graphics.draw(imgs["title"], 0, (splash.dt_temp - 1) * 32 * scale, 0, scale, scale)
	love.graphics.setColor(fontcolor.r, fontcolor.g, fontcolor.b)

	-- Show after 2.5 seconds
	if splash.dt_temp == 2.5 then
		love.graphics.printf("Press Start", 0, 80 * scale, love.graphics.getWidth(), "center")
	end

	-- If previous game
	if game.score ~= 0 then
		local info = "Score:" .. game.score
		love.graphics.printf(info, 0, 96 * scale, 160 * scale, "center")
	end

	-- Reset the color
	love.graphics.setColor(255, 255, 255)
end


function splash.update(dt)
	-- Update dt_temp
	splash.dt_temp = splash.dt_temp + dt

	-- Wait 2.5 seconds, then stop in place.
	if splash.dt_temp > 2.5 then
		splash.dt_temp = 2.5
	end
end


function splash.keypressed(key)
	-- Change to game state, and init game
	state = "game"
	game.load()
end
