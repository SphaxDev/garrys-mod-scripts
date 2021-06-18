local ServerAutoRestart = {} -- DO NOT TOUCH


-- You can edit here now (true means yes, false means no)

local ServerAutoRestart_Enable = true
local ServerAutoRestart_EnableCommand = true -- [Recommended] Add a console command => "restartserver" that can be only run by superadmin and will restart server
local ServerAutoRestart_Time = "05:00" -- at what hour it will restart (use 24h format so 04:00 AM will be 04:00 and 04:00 PM will be 12h+4 = 16:00 PM)
-- Warning, the server will restart 1 min. after the actual time to say that the server will restart. If you WANT it to restart a 4:00 just put 3:59

local ServerAutoRestart_AdvertBefore = true
local ServerAutoRestart_AdvertTime = "03:45" -- Put when you want to advert that there will be a restart
local ServerAutoRestart_AdvertMsg = "SphaxRestart | The server will restart in 15 minutes."

local ServerAutoRestart_AdvertBefore2 = true
local ServerAutoRestart_AdvertTime2 = "03:50" -- Put when you want to advert that there will be a restart
local ServerAutoRestart_AdvertMsg2 = "SphaxRestart | The server will restart in 10 minutes."

local ServerAutoRestart_AdvertBefore3 = true
local ServerAutoRestart_AdvertTime3 = "03:55" -- Put when you want to advert that there will be a restart
local ServerAutoRestart_AdvertMsg3 = "SphaxRestart | The server will restart in 5 minutes."

local ServerAutoRestart_AdvertBefore4 = false
local ServerAutoRestart_AdvertTime4 = "HH:MM" -- Put when you want to advert that there will be a restart
local ServerAutoRestart_AdvertMsg4 = "SphaxRestart | The server will restart in X minutes."

local ServerAutoRestart_AdvertBefore5 = false
local ServerAutoRestart_AdvertTime5 = "HH:MM" -- Put when you want to advert that there will be a restart
local ServerAutoRestart_AdvertMsg5 = "The server will restart in X minutes."

local ServerAutoRestart_LangMin = "Der Server startet in einer Minute neu! !"
local ServerAutoRestart_LangSecs = "The server will restart in %s seconds !" -- %s will be seconds here, do not edit it
local ServerAutoRestart_LangSec = "The server will restart in 1 second !"
local ServerAutoRestart_LangRes = "Server startet neu."



--[[--------------------------
	   Code (don't touch)
--------------------------]]--


function ServerAutoRestartFunc()
	if ServerAutoRestart_Enable then
	if ServerAutoRestart_AdvertBefore then
		if os.date( "%H:%M" ) == ServerAutoRestart_AdvertTime then
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_AdvertMsg )
		end
	end
	if ServerAutoRestart_AdvertBefore2 then
		if os.date( "%H:%M" ) == ServerAutoRestart_AdvertTime2 then
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_AdvertMsg2 )
		end
	end
	if ServerAutoRestart_AdvertBefore3 then
		if os.date( "%H:%M" ) == ServerAutoRestart_AdvertTime3 then
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_AdvertMsg3 )
		end
	end
	if ServerAutoRestart_AdvertBefore4 then
		if os.date( "%H:%M" ) == ServerAutoRestart_AdvertTime4 then
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_AdvertMsg4 )
		end
	end
	if ServerAutoRestart_AdvertBefore5 then
		if os.date( "%H:%M" ) == ServerAutoRestart_AdvertTime5 then
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_AdvertMsg5 )
		end
	end
	--if os.date( "%I:%M %p" ) == "3:00 AM" then
	if os.date( "%H:%M" ) == ServerAutoRestart_Time then -- I don't use AM/PM so let's use this :D
		PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangMin )
		timer.Simple( 30, function()
			string.Format("%s", "30")
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
			timer.Simple( 15, function()
				string.Format("%s", "15")
				PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
				timer.Simple( 5, function()
					string.Format("%s", "10")
					PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
					timer.Simple( 1, function()
						string.Format("%s", "9")
						PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
						timer.Simple( 1, function()
							string.Format("%s", "8")
							PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
							timer.Simple( 1, function()
								string.Format("%s", "7")
								PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
								timer.Simple( 1, function()
									string.Format("%s", "6")
									PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
									timer.Simple( 1, function()
										string.Format("%s", "5")
										PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
										timer.Simple( 1, function()
											string.Format("%s", "4")
											PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
											timer.Simple( 1, function()
												string.Format("%s", "3")
												PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
												timer.Simple( 1, function()
													string.Format("%s", "2")
													PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSecs )
													timer.Simple( 1, function()
														PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangSec )
														timer.Simple( 1, function()
															PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangRes )
															timer.Simple( 0.5, function() -- I know it does not restart at 1min but 1min00,5s but they need to read that server is restarting :) you can edit timer to 0.1 if you want
																RunConsoleCommand("map ", game.GetMap()) -- Reload the same map
															end)
														end)
													end)
												end)
											end)
										end)
									end)
								end)
							end)
						end)
					end)
				end)
			end)
		end)
	end
	end
end
timer.Create( "ServerAutoRestartTimer", 60, 0, ServerAutoRestartFunc ) -- Checks every minute to restart
if ServerAutoRestart_EnableCommand then
	concommand.Add( "restartserver", function( ply, cmd, args )
		if ply:IsSuperAdmin() then
				if 
			PrintMessage( HUD_PRINTTALK, ServerAutoRestart_LangRes )
			timer.Simple( 0.5, function()
				RunConsoleCommand("map ", game.GetMap()) -- Reload the same map
			end)
		end
	end)
end
