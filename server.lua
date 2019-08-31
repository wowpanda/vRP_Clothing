local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
MySQL = module("vrp_mysql", "MySQL")

vRP = Proxy.getInterface("vRP")

vRPclient = Tunnel.getInterface("vRP","vRP_Clothing")

MySQL.createCommand("vRP/table_costumization",[[
CREATE TABLE IF NOT EXISTS `vrp_costumization` (
  `user_id` varchar(255) NOT NULL,
  `dad` int(11) NOT NULL DEFAULT '0',
  `mum` int(11) NOT NULL DEFAULT '0',
  `dadmumpercent` int(11) NOT NULL DEFAULT '0',
  `skinton` int(11) NOT NULL DEFAULT '0',
  `eyecolor` int(11) NOT NULL DEFAULT '0',
  `acne` int(11) NOT NULL DEFAULT '0',
  `skinproblem` int(11) NOT NULL DEFAULT '0',
  `freckle` int(11) NOT NULL DEFAULT '0',
  `wrinkle` int(11) NOT NULL DEFAULT '0',
  `wrinkleopacity` int(11) NOT NULL DEFAULT '0',
  `eyebrow` int(11) NOT NULL DEFAULT '0',
  `eyebrowopacity` int(11) NOT NULL DEFAULT '0',
  `beard` int(11) NOT NULL DEFAULT '0',
  `beardopacity` int(11) NOT NULL DEFAULT '0',
  `beardcolor` int(11) NOT NULL DEFAULT '0',
  `hair` int(11) NOT NULL DEFAULT '0',
  `hairtext` int(11) NOT NULL DEFAULT '0',
  `torso` int(11) NOT NULL DEFAULT '0',
  `torsotext` int(11) NOT NULL DEFAULT '0',
  `leg` int(11) NOT NULL DEFAULT '0',
  `legtext` int(11) NOT NULL DEFAULT '0',
  `shoes` int(11) NOT NULL DEFAULT '0',
  `shoestext` int(11) NOT NULL DEFAULT '0',
  `accessory` int(11) NOT NULL DEFAULT '0',
  `accessorytext` int(11) NOT NULL DEFAULT '0',
  `undershirt` int(11) NOT NULL DEFAULT '0',
  `undershirttext` int(11) NOT NULL DEFAULT '0',
  `torso2` int(11) NOT NULL DEFAULT '0',
  `torso2text` int(11) NOT NULL DEFAULT '0',
  `prop_hat` int(11) NOT NULL DEFAULT '0',
  `prop_hat_text` int(11) NOT NULL DEFAULT '0',
  `prop_glasses` int(11) NOT NULL DEFAULT '0',
  `prop_glasses_text` int(11) NOT NULL DEFAULT '0',
  `prop_earrings` int(11) NOT NULL DEFAULT '0',
  `prop_earrings_text` int(11) NOT NULL DEFAULT '0',
  `prop_watches` int(11) NOT NULL DEFAULT '0',
  `prop_watches_text` int(11) NOT NULL DEFAULT '0');]])
MySQL.execute("vRP/table_costumization")

MySQL.createCommand("vRP/insert_user_costumization", "INSERT INTO vrp_costumization (user_id) VALUES(@user_id)")
MySQL.createCommand("vRP/set_costumization","UPDATE vrp_costumization SET dad=@dad, mum=@mum, dadmumpercent=@dadmumpercent, skinton=@skin, eyecolor=@eyecolor, acne=@acne, skinproblem=@skinproblem, freckle=@freckle, wrinkle=@wrinkle, wrinkleopacity=@wrinkleopacity, eyebrow=@eyebrow, eyebrowopacity=@eyebrowopacity, beard=@beard, beardopacity=@beardopacity, beardcolor=@beardcolor, hair=@hair, hairtext=@hairtext, torso=@torso, torsotext=@torsotext, leg=@leg, legtext=@legtext, shoes=@shoes, shoestext=@shoestext, accessory=@accessory, accessorytext=@accessorytext, undershirt=@undershirt, undershirttext=@undershirttext, torso2=@torso2, torso2text=@torso2text, prop_hat=@prop_hat, prop_hat_text=@prop_hat_text, prop_glasses=@prop_glasses, prop_glasses_text=@prop_glasses_text, prop_earrings=@prop_earrings, prop_earrings_text=@prop_earrings_text, prop_watches=@prop_watches, prop_watches_text=@prop_watches_text WHERE user_id = @user_id")
MySQL.createCommand("vRP/select_user_costumization","SELECT * FROM vrp_costumization WHERE user_id = @user_id")

RegisterServerEvent("updateSkin")
AddEventHandler("updateSkin", function(dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)
	local user_id = vRP.getUserId({source})

	if dad == nil then
		dad = 0
	end
	
	if mum == nil then
		mum = 0
	end

	MySQL.execute("vRP/set_costumization",{user_id = user_id, dad = dad, mum = mum, dadmumpercent = dadmumpercent, skin = skin, eyecolor = eyecolor, acne = acne, skinproblem = skinproblem, freckle = freckle, wrinkle = wrinkle, wrinkleopacity = wrinkleopacity, eyebrow = eyebrow, eyebrowopacity = eyebrowopacity, beard = beard, beardopacity = beardopacity, beardcolor = beardcolor, hair = hair, hairtext = haircolor, torso = torso, torsotext = torsotext, leg = leg, legtext = legtext, shoes = shoes, shoestext = shoestext, accessory = accessory, accessorytext = accessorytext, undershirt = undershirt, undershirttext = undershirttext, torso2 = torso2, torso2text = torso2text, prop_hat = prop_hat, prop_hat_text = prop_hat_text, prop_glasses = prop_glasses, prop_glasses_text = prop_glasses_text, prop_earrings = prop_earrings, prop_earrings_text = prop_earrings_text, prop_watches = prop_watches, prop_watches_text = prop_watches_text})
end)

function SetCostumization(user_id)
	MySQL.query("vRP/select_user_costumization",{user_id = user_id},function(result,affected)
		local dad = tonumber(result[1].dad)
		local mum = tonumber(result[1].mum)
		local dadmumpercent = tonumber(result[1].dadmumpercent)
		local skin = tonumber(result[1].skin)
		local eyecolor = tonumber(result[1].eyecolor)
		local acne = tonumber(result[1].acne)
		local skinproblem = tonumber(result[1].skinproblem)
		local freckle = tonumber(result[1].freckle)
		local wrinkle = tonumber(result[1].wrinkle)
		local wrinkleopacity = tonumber(result[1].wrinkleopacity)
		local hair = tonumber(result[1].hair)
		local haircolor = tonumber(result[1].haircolor)
		local eyebrow = tonumber(result[1].eyebrow)
		local eyebrowopacity = tonumber(result[1].eyebrowopacity)
		local beard = tonumber(result[1].beard)
		local beardopacity = tonumber(result[1].beardopacity)
		local beardcolor = tonumber(result[1].beardcolor)
		local hats = tonumber(result[1].hats)
		local glasses = tonumber(result[1].glasses)
		local ears = tonumber(result[1].ears)
		local tops = tonumber(result[1].tops)
		local pants = tonumber(result[1].pants)
		local shoes = tonumber(result[1].shoes)
		local watches = tonumber(result[1].watches)
		local torso = tonumber(result[1].torso)
		local torsotext = tonumber(result[1].torsotext)
		local leg = tonumber(result[1].leg)
		local legtext = tonumber(result[1].legtext)
		local shoes = tonumber(result[1].shoes)
		local shoestext = tonumber(result[1].shoestext)
		local accessory = tonumber(result[1].accessory)
		local accessorytext = tonumber(result[1].accessorytext)
		local undershirt = tonumber(result[1].undershirt)
		local undershirttext = tonumber(result[1].undershirttext)
		local torso2 = tonumber(result[1].torso2)
		local torso2text = tonumber(result[1].torso2text)
		local prop_hat = tonumber(result[1].prop_hat)
		local prop_hat_text = tonumber(result[1].prop_hat_text)
		local prop_glasses = tonumber(result[1].prop_glasses)
		local prop_glasses_text = tonumber(result[1].prop_glasses_text)
		local prop_earrings = tonumber(result[1].prop_earrings)
		local prop_earrings_text = tonumber(result[1].prop_earrings_text)
		local prop_watches = tonumber(result[1].prop_watches)
		local prop_watches_text = tonumber(result[1].prop_watches_text)

		TriggerClientEvent("vRP_C:playerSpawned",dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)		
	end)
end

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
	if first_spawn then
		Citizen.SetTimeout(5000,function()
			MySQL.query("vRP/select_user_costumization",{user_id = user_id},function(result,affected)
				if #result == 0 then
					MySQL.execute("vRP/insert_user_costumization",{user_id = user_id})
				else
					local dad = tonumber(result[1].dad)
					local mum = tonumber(result[1].mum)
					local dadmumpercent = tonumber(result[1].dadmumpercent)
					local skin = tonumber(result[1].skin)
					local eyecolor = tonumber(result[1].eyecolor)
					local acne = tonumber(result[1].acne)
					local skinproblem = tonumber(result[1].skinproblem)
					local freckle = tonumber(result[1].freckle)
					local wrinkle = tonumber(result[1].wrinkle)
					local wrinkleopacity = tonumber(result[1].wrinkleopacity)
					local hair = tonumber(result[1].hair)
					local haircolor = tonumber(result[1].haircolor)
					local eyebrow = tonumber(result[1].eyebrow)
					local eyebrowopacity = tonumber(result[1].eyebrowopacity)
					local beard = tonumber(result[1].beard)
					local beardopacity = tonumber(result[1].beardopacity)
					local beardcolor = tonumber(result[1].beardcolor)
					local hats = tonumber(result[1].hats)
					local glasses = tonumber(result[1].glasses)
					local ears = tonumber(result[1].ears)
					local tops = tonumber(result[1].tops)
					local pants = tonumber(result[1].pants)
					local shoes = tonumber(result[1].shoes)
					local watches = tonumber(result[1].watches)
					local torso = tonumber(result[1].torso)
					local torsotext = tonumber(result[1].torsotext)
					local leg = tonumber(result[1].leg)
					local legtext = tonumber(result[1].legtext)
					local shoes = tonumber(result[1].shoes)
					local shoestext = tonumber(result[1].shoestext)
					local accessory = tonumber(result[1].accessory)
					local accessorytext = tonumber(result[1].accessorytext)
					local undershirt = tonumber(result[1].undershirt)
					local undershirttext = tonumber(result[1].undershirttext)
					local torso2 = tonumber(result[1].torso2)
					local torso2text = tonumber(result[1].torso2text)
					local prop_hat = tonumber(result[1].prop_hat)
					local prop_hat_text = tonumber(result[1].prop_hat_text)
					local prop_glasses = tonumber(result[1].prop_glasses)
					local prop_glasses_text = tonumber(result[1].prop_glasses_text)
					local prop_earrings = tonumber(result[1].prop_earrings)
					local prop_earrings_text = tonumber(result[1].prop_earrings_text)
					local prop_watches = tonumber(result[1].prop_watches)
					local prop_watches_text = tonumber(result[1].prop_watches_text)
			
					TriggerClientEvent("vRP_C:playerSpawned",source,dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)		
				end
			end)
		end)
	end
end)

RegisterCommand("setskin",function(player,args)
	local user_id = vRP.getUserId({player})

	MySQL.query("vRP/select_user_costumization",{user_id = user_id},function(result,affected)
		local dad = tonumber(result[1].dad)
		local mum = tonumber(result[1].mum)
		local dadmumpercent = tonumber(result[1].dadmumpercent)
		local skin = tonumber(result[1].skin)
		local eyecolor = tonumber(result[1].eyecolor)
		local acne = tonumber(result[1].acne)
		local skinproblem = tonumber(result[1].skinproblem)
		local freckle = tonumber(result[1].freckle)
		local wrinkle = tonumber(result[1].wrinkle)
		local wrinkleopacity = tonumber(result[1].wrinkleopacity)
		local hair = tonumber(result[1].hair)
		local haircolor = tonumber(result[1].haircolor)
		local eyebrow = tonumber(result[1].eyebrow)
		local eyebrowopacity = tonumber(result[1].eyebrowopacity)
		local beard = tonumber(result[1].beard)
		local beardopacity = tonumber(result[1].beardopacity)
		local beardcolor = tonumber(result[1].beardcolor)
		local hats = tonumber(result[1].hats)
		local glasses = tonumber(result[1].glasses)
		local ears = tonumber(result[1].ears)
		local tops = tonumber(result[1].tops)
		local pants = tonumber(result[1].pants)
		local shoes = tonumber(result[1].shoes)
		local watches = tonumber(result[1].watches)
		local torso = tonumber(result[1].torso)
		local torsotext = tonumber(result[1].torsotext)
		local leg = tonumber(result[1].leg)
		local legtext = tonumber(result[1].legtext)
		local shoes = tonumber(result[1].shoes)
		local shoestext = tonumber(result[1].shoestext)
		local accessory = tonumber(result[1].accessory)
		local accessorytext = tonumber(result[1].accessorytext)
		local undershirt = tonumber(result[1].undershirt)
		local undershirttext = tonumber(result[1].undershirttext)
		local torso2 = tonumber(result[1].torso2)
		local torso2text = tonumber(result[1].torso2text)
		local prop_hat = tonumber(result[1].prop_hat)
		local prop_hat_text = tonumber(result[1].prop_hat_text)
		local prop_glasses = tonumber(result[1].prop_glasses)
		local prop_glasses_text = tonumber(result[1].prop_glasses_text)
		local prop_earrings = tonumber(result[1].prop_earrings)
		local prop_earrings_text = tonumber(result[1].prop_earrings_text)
		local prop_watches = tonumber(result[1].prop_watches)
		local prop_watches_text = tonumber(result[1].prop_watches_text)
		TriggerClientEvent("vRP_C:playerSpawned",player,dad, mum, dadmumpercent, skin, eyecolor, acne, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)
	end)
end)
