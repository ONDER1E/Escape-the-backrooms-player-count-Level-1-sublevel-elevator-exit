function ProcessJuiceCommand(FullCommand, Parameters, Ar)
    GlobalAr = Ar

    if CharacterCache == nil or not CharacterCache:IsValid() then
        CharacterCache = FindFirstOf("BPCharacter_Demo_C") --[[@as AActor]]
        if not CharacterCache:IsValid() then
            Log("Couldn't find the player character.")
            return true
        end
    end

    StartHook()

    return ProcessJuice(CharacterCache, true)
end

function ProcessJuice(Character, bPrint)
    if not JuiceActive then
        JuiceActive = true
        Character:GetPropertyValue("CharacterMovement"):SetPropertyValue("MaxWalkSpeed", 675)
        Character:SetPropertyValue("IsBurnedOut", true)
        if bPrint then Log("Infinite juice effect on") end
    else
        JuiceActive = false
        Character:GetPropertyValue("CharacterMovement"):SetPropertyValue("MaxWalkSpeed", Character:GetPropertyValue("WalkSpeed"))
        Character:SetPropertyValue("IsBurnedOut", false)
        if bPrint then Log("Infinite juice effect off") end
    end

    return true
end

RegisterConsoleCommandHandler("juice", ProcessJuiceCommand)
RegisterConsoleCommandHandler("j", ProcessJuiceCommand)