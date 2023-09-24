_G.Webhook = "https://discord.com/api/webhooks/1155578423192862801/qmb6HEECk-Kkpd4cC8c9vkRY6L12C_n_gYeYt8NgO4l2yxM8j1VeBnhrBtYC_Hcrg330"


local function getCurrentDateTime()
    local currentTime = os.time()
    local currentDateTime = os.date("%Y-%m-%d %H:%M:%S", currentTime)
    return currentDateTime
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end


local url = tostring(_G.Webhook)
local embed = {
    ["title"] = "script executed",
    ["description"] = "user:",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = game.Players.LocalPlayer.Name,
            ["value"] = "https://www.roblox.com/users/" .. tostring(game.Players.LocalPlayer.UserId) .. "/profile"
        },
        {
            ["name"] = "game: "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
            ["value"] = "https://www.roblox.com/games/" .. tostring(game.PlaceId)
        }
    },
    ["footer"] = {
        ["text"] = tostring(getCurrentDateTime())
    }
}
SendMessageEMBED(url, embed)

if game.PlaceId == 13772394625 then
   loadstring(game:HttpGet("https://raw.githubusercontent.com/cuenhub/z-hub/main/games/bladeball.lua"))()
else
   loadstring(game:HttpGet("https://raw.githubusercontent.com/cuenhub/z-hub/main/games/universal.lua"))()
end
