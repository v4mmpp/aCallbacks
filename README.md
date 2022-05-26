# aCallback
An easy to use Callback system for your server / framework.

# Explaination
You can easily get data from server-side, for exemple get an/more information(s) from database & bring it directly to Client-Side.

# Usage Exemple
→ __Server-Side__
```lua
-- The commented parameters are those we added in the on the client-side.
exports['aCallback']:registerCallback('getSecretKey', function(source, callback, --[[booleanValue, secondKey]])
    local secretKey = 'secretkey!';
    callback(secretKey);
end);
```  
  
→ __Client-Side__ 
```lua
exports['aCallback']:triggerCallback('getSecretKey', function(secretKey)
    print('This is the secret key: ' .. secretKey);

    -- You can also add parameters after callback function.
end, --[[true, 'secondKey']]);
```  

→ __( Result on client-side )__ 
   
![preview](https://cdn.discordapp.com/attachments/854756500034945075/979444098354278420/unknown.png)

#
⭐ You can Star my repo to support me!

# Credits
© v4mpp - (${RevengeBack_}#4235)