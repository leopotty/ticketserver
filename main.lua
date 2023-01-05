local webhookService = {}

local https = game:GetService("HttpService")
local Einstellungen = require(script.Parent.Einstellungen)


function webhookService:createMessage(url, message : string)
	local data = {
		["content"] = message
	}
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewistehminerz.dev")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
	end
end


function webhookService:createEmbed(url, title : string, message :string , fields, image)
	local data = {
		['content'] = "",
		['embeds'] = {{
			["image"] = {["url"] = image},
			['title'] = "**"..title.."**",
			['description'] = message,
			['type'] = "rich",
			["color"] = tonumber(Einstellungen.EmbedFarbe),
			['fields'] = fields

		},
		},
	}
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewistehminerz.dev")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
		
	end
end


function webhookService:createAuthorEmbed(url, authorName : string, iconurl, description : string, fields)
	local data = {
		["embeds"] = {{
			["author"] = {
				["name"] = authorName,
				["icon_url"] = iconurl,
			},
			["description"] = description,
			["color"] = tonumber(0xFFFAFA),
			["fields"] = fields
			
			
		}},
	}
	
	local finalData = https:JSONEncode(data)
	local finalUrl = string.gsub(url, "discord.com", "webhook.lewistehminerz.dev")
	local finalBackupUrl = string.gsub(url, "discord.com", "webhook.newstargeted.com")
	
	local good, bad = pcall(function()
		https:PostAsync(finalUrl, finalData)
	end)
	if good then
		print("Webhook Request Success!")
	else
		print("Webhook Request Failed " .. bad .. " Trying backup URL")
		https:PostAsync(finalBackupUrl, finalData)
		print("Attempted request with backup URL, if webhook does not send then both URLS are down or you have a bad request.")
	end
end


return webhookService
