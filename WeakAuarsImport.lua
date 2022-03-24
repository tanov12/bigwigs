local NUI = select(2, ...):unpack()

function NUI:WeakAurasImport(importDB)
  if importDB then
    WeakAurasSaved = NUI.WeakAurasSaved
  end

  PluginInstallStepComplete.message = "WeakAuras Imported"
  PluginInstallStepComplete:Show()
end
