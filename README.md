# Battlezone Color Selector
Players in Battlezone Combat Commander now have the opportunity to select colors of their choosing before a multiplayer game.

## Overview
Since 1999, the default team color for Battlezone Combat Commander MPI (Multiplayer Instant) is red. The only other way is playing other modes like Deathmatch, Free For All, or by changing your preferences file. Beyond that, there was no another way for players to easily pick a team color. As of 2019, this deadlock of being red team color changed. Players in MPI (Multiplayer Instant) can easily select a color choice on the fly before a game starts.

## Getting Started

There are two ways you can use this color selector:

1. Clone this repository
    ```bash
    https://github.com/HerndonE/Battlezone-Color-Selector.git
    ```
Drag the **Battlezone Color Selector** folder into your Battlezone Combat Commander addon folder i.e.
**C:\Users\YourName\Documents\My Games\Battlezone Combat Commander\addon**. Then launch Battlezone and create
a muliplayer game. Once done, you want to select **MPI: CS: Chill**. In the options tab you can click the fourth page
to select your team colors.<br>     
2. Steam <br>
Additional maps that use this color selector feature is posted on the [Battlezone Combat Commander Steam Workshop](https://steamcommunity.com/app/624970/workshop/).

| <a href="Steam"/> <img src="https://img.shields.io/badge/STEAM WORKSHOP ITEM%20-%232B2F33.svg?&style=for-the-badge&logo=steam&ogoColor=white"/></a>  | <a href="Steam"/> <img src="https://img.shields.io/badge/STEAM STATISTICS%20-%232B2F33.svg?&style=for-the-badge&logo=steam&ogoColor=white"/></a> |
| ------------- |:-------------:|
| [F9bomber's Color Selector (Asset)](https://steamcommunity.com/sharedfiles/filedetails/?id=1851404655&searchtext=)|![](https://img.shields.io/steam/views/1851404655?logo=steam) ![](https://img.shields.io/steam/subscriptions/1851404655?logo=steam) ![](https://img.shields.io/steam/favorites/1851404655?logo=steam)![](https://img.shields.io/steam/downloads/1851404655?logo=steam)|
| [F9bomber's Color Selector (Config)](https://steamcommunity.com/sharedfiles/filedetails/?id=1851090665&searchtext=)|![](https://img.shields.io/steam/views/1851090665?logo=steam) ![](https://img.shields.io/steam/subscriptions/1851090665?logo=steam) ![](https://img.shields.io/steam/favorites/1851090665?logo=steam)![](https://img.shields.io/steam/downloads/1851090665?logo=steam)|

**Note**:
1. If no colors are selected will result in default red and blue.
2. Custom RGB values **MUST** be greater than 0.
3. No two teams can be the same color UNLESS you use the sliders.
4. Use the stock AIPs (Artificial Intelligence Planning).

## Organization
```
/*-------------------	Organization	-----------------------------*/
		
Declare rgb values for team 1 and team 2 

colorFunction() -- where player selects their color
start() -- start function ie first execution
{
initialize the game
call colorFunction
}

```
## Code Samples

```lua
-- Green Color
 
--[[
key terms: 
 1. ivar - an integer variable item. ivar 50-127 are free to use, they rest have been used in game.
 2. network.session.ivar# - a set of network-replicated integer variable items (for configuring various network session settings)
]]--

-- This will return the value of the specified string if we want green turned on.
if GetVarItemInt("network.session.ivar102") == 1 then 
     SetTeamColor(1, SetVector(80, 223, 32)); -- Now we team Color for the team 1 (player) of a Vector in rgb values
end

-- Team 6 color green on. In our cfg file, value(2) is set with ivar102 so it can talk
if GetVarItemInt("network.session.ivar102") == 2 then
     SetTeamColor(6, SetVector(80, 223, 32)); -- to our code.
end

-- Team color green off
if GetVarItemInt("network.session.ivar102") == 0 then
end  
```  

```
-- These integer values are declared in the Mission table/constructor set our rgb values at 0. The maps .inf file will set our min/max at 0 and 255 for the slider.
 int r = 0;
 int g = 0;
 int b = 0;
	

-- Team 1 RGB Color Selector--

Mission.r = GetVarItemInt("network.session.ivar111"); -- Set 'r value' to an ivar#
Mission.g = GetVarItemInt("network.session.ivar112");
Mission.b = GetVarItemInt("network.session.ivar113");
--[[ Once all values are greater than 0, the game will set team 1 (player) custom rgb selection. Once the game is loaded you can 
press "ctrl ~" to see that your rgb values are loaded.]]--
	if (Mission.r > 0 and Mission.g > 0 and Mission.b > 0)  then
		SetTeamColor(1, Mission.r, Mission.g, Mission.b);
		print("Player Custom RGB "..Mission.r .." "..Mission.g .." "..Mission.b);
	end											  
```
## Results
<p align="center">
  <img src="https://github.com/HerndonE/Battlezone-Color-Selector/blob/master/Visuals/ConfigurationScreen.jpg"/>
  <img src="https://github.com/HerndonE/Battlezone-Color-Selector/blob/master/Visuals/ColorGif.gif"/>
</p>
