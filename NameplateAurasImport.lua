local NUI = select(2, ...):unpack()

function NUI:NameplateAurasImport(importDB)
  if importDB then
    NameplateAurasAceDB["profileKeys"]["Naowh"] = NUI.NameplateAurasAceDB.Profile
  end

  local NamePlateAuras = LibStub("AceDB-3.0"):New(NameplateAurasAceDB)

  NamePlateAuras:SetProfile("Naowh")

  PluginInstallStepComplete.message = "NameplateAuras Profile Imported"
  PluginInstallStepComplete:Show()
end
