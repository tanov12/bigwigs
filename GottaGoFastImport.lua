local NUI = select(2, ...):unpack()

function NUI:GottaGoFastImport(importDB)

  if importDB then
    GottaGoFastDB = NUI.GottaGoFastDB
  end

  name = UnitName("PLAYER")
  realm = GetRealmName()

  --GottaGoFastDB["profileKeys"][name.."-"..realm] = "Default"

  PluginInstallStepComplete.message = "GottaGoFast Profile Imported"
  PluginInstallStepComplete:Show()
end
