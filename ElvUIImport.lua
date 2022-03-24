local NUI = select(2, ...):unpack()
local E, L, V, P, G = unpack(ElvUI)

function NUI:ElvUIImport(layout, importDB)

  --Don't update the profile settings unless we're mean to
  if importDB then
    --this adds in all the profile settigns
    ElvDB["profiles"]["Naowh DPS/Tank"] = NUI.ElvUI.Tank
    ElvDB["profiles"]["Naowh DPS/Tank -DARK"] = NUI.ElvUI.TankDark
    ElvDB["profiles"]["Naowh Heal"] = NUI.ElvUI.Heal
    ElvDB["profiles"]["Naowh Heal -DARK"] = NUI.ElvUI.HealDark
  end

  --switch to the profile we want.
  if layout == "normal" then
    E.data:SetProfile("Naowh DPS/Tank")
  elseif layout == "dark" then
    E.data:SetProfile("Naowh DPS/Tank -DARK")
  elseif layout == "healer" then
    E.data:SetProfile("Naowh Heal")
  elseif layout == "healer dark" then
    E.data:SetProfile("Naowh Heal -DARK")
  end

  --disable the totem bar
  E.private["general"]["totemBar"] = false

  --character blizz font replacement settings
  E.private["general"]["dmgfont"] = "GothamNarrowUltra"
  E.private["general"]["namefont"] = "Naowh"

  --set the UI scale to 0.71
  ElvDB["global"]["general"]["UIScale"] = 0.71

  --Keep the font from resetting to default
  E.db["general"]["font"] = "Naowh"
	E:UpdateMedia();
	E:UpdateFontTemplates()

  PluginInstallStepComplete.message = "ElvUI Profiles Imported"
  PluginInstallStepComplete:Show()
end
