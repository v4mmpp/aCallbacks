Utilities = {};

---log
---@public
---@param message string
---@return function
function Utilities.log(message)
    return print(('^1[aCallbacks]:^7 %s'):format(message or ""));
end