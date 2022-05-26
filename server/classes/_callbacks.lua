---@public
aCallbacks = aCallbacks or {};
aCallbacks.__index = aCallbacks;
aCallbacks.registered = {};

setmetatable(aCallbacks, {
    __call = function(_, cbData)
        local self = {};
        self.id = (#aCallbacks.registered + 1);
        self.name = cbData.name;
        self.void = cbData.void;
        
        aCallbacks.registered[self.id] = self;
        return setmetatable(self, aCallbacks);
    end,
});

---doesCallbackExisst
---@public
---@param name string
---@return boolean
function aCallbacks.doesCallbackExist(name)
    for i = 1, #aCallbacks.registered do
        return (aCallbacks.registered[i].name == name);
    end
end

---registerCallback
---@public
---@param name string
---@param void function
---@return table
function aCallbacks.registerCallback(name, void)
    if (aCallbacks.doesCallbackExist(name)) then
        return Utilities.log(('^3Warning^7, callback: (^3%s^7) already exists.'):format(name));
    end

    local newCallback = aCallbacks({ name = name, void = void });
    local eventName = ('aCallbacks_:%s'):format(newCallback.name);
    RegisterNetEvent(eventName);
    AddEventHandler(eventName, function(playerId, params)
        if (not playerId) then
            return Utilities.log(('^3Warning^7, player-id of callback: (^3%s^7) is NULL.'):format(name));
        end
        
        newCallback.void(playerId, function(...)
            local args = { ... };
            TriggerClientEvent(eventName, playerId, table.unpack(args));
        end, table.unpack(params));
    end);

    if (Configuration.registerConsoleOutput) then
        Utilities.log(('Success, callback (%s) ^2registered^7.'):format(newCallback.name));
    end
    return newCallback;
end