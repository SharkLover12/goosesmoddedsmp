local internet = require("internet")
local json = require("json") -- Ensure you have a JSON library available, or parse manually if necessary.

-- Replace <your-api-key-here> with your actual Groq API key
local api_key = "<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>"
local api_url = "https://api.groq.com/v1/chat/completion"

-- Ask the user for a custom prompt
print("Enter your prompt: ")
local user_prompt = io.read()

-- Construct the request body using the user's prompt
local request_body = {
    messages = {
        {
            role = "user",
            content = user_prompt
        }
    },
    model = "mixtral-8x7b-32768" -- Or another model as needed
}

-- Convert Lua table to JSON string
local json_body = json.encode(request_body)

-- Create a request to the Groq API with the authorization header
local headers = {
    ["Authorization"] = "Bearer " .. api_key,
    ["Content-Type"] = "application/json"
}

-- Send POST request
local response = internet.request(api_url, json_body, headers)

-- Read the response and print the chat completion result
for line in response do
    print(line)
end
