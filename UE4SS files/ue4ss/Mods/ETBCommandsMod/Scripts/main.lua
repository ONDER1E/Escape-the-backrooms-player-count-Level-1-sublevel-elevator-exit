GlobalAr = nil
CharacterCache = nil ---@type AActor|nil
PlayerStateCache = nil ---@type AActor|nil
HookActive = false
JuiceActive = false
SanityActive = false

function Log(Message)
    if type(GlobalAr) == "userdata" and GlobalAr:type() == "FOutputDevice" then
        GlobalAr:Log(Message)
    else
        print("[ETBCommandsMod] " .. Message .. "\n")
    end
end

function StartHook()
    if not HookActive then
        HookActive = true
        RegisterBeginPlayPostHook(
        ---@param Context RemoteUnrealParam<AActor>
        function(Context)
            local actor = Context:get()
            if actor:GetFName():ToString():sub(1, 5) == "BPCha" then
                if JuiceActive then
                    JuiceActive = false
                    ProcessJuice(actor, false)
                    return
                end
            end
            if actor:GetFName():ToString():sub(1, 5) == "MP_PS" then
                if SanityActive then
                    SanityActive = false
                    ProcessSanity(actor, false)
                    return
                end
            end
            if actor:GetFName():ToString():sub(1, 5) == "GM_Ma" then
                JuiceActive = false
                SanityActive = false
                return
            end
        end)
    end
end

require("give_drop")
require("juice")
require("sanity")