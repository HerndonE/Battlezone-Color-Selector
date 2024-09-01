assert(load(assert(LoadFile("_requirefix.lua")),"_requirefix.lua"))();
local M = {
	red = 0;
	green = 0;
	blue = 0;	
	Min = 0.0;
	Max = 255.0;
}
local color_groups = {{black = GetVarItemInt("network.session.ivar100"), color_value = {11,11,11}}, 
					  {white = GetVarItemInt("network.session.ivar101"), color_value = {255,255,255}},
					  {green = GetVarItemInt("network.session.ivar102"), color_value = {80,223,32}},
					  {red = GetVarItemInt("network.session.ivar103"), color_value = {255,0,0}},
					  {blue = GetVarItemInt("network.session.ivar104"), color_value = {0,0,255}},
					  {yellow = GetVarItemInt("network.session.ivar105"), color_value = {255, 255, 0}},
					  {purple = GetVarItemInt("network.session.ivar106"), color_value = {128, 0, 255}},
					  {pink = GetVarItemInt("network.session.ivar107"), color_value = {255, 0, 255}},
					  {orange = GetVarItemInt("network.session.ivar108"), color_value = {255, 191, 0}},
					  {brown = GetVarItemInt("network.session.ivar109"), color_value = {102, 51, 0}},
					  {gray = GetVarItemInt("network.session.ivar110"), color_value = {128, 128, 128}}}
local color_names = {"black", "white", "green", "red", "blue", "yellow", "purple", "pink", "orange",
					"brown", "gray"}
					
function random_color_selection()
	-- Human Team RGB Color Selector Slider
	M.red = GetVarItemInt("network.session.ivar111");
	M.green = GetVarItemInt("network.session.ivar112");
	M.blue = GetVarItemInt("network.session.ivar113");
	if (M.red > 0 and M.green > 0 and M.blue > 0)  then
		for i= 4, 1, -1 
			do 
				SetTeamColor(i, M.red, M.green, M.blue);
			end
		print("Player Team Custom RGB: r =" .. M.red .." g =".. M.green .." b =".. M.blue)
	end
	-- Computer Team 6 RGB Color Selector Slider
	M.red = GetVarItemInt("network.session.ivar114");
	M.green = GetVarItemInt("network.session.ivar115");
	M.blue = GetVarItemInt("network.session.ivar116");
	if (M.red > 0 and M.green > 0 and M.blue > 0)  then
		SetTeamColor(6, M.red, M.green, M.blue);
		print("Computer Team Custom RGB: r =" .. M.red .." g =".. M.green .." b =".. M.blue)
	end
	
	-- Random Human Team/Computer Team Color
	M.red = GetRandomFloat(M.Min, M.Max) ;
	M.green = GetRandomFloat(M.Min, M.Max) ;
	M.blue = GetRandomFloat(M.Min, M.Max) ;
	if GetVarItemInt("network.session.ivar118") == 1 then
		print("Random Human Team Color is: r =" .. M.red .." g =".. M.green .." b =".. M.blue)
		for i= 4, 1, -1 
			do 
				SetTeamColor(i, SetVector(M.red, M.green, M.blue));
			end
	end

	if GetVarItemInt("network.session.ivar118") == 2 then
		print("Random Computer Team Color is: r =" .. M.red .." g =".. M.green .." b =".. M.blue)
		SetTeamColor(6, SetVector(M.red, M.green, M.blue));
	end
	
end

function M.team_color()
	random_color_selection()
	
	for _, item in pairs(color_groups) do
		for key, value in pairs(item) do
				local color_string = table.concat(item.color_value, ", ")
				local table_string = "{" .. color_string .. "}"
				local table_object = load("return " .. table_string)()
				if key == color_names[_] and value == 1 then -- Human Team Color
					print("Human Team Color is " .. color_names[_] .. ": r = " .. table_object[1] .. " g = " .. table_object[2]
					.. " b = " .. table_object[3])
					for i= 4, 1, -1 
						do 
							SetTeamColor(i, SetVector(table_object[1],table_object[2],table_object[3]));
						end
				end
				
				if key == color_names[_] and value == 2 then -- Computer Team Color
					print("Computer Team Color is " .. color_names[_] .. ": r = " .. table_object[1] .. " g = " .. table_object[2]
					.. " b = " .. table_object[3])
					SetTeamColor(6, SetVector(table_object[1],table_object[2],table_object[3]));
				end
			end
		end
	end
	
function M.rgb_animation(ColorChange)	
	if (ColorChange >= SecondsToTurns(1)) then --- Change color every second
		ColorChange = 0;
		M.red = GetRandomFloat(M.Min, M.Max) ;
		M.green = GetRandomFloat(M.Min, M.Max) ;
		M.blue = GetRandomFloat(M.Min, M.Max) ;
	end
	
	if GetVarItemInt("network.session.ivar117") == 1 then
	 for i= 4, 1, -1 
		do 
			SetTeamColor(i, SetVector(M.red, M.green, M.blue));
		end
	end
	
	if GetVarItemInt("network.session.ivar117") == 2 then
	 SetTeamColor(6, SetVector(M.red, M.green, M.blue));
	end
end

return M