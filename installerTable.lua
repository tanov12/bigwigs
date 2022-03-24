local addon, _ = ...
local Version = GetAddOnMetadata(addon, "Version")
local  NUI = select(2, ...):unpack()

--This is the data we pass on to the ElvUI Plugin Installer.
--The Plugin Installer is reponsible for displaying the install guide for this layout.
NUI.InstallerData = {
	Title = format("%s %s", NUI.PluginName, "Installation"),
	Name = NUI.PluginName,
	tutorialImage = "Interface\\AddOns\\NaowhUI_Installer\\Naowh_Logo_Transparent.tga", --If you have a logo you want to use, otherwise it uses the one from ElvUI
	Pages = {
		[1] = function()
			if NaowhUI_DB.global and NaowhUI_DB.global.installed then
				PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", NUI.PluginName)
				PluginInstallFrame.Desc1:SetFormattedText("It looks like you've installed %s before. If you'd like to load the same NaowhUI profiles on this character you can click 'Load Profiles'.", NUI.PluginName)
				PluginInstallFrame.Desc2:SetText("If you'd like to go through the installation again you can click the continue button. |cffff0000!!WARNING:!!|r Doing so will reset all of your profiles again. You can also click 'Skip Process' if you don't want the Naowh profiles on this character.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", NUI.LoadNUIProfiles)
				PluginInstallFrame.Option1:SetText("Load Profiles")
				PluginInstallFrame.Option2:Show()
				PluginInstallFrame.Option2:SetScript("OnClick", NUI.InstallComplete)
				PluginInstallFrame.Option2:SetText("Skip Process")
			else
				NUI:Notice("NOTICE! \n\nAs you go through the installer you won't see any changes. Changes will not be visible until you reload. A reload will happen automatically at the end of the installer.")
				PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", NUI.PluginName)
				PluginInstallFrame.Desc1:SetText("This installation process will guide you through steps to add Naowh's profiles for various addons. NOTICE! As you go through the installer you won't see any changes. Changes will not be visible until you reload. A reload will happen automatically at the end of the installer.\n|cffff0000!!WARNING:!!|r Running the installer will cause ALL settings for the addons in it to be wiped. If you'd like to keep any of your settings back up your WTF file NOW!")
				PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
				PluginInstallFrame.Option1:Show()
				PluginInstallFrame.Option1:SetScript("OnClick", NUI.InstallComplete)
				PluginInstallFrame.Option1:SetText("Skip Process")
			end
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:ElvUIImport("normal", true) end)
			PluginInstallFrame.Option1:SetText("DPS/Tank")
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript("OnClick", function() NUI:ElvUIImport("dark", true) end)
			PluginInstallFrame.Option2:SetText("DPS/Tank Dark")
			PluginInstallFrame.Option3:Show()
			PluginInstallFrame.Option3:SetScript("OnClick", function() NUI:ElvUIImport("healer", true) end)
			PluginInstallFrame.Option3:SetText("Healer")
			PluginInstallFrame.Option4:Show()
			PluginInstallFrame.Option4:SetScript("OnClick", function() NUI:ElvUIImport("healer dark", true) end)
			PluginInstallFrame.Option4:SetText("Healer Dark")
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("BigWigs")
			PluginInstallFrame.Desc1:SetText("Import Naowh's BigWigs profile.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:BigWigsImport(true) end)
			PluginInstallFrame.Option1:SetText("Setup BigWigs")
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Details")
			PluginInstallFrame.Desc1:SetText("Import Naowh's Details profile")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:DetailsImport(true) end)
			PluginInstallFrame.Option1:SetText("Setup Details")
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Exorsus Raid Tools")
			PluginInstallFrame.Desc1:SetText("Import Naowh's Exorsus Raid Tools profile.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:ExRTImport(true) end)
			PluginInstallFrame.Option1:SetText("Setup ExRT")
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("GottaGoFast")
			PluginInstallFrame.Desc1:SetText("Import Naowh's GottaGoFast profile.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:GottaGoFastImport(true) end)
			PluginInstallFrame.Option1:SetText("Setup GottaGoFast")
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("NameplateAuras")
			PluginInstallFrame.Desc1:SetText("Import Naowh's NameplateAuras profile.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:NameplateAurasImport(true) end )
			PluginInstallFrame.Option1:SetText("Setup NameplateAuras")
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Plater")
			PluginInstallFrame.Desc1:SetText("Import Naowh's Plater profile.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() NUI:PlaterImport(true) end)
			PluginInstallFrame.Option1:SetText("Setup Plater")
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("WeakAuras")
			PluginInstallFrame.Desc1:SetText("Import Naowh's WeakAuras.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function()
				local import = function() NUI:WeakAurasImport(true) end
				NUI:OverwriteWarning("WARNING! \n\nContinuing will remove all your WeakAuras and import Naowh's. If you'd like to save any of your auras export them now and re-import them after installing.", import, true)
			end)
			PluginInstallFrame.Option1:SetText("Setup WeakAuras")
		end,
		[10] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", NUI.InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts",
		[3] = "BigWigs",
		[4] = "Details",
		[5] = "Exorsus Raid Tools",
		[6] = "GottaGoFast",
		[7] = "NameplateAuras",
		[8] = "Plater",
		[9] = "WeakAuras",
		[10] = "Installation Complete",
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}
