-- ============================================================
-- 2021 CLIENT (PEKORA) AUTO-FIXED COPY
-- mechanical fixes applied: %* -> %s x0, pairs() wrap x0, if-expr -> __2021_if x0, compound-assign x0
-- no manual fixes needed; paste as-is.
-- ============================================================
local HttpService = game:GetService("HttpService")
local Promise = require(script.Parent:FindFirstChild("Promise"))

local HttpWrapper = { }

function HttpWrapper:Request(requestOptions)
    if requestOptions == nil then
        return Promise.reject("Argument 1 missing or nil")
    elseif requestOptions.Url == nil then
        return Promise.reject("Argument 1 missing Url field")
    end

    return Promise.new(function(resolve, reject)
        --[[local response = HttpService:RequestAsync(requestOptions)

        if response.Success then
            resolve(response.Body)
        else
            reject(response)
        end]]

        local response

        local success, r = pcall(function()
            return HttpService:RequestAsync(requestOptions)
        end)

        if not success then
            response.Success = false
            response.Body = "HttpWrapper could not make the request:\n" .. tostring(r)
            response.StatusCode = 408
            response.StatusMessage = "HTTP Request Timed Out (Probably)"
            reject(response)
        else
            response = r
            resolve(response.Body)
        end
    end)
end

return HttpWrapper