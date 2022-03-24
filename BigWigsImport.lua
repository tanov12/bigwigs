local NUI = select(2, ...):unpack()

function NUI:BigWigsImport(importDB)
  if importDB then
    -- Assign our BigWigs Database settings into BigWigs' own database
    BigWigs3DB = NUI.BigWigs3DB
  end

  -- Switch to the desired profile
  local BigWigs = LibStub("AceDB-3.0"):New(BigWigs3DB)
  BigWigs:SetProfile("Naowh")

  PluginInstallStepComplete.message = "BigWigs Profile Imported"
  PluginInstallStepComplete:Show()
end
