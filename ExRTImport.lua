local NUI = select(2, ...):unpack()

function NUI:ExRTImport(importDB)
  local ExRT = LibStub("AceDB-3.0"):New(VExRT)

  if importDB then
    VExRT["Profiles"]["Naowh"] = NUI.ExRT.Profile
  end

  ExRT:SetProfile("Naowh")

  PluginInstallStepComplete.message = "ExorsusRaidTools Profile Imported"
  PluginInstallStepComplete:Show()
end
