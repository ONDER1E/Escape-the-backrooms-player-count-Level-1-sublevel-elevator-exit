function ProcessSanityCommand(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    if PlayerStateCache == nil or not PlayerStateCache:IsValid() then
        PlayerStateCache = FindFirstOf("MP_PS_C") --[[@as AActor]]
        if not PlayerStateCache:IsValid() then
            Log("Couldn't find the player state.")
            return true
        end
    end

    StartHook()

    return ProcessSanity(PlayerStateCache, true)
end

function ProcessSanity(State, bPrint)
    if not SanityActive then
        SanityActive = true
        State:SetPropertyValue("ShouldLowerSanity", false)
        State:SetPropertyValue("Sanity", 100.0)
        if bPrint then Log("Infinite sanity on") end
    else
        SanityActive = false
        State:SetPropertyValue("ShouldLowerSanity", true)
        if bPrint then Log("Infinite sanity off") end
    end

    return true
end

RegisterConsoleCommandHandler("sanity", ProcessSanityCommand)