do
	if game:GetService("CoreGui"):FindFirstChild("Krnl Hub") then
		game:GetService("CoreGui"):FindFirstChild("Krnl Hub"):Destroy()
	end

	_G.kHubLoaded = {true,false,true};
	if _G.kHubESPs and typeof(_G.kHubESPs) == 'table' then
		for a,b in next, _G.kHubESPs.names do
			pcall(function()
				b.Visible = false
				b:Remove()
			end)
		end
		for a,b in next, _G.kHubESPs.boxes do
			pcall(function()
				for _,__ in next, b do
					pcall(function()
						__.Visible = false
						__:Remove()
					end)
				end
			end)
		end
		for a,b in next, _G.kHubESPs.tracers do
			pcall(function()
				b.Visible = false
				b:Remove()
			end)
		end
		_G.kHubESPs.tracers = {}
		pcall(function()
			_G.kHubESPs.connection:Disconnect()
		end)
		pcall(function()
			for a,b in next, _G.kHubESPs.ui_connection do
				pcall(function()
					b:Disconnect()
				end)
			end
		end)
		pcall(function()
			_G.kHubESPs.connection2:Disconnect()
		end)
		pcall(function()
			_G.kHubESPs.fov_gui:Remove()
		end)
		pcall(function()
			_G.kHubESPs.chams:ClearAllChildren()
		end)
	end

	if debug then
		for i,v in next, debug do
			getgenv()[i] = b
		end
	end

	-- for a,b in next, getgenv() do
	-- 	table.insert({}, {tostring(a), tostring(b)})
	-- end

	-- while os.getenv or os.execute or rescan or addteleportscript do end

	-- while not (is_synapse_function or is_sirhurt_closure or issentinelclosure or is_protosmasher_closure or KRNL_LOADED) do end

	if not game.HttpGet then
		if HttpGet then
			game.HttpGet = HttpGet
		end
	end
	if not mousemoverel then
		if Input and Input.MoveMouse then
			getgenv().mousemoverel = Input.MoveMouse
		end
	end

	local library = {}
	loadstring(game:HttpGet('https://raw.githubusercontent.com/LaziestBoy/Krnl-Hub/master/Intro.lua', true))()

	local games = {
		['111958650'] = 'Arsenal';
		['1247975681'] = 'Big Paintball';
		['1318971886'] = 'Break In';
		['1348291821'] = 'Destroy The City';
		['1450737259'] = 'Egg Clicker';
		['2471084'] = 'Lumber Tycoon 2';
		['498490399'] = 'Mad City';
		['1335695570'] = 'Ninja Legends';
		['73885730'] = 'Prison Life';
		['151620849'] = 'Redwood Prison';
		['83858907'] = 'Speed Run 4';
		['791881410'] = 'Stands Online';
		['81762198'] = 'Vehicle Simulator';
		['833209132'] = 'Vesteria';
		['63955796'] = 'Zombie Rush';
	}

	local success,err = pcall(function()
		loadstring(
			game:HttpGet(
				string.format(
					'https://raw.githubusercontent.com/LaziestBoy/Krnl-Hub/master/Games/%s.lua', games[tostring(game.GameId)]
				),
				true
			)
		)()
	end)
	
	if not success then
		loadstring(game:HttpGet('https://gist.github.com/Bi-nz/ac41df5bd5dffb8a285e2751f1a69c95/raw',true))():Create()
	end
end