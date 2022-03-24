local NUI = select(2, ...):unpack()

function NUI:DetailsImport(importDB)

  if importDB then
    _detalhes_global["__profiles"]["Naowh"] = NUI.Details.Profile
  end

  _detalhes:ApplyProfile("Naowh", false, false)

  PluginInstallStepComplete:Hide()
  PluginInstallStepComplete.message = "Details Profile Imported"
  PluginInstallStepComplete:Show()
end
