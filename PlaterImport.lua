local NUI = select(2, ...):unpack()

function NUI:PlaterImport(importDB)
  if importDB then
    PlaterDB["profiles"]["Naowh"] = NUI.Plater.Profile
  end

  name = UnitName("PLAYER")
  realm = GetRealmName()
  --if we overwrite the PlaterDB to add our profiles it will forget which profile to load
  --set the profile key manually so the correct profile is selected after a reload
  PlaterDB["profileKeys"][name.." - "..realm] = "Naowh"

 PluginInstallStepComplete.message = "Plater Profile Imported"
 PluginInstallStepComplete:Show()
end
