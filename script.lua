--[[
    Name: ROBLOX REPORT GASLIGHTING
    Description: The message in the "fakemessage" variable will only show up on chats,
                 while the message in the "realmessage" variable will only show up in 
                 reports.
]]

local fakemessage = "do you like noobs?" 
local realmessage = "do you like black people?" 

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local PlayerScripts = Players.LocalPlayer:FindFirstChildOfClass("PlayerScripts")
local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
local SayMessageRequest = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest


function SpoofChat()
    local Chat = PlayerGui:FindFirstChild("Chat")
    local ChatBar = Chat:FindFirstChild('ChatBar', true)
    
    if ChatBar then
        ChatBar:SetTextFromInput(realmessage)
        Players:Chat(realmessage)
        ChatBar:SetTextFromInput("")
    end
end

if SayMessageRequest then
    SayMessageRequest:FireServer(fakemessage, "All")
    SpoofChat()
end
