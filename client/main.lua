aCallbacks = aCallbacks or {};
aCallbacks.events = {};

---@public
---@param name string
---@param playerId number
---@param eventVoid function
---@param ... table
function aCallbacks.triggerCallback(name, playerId, eventVoid, ...)
    local params = { ... }
    aCallbacks.registerNetEvent(name, playerId, eventVoid, params);
end

---@public
---@param name string
---@param playerId number
---@param eventVoid function
---@param params any
---@return table | nil
function aCallbacks.registerNetEvent(name, playerId, eventVoid, params)
    local registeredState = aCallbacks.events[name] ~= nil;
    local eventName = ('aCallbacks_:%s'):format(name);
    if (not registeredState) then
        RegisterNetEvent(eventName);
        AddEventHandler(eventName, function(...)
            eventVoid(...);
        end)

        aCallbacks.events[name] = eventVoid;
    end

    TriggerServerEvent(eventName, playerId, params);
    return aCallbacks.events[name];
end