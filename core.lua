local addon, engine = ...
engine[1] = {}
local Version = GetAddOnMetadata(addon, "Version")

function engine:unpack()
	return self[1]
end

NUI = engine [1]

NaowhUI = LibStub("AceAddon-3.0"):NewAddon("NaowhUI Installer");
NaowhUI.db = LibStub("AceDB-3.0"):New("NaowhUI_DB");

--Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic

-- These are things we do not cache
-- GLOBALS: PluginInstallStepComplete, PluginInstallFrame

NUI.PluginName = "|cff0091edNaowh|r|cffffa300UI|r"

--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

--Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

--Create a new ElvUI module so ElvUI can handle initialization when ready
local NaowhUI = E:NewModule(NUI.PluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

--This function is executed when you press "Skip Process" or "Finished" in the installer.
function NUI:InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	--Set a variable tracking the profile that was Installed
	NaowhUI.db.global["ElvUI profile name"] = ElvUI[1].data:GetCurrentProfile()
	NaowhUI.db.global.installed = true

	NaowhUI.db.profile.install_version = Version

	--Plater dose not like it when you change profiles and requies a reload after so do it right before the reload
	E.private["nameplates"]["enable"] = false
	if IsAddOnLoaded ("Plater") then
		Plater.db:SetProfile("Naowh")
	end

	--re-enabled the ElvUI incompatility warning
	E.global.ignoreIncompatible = true
	ReloadUI()
end

-- Function that requires a deplayed confirmation
-- importFunction: the fucntion for the import that's being confirmed
local function doubleComfirmation(importFunction)

	-- Make the dialog box that will be shown
		StaticPopupDialogs["SecondOverrideConfirm"] = {
			text = "Are you sure you want to continue? Your settings will be lost.",
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				importFunction()
			end,
			-- set a timed delay on the accecpt button
			StartDelay = function() return 2 end,
			whileDead = true,
			hideOnEscape = true,
		}

		-- tell our dialog box to show
		StaticPopup_Show("SecondOverrideConfirm", "test")

end

-- string: a string as the message to be shown in the dialog box
-- importFunction: the fucntion for the import that's being confirmed
-- shouldDoubleConfirm: boolean for if a second timed confirmation should happen
function NUI:OverwriteWarning(string, importFunction, shouldDoubleConfirm)
	-- the user is on a step that will destroy existing settings
	-- make a dialog box that will warn them

	-- Make the dialog box that will be shown
		StaticPopupDialogs["ProfileOverrideConfirm"] = {
			text = string,
			button1 = "Yes",
			button2 = "No",
			OnAccept = function()
				if (shouldDoubleConfirm) then
					-- if we need a double confirmation go there
					doubleComfirmation(importFunction)
				else
					-- else run our import function
					importFunction()
				end
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
		}

		-- tell our dialog box to show
		StaticPopup_Show("ProfileOverrideConfirm", "test")
end

-- string: a string as the message to be shown in the dialog box
function NUI:Notice(string)
	-- we'd like to notify the user about something
	-- make a dialog box that will show a notice

	-- Make the dialog box that will be shown
		StaticPopupDialogs["ProfileOverrideConfirm"] = {
			text = string,
			button1 = "Okay",
			OnAccept = function()
			end,
			StartDelay = function() return 1 end,
			whileDead = true,
			hideOnEscape = true,
		}

		-- tell our dialog box to show
		StaticPopup_Show("ProfileOverrideConfirm", "test")
end


function NUI:LoadNUIProfiles()
	NaowhUI.db = LibStub("AceDB-3.0"):New("NaowhUI_DB");

	ElvUI[1].data:SetProfile(NaowhUI.db.global["ElvUI profile name"])

	if IsAddOnLoaded("BigWigs") then
		NUI:BigWigsImport()
	end

	if IsAddOnLoaded("Details") then
		NUI:DetailsImport()
	end

	if IsAddOnLoaded("ExRT") then
		NUI:GottaGoFastImport()
	end

	if IsAddOnLoaded("GottaGoFast") then
		NUI:GottaGoFastImport()
	end

	if IsAddOnLoaded("NameplateAuras") then
		--Plater dose not like it when you change profiles and requies a reload after so do it right before the reload
		E.private["nameplates"]["enable"] = false
		Plater.db:SetProfile("Naowh")
	end

	if IsAddOnLoaded("Plater") then
		NUI:NameplateAurasImport()
	end

	NaowhUI.db.profile.install_version = Version
	ReloadUI()
end

local function detailsTutorials()
	Details:SetTutorialCVar ("STREAMER_PLUGIN_FIRSTRUN", true)
	Details:SetTutorialCVar ("version_announce", 1)
	Details.character_first_run = false
	Details.auto_open_news_window = false
	_detalhes.is_first_run = false
end

local function forceFont()
	--make the installer use the font we want
	local LSM = LibStub("LibSharedMedia-3.0")
	LSM:Register("font", "Naowh", [[Interface\Addons\NaowhUI_Installer\Naowh.TTF]])
	E.db["general"]["font"] = "Naowh"
	E:UpdateMedia();
	E:UpdateFontTemplates()
end

--This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args[NUI.PluginName] = {
		order = 100,
		type = "group",
		name = format("%s", NUI.PluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = NUI.PluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", NUI.PluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() forceFont(); E:GetModule("PluginInstaller"):Queue(NUI.InstallerData); E:ToggleOptionsUI(); end,
			},
		},
	}
end

--Create a unique table for our plugin
P[NUI.PluginName] = {}

--This function will handle initialization of the addon
function NaowhUI:Initialize()

	--disable the details tutorials
	detailsTutorials()

	NaowhUI.db = LibStub("AceDB-3.0"):New("NaowhUI_DB");
	--Trick ElvUI into thinking it's installer has been run
	E.private.install_complete = E.version

	--prevent the ElvUI Nameplate conflit dialog
	E.global.ignoreIncompatible = true


	--Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and NaowhUI.db.profile.install_version == nil then
		forceFont()
		E:GetModule("PluginInstaller"):Queue(NUI.InstallerData)
	end

	--Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

--Register our slash command
SLASH_NUI1 = "/naowhui"
local function Commands(msg, editbox)
	E:GetModule("PluginInstaller"):Queue(NUI.InstallerData)
end
SlashCmdList["NUI"] = Commands

--Register module with callback so it gets initialized when ready
E:RegisterModule(NaowhUI:GetName())
