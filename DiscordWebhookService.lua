local HttpService = game:GetService("HttpService")

local DWS = {}

-- Initialize the queues
local webhookQueues = {}
local retryInterval = 0.5

-- Function to process a specific queue
local function processQueue(queue, webhookUrl)
	while true do
		if #queue > 0 then
			local messageData = table.remove(queue, 1)
			local success, response = pcall(function()
				return HttpService:RequestAsync({
					Url = webhookUrl,
					Method = "POST",
					Headers = messageData.headers,
					Body = messageData.data
				})
			end)

			if not success or response.StatusCode ~= 204 then
				warn("Failed to send message to Discord, retrying in " .. retryInterval .. " seconds:", response)
				table.insert(queue, 1, messageData)  -- Re-add the message to the queue
				wait(retryInterval)  -- Wait before retrying
			else
				print("Message sent to Discord successfully to webhook: " .. webhookUrl)
				print("Response Status Code:", response.StatusCode)
				print("Response Body:", response.Body)
				wait(0.25)
			end
		else
			wait(retryInterval)  -- Wait if the queue is empty
		end
	end
end

-- Function to add a message to a random webhook's queue
function DWS.sendMessageToDiscord(message, webhooks, displayTime)
	-- Set default value for displayTime if not provided
	if displayTime == nil then
		displayTime = true
	end

	-- Optionally include time in the message
	if displayTime then
		local currentTime = os.date("!%Y-%m-%d %H:%M:%S", os.time())
		message = message .. " (Time: " .. currentTime .. ")"
	end

	-- Select a random webhook
	local selectedWebhookIndex = math.random(1, #webhooks)
	local selectedWebhook = webhooks[selectedWebhookIndex]

	-- Initialize the queue for the selected webhook if it doesn't exist
	if webhookQueues[selectedWebhook] == nil then
		webhookQueues[selectedWebhook] = {}
		-- Start processing this queue in a new thread
		spawn(function() processQueue(webhookQueues[selectedWebhook], selectedWebhook) end)
	end

	local data = HttpService:JSONEncode({content = message})
	local headers = {
		["Content-Type"] = "application/json"
	}
	table.insert(webhookQueues[selectedWebhook], {data = data, headers = headers})
	print("Message added to queue for webhook: " .. selectedWebhook)
end

return DWS
