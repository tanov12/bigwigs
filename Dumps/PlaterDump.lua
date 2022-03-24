local NUI = select(2, ...):unpack()

NUI.Plater = {}

NUI.Plater.Profile = {
	["aura_breakline_space"] = 15,
	["script_data"] = {
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = scriptTable.config.changeNameplateColor --\n    envTable.NameplateColor = scriptTable.config.nameplateColor\n    envTable.NameplateSizeOffset = scriptTable.config.nameplateSizeOffset --\n    \n    unitFrame.UnitImportantSkullTexture = unitFrame.UnitImportantSkullTexture or unitFrame:CreateTexture(nil, \"background\")\n    \n    unitFrame.UnitImportantSkullTexture:SetTexture([[Interface/AddOns/Plater/media/skullbones_128]])\n    unitFrame.UnitImportantSkullTexture:SetPoint(\"center\", unitFrame.healthBar, \"center\", 0, -5)\n    \n    unitFrame.UnitImportantSkullTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.skullColor))\n    unitFrame.UnitImportantSkullTexture:SetAlpha(scriptTable.config.skullAlpha)\n    unitFrame.UnitImportantSkullTexture:SetScale(scriptTable.config.skullScale)\n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n--[=[\n\n154564 - debug\n\nUsing spellIDs for multi-language support\n\n164362 - smily morsel - plaguefall\n168882 - fleeting manifestation - sanguine depths\n170234 - oppressive banner - theater of pain\n168988 - overgrowth - Mists of Tirna Scithe\n170452 - essesnce orb - torghast\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)   \n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \n    unitFrame.UnitImportantSkullTexture:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1604599472,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
			["Enabled"] = true,
			["Revision"] = 355,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (envTable.dotAnimation) then\n        Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    end\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    unitFrame.UnitImportantSkullTexture:Show()\nend\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option6",
					["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
					["Name"] = "Option 6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Key"] = "changeNameplateColor",
					["Value"] = true,
					["Name"] = "Change Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "change to true to change the color",
				}, -- [4]
				{
					["Type"] = 1,
					["Key"] = "nameplateColor",
					["Value"] = {
						1, -- [1]
						0, -- [2]
						0.5254901960784314, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "increase the nameplate height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 3,
					["Name"] = "Nameplate Size Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "nameplateSizeOffset",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "dotsColor",
					["Value"] = {
						1, -- [1]
						0.7137254901960784, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 5,
					["Key"] = "option10",
					["Value"] = "Skull Texture",
					["Name"] = "Skull Texture",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [10]
				{
					["Type"] = 1,
					["Key"] = "skullColor",
					["Value"] = {
						1, -- [1]
						0.4627450980392157, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Skull Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "",
					["Min"] = 0,
					["Name"] = "Alpha",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "skullAlpha",
				}, -- [12]
				{
					["Type"] = 2,
					["Max"] = 2,
					["Desc"] = "",
					["Min"] = 0.4,
					["Key"] = "skullScale",
					["Value"] = 0.6,
					["Name"] = "Scale",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = true,
				}, -- [13]
			},
			["version"] = -1,
			["Name"] = "Unit - Important [Plater]",
			["NpcNames"] = {
				"135029", -- [1]
				"134388", -- [2]
				"134612", -- [3]
				"133361", -- [4]
				"136330", -- [5]
				"130896", -- [6]
				"129758", -- [7]
				"Healing Tide Totem", -- [8]
				"131009", -- [9]
			},
		}, -- [1]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["Time"] = 1604354808,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 604,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Add the buff name in the trigger box.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
				275826, -- [1]
				272888, -- [2]
				272659, -- [3]
				267901, -- [4]
				267830, -- [5]
				265393, -- [6]
				328175, -- [7]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Key"] = "glowEnabled",
					["Value"] = false,
					["Name"] = "Glow Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Key"] = "glowColor",
					["Value"] = {
						0.403921568627451, -- [1]
						0.00392156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Glow Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Key"] = "dotsEnabled",
					["Value"] = true,
					["Name"] = "Dots Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dots Color",
					["Value"] = {
						1, -- [1]
						0.3215686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Aura - Buff Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [2]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:SetVertexColor(Plater:ParseColors(scriptTable.config.flashColor))\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, scriptTable.config.flashDuration/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, scriptTable.config.flashDuration/2, 1, 0)\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (scriptTable.config.flashDuration/2)\n    fadeOut:SetDuration (scriptTable.config.flashDuration/2)\n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.castBar, envTable.dotAnimation)    \n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1604674264,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_darkorange",
			["Enabled"] = true,
			["Revision"] = 695,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.castBar, 5, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\n        end\n    end\n    \nend\n\n\n",
			["SpellIds"] = {
				257785, -- [1]
				267237, -- [2]
				266951, -- [3]
				267273, -- [4]
				267433, -- [5]
				263066, -- [6]
				255577, -- [7]
				255371, -- [8]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Plays a big animation when the cast start.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Flash:",
					["Name"] = "Flash",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Name"] = "Flash Duration",
					["Value"] = 0.8,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [6]
				{
					["Type"] = 1,
					["Key"] = "flashColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Flash Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [7]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 5,
					["Name"] = "Shake",
					["Value"] = "Shake:",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 0.5,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "How strong is the shake.",
					["Min"] = 1,
					["Name"] = "Shake Amplitude",
					["Value"] = 5,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
				{
					["Type"] = 6,
					["Key"] = "option13",
					["Value"] = 0,
					["Name"] = "Option 13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 5,
					["Key"] = "option14",
					["Value"] = "Dot Animation:",
					["Name"] = "Dot Animation",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [14]
				{
					["Type"] = 1,
					["Key"] = "dotColor",
					["Value"] = {
						0.5647058823529412, -- [1]
						0.5647058823529412, -- [2]
						0.5647058823529412, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dots around the nameplate",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "Adjust the width of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Fraction"] = false,
					["Value"] = 8,
					["Name"] = "Dot X Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [16]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Adjust the height of the dots to better fit in your nameplate.",
					["Min"] = -10,
					["Name"] = "Dot Y Offset",
					["Value"] = 3,
					["Key"] = "yOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [17]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [18]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [19]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [20]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [21]
				{
					["Type"] = 6,
					["Key"] = "option18",
					["Value"] = 0,
					["Name"] = "blank",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [22]
				{
					["Type"] = 6,
					["Name"] = "blank",
					["Value"] = 0,
					["Key"] = "option18",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [23]
				{
					["Type"] = 5,
					["Key"] = "option19",
					["Value"] = "Cast Bar",
					["Name"] = "Option 19",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [24]
				{
					["Type"] = 4,
					["Key"] = "useCastbarColor",
					["Value"] = true,
					["Name"] = "Use Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Use cast bar color.",
				}, -- [25]
				{
					["Type"] = 1,
					["Key"] = "castBarColor",
					["Value"] = {
						0.4117647058823529, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Cast bar color.",
				}, -- [26]
			},
			["version"] = -1,
			["Name"] = "Cast - Very Important [Plater]",
			["NpcNames"] = {
			},
		}, -- [3]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0\n    \n\nend\n\n\n",
			["Time"] = 1604698647,
			["url"] = "",
			["Icon"] = 2175503,
			["Enabled"] = true,
			["Revision"] = 462,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    self:SetStatusBarColor (Plater:ParseColors (scriptTable.config.castBarColor))\nend\n\n\n\n\n\n\n",
			["SpellIds"] = {
				240446, -- [1]
				273577, -- [2]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Plays a special animation showing the explosion time.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Option 3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 3,
					["Name"] = "Cast Bar Height Mod",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [4]
				{
					["Type"] = 1,
					["Key"] = "castBarColor",
					["Value"] = {
						1, -- [1]
						0.5843137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Changes the cast bar color to this one.",
				}, -- [5]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Option 7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Key"] = "option6",
					["Value"] = "Arrow:",
					["Name"] = "Arrow:",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Key"] = "showArrow",
					["Value"] = true,
					["Name"] = "Show Arrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.5,
					["Name"] = "Arrow Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Name"] = "Arrow Width",
					["Value"] = 8,
					["Key"] = "arrowWidth",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Fraction"] = false,
					["Value"] = 8,
					["Name"] = "Arrow Height",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowHeight",
				}, -- [11]
				{
					["Type"] = 6,
					["Key"] = "option13",
					["Value"] = 0,
					["Name"] = "Option 13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 5,
					["Key"] = "option12",
					["Value"] = "Dot Animation:",
					["Name"] = "Dot Animation:",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 1,
					["Key"] = "dotColor",
					["Value"] = {
						1, -- [1]
						0.615686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Dot Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 4,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "xOffset",
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Key"] = "yOffset",
					["Value"] = 3,
					["Name"] = "Dot Y Offset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [16]
			},
			["version"] = -1,
			["Name"] = "Explosion Affix M+ [Plater]",
			["NpcNames"] = {
			},
		}, -- [4]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self, scriptTable.config.glowColor)\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Hide()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        Plater.StopDotAnimation(self, envTable.dotAnimation)\n    end\n    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1604454032,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 351,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Desc"] = "Add the debuff name in the trigger box.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (scriptTable.config.glowEnabled) then\n        envTable.buffIconGlow:Show()\n    end\n    \n    if (scriptTable.config.dotsEnabled) then\n        envTable.dotAnimation = Plater.PlayDotAnimation(self, 6, scriptTable.config.dotsColor, 6, 3) \n    end\nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Enter the spell name or spellID of the Buff in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Key"] = "glowEnabled",
					["Value"] = false,
					["Name"] = "Glow Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 1,
					["Key"] = "glowColor",
					["Value"] = {
						0.403921568627451, -- [1]
						0.00392156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Glow Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 4,
					["Key"] = "dotsEnabled",
					["Value"] = true,
					["Name"] = "Dots Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dots Color",
					["Value"] = {
						1, -- [1]
						0.3215686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
			},
			["version"] = -1,
			["Name"] = "Aura - Debuff Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [5]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1604696442,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_orange",
			["Enabled"] = true,
			["Revision"] = 970,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"none\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				258153, -- [1]
				258313, -- [2]
				257069, -- [3]
				274569, -- [4]
				278020, -- [5]
				261635, -- [6]
				272700, -- [7]
				280404, -- [8]
				268030, -- [9]
				265368, -- [10]
				263891, -- [11]
				264520, -- [12]
				265407, -- [13]
				278567, -- [14]
				278602, -- [15]
				258128, -- [16]
				257791, -- [17]
				258938, -- [18]
				265089, -- [19]
				272183, -- [20]
				256060, -- [21]
				257397, -- [22]
				257899, -- [23]
				269972, -- [24]
				270901, -- [25]
				270492, -- [26]
				268129, -- [27]
				268709, -- [28]
				263215, -- [29]
				268797, -- [30]
				262540, -- [31]
				262554, -- [32]
				253517, -- [33]
				255041, -- [34]
				252781, -- [35]
				250368, -- [36]
				258777, -- [37]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Name"] = "Cast Bar Color Enabled",
					["Value"] = true,
					["Key"] = "useCastbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Cast Bar Color",
					["Value"] = {
						1, -- [1]
						0.4313725490196079, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "castbarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Name"] = "Blank Line",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Fraction"] = true,
					["Value"] = 0.4,
					["Key"] = "flashDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Flash Duration",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 5,
					["Key"] = "castBarHeight",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Cast Bar Height Mod",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Key"] = "shakeDuration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Shake Duration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 100,
					["Desc"] = "How strong is the shake.",
					["Min"] = 2,
					["Name"] = "Shake Amplitude",
					["Value"] = 8,
					["Key"] = "shakeAmplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Name"] = "Shake Frequency",
					["Value"] = 40,
					["Key"] = "shakeFrequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [12]
			},
			["version"] = -1,
			["Name"] = "Cast - Big Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [6]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        envTable.flashIn = Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        envTable.flashOut = Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    envTable.flashIn:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.flashOut:SetDuration(scriptTable.config.flashDuration / 2)\n    envTable.SmallFlashTexture:SetColorTexture (Plater:ParseColors(scriptTable.config.flashColor))\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    \n    \nend\n\n\n",
			["Time"] = 1604617585,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Enabled"] = true,
			["Revision"] = 595,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
			["SpellIds"] = {
				275192, -- [1]
				265912, -- [2]
				274438, -- [3]
				268317, -- [4]
				268375, -- [5]
				276767, -- [6]
				264105, -- [7]
				265876, -- [8]
				270464, -- [9]
				266106, -- [10]
				272180, -- [11]
				278961, -- [12]
				278755, -- [13]
				265468, -- [14]
				256405, -- [15]
				256897, -- [16]
				264101, -- [17]
				280604, -- [18]
				268702, -- [19]
				281621, -- [20]
				262515, -- [21]
				255824, -- [22]
				253583, -- [23]
				250096, -- [24]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Plays a small animation when the cast start.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Option 3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1.2,
					["Desc"] = "How long is the flash played when the cast starts.",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.6,
					["Name"] = "Flash Duration",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [5]
				{
					["Type"] = 1,
					["Key"] = "flashColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Flash Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the Flash",
				}, -- [6]
			},
			["version"] = -1,
			["Name"] = "Cast - Small Alert [Plater]",
			["NpcNames"] = {
			},
		}, -- [7]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
			["Time"] = 1596198404,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
			["NpcNames"] = {
			},
			["Enabled"] = true,
			["Revision"] = 109,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Prio"] = 99,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
			["Name"] = "Aura - Invalidate Unit [Plater]",
			["PlaterCore"] = 1,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
			["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				261265, -- [1]
				261266, -- [2]
				271590, -- [3]
			},
		}, -- [8]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
			["Time"] = 1596198406,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
			["Icon"] = 135024,
			["Enabled"] = true,
			["Revision"] = 62,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
			["Prio"] = 99,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Name"] = "Color Change [Plater]",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			["NpcNames"] = {
				"141851", -- [1]
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n        envTable.smallFlash:Stop()\n    \nend\n\n\n",
		}, -- [9]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = scriptTable.config.blinkEnabled\n        envTable.GlowEnabled = scriptTable.config.glowEnabled \n        envTable.ChangeNameplateColor = scriptTable.config.changeNameplateColor;\n        envTable.TimeLeftToBlink = scriptTable.config.timeleftToBlink;\n        envTable.BlinkSpeed = scriptTable.config.blinkSpeed; \n        envTable.BlinkColor = scriptTable.config.blinkColor; \n        envTable.BlinkMaxAlpha = scriptTable.config.blinkMaxAlpha; \n        envTable.NameplateColor = scriptTable.config.nameplateColor; \n        \n        --text color\n        envTable.TimerColorEnabled = scriptTable.config.timerColorEnabled \n        envTable.TimeLeftWarning = scriptTable.config.timeLeftWarning;\n        envTable.TimeLeftCritical = scriptTable.config.timeLeftCritical;\n        envTable.TextColor_Warning = scriptTable.config.warningColor; \n        envTable.TextColor_Critical = scriptTable.config.criticalColor; \n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
			["Time"] = 1604354808,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
			["Enabled"] = true,
			["Revision"] = 331,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "					function (scriptTable)\n						--insert code here\n						\n					end\n				",
			["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option10",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option17",
					["Value"] = "Enter the spell name or spellID in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 17",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Key"] = "blinkEnabled",
					["Value"] = true,
					["Name"] = "Blink Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable blink",
				}, -- [4]
				{
					["Type"] = 4,
					["Key"] = "glowEnabled",
					["Value"] = true,
					["Name"] = "Glow Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable glows",
				}, -- [5]
				{
					["Type"] = 4,
					["Key"] = "changeNameplateColor",
					["Value"] = true,
					["Name"] = "Change NamePlate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'true' to enable nameplate color change",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "in seconds, affects the blink effect only",
					["Min"] = 1,
					["Fraction"] = true,
					["Value"] = 3,
					["Name"] = "Timeleft to Blink",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeleftToBlink",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 3,
					["Desc"] = "time to complete a blink loop",
					["Min"] = 0.5,
					["Fraction"] = true,
					["Value"] = 1,
					["Name"] = "Blink Speed",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "blinkSpeed",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "max transparency in the animation loop (1.0 is full opaque)",
					["Min"] = 0.1,
					["Fraction"] = true,
					["Value"] = 0.6,
					["Name"] = "Blink Max Alpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "blinkMaxAlpha",
				}, -- [9]
				{
					["Type"] = 1,
					["Key"] = "blinkColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Blink Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color of the blink",
				}, -- [10]
				{
					["Type"] = 1,
					["Key"] = "",
					["Value"] = {
						0.2862745098039216, -- [1]
						0.00392156862745098, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Nameplate Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "nameplate color if ChangeNameplateColor is true",
				}, -- [11]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option10",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 4,
					["Key"] = "timerColorEnabled",
					["Value"] = true,
					["Name"] = "Timer Color Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "set to 'false' to disable changes in the color of the time left text",
				}, -- [13]
				{
					["Type"] = 2,
					["Max"] = 20,
					["Desc"] = "in seconds, affects the color of the text",
					["Min"] = 1,
					["Name"] = "Time Left Warning",
					["Value"] = 8,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeLeftWarning",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "in seconds, affects the color of the text",
					["Min"] = 1,
					["Name"] = "Time Left Critical",
					["Value"] = 3,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "timeLeftCritical",
				}, -- [15]
				{
					["Type"] = 1,
					["Key"] = "warningColor",
					["Value"] = {
						1, -- [1]
						0.8705882352941177, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Warning Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color when the time left entered in a warning zone",
				}, -- [16]
				{
					["Type"] = 1,
					["Key"] = "criticalColor",
					["Value"] = {
						1, -- [1]
						0.07450980392156863, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Critical Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "color when the time left is critical",
				}, -- [17]
			},
			["version"] = -1,
			["Name"] = "Aura - Blink by Time Left [Plater]",
			["NpcNames"] = {
			},
		}, -- [10]
		{
			["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
			["Time"] = 1543680853,
			["Icon"] = 133006,
			["Enabled"] = false,
			["Revision"] = 45,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
			["Name"] = "Aura - Border Color [Plater]",
			["PlaterCore"] = 1,
			["SpellIds"] = {
			},
			["NpcNames"] = {
			},
			["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
		}, -- [11]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
			["Time"] = 1578054190,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
			["Icon"] = 136048,
			["Enabled"] = true,
			["Revision"] = 133,
			["Options"] = {
			},
			["Author"] = "Celian-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Name"] = "UnitPower [Plater]",
			["Desc"] = "Show the energy amount above the nameplate",
			["NpcNames"] = {
				"Guardian of Yogg-Saron", -- [1]
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
		}, -- [12]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    --envTable.movingArrow.color = scriptTable.config.arrowColor\n    envTable.movingArrow:SetAlpha (scriptTable.config.arrowAlpha)\n    envTable.movingArrow:SetDesaturated (scriptTable.config.desaturateArrow)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    envTable.arrowAnimation = envTable.arrowAnimation or Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.20, self:GetWidth()-16, 0)\n    \n    envTable.arrowAnimation:SetDuration(scriptTable.config.animSpeed)\nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend",
			["Time"] = 1604599443,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_frontal",
			["Enabled"] = true,
			["Revision"] = 460,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
			["SpellIds"] = {
				255952, -- [1]
				257426, -- [2]
				274400, -- [3]
				272609, -- [4]
				269843, -- [5]
				269029, -- [6]
				272827, -- [7]
				269266, -- [8]
				263912, -- [9]
				264923, -- [10]
				258864, -- [11]
				256955, -- [12]
				265540, -- [13]
				260793, -- [14]
				270003, -- [15]
				270507, -- [16]
				257337, -- [17]
				268415, -- [18]
				275907, -- [19]
				268865, -- [20]
				260669, -- [21]
				260280, -- [22]
				253239, -- [23]
				265541, -- [24]
				250258, -- [25]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Produces an effect to indicate the spell will hit players in front of the enemy.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Key"] = "option4",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option3",
					["Value"] = 0,
					["Name"] = "Option 3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Set the alpha of the moving arrow",
					["Min"] = 0,
					["Name"] = "Arrow Alpha",
					["Value"] = 0.275,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowAlpha",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Time that takes for an arrow to travel from the to right.",
					["Min"] = 0,
					["Name"] = "Animation Speed",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "animSpeed",
				}, -- [6]
				{
					["Type"] = 4,
					["Key"] = "desaturateArrow",
					["Value"] = false,
					["Name"] = "Use White Arrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the arrow color will be desaturated.",
				}, -- [7]
			},
			["version"] = -1,
			["Name"] = "Cast - Frontal Cone [Plater]",
			["NpcNames"] = {
			},
		}, -- [13]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n--165560 = Gormling Larva - MTS\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        envTable.FixateTarget:Show();\n        envTable.FixateIcon:Show();\n    end    \nend\n\n\n",
			["Time"] = 1604239880,
			["url"] = "",
			["Icon"] = 1029718,
			["Enabled"] = true,
			["Revision"] = 269,
			["semver"] = "",
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n\n\n\n\n",
			["Desc"] = "Show above the nameplate who is the player fixated",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Fixate [Plater]",
			["NpcNames"] = {
			},
		}, -- [14]
		{
			["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [321891] = \"Freeze Tag Fixation\", --Illusionary Vulpin - MTS\n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604087921,
			["url"] = "",
			["Icon"] = 841383,
			["Enabled"] = true,
			["Revision"] = 266,
			["semver"] = "",
			["Author"] = "Tecno-Azralon",
			["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["SpellIds"] = {
				"spawn of g'huun", -- [1]
				"smuggled crawg", -- [2]
				"sergeant bainbridge", -- [3]
				"blacktooth scrapper", -- [4]
				"irontide grenadier", -- [5]
				"feral bloodswarmer", -- [6]
				"earthrager", -- [7]
				"crawler mine", -- [8]
				"rezan", -- [9]
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Fixate On You [Plater]",
			["NpcNames"] = {
				"smuggled crawg", -- [1]
				"sergeant bainbridge", -- [2]
				"blacktooth scrapper", -- [3]
				"irontide grenadier", -- [4]
				"feral bloodswarmer", -- [5]
				"earthrager", -- [6]
				"crawler mine", -- [7]
				"rezan", -- [8]
				"136461", -- [9]
			},
		}, -- [15]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TextSize = 12\n    envTable.TextFont  = \"Gotham Ultra\"\n    envTable.Xoffset = 0\n    envTable.Yoffset = -12\n    \n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"center\", unitFrame.healthBar, \"center\", envTable.Xoffset, envTable.Yoffset);    \n    \n    envTable.FixateTarget.textsize = envTable.TextSize\n    envTable.FixateTarget.textfont = envTable.TextFont\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    \n    \nend\n\n\n",
			["ScriptType"] = 3,
			["Temp_Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Time"] = 1605189097,
			["Icon"] = 1029718,
			["url"] = "https://wago.io/cQbyWpQeE/3",
			["NpcNames"] = {
				"Earthrager", -- [1]
				"Spiteful Shade", -- [2]
				"Carrion Worm", -- [3]
			},
			["semver"] = "1.0.2",
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    \n    \nend\n\n\n",
			["Revision"] = 302,
			["Options"] = {
			},
			["version"] = 3,
			["Prio"] = 99,
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    \n    \nend\n\n\n",
			["Name"] = "Fixate No cast",
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        \n        \n    else \n        envTable.FixateTarget.text = \"\"\n        \n    end    \nend\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				272584, -- [1]
				244653, -- [2]
				260954, -- [3]
				257739, -- [4]
				257314, -- [5]
				266107, -- [6]
				257582, -- [7]
				262377, -- [8]
				257407, -- [9]
			},
			["PlaterCore"] = 1,
			["Desc"] = "Show above the nameplate who is the player fixated",
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TextSize = 12\n    envTable.TextFont  = \"Gotham Ultra\"\n    envTable.Xoffset = 0\n    envTable.Yoffset = -12\n    \n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"center\", unitFrame.healthBar, \"center\", envTable.Xoffset, envTable.Yoffset);    \n    \n    envTable.FixateTarget.textsize = envTable.TextSize\n    envTable.FixateTarget.textfont = envTable.TextFont\n    \n    \n    \nend\n\n\n\n\n\n\n\n\n",
			["Enabled"] = true,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n        \n        \n        \n    else \n        envTable.FixateTarget.text = \"\"\n        \n    end    \nend\n\n\n\n\n\n\n\n\n",
		}, -- [16]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = scriptTable.config.castBarHeight\n    envTable.ShowArrow = scriptTable.config.showArrow\n    envTable.ArrowAlpha = scriptTable.config.arrowAlpha\n    envTable.HealthBarColor = scriptTable.config.healthBarColor\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\AddOns\\Plater\\images\\spark3]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = scriptTable.config.arrowWidth\n    envTable.topArrow.height = scriptTable.config.arrowHeight\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = scriptTable.config.shakeAmplitude\n    envTable.FrameShake.OriginalDuration = scriptTable.config.shakeDuration\n    envTable.FrameShake.OriginalFrequency = scriptTable.config.shakeFrequency\nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, envTable.dotAnimation)\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-9, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\nend\n\n\n",
			["Time"] = 1604617977,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_red",
			["Enabled"] = true,
			["Revision"] = 513,
			["semver"] = "",
			["Author"] = "Bombad�o-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Used on casts that make the mob explode or transform if the cast passes.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 5\n    \n    envTable.dotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotColor, scriptTable.config.xOffset, scriptTable.config.yOffset)\n    \n    \nend",
			["SpellIds"] = {
				332329, -- [1]
				320103, -- [2]
				321406, -- [3]
				335817, -- [4]
				321061, -- [5]
				320141, -- [6]
				326171, -- [7]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Option 1",
					["Value"] = 0,
					["Key"] = "option1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 2",
					["Value"] = "Plays a special animation showing the explosion time.",
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Name"] = "Option 3",
					["Value"] = 0,
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "Increases the health bar height by this value",
					["Min"] = 0,
					["Fraction"] = false,
					["Value"] = 3,
					["Key"] = "castBarHeight",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Health Bar Height Mod",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Health Bar Color",
					["Value"] = {
						1, -- [1]
						0.5843137254901961, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "healthBarColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Changes the health bar color to this one.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 7",
					["Value"] = 0,
					["Key"] = "option7",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 5,
					["Name"] = "Arrow:",
					["Value"] = "Arrow:",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 4,
					["Name"] = "Show Arrow",
					["Value"] = true,
					["Key"] = "showArrow",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Show an arrow above the nameplate showing the cast bar progress.",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Arrow alpha.",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.5,
					["Key"] = "arrowAlpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Arrow Alpha",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Width.",
					["Min"] = 4,
					["Name"] = "Arrow Width",
					["Value"] = 8,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "arrowWidth",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 12,
					["Desc"] = "Arrow Height.",
					["Min"] = 4,
					["Fraction"] = false,
					["Value"] = 8,
					["Key"] = "arrowHeight",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Arrow Height",
				}, -- [11]
				{
					["Type"] = 6,
					["Name"] = "Option 13",
					["Value"] = 0,
					["Key"] = "option13",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [12]
				{
					["Type"] = 5,
					["Name"] = "Dot Animation:",
					["Value"] = "Dot Animation:",
					["Key"] = "option12",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [13]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.615686274509804, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Adjust the color of the dot animation.",
				}, -- [14]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot X Offset",
					["Min"] = -10,
					["Name"] = "Dot X Offset",
					["Value"] = 4,
					["Key"] = "xOffset",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Fraction"] = false,
				}, -- [15]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Dot Y Offset",
					["Min"] = -10,
					["Key"] = "yOffset",
					["Value"] = 3,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Dot Y Offset",
				}, -- [16]
			},
			["version"] = -1,
			["Name"] = "Cast - Ultra Important [P]",
			["NpcNames"] = {
			},
		}, -- [17]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    --check for marks\n    function  envTable.CheckMark (unitId, unitFrame)\n        if (not GetRaidTargetIndex(unitId)) then\n            if (scriptTable.config.onlyInCombat) then\n                if (not UnitAffectingCombat(unitId)) then\n                    return\n                end                \n            end\n            \n            SetRaidTarget(unitId, 8)\n        end       \n    end\nend\n\n\n--163520 - forsworn squad-leader\n--163618 - zolramus necromancer - The Necrotic Wake\n--164506 - anciet captain - theater of pain\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n",
			["Time"] = 1604696441,
			["url"] = "",
			["Icon"] = "Interface\\Worldmap\\GlowSkull_64Grey",
			["Enabled"] = true,
			["Revision"] = 63,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Auto set skull marker",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.CheckMark (unitId, unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 5,
					["Key"] = "option1",
					["Value"] = "Auto set a raid target Skull on the unit.",
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Key"] = "option2",
					["Value"] = 0,
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 4,
					["Key"] = "onlyInCombat",
					["Value"] = false,
					["Name"] = "Only in Combat",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "Set the mark only if the unit is in combat.",
				}, -- [3]
			},
			["version"] = -1,
			["Name"] = "Auto Set Skull",
			["NpcNames"] = {
				"163520", -- [1]
				"163618", -- [2]
				"164506", -- [3]
			},
		}, -- [18]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n--[=[\n\n154564 - debug\n\n168098 - empowered coldheart agent\n156212 - coldheart agent\n\n\n\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    --check if can change the nameplate color\n    if (scriptTable.config.changeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, scriptTable.config.nameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1604607993,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\skullbones_64",
			["Enabled"] = true,
			["Revision"] = 406,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    Plater.StopDotAnimation(unitFrame.healthBar, unitFrame.healthBar.MainTargetDotAnimation)\n    \n    unitFrame.healthBar.MainTargetDotAnimation = Plater.PlayDotAnimation(unitFrame.healthBar, 2, scriptTable.config.dotsColor, 3, 4) \n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + scriptTable.config.nameplateSizeOffset)\n    \nend\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Name"] = "Option 6",
					["Value"] = "Enter the npc name or npcId in the \"Add Trigger\" box and hit \"Add\".",
					["Key"] = "option6",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 4,
					["Name"] = "Change Nameplate Color",
					["Value"] = true,
					["Key"] = "changeNameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "change to true to change the color",
				}, -- [4]
				{
					["Type"] = 1,
					["Name"] = "Nameplate Color",
					["Value"] = {
						1, -- [1]
						0, -- [2]
						0.5254901960784314, -- [3]
						1, -- [4]
					},
					["Key"] = "nameplateColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 2,
					["Max"] = 6,
					["Desc"] = "increase the nameplate height by this value",
					["Min"] = 0,
					["Key"] = "nameplateSizeOffset",
					["Value"] = 0,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Nameplate Size Offset",
				}, -- [6]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 1,
					["Name"] = "Dot Color",
					["Value"] = {
						1, -- [1]
						0.7137254901960784, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Key"] = "dotsColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [8]
				{
					["Type"] = 6,
					["Name"] = "Blank Space",
					["Value"] = 0,
					["Key"] = "option4",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [9]
			},
			["version"] = -1,
			["Name"] = "Unit - Main Target [P]",
			["NpcNames"] = {
				"156212", -- [1]
				"168098", -- [2]
			},
		}, -- [19]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.npcInfo = {\n        [164427] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"1\", name = \"Boom!\"}, --reanimated warrior - plaguefall\n        \n        [164414] = {secondCastBar = true, timer = 20, timerId = 321247, altCastId = \"2\", name = \"Boom!\"}, --reanimated mage - plaguefall\n        \n        [164185] = {secondCastBar = true, timer = 20, timerId = 319941, altCastId = \"3\", remaining = 5, name = GetSpellInfo(319941)}, --Echelon - Halls of Atonement\n        \n        [164567] = {secondCastBar = true, altCastId = \"dromanswrath\", debuffTimer = 323059, name = GetSpellInfo(323059), spellIcon = 323059}, --Ingra Maloch -- tirna scythe\n        \n        [165408] = {secondCastBar = true, timer = 20, timerId = 322711, altCastId = \"4\", remaining = 5, name = GetSpellInfo(322711)}, --Halkias - Refracted Sinlight - Halls of Atonement\n        \n        \n        --[154564] = {secondCastBar = true, timerId = \"Test Bar\", altCastId = \"debugcast\", remaining = 5, name = GetSpellInfo(319941), spellIcon = 319941}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n        --[154580] = {secondCastBar = true, altCastId = \"debugcast\", debuffTimer = 204242, name = GetSpellInfo(81297), spellIcon = 81297}, --debug \"Test (1)\" BW \"Test Bar\" DBM --DEBUG\n    }\n    \n    --set the castbar config\n    local config = {\n        iconTexture = \"\",\n        iconTexcoord = {0.1, 0.9, 0.1, 0.9},\n        iconAlpha = 1,\n        iconSize = 14,\n        \n        text = \"Boom!\",\n        textSize = 9,\n        \n        texture = [[Interface\\AddOns\\Plater\\images\\bar_background]],\n        color = \"silver\",\n        \n        isChanneling = false,\n        canInterrupt = false,\n        \n        height = 2,\n        width = Plater.db.profile.plate_config.enemynpc.health_incombat[1],\n        \n        spellNameAnchor = {side = 3, x = 0, y = -2},\n        timerAnchor = {side = 5, x = 0, y = -2},\n    }    \n    \n    function envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, customTime, customStart)\n        --show the cast bar\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                if (npcInfo.remaining) then\n                    local timeLeft = barObject.timer + barObject.start - GetTime()\n                    if (timeLeft > npcInfo.remaining) then\n                        return\n                    end\n                end\n                \n                config.text = npcInfo.name\n                \n                if (npcInfo.spellIcon) then\n                    local _, _, iconTexture = GetSpellInfo(npcInfo.spellIcon)\n                    config.iconTexture = iconTexture\n                else\n                    config.iconTexture = \"\"\n                end\n                \n                Plater.SetAltCastBar(unitFrame.PlateFrame, config, barObject.timer, customStart or barObject.start, npcInfo.altCastId)\n            end\n        else\n            Plater.SetAltCastBar(unitFrame.PlateFrame, config, customTime or npcInfo.timer, customStart, npcInfo.altCastId)            \n        end\n        \n        DetailsFramework:TruncateText(unitFrame.castBar2.Text, unitFrame.castBar2:GetWidth() - 16)\n    end\nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    Plater.ClearAltCastBar(unitFrame.PlateFrame)\nend",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.timerId) then\n            local barObject = Plater.GetBossTimer(npcInfo.timerId)\n            if (barObject) then\n                local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                if (altCastId ~= npcInfo.altCastId or not unitFrame.castBar2:IsShown()) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n                end\n            end \n            \n        elseif (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                --get the debuff timeleft\n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                local startTime = expirationTime - duration\n                \n                if (not unitFrame.castBar2:IsShown() or unitFrame.castBar2.spellStartTime < startTime) then\n                    envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, startTime)\n                end\n                \n            else \n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604354364,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\Images\\countdown_bar_icon",
			["Enabled"] = true,
			["Revision"] = 206,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Some units has special events without a clear way to show. This script adds a second cast bar to inform the user about it.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    local npcInfo = envTable.npcInfo[envTable._NpcID]\n    \n    if (npcInfo and npcInfo.secondCastBar) then\n        if (npcInfo.debuffTimer) then\n            if (Plater.NameplateHasAura (unitFrame, npcInfo.debuffTimer)) then\n                \n                local name = npcInfo.name\n                local _, _, _, _, duration, expirationTime = AuraUtil.FindAuraByName(name, unitId, \"DEBUFF\")\n                \n                envTable.ShowAltCastBar(npcInfo, unitFrame, unitId, duration, expirationTime-duration)\n            else\n                if (unitFrame.castBar2:IsShown()) then\n                    local altCastId = Plater.GetAltCastBarAltId(unitFrame.PlateFrame)\n                    if (altCastId == npcInfo.altCastId) then\n                        Plater.ClearAltCastBar(unitFrame.PlateFrame)\n                    end                   \n                end                              \n            end\n        else\n            envTable.ShowAltCastBar(npcInfo, unitFrame, unitId)\n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["version"] = -1,
			["Name"] = "Countdown",
			["NpcNames"] = {
				"164427", -- [1]
				"164414", -- [2]
				"164185", -- [3]
				"164567", -- [4]
				"165408", -- [5]
			},
		}, -- [20]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \n    envTable.lifePercent = {\n        --npcId         percent divisions\n        [154564] = {80, 30},   --debug\n        [164451] = {40}, --dessia the decapirator - theater of pain\n        [164463] = {40}, --Paceran the Virulent - theater of pain\n        [164461] = {40}, -- Sathel the Accursed - theater of pain\n        [165946]= {50}, -- ~mordretha - thather of pain\n        [164501] = {70, 40, 10}, --mistcaller - tina scythe\n        [164218] = {70, 40}, --Lord Chamberlain - Halls of Atonement\n    }\n    \n    function envTable.CreateMarker(unitFrame)\n        unitFrame.healthMarker = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthMarker:SetColorTexture(1, 1, 1)\n        unitFrame.healthMarker:SetSize(1, unitFrame.healthBar:GetHeight())\n        \n        unitFrame.healthOverlay = unitFrame.healthBar:CreateTexture(nil, \"overlay\")\n        unitFrame.healthOverlay:SetColorTexture(1, 1, 1)\n        unitFrame.healthOverlay:SetSize(1, unitFrame.healthBar:GetHeight())\n    end\n    \n    function envTable.UpdateMarkers(unitFrame)\n        local markersTable = envTable.lifePercent[envTable._NpcID]\n        if (markersTable) then\n            local unitLifePercent = envTable._HealthPercent / 100\n            for i, percent in ipairs(markersTable) do\n                percent = percent / 100\n                if (unitLifePercent > percent) then\n                    if (not unitFrame.healthMarker) then\n                        envTable.CreateMarker(unitFrame)\n                    end\n                    \n                    unitFrame.healthMarker:Show()\n                    local width = unitFrame.healthBar:GetWidth()\n                    unitFrame.healthMarker:SetPoint(\"left\", unitFrame.healthBar, \"left\", width*percent, 0)\n                    \n                    local overlaySize = width * (unitLifePercent - percent)\n                    unitFrame.healthOverlay:SetWidth(overlaySize)\n                    unitFrame.healthOverlay:SetPoint(\"left\", unitFrame.healthMarker, \"right\", 0, 0)\n                    \n                    unitFrame.healthMarker:SetVertexColor(Plater:ParseColors(scriptTable.config.indicatorColor))\n                    unitFrame.healthMarker:SetAlpha(scriptTable.config.indicatorAlpha)\n                    \n                    unitFrame.healthOverlay:SetVertexColor(Plater:ParseColors(scriptTable.config.fillColor))\n                    unitFrame.healthOverlay:SetAlpha(scriptTable.config.fillAlpha)\n                    \n                    return\n                end\n            end --end for\n            \n            if (unitFrame.healthMarker:IsShown()) then\n                unitFrame.healthMarker:Hide()\n                unitFrame.healthOverlay:Hide()\n            end\n        end\n    end\nend      \n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    if (unitFrame.healthMarker) then\n        unitFrame.healthMarker:Hide()\n        unitFrame.healthOverlay:Hide()\n    end\nend\n\n\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["Time"] = 1604354628,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\health_indicator",
			["Enabled"] = true,
			["Revision"] = 108,
			["semver"] = "",
			["Author"] = "Aelerolor-Torghast",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Place a marker into the health bar to indicate when the unit will change phase or cast an important spell.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    envTable.UpdateMarkers(unitFrame)\nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 5,
					["Key"] = "option1",
					["Value"] = "Add markers into the health bar to remind you about boss abilities at life percent.",
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 6,
					["Key"] = "",
					["Value"] = 0,
					["Name"] = "blank line",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 1,
					["Key"] = "indicatorColor",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Vertical Line Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Indicator color.",
				}, -- [3]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Indicator alpha.",
					["Min"] = 0.1,
					["Name"] = "Vertical Line Alpha",
					["Value"] = 0.79,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "indicatorAlpha",
				}, -- [4]
				{
					["Type"] = 6,
					["Name"] = "blank line",
					["Value"] = 0,
					["Key"] = "",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [5]
				{
					["Type"] = 1,
					["Name"] = "Fill Color",
					["Value"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Key"] = "fillColor",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Fill color.",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "Fill alpha.",
					["Min"] = 0,
					["Fraction"] = true,
					["Value"] = 0.2,
					["Key"] = "fillAlpha",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Name"] = "Fill Alpha",
				}, -- [7]
			},
			["version"] = -1,
			["Name"] = "Unit - Health Markers [P]",
			["NpcNames"] = {
				"164451", -- [1]
				"164463", -- [2]
				"164461", -- [3]
				"165946", -- [4]
				"164501", -- [5]
				"164218", -- [6]
			},
		}, -- [21]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = scriptTable.config.castbarColor\n    \n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = scriptTable.config.flashDuration\n    \n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = scriptTable.config.castBarHeight\n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, scriptTable.config.shakeDuration, scriptTable.config.shakeAmplitude, scriptTable.config.shakeFrequency, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    envTable.BackgroundFlash.fadeIn = envTable.BackgroundFlash.fadeIn or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    envTable.BackgroundFlash.fadeIn:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    envTable.BackgroundFlash.fadeOut = envTable.BackgroundFlash.fadeOut or Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    envTable.BackgroundFlash.fadeOut:SetDuration(CONFIG_BACKGROUND_FLASH_DURATION/2)\n    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()    \n    \n    \n    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    unitFrame.castBar:SetHeight (envTable._DefaultHeight)\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \nend\n\n\n",
			["Time"] = 1604593143,
			["url"] = "",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar_tank",
			["Enabled"] = true,
			["Revision"] = 833,
			["semver"] = "",
			["Author"] = "Tercioo-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend",
			["Desc"] = "Cast alert for abilities which only the tank can interrupt.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    if (not Plater.IsPlayerTank()) then\n        return\n    end\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --envTable.currentHeight = unitFrame.castBar:GetHeight()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        if (scriptTable.config.useCastbarColor) then\n            self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n        end\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \n    unitFrame.castBar.Spark:SetHeight(unitFrame.castBar:GetHeight())\n    \nend\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				321828, -- [1]
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Blank Line",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option2",
					["Value"] = "Produces a notable effect in the cast bar when a spell from the 'Triggers' starts to cast.",
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Key"] = "option3",
					["Value"] = "Enter the spell name or spellID of the Spell in the Add Trigger box and hit \"Add\".",
					["Name"] = "Option 3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option4",
					["Value"] = 0,
					["Name"] = "Blank Space",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Key"] = "useCastbarColor",
					["Value"] = true,
					["Name"] = "Cast Bar Color Enabled",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "When enabled, changes the cast bar color,",
				}, -- [5]
				{
					["Type"] = 1,
					["Key"] = "castbarColor",
					["Value"] = {
						1, -- [1]
						0.4313725490196079, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["Name"] = "Cast Bar Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the cast bar.",
				}, -- [6]
				{
					["Type"] = 6,
					["Key"] = "option7",
					["Value"] = 0,
					["Name"] = "Blank Line",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [7]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts it flash rapidly, adjust how fast it flashes. Value is milliseconds.",
					["Min"] = 0.05,
					["Name"] = "Flash Duration",
					["Value"] = 0.2,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "flashDuration",
				}, -- [8]
				{
					["Type"] = 2,
					["Max"] = 10,
					["Desc"] = "Increases the cast bar height by this value",
					["Min"] = 0,
					["Name"] = "Cast Bar Height Mod",
					["Value"] = 0,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "castBarHeight",
				}, -- [9]
				{
					["Type"] = 2,
					["Max"] = 1,
					["Desc"] = "When the cast starts, there's a small shake in the nameplate, this settings controls how long it takes.",
					["Min"] = 0.1,
					["Name"] = "Shake Duration",
					["Value"] = 0.1,
					["Fraction"] = true,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeDuration",
				}, -- [10]
				{
					["Type"] = 2,
					["Max"] = 200,
					["Desc"] = "How strong is the shake.",
					["Min"] = 10,
					["Fraction"] = false,
					["Value"] = 25,
					["Name"] = "Shake Amplitude",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeAmplitude",
				}, -- [11]
				{
					["Type"] = 2,
					["Max"] = 80,
					["Desc"] = "How fast the shake moves.",
					["Min"] = 1,
					["Fraction"] = false,
					["Value"] = 30,
					["Name"] = "Shake Frequency",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "shakeFrequency",
				}, -- [12]
			},
			["version"] = -1,
			["Name"] = "Cast - Tank Interrupt [P]",
			["NpcNames"] = {
			},
		}, -- [22]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);    \n    \n    envTable.EnergyAmount.fontsize = scriptTable.config.fontSize\n    envTable.EnergyAmount.fontcolor = scriptTable.config.fontColor\n    envTable.EnergyAmount.outline = scriptTable.config.outline\n    \n    \nend\n\n--[=[\n\n164406 = Shriekwing\n164407 = Sludgefist\n162100 = kryxis the voracious\n162099 = general kaal - sanguine depths\n162329 = Xav the Unfallen - threater of pain\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    \n    local currentPower = UnitPower(unitId)\n    \n    if (currentPower and currentPower > 0) then\n        local maxPower = UnitPowerMax (unitId)\n        local percent = floor (currentPower / maxPower * 100)\n        \n        envTable.EnergyAmount.text = \"\" .. percent;\n        \n        if (scriptTable.config.showLater) then\n            local alpha = (percent -80) * 5\n            alpha = alpha / 100\n            alpha = max(0, alpha)\n            envTable.EnergyAmount:SetAlpha(alpha)\n            \n        else\n            envTable.EnergyAmount:SetAlpha(1.0)\n        end\n        \n        \n    else\n        envTable.EnergyAmount.text = \"\"\n    end\nend\n\n\n\n\n\n\n\n\n",
			["Time"] = 1604357453,
			["url"] = "",
			["Icon"] = 136048,
			["Enabled"] = true,
			["Revision"] = 233,
			["semver"] = "",
			["Author"] = "Celian-Sylvanas",
			["Initialization"] = "function (scriptTable)\n    --insert code here\n    \nend\n\n\n",
			["Desc"] = "Show the energy amount above the nameplate.",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 6,
					["Key"] = "option1",
					["Value"] = 0,
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [1]
				{
					["Type"] = 5,
					["Key"] = "option3",
					["Value"] = "Show the power of the unit above the nameplate.",
					["Name"] = "script desc",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [2]
				{
					["Type"] = 5,
					["Name"] = "add trigger",
					["Value"] = "Add the unit name or unitId in the \"Add Trigger\" field and press \"Add\".",
					["Key"] = "option3",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
					["Desc"] = "",
				}, -- [3]
				{
					["Type"] = 6,
					["Key"] = "option2",
					["Value"] = 0,
					["Name"] = "Option 2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [4]
				{
					["Type"] = 4,
					["Key"] = "showLater",
					["Value"] = true,
					["Name"] = "Show at 80% of Energy",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the energy won't start showing until the unit has 80% energy.",
				}, -- [5]
				{
					["Type"] = 6,
					["Name"] = "Option 2",
					["Value"] = 0,
					["Key"] = "option2",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
					["Desc"] = "",
				}, -- [6]
				{
					["Type"] = 2,
					["Max"] = 32,
					["Desc"] = "Text size.",
					["Min"] = 8,
					["Name"] = "Text Size",
					["Value"] = 16,
					["Fraction"] = false,
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
					["Key"] = "fontSize",
				}, -- [7]
				{
					["Type"] = 1,
					["Key"] = "fontColor",
					["Value"] = {
						0.803921568627451, -- [1]
						0.803921568627451, -- [2]
						0.803921568627451, -- [3]
						1, -- [4]
					},
					["Name"] = "Font Color",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "Color of the text.",
				}, -- [8]
				{
					["Type"] = 4,
					["Key"] = "outline",
					["Value"] = true,
					["Name"] = "Enable Text Outline",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
					["Desc"] = "If enabled, the text uses outline.",
				}, -- [9]
			},
			["version"] = -1,
			["Name"] = "Unit - Show Energy [Plater]",
			["NpcNames"] = {
				"164406", -- [1]
				"164407", -- [2]
				"162100", -- [3]
				"162099", -- [4]
				"162329", -- [5]
				"164558", -- [6]
			},
		}, -- [23]
	},
	["cast_statusbar_fadein_time"] = 0.0241608340293169,
	["target_shady_enabled"] = false,
	["aura2_y_offset"] = 30.95999145507813,
	["aura_timer_text_anchor"] = {
		["y"] = -0.5,
	},
	["buffs_on_aura2"] = true,
	["npc_cache"] = {
		[65414] = {
			"Ethereal Sha", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[155634] = {
			"Bound Storm", -- [1]
			"The Eternal Palace", -- [2]
		},
		[156146] = {
			"Voidbound Shieldbearer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[127485] = {
			"Bilge Rat Looter", -- [1]
			"Tol Dagor", -- [2]
		},
		[165872] = {
			"Flesh Crafter", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[151028] = {
			"Thornstalker Nydora", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[131577] = {
			"Spirit of Fire", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[34190] = {
			"Hardened Iron Golem", -- [1]
			"Ulduar", -- [2]
		},
		[62983] = {
			"Lei Shi", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[170480] = {
			"Atal'ai Deathwalker", -- [1]
			"De Other Side", -- [2]
		},
		[154612] = {
			"Unleashed Nightmare", -- [1]
			"The Eternal Palace", -- [2]
		},
		[151029] = {
			"Thornspeaker Tavery", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[102404] = {
			"Stoneclaw Grubmaster", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[164338] = {
			"Mawsworn Guard", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[127486] = {
			"Ashvane Officer", -- [1]
			"Tol Dagor", -- [2]
		},
		[169457] = {
			"Bargast", -- [1]
			"Castle Nathria", -- [2]
		},
		[145399] = {
			"Wild Starcaller", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[17803] = {
			"Coilfang Oracle", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[124927] = {
			"Jun-Ti", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[164339] = {
			"Mawsworn Bowman", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[136186] = {
			"Tidesage Spiritualist", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[56713] = {
			"Master Snowdrift", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[133627] = {
			"Tally Zapnabber", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[134139] = {
			"Shrine Templar", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[61448] = {
			"Sik'thik Soldier", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[53642] = {
			"Cinderweb Spinner", -- [1]
			"Firelands", -- [2]
		},
		[170483] = {
			"Atal'ai Deathwalker's Spirit", -- [1]
			"De Other Side", -- [2]
		},
		[140795] = {
			"Dunecircler the Bleak", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145402] = {
			"Frenzied Wildheart", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[110340] = {
			"Geisterbestie", -- [1]
			"Isle of Conquest", -- [2]
		},
		[164342] = {
			"Mawsworn Defender", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[173044] = {
			"Stitching Assistant", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[43917] = {
			"Rock Borer", -- [1]
			"The Stonecore", -- [2]
		},
		[44045] = {
			"Darkened Creation", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[52363] = {
			"Occu'thar", -- [1]
			"Baradin Hold", -- [2]
		},
		[136190] = {
			"Shadowy Rift", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140797] = {
			"Corpseharvest", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[170486] = {
			"Atal'ai Devoted", -- [1]
			"De Other Side", -- [2]
		},
		[146940] = {
			"Primordial Mindbender", -- [1]
			"Crucible of Storms", -- [2]
		},
		[135167] = {
			"Spectral Berserker", -- [1]
			"Kings' Rest", -- [2]
		},
		[160249] = {
			"Spike Tentacle", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[161273] = {
			"Abyssal Spawn", -- [1]
			"Chamber of Heart - Scenario", -- [2]
		},
		[154619] = {
			"Watcher Aum-ka", -- [1]
			"Halls of Origination", -- [2]
		},
		[164345] = {
			"Scavenging Soul Eater", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[164857] = {
			"Spriggan Mendbender", -- [1]
			"De Other Side", -- [2]
		},
		[140799] = {
			"Driftstalker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[76814] = {
			"Flamebender Ka'graz", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[54923] = {
			"Infinite Warden", -- [1]
			"End Time", -- [2]
		},
		[135169] = {
			"Spirit Drain Totem", -- [1]
			"The Underrot", -- [2]
		},
		[131586] = {
			"Banquet Steward", -- [1]
			"Waycrest Manor", -- [2]
		},
		[127490] = {
			"Knight Captain Valyri", -- [1]
			"Tol Dagor", -- [2]
		},
		[140800] = {
			"Cloudwing the Killthief", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[43662] = {
			"Unbound Earth Rager", -- [1]
			"The Stonecore", -- [2]
		},
		[142336] = {
			"Pygmy Octopus", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[155645] = {
			"Walkie Shockie X2", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[147967] = {
			"7th Legion Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[170490] = {
			"Atal'ai High Priest", -- [1]
			"De Other Side", -- [2]
		},
		[168443] = {
			"Zolramus Necromancer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[78351] = {
			"Uktar", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[13447] = {
			"Corporal Noreg Stormpike", -- [1]
			"Alterac Valley", -- [2]
		},
		[166396] = {
			"Noble Skirmisher", -- [1]
			"Sanguine Depths", -- [2]
		},
		[146945] = {
			"Swarming Voidspawn", -- [1]
			"Crucible of Storms", -- [2]
		},
		[100362] = {
			"Grasping Tentacle", -- [1]
			"Maw of Souls", -- [2]
		},
		[156159] = {
			"Coldheart Javelineer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[173051] = {
			"Suppressor Xelors", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[130307] = {
			"Unstable Typhoon", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[151041] = {
			"Etruvis the Vassal", -- [1]
			"Crucible of Storms", -- [2]
		},
		[168445] = {
			"Brittle Warrior", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[164862] = {
			"Weald Shimmermoth", -- [1]
			"De Other Side", -- [2]
		},
		[59915] = {
			"Jasper Guardian", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[162303] = {
			"Aqir Swarmkeeper", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[134150] = {
			"Runecarver Sorn", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[139269] = {
			"Gloom Horror", -- [1]
			"Waycrest Manor", -- [2]
		},
		[156161] = {
			"Inquisitor Gnshal", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[140293] = {
			"Snowfur Snarler", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[153090] = {
			"Lady Venomtongue", -- [1]
			"The Eternal Palace", -- [2]
		},
		[146436] = {
			"Tempting Siren", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[167935] = {
			"Contagious Droplet", -- [1]
			"Plaguefall", -- [2]
		},
		[140294] = {
			"Snowfur Wolf", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[153091] = {
			"Serena Scarscale", -- [1]
			"The Eternal Palace", -- [2]
		},
		[149508] = {
			"Ice Blocked Nathanos", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[53901] = {
			"Unstable Magma", -- [1]
			"Firelands", -- [2]
		},
		[138247] = {
			"Irontide Marauder", -- [1]
			"Siege of Boralus", -- [2]
		},
		[146949] = {
			"Sputtering Fleshrender", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[163841] = {
			"Amalgamation of Flesh", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[76306] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[153092] = {
			"Venna Seastorm", -- [1]
			"The Eternal Palace", -- [2]
		},
		[162306] = {
			"Aqir Drone", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[140296] = {
			"Dampfur the Musky", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[148998] = {
			"Furious Guardian Spirit", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[157700] = {
			"Agustus Moulaine", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[145927] = {
			"Starcaller Ellana", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[67093] = {
			"Sik'thik Battle-Mender", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[163331] = {
			"Stone Legion Nightblade", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[164355] = {
			"Manifestation of Pride", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[140297] = {
			"Nok-arak", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[56717] = {
			"Hoptallus", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[117769] = {
			"Felborne Spellbreaker", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[145928] = {
			"Skavis Nightstalker", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[53134] = {
			"Ancient Core Hound", -- [1]
			"Firelands", -- [2]
		},
		[126983] = {
			"Harlan Sweete", -- [1]
			"Freehold", -- [2]
		},
		[136203] = {
			"Danath Trollbane", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[149000] = {
			"Baleful Guardian Spirit", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[162309] = {
			"Kul'tharok", -- [1]
			"Theater of Pain", -- [2]
		},
		[96015] = {
			"Inquisitor Tormentorum", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[140299] = {
			"Ghostfang", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[169476] = {
			"Highway Serf", -- [1]
			"Halls of Atonement", -- [2]
		},
		[162310] = {
			"Hunter", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[146442] = {
			"Grunt", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[155656] = {
			"Misha", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[140300] = {
			"Ripshread", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153097] = {
			"Voidbound Shaman", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[43537] = {
			"Stonecore Earthshaper", -- [1]
			"The Stonecore", -- [2]
		},
		[162311] = {
			"Death Knight", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[134158] = {
			"Shadow-Borne Champion", -- [1]
			"Kings' Rest", -- [2]
		},
		[39954] = {
			"Twilight Shadow Weaver", -- [1]
			"Grim Batol", -- [2]
		},
		[140301] = {
			"Scarpaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[56718] = {
			"Hopper", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[145932] = {
			"Celestra Brightmoon", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[138254] = {
			"Irontide Powdershot", -- [1]
			"Siege of Boralus", -- [2]
		},
		[146956] = {
			"Ashen Deathguard", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[61453] = {
			"Mu'Shiba", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[123146] = {
			"Torn Spirit", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[136207] = {
			"Stromgarde Defender", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[149516] = {
			"Blackpaw", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[162313] = {
			"Mage", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[138255] = {
			"Ashvane Spotter", -- [1]
			"Siege of Boralus", -- [2]
		},
		[136208] = {
			"Stromgarde Arbalest", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[34196] = {
			"Rune Etched Sentry", -- [1]
			"Ulduar", -- [2]
		},
		[137232] = {
			"Entanglement", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[145934] = {
			"Ivan the Mad", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168457] = {
			"Stonewall Gargon", -- [1]
			"Sanguine Depths", -- [2]
		},
		[168969] = {
			"Gushing Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[136721] = {
			"Circle Spellweaver", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[137233] = {
			"Plague Toad", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[17805] = {
			"Coilfang Slavemaster", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[48906] = {
			"Blaze of the Heavens", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[170488] = {
			"Son of Hakkar", -- [1]
			"De Other Side", -- [2]
		},
		[164363] = {
			"Undying Stonefiend", -- [1]
			"Halls of Atonement", -- [2]
		},
		[131585] = {
			"Enthralled Guard", -- [1]
			"Waycrest Manor", -- [2]
		},
		[129802] = {
			"Earthrager", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[157709] = {
			"Dreliana", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[166411] = {
			"Forsworn Usurper", -- [1]
			"Spires of Ascension", -- [2]
		},
		[162828] = {
			"Corrosive Digester", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146960] = {
			"Shambling Deadeye", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[13320] = {
			"Commander Karl Philips", -- [1]
			"Alterac Valley", -- [2]
		},
		[135699] = {
			"Ashvane Jailer", -- [1]
			"Tol Dagor", -- [2]
		},
		[140789] = {
			"Spark Elemental", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[53648] = {
			"Inferno Hawk", -- [1]
			"Firelands", -- [2]
		},
		[174090] = {
			"Nathrian Hierarch", -- [1]
			"Castle Nathria", -- [2]
		},
		[162317] = {
			"Gorechop", -- [1]
			"Theater of Pain", -- [2]
		},
		[54544] = {
			"Echo of Tyrande", -- [1]
			"End Time", -- [2]
		},
		[151056] = {
			"Varanq'ul the Mighty", -- [1]
			"Crucible of Storms", -- [2]
		},
		[112655] = {
			"Celestial Acolyte", -- [1]
			"The Nighthold", -- [2]
		},
		[156145] = {
			"Burrowing Appendage", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[34069] = {
			"Molten Colossus", -- [1]
			"Ulduar", -- [2]
		},
		[34197] = {
			"Chamber Overseer", -- [1]
			"Ulduar", -- [2]
		},
		[140792] = {
			"Breakbeak Bonepicker", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[154128] = {
			"Blazing Elemental", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[97043] = {
			"Seacursed Slaver", -- [1]
			"Maw of Souls", -- [2]
		},
		[129547] = {
			"Blacktooth Knuckleduster", -- [1]
			"Freehold", -- [2]
		},
		[167949] = {
			"Plague-ridden Survivor", -- [1]
			"Plaguefall", -- [2]
		},
		[164861] = {
			"Spriggan Barkbinder", -- [1]
			"De Other Side", -- [2]
		},
		[168973] = {
			"High Torturer Darithos", -- [1]
			"Castle Nathria", -- [2]
		},
		[78352] = {
			"Battle Medic Rogg", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[174092] = {
			"Nathrian Gargon Rider", -- [1]
			"Castle Nathria", -- [2]
		},
		[60047] = {
			"Amethyst Guardian", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[149514] = {
			"Grimhorn", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[151058] = {
			"Bubbling Blood", -- [1]
			"Crucible of Storms", -- [2]
		},
		[39956] = {
			"Twilight Enforcer", -- [1]
			"Grim Batol", -- [2]
		},
		[883] = {
			"Deer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[136214] = {
			"Windspeaker Heldis", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[136181] = {
			"Volcano", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[174093] = {
			"Nathrian Ranger", -- [1]
			"Castle Nathria", -- [2]
		},
		[162320] = {
			"Shaman", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[150547] = {
			"Scrapbone Grunter", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[151059] = {
			"Eternal Guardian", -- [1]
			"Crucible of Storms", -- [2]
		},
		[156157] = {
			"Coldheart Ascendant", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[162319] = {
			"Paladin", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[162312] = {
			"Druid", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[127757] = {
			"Reanimated Honor Guard", -- [1]
			"Atal'Dazar", -- [2]
		},
		[164873] = {
			"Runestag Elderhorn", -- [1]
			"De Other Side", -- [2]
		},
		[154131] = {
			"Molten Fury", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[137716] = {
			"Bottom Feeder", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[54161] = {
			"Flame Archon", -- [1]
			"Firelands", -- [2]
		},
		[163857] = {
			"Plaguebound Devoted", -- [1]
			"Plaguefall", -- [2]
		},
		[139799] = {
			"Ironhull Apprentice", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[117264] = {
			"Maiden of Valor", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[34198] = {
			"Iron Mender", -- [1]
			"Ulduar", -- [2]
		},
		[165905] = {
			"Son of Hakkar", -- [1]
			"De Other Side", -- [2]
		},
		[62982] = {
			"Mindbender", -- [1]
			"Theater of Pain", -- [2]
		},
		[139284] = {
			"Plague Doctor", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[155156] = {
			"Jaina Proudmoore", -- [1]
			"The Eternal Palace", -- [2]
		},
		[154129] = {
			"Burning Emberguard", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[139800] = {
			"Galecaller Apprentice", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[168968] = {
			"Plaguebound Fallen", -- [1]
			"Plaguefall", -- [2]
		},
		[76310] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[168949] = {
			"Risen Bonesoldier", -- [1]
			"De Other Side", -- [2]
		},
		[26125] = {
			"Stoneleaper", -- [1]
			"Eye of the Storm", -- [2]
		},
		[95766] = {
			"Crazed Razorbeak", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[167955] = {
			"Sanguine Cadet", -- [1]
			"Sanguine Depths", -- [2]
		},
		[159764] = {
			"Jesh'ra", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[135706] = {
			"Bilge Rat Looter", -- [1]
			"Tol Dagor", -- [2]
		},
		[129550] = {
			"Bilge Rat Padfoot", -- [1]
			"Freehold", -- [2]
		},
		[130575] = {
			"Wandering Axebeak", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[161812] = {
			"Faceless Ruiner", -- [1]
			"Chamber of Heart - Scenario", -- [2]
		},
		[130318] = {
			"Slitherblade Prophet", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[118289] = {
			"Maiden of Vigilance", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[155158] = {
			"First Arcanist Thalyssra", -- [1]
			"The Eternal Palace", -- [2]
		},
		[118801] = {
			"Imp", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[144881] = {
			"Rescued Refugee", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[127503] = {
			"Overseer Korgus", -- [1]
			"Tol Dagor", -- [2]
		},
		[139804] = {
			"Venture Inspector", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[161813] = {
			"K'thir Assassin", -- [1]
			"Chamber of Heart - Scenario", -- [2]
		},
		[133660] = {
			"BomBot 9000", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134686] = {
			"Mature Krolusk", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[13318] = {
			"Commander Mortimer", -- [1]
			"Alterac Valley", -- [2]
		},
		[167956] = {
			"Dark Acolyte", -- [1]
			"Sanguine Depths", -- [2]
		},
		[133663] = {
			"Fanatical Headhunter", -- [1]
			"The Underrot", -- [2]
		},
		[80411] = {
			"Iron Marksman", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[34199] = {
			"Lightning Charged Iron Dwarf", -- [1]
			"Ulduar", -- [2]
		},
		[101398] = {
			"Psyfiend", -- [1]
			"Eye of the Storm", -- [2]
		},
		[130319] = {
			"Slitherblade Phalanx", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134173] = {
			"Animated Droplet", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[118804] = {
			"Domatrax", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[159767] = {
			"Sanguimar", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[152089] = {
			"Thrall", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[132126] = {
			"Gilded Priestess", -- [1]
			"Atal'Dazar", -- [2]
		},
		[140828] = {
			"Morningdew", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[161815] = {
			"K'thir Voidcaller", -- [1]
			"Chamber of Heart - Scenario", -- [2]
		},
		[162327] = {
			"Rogue", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[134174] = {
			"Shadow-Borne Witch Doctor", -- [1]
			"Kings' Rest", -- [2]
		},
		[155161] = {
			"Shandris Feathermoon", -- [1]
			"The Eternal Palace", -- [2]
		},
		[159768] = {
			"Deresh of the Nothingness", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139805] = {
			"Mechanical Guardhound", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129552] = {
			"Monzumi", -- [1]
			"Atal'Dazar", -- [2]
		},
		[140829] = {
			"Autumnbreeze", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[165911] = {
			"Loyal Creation", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[162328] = {
			"Warlock", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[130298] = {
			"Water Elemental", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[155162] = {
			"Lor'themar Theron", -- [1]
			"The Eternal Palace", -- [2]
		},
		[151579] = {
			"Shield Generator", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[139806] = {
			"Venture Demolitions Expert", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[133666] = {
			"Dizzy's Decoy", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136735] = {
			"Ashvane Marine", -- [1]
			"Tol Dagor", -- [2]
		},
		[72456] = {
			"Korgra the Snake", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[162329] = {
			"Xav the Unfallen", -- [1]
			"Theater of Pain", -- [2]
		},
		[95769] = {
			"Mindshattered Screecher", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[151068] = {
			"Tentacled Voidpriest", -- [1]
			"Crucible of Storms", -- [2]
		},
		[120851] = {
			"Hippogryph Lord Varah", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[131617] = {
			"Groundskeeper Lilith", -- [1]
			"Waycrest Manor", -- [2]
		},
		[136224] = {
			"Stromgarde Spellweaver", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[156653] = {
			"Coagulated Horror", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[165913] = {
			"Ghastly Parishioner", -- [1]
			"Halls of Atonement", -- [2]
		},
		[162330] = {
			"Demon Hunter", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[68129] = {
			"Ashtongue Shaman", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[155629] = {
			"Azsh'ari Stormbinder", -- [1]
			"The Eternal Palace", -- [2]
		},
		[151581] = {
			"Horrific Vision", -- [1]
			"The Eternal Palace", -- [2]
		},
		[139808] = {
			"Venture Oaf", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[43286] = {
			"Crystal Shard", -- [1]
			"The Stonecore", -- [2]
		},
		[59794] = {
			"Krik'thik Disruptor", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[53140] = {
			"Son of Flame", -- [1]
			"Firelands", -- [2]
		},
		[162331] = {
			"Corrupted Neuron", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[17802] = {
			"Coilfang Warrior", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[43658] = {
			"Frenzied Crocolisk", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[167962] = {
			"Defunct Dental Drill", -- [1]
			"De Other Side", -- [2]
		},
		[139809] = {
			"Venture Acquisitions Specialist", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168986] = {
			"Skeletal Raptor", -- [1]
			"De Other Side", -- [2]
		},
		[169498] = {
			"Plague Bomb", -- [1]
			"Plaguefall", -- [2]
		},
		[149535] = {
			"Icebound Image", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139810] = {
			"Venture Middle Manager", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[13257] = {
			"Murgot Deepforge", -- [1]
			"Alterac Valley", -- [2]
		},
		[134691] = {
			"Static-charged Dervish", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[167963] = {
			"Headless Client", -- [1]
			"De Other Side", -- [2]
		},
		[135715] = {
			"Ferocious Nightsaber", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140322] = {
			"Stonehusk Broodwatcher", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[153119] = {
			"Lesser Void Elemental", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[13577] = {
			"Stormpike Ram Rider Commander", -- [1]
			"Alterac Valley", -- [2]
		},
		[140272] = {
			"Forest-Strider", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[95771] = {
			"Dreadsoul Ruiner", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[104217] = {
			"Talixae Flamewreath", -- [1]
			"Court of Stars", -- [2]
		},
		[135204] = {
			"Spectral Hex Priest", -- [1]
			"Kings' Rest", -- [2]
		},
		[135716] = {
			"Nightsaber Hunter", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168988] = {
			"Overgrowth", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[168425] = {
			"Forsworn Annihilator", -- [1]
			"Spires of Ascension", -- [2]
		},
		[117782] = {
			"Eredar Bloodmage", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[155628] = {
			"Azsh'ari Oracle", -- [1]
			"The Eternal Palace", -- [2]
		},
		[155680] = {
			"Deephive Summoner", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[135717] = {
			"Wild Nightsaber", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[167965] = {
			"Lubricator", -- [1]
			"De Other Side", -- [2]
		},
		[139812] = {
			"Venture Producer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140324] = {
			"Stonehusk Harvester", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[164362] = {
			"Slimy Morsel", -- [1]
			"Plaguefall", -- [2]
		},
		[135719] = {
			"Duskrunner", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[60051] = {
			"Cobalt Guardian", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[95772] = {
			"Frenzied Nightclaw", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[104218] = {
			"Advisor Melandrus", -- [1]
			"Court of Stars", -- [2]
		},
		[167966] = {
			"Experimental Sludge", -- [1]
			"De Other Side", -- [2]
		},
		[135718] = {
			"Nightsaber Cub", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[24207] = {
			"Army of the Dead", -- [1]
			"Eye of the Storm", -- [2]
		},
		[161312] = {
			"Crushing Tendril", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[165919] = {
			"Skeletal Marauder", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[165408] = {
			"Halkias", -- [1]
			"Halls of Atonement", -- [2]
		},
		[36633] = {
			"Ice Sphere", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[53141] = {
			"Molten Surger", -- [1]
			"Firelands", -- [2]
		},
		[114712] = {
			"Runecarver Slave", -- [1]
			"Maw of Souls", -- [2]
		},
		[139814] = {
			"Merger Specialist Huzzle", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140271] = {
			"Severhorn", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140838] = {
			"Mischievous Flood", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[136713] = {
			"Highlands Laborer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[146963] = {
			"Shortufse Sapper", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[164897] = {
			"Fog Dweller", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[159266] = {
			"Portal Master", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[112665] = {
			"Nighthold Protector", -- [1]
			"The Nighthold", -- [2]
		},
		[135720] = {
			"Moon-Touched Huntress", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[152612] = {
			"Subjugator Klontzas", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140839] = {
			"Water Spirit", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[62995] = {
			"Animated Protector", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[130325] = {
			"Deepsea Viseclaw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[130581] = {
			"Sand-Eye", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135721] = {
			"Asha'ne", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[172064] = {
			"Unstable Larva", -- [1]
			"Plaguefall", -- [2]
		},
		[131626] = {
			"Wild Direhorn", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[45065] = {
			"Tol'vir Merchant", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[165410] = {
			"High Adjudicator Aleez", -- [1]
			"Halls of Atonement", -- [2]
		},
		[139818] = {
			"Security Officer Durk", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[147497] = {
			"Prelate Akk'al", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138281] = {
			"Faceless Corruptor", -- [1]
			"The Underrot", -- [2]
		},
		[156650] = {
			"Dark Manifestation", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[155685] = {
			"Deephive Soldier", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[135722] = {
			"Twilight Prowler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[32908] = {
			"Captured Mercenary Captain", -- [1]
			"Ulduar", -- [2]
		},
		[140841] = {
			"Snickering Ripple", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[126969] = {
			"Trothak", -- [1]
			"Freehold", -- [2]
		},
		[118523] = {
			"Huntress Kasparian", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[130582] = {
			"Despondent Scallywag", -- [1]
			"Tol Dagor", -- [2]
		},
		[80676] = {
			"Iron Flametwister", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[155686] = {
			"Azsh'ari Venomwatcher", -- [1]
			"The Eternal Palace", -- [2]
		},
		[135723] = {
			"Moonclaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[115226] = {
			"Ravenian", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140842] = {
			"Ebb", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[99358] = {
			"Rotheart Dryad", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[63508] = {
			"Xuen", -- [1]
			"Waycrest Manor", -- [2]
		},
		[154663] = {
			"Gnome-Eating Droplet", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[87841] = {
			"Grom'kar Firemender", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[129047] = {
			"Stromgarde Marksman", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[135724] = {
			"Brushstalker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129559] = {
			"Cutwater Duelist", -- [1]
			"Freehold", -- [2]
		},
		[140843] = {
			"Air Spirit", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[11658] = {
			"Molten Giant", -- [1]
			"Molten Core", -- [2]
		},
		[155689] = {
			"Zanj'ir Gladiator", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140845] = {
			"Playful Gust", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[134701] = {
			"Blood Effigy", -- [1]
			"The Underrot", -- [2]
		},
		[155688] = {
			"Azsh'ari Frostbinder", -- [1]
			"The Eternal Palace", -- [2]
		},
		[78116] = {
			"Elementale dell'Acqua", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[140332] = {
			"Chitterbore", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140844] = {
			"Zephis", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[99359] = {
			"Rotheart Keeper", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[140269] = {
			"Ulu'tale", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139757] = {
			"Sureshot Johnson", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[171557] = {
			"Shade of Bargast", -- [1]
			"Castle Nathria", -- [2]
		},
		[39962] = {
			"Twilight Stormbreaker", -- [1]
			"Grim Batol", -- [2]
		},
		[172581] = {
			"Slimelet", -- [1]
			"Theater of Pain", -- [2]
		},
		[165415] = {
			"Toiling Groundskeeper", -- [1]
			"Halls of Atonement", -- [2]
		},
		[64916] = {
			"Kor'thik Swarmguard", -- [1]
			"Heart of Fear", -- [2]
		},
		[125977] = {
			"Reanimation Totem", -- [1]
			"Atal'Dazar", -- [2]
		},
		[155684] = {
			"Depthcaller Xith'el", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[130584] = {
			"Gorespike", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[77605] = {
			"Whirling Dervish", -- [1]
			"Skyreach", -- [2]
		},
		[134144] = {
			"Living Current", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[127497] = {
			"Ashvane Warden", -- [1]
			"Tol Dagor", -- [2]
		},
		[140334] = {
			"Nightscale Coilfang", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[144941] = {
			"Akunda's Aspect", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[99360] = {
			"Vilethorn Blossom", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[168953] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[140847] = {
			"Earth Spirit", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[80677] = {
			"Iron Journeyman", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[155691] = {
			"Zanj'ir Wrangler", -- [1]
			"The Eternal Palace", -- [2]
		},
		[129305] = {
			"Rapacious Fathomjaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140335] = {
			"Nightscale Screecher", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[144942] = {
			"Spark Bot", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[82698] = {
			"Night-Twisted Devout", -- [1]
			"Highmaul", -- [2]
		},
		[148483] = {
			"Ancestral Avenger", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[159224] = {
			"Gryth'ax the Executioner", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[159275] = {
			"Portal Keeper", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[163882] = {
			"Decaying Flesh Giant", -- [1]
			"Plaguefall", -- [2]
		},
		[148488] = {
			"Unliving Augur", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140336] = {
			"Nightscale Wind Serpent", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[161286] = {
			"Dark Ritualist", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[109075] = {
			"Parasitic Lasher", -- [1]
			"The Nighthold", -- [2]
		},
		[153064] = {
			"Overzealous Hulk", -- [1]
			"The Eternal Palace", -- [2]
		},
		[129527] = {
			"Bilge Rat Buccaneer", -- [1]
			"Freehold", -- [2]
		},
		[168420] = {
			"Forsworn Champion", -- [1]
			"Spires of Ascension", -- [2]
		},
		[80422] = {
			"Iron Marksman", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[140849] = {
			"Pernicious Stonekin", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140337] = {
			"Nightscale Hatchling", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[144944] = {
			"Thirsting Bloodsucker", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[138219] = {
			"Blighted Haunter", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[139817] = {
			"Chief Engineer Zazzy", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[126216] = {
			"Zian-Ti Destroyer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[61334] = {
			"Cursed Mogu Sculpture", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[140798] = {
			"Cragcaw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140266] = {
			"Broken-Horn the Ancient", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140338] = {
			"Clutch Guardian Jinka'lo", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[162305] = {
			"Aqir Heartpiercer", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[102397] = {
			"Wrathlord Bulwark", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[127488] = {
			"Ashvane Flamecaster", -- [1]
			"Tol Dagor", -- [2]
		},
		[95779] = {
			"Festerhide Grizzly", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[62358] = {
			"Corrupt Droplet", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[112671] = {
			"Duskwatch Battle-Magus", -- [1]
			"The Nighthold", -- [2]
		},
		[140339] = {
			"Vale Terror", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[80423] = {
			"Thunderlord Beast-Tender", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[157231] = {
			"Shad'har the Insatiable", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[111112] = {
			"Ebulliant", -- [1]
			"The Nighthold", -- [2]
		},
		[133685] = {
			"Befouled Spirit", -- [1]
			"The Underrot", -- [2]
		},
		[131578] = {
			"Burning Exile", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[71712] = {
			"Despair Spawn", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[80409] = {
			"Markog Aba'dir", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[106785] = {
			"Bitterbrine Slave", -- [1]
			"Eye of Azshara", -- [2]
		},
		[168418] = {
			"Forsworn Inquisitor", -- [1]
			"Spires of Ascension", -- [2]
		},
		[39961] = {
			"Enslaved Water Spirit", -- [1]
			"Grim Batol", -- [2]
		},
		[131112] = {
			"Cutwater Striker", -- [1]
			"Tol Dagor", -- [2]
		},
		[145903] = {
			"Darkforged Crusader", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136246] = {
			"Stromgarde Faithful", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[132074] = {
			"Overseer Krix", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[45467] = {
			"Trogg Dweller", -- [1]
			"Grim Batol", -- [2]
		},
		[56472] = {
			"Fragrant Lotus", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[140341] = {
			"Cloudscraper", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144948] = {
			"Leatherwing Hunter", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[98813] = {
			"Bloodscent Felhound", -- [1]
			"Black Rook Hold", -- [2]
		},
		[140854] = {
			"Flow", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[29264] = {
			"Spirit Raptor", -- [1]
			"Deepwind Gorge", -- [2]
		},
		[130333] = {
			"Gritplate Basilisk", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[59544] = {
			"The Nodding Tiger", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[106786] = {
			"Bitterbrine Slave", -- [1]
			"Eye of Azshara", -- [2]
		},
		[136249] = {
			"Guardian Elemental", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[144949] = {
			"Canopy Stalker", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[174126] = {
			"Baron Duskhollow", -- [1]
			"Castle Nathria", -- [2]
		},
		[153141] = {
			"Endless Hunger Totem", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[146485] = {
			"Nevara Nightshade", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[56473] = {
			"Flying Snow", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[140345] = {
			"Stormscreech", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135736] = {
			"Gore", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[68140] = {
			"Hungering Soul Fragment", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[140855] = {
			"Trickle", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[145976] = {
			"Stonehide Bull", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[14762] = {
			"Dun Baldar North Marshal", -- [1]
			"Alterac Valley", -- [2]
		},
		[99366] = {
			"Taintheart Summoner", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[127477] = {
			"Saltwater Snapper", -- [1]
			"Tol Dagor", -- [2]
		},
		[100393] = {
			"Dread Felbat", -- [1]
			"The Arcway", -- [2]
		},
		[156212] = {
			"Coldheart Agent", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140344] = {
			"Sky Viper", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[144951] = {
			"Palefur Devourer", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[149558] = {
			"Jaina's Tide Elemental", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[145975] = {
			"Stonehide Buck", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[167994] = {
			"Ossified Conscript", -- [1]
			"Theater of Pain", -- [2]
		},
		[165430] = {
			"Malignant Spawn", -- [1]
			"Plaguefall", -- [2]
		},
		[163891] = {
			"Rotmarrow Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[156213] = {
			"Coldheart Guardian", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[136250] = {
			"Hoodoo Hexer", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[144952] = {
			"Hookfang", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[151610] = {
			"Amathet Guardian", -- [1]
			"Halls of Origination", -- [2]
		},
		[130334] = {
			"Gritplate Gazer", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140262] = {
			"Runehoof Doe", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144956] = {
			"Razorbite", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[163892] = {
			"Rotting Slimeclaw", -- [1]
			"Plaguefall", -- [2]
		},
		[32927] = {
			"Runemaster Molgeim", -- [1]
			"Ulduar", -- [2]
		},
		[102395] = {
			"Infiltrator Assassin", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[157238] = {
			"Prophet Skitra", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[53786] = {
			"Blazing Monstrosity", -- [1]
			"Firelands", -- [2]
		},
		[145977] = {
			"Mammoth Stonehide", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[158774] = {
			"Broken Citizen", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[62360] = {
			"Corrupt Droplet", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[112675] = {
			"Duskwatch Sentinel", -- [1]
			"The Nighthold", -- [2]
		},
		[154682] = {
			"Echo of Fear", -- [1]
			"The Eternal Palace", -- [2]
		},
		[82733] = {
			"Night-Twisted Shadowsworn", -- [1]
			"Highmaul", -- [2]
		},
		[161334] = {
			"Gnashing Terror", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[11659] = {
			"Molten Destroyer", -- [1]
			"Molten Core", -- [2]
		},
		[130335] = {
			"Gritplate Crystaleye", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[154685] = {
			"Echo of Delirium", -- [1]
			"The Eternal Palace", -- [2]
		},
		[112678] = {
			"Shal'dorei Naturalist", -- [1]
			"The Nighthold", -- [2]
		},
		[163894] = {
			"Blighted Spinebreaker", -- [1]
			"Plaguefall", -- [2]
		},
		[164406] = {
			"Shriekwing", -- [1]
			"Castle Nathria", -- [2]
		},
		[118518] = {
			"Priestess Lunaspyre", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[144955] = {
			"Zal'zi the Bloodgorged", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[129826] = {
			"Brineshell Snapclaw", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[130338] = {
			"Dustfang", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[146491] = {
			"Phantom of Retribution", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[151098] = {
			"Shadowy Appendage", -- [1]
			"Crucible of Storms", -- [2]
		},
		[112676] = {
			"Nobleborn Warpcaster", -- [1]
			"The Nighthold", -- [2]
		},
		[164407] = {
			"Sludgefist", -- [1]
			"Castle Nathria", -- [2]
		},
		[136254] = {
			"Stromgarde Knight", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[140861] = {
			"Duster", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[166971] = {
			"Castellan Niklaus", -- [1]
			"Castle Nathria", -- [2]
		},
		[138818] = {
			"Bloodwake Warbringer", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[146492] = {
			"Phantom of Rage", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[61337] = {
			"Glintrok Ironhide", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[135231] = {
			"Spectral Brute", -- [1]
			"Kings' Rest", -- [2]
		},
		[173114] = {
			"Invasive Decayfly", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[164920] = {
			"Drust Soulcleaver", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[144957] = {
			"Shali'i", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[174134] = {
			"Lord Evershade", -- [1]
			"Castle Nathria", -- [2]
		},
		[136264] = {
			"Half-Finished Mummy", -- [1]
			"Kings' Rest", -- [2]
		},
		[146493] = {
			"Phantom of Slaughter", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[61340] = {
			"Glintrok Hexxer", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[151612] = {
			"Amathet Sun Priest", -- [1]
			"Halls of Origination", -- [2]
		},
		[156219] = {
			"Coldheart Scout", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[164921] = {
			"Drust Harvester", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[140863] = {
			"Rubywind Prankster", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129828] = {
			"Brineshell Clacker", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[81197] = {
			"Iron Raider", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[166969] = {
			"Baroness Frieda", -- [1]
			"Castle Nathria", -- [2]
		},
		[61339] = {
			"Glintrok Oracle", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[155708] = {
			"Tentacle", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[59546] = {
			"The Talking Fish", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[147938] = {
			"Azergem Crystalback", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140864] = {
			"Gigglefit", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[165946] = {
			"Mordretha, the Endless Empress", -- [1]
			"Theater of Pain", -- [2]
		},
		[135239] = {
			"Spectral Witch Doctor", -- [1]
			"Kings' Rest", -- [2]
		},
		[166970] = {
			"Lord Stavros", -- [1]
			"Castle Nathria", -- [2]
		},
		[43934] = {
			"Soul Fragment", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[135234] = {
			"Diseased Mastiff", -- [1]
			"Waycrest Manor", -- [2]
		},
		[13797] = {
			"Mountaineer Boombellow", -- [1]
			"Alterac Valley", -- [2]
		},
		[140353] = {
			"Brightscale Coilfang", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[56731] = {
			"Habanero Brew", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[41376] = {
			"Nefarian", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[154174] = {
			"Horrific Summoner", -- [1]
			"The Eternal Palace", -- [2]
		},
		[158781] = {
			"Shredded Psyche", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[61338] = {
			"Glintrok Skulker", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[135235] = {
			"Spectral Beastmaster", -- [1]
			"Kings' Rest", -- [2]
		},
		[63106] = {
			"Sik'thik Swarmer", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[140354] = {
			"Brightscale Wind Serpent", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138827] = {
			"Bodalf the Strong", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138823] = {
			"Bloodwake Wayfinder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[154175] = {
			"Horrific Summoner", -- [1]
			"The Eternal Palace", -- [2]
		},
		[138307] = {
			"Smashface", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138819] = {
			"Bloodwake Marauder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[140259] = {
			"Runehoof Greatstag", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152128] = {
			"Orgozoa", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140355] = {
			"Brightscale Screecher", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[129827] = {
			"Brineshell Crusher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[149569] = {
			"Dazari Worshipper", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[164929] = {
			"Tirnenn Villager", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[138308] = {
			"Ook-Aak", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138820] = {
			"Bloodwake Vrykul", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[135241] = {
			"Bilge Rat Pillager", -- [1]
			"Siege of Boralus", -- [2]
		},
		[59547] = {
			"Jiang", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[164926] = {
			"Drust Boughbreaker", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[144963] = {
			"Kimbul's Aspect", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[56350] = {
			"Disciple of Hate", -- [1]
			"Baradin Hold", -- [2]
		},
		[136270] = {
			"Captain Nials", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[134214] = {
			"Riftblade Kelain", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[71474] = {
			"Embodied Despair", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[167998] = {
			"Portal Guardian", -- [1]
			"Theater of Pain", -- [2]
		},
		[138826] = {
			"Leikneir the Brave", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140357] = {
			"Venomreaver", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[56732] = {
			"Liu Flameheart", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[139338] = {
			"Icetusk Prophet", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[61341] = {
			"Mounted Mogu", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[134215] = {
			"Duskrunner Lorinas", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138822] = {
			"Bloodwake Harpooner", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[167999] = {
			"Echo of Sin", -- [1]
			"Castle Nathria", -- [2]
		},
		[156226] = {
			"Coldheart Binder", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[66100] = {
			"Apparition of Terror", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[33186] = {
			"Razorscale", -- [1]
			"Ulduar", -- [2]
		},
		[33699] = {
			"Storm Tempered Keeper", -- [1]
			"Ulduar", -- [2]
		},
		[147936] = {
			"Azergem Shardback", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[134216] = {
			"Shadeweaver Zarra", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[71475] = {
			"Rook Stonetoe", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[135240] = {
			"Soul Essence", -- [1]
			"Waycrest Manor", -- [2]
		},
		[61442] = {
			"Kuai the Brute", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[140359] = {
			"Thunderhawk Devourer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[157255] = {
			"Aqir Drone", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139343] = {
			"Icetusk Drudge", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[14763] = {
			"Dun Baldar South Marshal", -- [1]
			"Alterac Valley", -- [2]
		},
		[159303] = {
			"Monstrous Behemoth", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[138824] = {
			"Halfid Ironeye", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168001] = {
			"Empowered Flameforge Enforcer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[139340] = {
			"Icetusk Necromancer", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140360] = {
			"Sunback", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[59804] = {
			"Gripping Hatred", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[140769] = {
			"Goldenvein", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[157256] = {
			"Aqir Darter", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[135246] = {
			"\"Stabby\" Lottie", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[138825] = {
			"Ingathora Blood-Drinker", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[168002] = {
			"Empowered Mawsworn Shackler", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[129318] = {
			"Sandskitter Crab", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140361] = {
			"Darkshadow the Omen", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129830] = {
			"Clackclaw the Behemoth", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[60701] = {
			"Zian of the Endless Shadow", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[44704] = {
			"Minion of Siamat", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[44577] = {
			"General Husam", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[159301] = {
			"General Kaal", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[168003] = {
			"Empowered Coldheart Ascendant", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[152135] = {
			"Void-Twisted Spellweaver", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[140362] = {
			"Shimmerwing", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[157254] = {
			"Tek'ris", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[159305] = {
			"Maddened Conscript", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[151630] = {
			"Void Ichor", -- [1]
			"Crucible of Storms", -- [2]
		},
		[128551] = {
			"Irontide Mastiff", -- [1]
			"Freehold", -- [2]
		},
		[71477] = {
			"Embodied Gloom", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[139339] = {
			"Icetusk Defender", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138831] = {
			"Horvuld Oceanscythe", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140768] = {
			"Guuru the Mountain-Breaker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144970] = {
			"Kaldorei Archer", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[130087] = {
			"Irontide Raider", -- [1]
			"Tol Dagor", -- [2]
		},
		[158279] = {
			"Haywire Clockwork Rocket Bot", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[135248] = {
			"Briona the Bloodthirsty", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[167493] = {
			"Venomous Sniper", -- [1]
			"Plaguefall", -- [2]
		},
		[135245] = {
			"Bilge Rat Demolisher", -- [1]
			"Siege of Boralus", -- [2]
		},
		[59522] = {
			"Sudsy Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[155612] = {
			"Azsh'ari Channeler", -- [1]
			"The Eternal Palace", -- [2]
		},
		[144971] = {
			"Druid of the Branch", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[131666] = {
			"Coven Thornshaper", -- [1]
			"Waycrest Manor", -- [2]
		},
		[11948] = {
			"Vanndar Stormpike", -- [1]
			"Alterac Valley", -- [2]
		},
		[144975] = {
			"Forsaken Lancer", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[71478] = {
			"Embodied Anguish", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[139341] = {
			"Icetusk Shadowcaster", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[12076] = {
			"Lava Elemental", -- [1]
			"Molten Core", -- [2]
		},
		[144460] = {
			"Overfed Snapper", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[144972] = {
			"Kaldorei Huntress", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[56862] = {
			"Drunken Hozen Brawler", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[101679] = {
			"Dreadsoul Poisoner", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[61213] = {
			"Krik'thik Conscript", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[138830] = {
			"Thorvast, Guided by the Stars", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168007] = {
			"Empowered Mawsworn Soulbinder", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[135759] = {
			"Earthwall Totem", -- [1]
			"Kings' Rest", -- [2]
		},
		[139345] = {
			"Deathwhisperer Kulu", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144973] = {
			"Kaldorei Sentinel", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[53791] = {
			"Blazing Monstrosity", -- [1]
			"Firelands", -- [2]
		},
		[127019] = {
			"Training Dummy", -- [1]
			"Freehold", -- [2]
		},
		[33572] = {
			"Steelforged Defender", -- [1]
			"Ulduar", -- [2]
		},
		[71479] = {
			"He Softfoot", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[155723] = {
			"Swarmguard Kzaz", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[135760] = {
			"7th Legion Marine", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[113197] = {
			"Understone Drudge", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[144974] = {
			"Forsaken Alchemist", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[135763] = {
			"Voidling", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[68096] = {
			"Ashtongue Primalist", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[135648] = {
			"Driftcoat", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[59551] = {
			"Bopper", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[22869] = {
			"Illidari Boneslicer", -- [1]
			"Black Temple", -- [2]
		},
		[135761] = {
			"Thundering Totem", -- [1]
			"Kings' Rest", -- [2]
		},
		[22997] = {
			"Flame of Azzinoth", -- [1]
			"Black Temple", -- [2]
		},
		[153165] = {
			"Custodian Thonar", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[54432] = {
			"Murozond", -- [1]
			"End Time", -- [2]
		},
		[158284] = {
			"Craggle Wobbletop", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[152656] = {
			"Deadsoul Stalker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[71480] = {
			"Sun Tenderheart", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[163915] = {
			"Hatchling Nest", -- [1]
			"Plaguefall", -- [2]
		},
		[131667] = {
			"Soulbound Goliath", -- [1]
			"Waycrest Manor", -- [2]
		},
		[53635] = {
			"Cinderweb Drone", -- [1]
			"Firelands", -- [2]
		},
		[144976] = {
			"Forsaken Deathguard", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[56863] = {
			"Sleepy Hozen Brawler", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[158285] = {
			"Tinkered Shieldbot", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[138836] = {
			"Zara'thik Swarmguard", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[159309] = {
			"Leeching Parasite", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139346] = {
			"Soul-Speaker Galani", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[139858] = {
			"Voru'kar Infector", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[147932] = {
			"Agitated Azershard", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[144977] = {
			"Forsaken Deadshot", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[135765] = {
			"Torrent Totem", -- [1]
			"Kings' Rest", -- [2]
		},
		[158286] = {
			"Reprogrammed Warbot", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[135254] = {
			"Irontide Raider", -- [1]
			"Tol Dagor", -- [2]
		},
		[155215] = {
			"Faeleaf Lasher", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[147537] = {
			"Treasury Protector", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[131669] = {
			"Jagged Hound", -- [1]
			"Waycrest Manor", -- [2]
		},
		[34085] = {
			"Forge Construct", -- [1]
			"Ulduar", -- [2]
		},
		[54688] = {
			"Time-Twisted Nightsaber", -- [1]
			"End Time", -- [2]
		},
		[138837] = {
			"Zara'thik Ambershaper", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[170572] = {
			"Atal'ai Hoodoo Hexxer", -- [1]
			"De Other Side", -- [2]
		},
		[158169] = {
			"Devout Disciple", -- [1]
			"Halls of Origination", -- [2]
		},
		[147026] = {
			"Forsaken Bilespitter", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[139348] = {
			"Baga the Frostshield", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131670] = {
			"Heartsbane Vinetwister", -- [1]
			"Waycrest Manor", -- [2]
		},
		[140372] = {
			"Hive Guardian Ksh'ix", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139349] = {
			"Grave-Caller Muja", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[144860] = {
			"Sira Moonwarden", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[148443] = {
			"Defense-A-Bot", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[120366] = {
			"Hellblaze Temptress", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[71482] = {
			"Embodied Desperation", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[60447] = {
			"Krik'thik Saboteur", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[88314] = {
			"Dungeoneer's Training Dummy", -- [1]
			"SMV Alliance Garrison Level 3", -- [2]
		},
		[139862] = {
			"Voru'kar Spitter", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[14188] = {
			"Dirk Swindle", -- [1]
			"Alterac Valley", -- [2]
		},
		[40484] = {
			"Erudax", -- [1]
			"Grim Batol", -- [2]
		},
		[173134] = {
			"Darksworn Goliath", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[65310] = {
			"Turnip Punching Bag", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[73530] = {
			"Dragonmaw Grunt", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[139350] = {
			"Anaha Witherbreath", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[156242] = {
			"Animated Prowler", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140374] = {
			"Hive Guardian Yx'nil", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152661] = {
			"Mawsworn Ward", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[53793] = {
			"Harbinger of Flame", -- [1]
			"Firelands", -- [2]
		},
		[140376] = {
			"Duneshell Scarab", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134232] = {
			"Hired Assassin", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[138839] = {
			"Zara'thik Deathsinger", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[139351] = {
			"Shadowspeaker Angolo", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[59808] = {
			"Shado-Pan Stormbringer", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[34086] = {
			"Magma Rager", -- [1]
			"Ulduar", -- [2]
		},
		[136793] = {
			"Circle Apprentice", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[139353] = {
			"Unliving Champion", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135645] = {
			"Elder Pridemother", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135770] = {
			"Veteran Sergeant Slayde", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[138840] = {
			"Zara'thik Impaler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139352] = {
			"Death-Caller Majuli", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[59552] = {
			"The Crybaby Hozen", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[173136] = {
			"Blightsmasher", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[157268] = {
			"Crawling Corruption", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[40357] = {
			"Invoked Flaming Spirit", -- [1]
			"Grim Batol", -- [2]
		},
		[137817] = {
			"Cresting Exile", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[151639] = {
			"Crazed Gyreworm", -- [1]
			"Neltharion's Lair - HoA Scenario", -- [2]
		},
		[155221] = {
			"Faeleaf Tender", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[151638] = {
			"Crazed Earth Rager", -- [1]
			"Neltharion's Lair - HoA Scenario", -- [2]
		},
		[60576] = {
			"Stone Quilen", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[140377] = {
			"Duneshell Harvester", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153174] = {
			"Watchers of Death", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[56865] = {
			"Aqua Dancer", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[151128] = {
			"Lord of Locks", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[61216] = {
			"Glintrok Hexxer", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[138842] = {
			"Ta'kil the Resonator", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139354] = {
			"Butun the Boneripper", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[160341] = {
			"Sewer Beastling", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140378] = {
			"Duneshell Broodwatcher", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138843] = {
			"Wingleader Srak'ik", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[174162] = {
			"Countess Gloomveil", -- [1]
			"Castle Nathria", -- [2]
		},
		[137819] = {
			"Thundering Exile", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[139868] = {
			"Voru'kar Nerubian", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[147033] = {
			"Brynja", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[139355] = {
			"Guran the Frostblade", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[139867] = {
			"Voru'kar Venomancer", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[148569] = {
			"Breakwater Elemental", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[148441] = {
			"Gnomish Gyro-Engineer", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[11661] = {
			"Flamewaker", -- [1]
			"Molten Core", -- [2]
		},
		[137820] = {
			"Rumbling Exile", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[42789] = {
			"Stonecore Magmalord", -- [1]
			"The Stonecore", -- [2]
		},
		[138844] = {
			"Ya'vik the Imperial Blade", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[118834] = {
			"Fel Portal Guardian", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[59553] = {
			"The Songbird Queen", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[62348] = {
			"Sik'thik Soldier", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[96247] = {
			"Vileshard Crawler", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[104246] = {
			"Duskwatch Guard", -- [1]
			"Court of Stars", -- [2]
		},
		[11949] = {
			"Captain Balinda Stonehearth", -- [1]
			"Alterac Valley", -- [2]
		},
		[139357] = {
			"Icetusk Shambler", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[159320] = {
			"Amahtet", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[168022] = {
			"Slime Tentacle", -- [1]
			"Plaguefall", -- [2]
		},
		[147032] = {
			"Nathanos Blightcaller", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[112638] = {
			"Astral Defender", -- [1]
			"The Nighthold", -- [2]
		},
		[16236] = {
			"Eye Stalk", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[156237] = {
			"Imperator Dara", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[135263] = {
			"Ashvane Spotter", -- [1]
			"Siege of Boralus", -- [2]
		},
		[53795] = {
			"Egg Pile", -- [1]
			"Firelands", -- [2]
		},
		[138846] = {
			"Amberwinged Mindsinger", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[155738] = {
			"Rallying Banner", -- [1]
			"The Eternal Palace", -- [2]
		},
		[139870] = {
			"Voru'kar Swarmguard", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140382] = {
			"Jeweled Harvester", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[54435] = {
			"Kattè", -- [1]
			"End Time", -- [2]
		},
		[170071] = {
			"Mawsworn Shadestalker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[171474] = {
			"Finger Food", -- [1]
			"Plaguefall", -- [2]
		},
		[120371] = {
			"Helblaze Imp", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[37799] = {
			"Vile Spirit", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[173655] = {
			"Mistveil Matriarch", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[76094] = {
			"Sun Trinket", -- [1]
			"Skyreach", -- [2]
		},
		[140383] = {
			"Jeweled Scarab", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[157275] = {
			"Darkwhisper Disciple", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[139360] = {
			"Risen Icetusk Brute", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152669] = {
			"Void Globule", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[76097] = {
			"Solar Familiar", -- [1]
			"Skyreach", -- [2]
		},
		[138848] = {
			"Blade-Dancer Zorlak", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[59426] = {
			"Bopper", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[140392] = {
			"Direbore of the Thousand Tunnels", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140384] = {
			"Jeweled Broodwatcher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[103224] = {
			"Volatile Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[97269] = {
			"Hatecoil Crestrider", -- [1]
			"Eye of Azshara", -- [2]
		},
		[131685] = {
			"Runic Disciple", -- [1]
			"Waycrest Manor", -- [2]
		},
		[164447] = {
			"Skuld", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[138849] = {
			"Hivelord Vix'ick", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144996] = {
			"Visage from Beyond", -- [1]
			"Crucible of Storms", -- [2]
		},
		[165472] = {
			"Court Siphoner", -- [1]
			"Castle Nathria", -- [2]
		},
		[142950] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[140760] = {
			"Earthliving Giant", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[56867] = {
			"Fiery Trickster", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[46375] = {
			"Rowdy Troublemaker", -- [1]
			"Stormwind Stockade", -- [2]
		},
		[138338] = {
			"Reanimated Guardian", -- [1]
			"The Underrot", -- [2]
		},
		[137320] = {
			"Champion Defender", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[144998] = {
			"Death Specter", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[152159] = {
			"Zoatroid", -- [1]
			"The Eternal Palace", -- [2]
		},
		[136297] = {
			"Forgotten Denizen", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[144993] = {
			"Crazed Thistlebear", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[172128] = {
			"Hero", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[133593] = {
			"Expert Technician", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[76794] = {
			"Overheated Cinder Wolf", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138851] = {
			"Soul Hunter", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[148582] = {
			"Stormbound Guardian", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139875] = {
			"Hollow Widow", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140387] = {
			"Jeweled Queen", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[165469] = {
			"Nathrian Enforcer", -- [1]
			"Castle Nathria", -- [2]
		},
		[96756] = {
			"Ymiron, the Fallen King", -- [1]
			"Maw of Souls", -- [2]
		},
		[133733] = {
			"Moonscythe Pelani", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[61348] = {
			"Lorewalker Cho", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[142947] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[151649] = {
			"Defense Bot Mk I", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[59555] = {
			"Haunting Sha", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[151144] = {
			"Hati", -- [1]
			"Deepwind Gorge", -- [2]
		},
		[165470] = {
			"Nathrian Executor", -- [1]
			"Castle Nathria", -- [2]
		},
		[115767] = {
			"Mistress Sassz'ine", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[133734] = {
			"Rune Scribe Lusaris", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[120374] = {
			"Felguard Destroyer", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[142948] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[146901] = {
			"Maniacal Apothecary", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[152162] = {
			"Void-Twisted Skystriker", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[140389] = {
			"Tunnel-Keeper Ky'nyx", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[165471] = {
			"Nathrian Duelist", -- [1]
			"Castle Nathria", -- [2]
		},
		[76865] = {
			"Beastlord Darmac", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[137830] = {
			"Pallid Gorger", -- [1]
			"Waycrest Manor", -- [2]
		},
		[98366] = {
			"Ghostly Retainer", -- [1]
			"Black Rook Hold", -- [2]
		},
		[61347] = {
			"Kingsguard", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[145001] = {
			"Lanara Moonshade", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[164967] = {
			"Doctor Ickus", -- [1]
			"Plaguefall", -- [2]
		},
		[169055] = {
			"Marrow Scraper", -- [1]
			"Theater of Pain", -- [2]
		},
		[140902] = {
			"Vog'rish, the Ascended", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[155239] = {
			"Forest Father", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[99644] = {
			"Felguard Annihilator", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[98368] = {
			"Ghostly Protector", -- [1]
			"Black Rook Hold", -- [2]
		},
		[104251] = {
			"Duskwatch Sentry", -- [1]
			"Court of Stars", -- [2]
		},
		[147924] = {
			"Geoshard", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138349] = {
			"Vengeful Ghost", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[121399] = {
			"Inquisitor Sebilus", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[132713] = {
			"Mogul Razdunk", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[174175] = {
			"Loyal Stoneborn", -- [1]
			"Halls of Atonement", -- [2]
		},
		[146900] = {
			"Shambling Deadeye", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[80708] = {
			"Iron Taskmaster", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[142951] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[151653] = {
			"Void Tentacle", -- [1]
			"Uldir Scenario", -- [2]
		},
		[164450] = {
			"Dealer Xy'exa", -- [1]
			"De Other Side", -- [2]
		},
		[59684] = {
			"Hozen Party Animal", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[165474] = {
			"Court Assassin", -- [1]
			"Castle Nathria", -- [2]
		},
		[134767] = {
			"Deathclaw Egg-Mother", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[99645] = {
			"Shadowmoon Technician", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[161229] = {
			"Aqir Venomweaver", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[10990] = {
			"Alterac Ram", -- [1]
			"Alterac Valley", -- [2]
		},
		[136840] = {
			"Zoga", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[164451] = {
			"Dessia the Decapitator", -- [1]
			"Theater of Pain", -- [2]
		},
		[60708] = {
			"Meng the Demented", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[145000] = {
			"Lancer-Captain Blaer", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[101437] = {
			"Burning Geode", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[109041] = {
			"Naturalist Tel'arn", -- [1]
			"The Nighthold", -- [2]
		},
		[134251] = {
			"Seneschal M'bara", -- [1]
			"Kings' Rest", -- [2]
		},
		[142953] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[45096] = {
			"Tamed Tol'vir Prowler", -- [1]
			"Grim Batol", -- [2]
		},
		[56448] = {
			"Wise Mari", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[148584] = {
			"Archmage Mordent Evenshade", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[127799] = {
			"Dazar'ai Honor Guard", -- [1]
			"Atal'Dazar", -- [2]
		},
		[143985] = {
			"Absorb-o-Tron", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[22873] = {
			"Coilskar General", -- [1]
			"Black Temple", -- [2]
		},
		[154727] = {
			"Sun Prophet Tenhamen", -- [1]
			"Halls of Origination", -- [2]
		},
		[11502] = {
			"Ragnaros", -- [1]
			"Molten Core", -- [2]
		},
		[147561] = {
			"Forsaken Blightspreader", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[112955] = {
			"Shadescale Wyrm", -- [1]
			"The Nighthold", -- [2]
		},
		[149617] = {
			"Death Specter", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[97087] = {
			"Valarjar Champion", -- [1]
			"Halls of Valor", -- [2]
		},
		[101438] = {
			"Vileshard Chunk", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[77128] = {
			"Pack Beast", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[156795] = {
			"SI:7 Informant", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[151145] = {
			"Ténor", -- [1]
			"Eye of the Storm", -- [2]
		},
		[151657] = {
			"Bomb Tonk", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[139884] = {
			"Prophet Doom-Ra", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[160871] = {
			"Possessed Package", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[149098] = {
			"Maiev Shadowsong", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[161895] = {
			"Thing From Beyond", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[164464] = {
			"Xira the Underhanded", -- [1]
			"Theater of Pain", -- [2]
		},
		[11982] = {
			"Magmadar", -- [1]
			"Molten Core", -- [2]
		},
		[134766] = {
			"Wavespitter", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[151658] = {
			"Strider Tonk", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[112956] = {
			"Shimmering Manaspine", -- [1]
			"The Nighthold", -- [2]
		},
		[60709] = {
			"Qiang the Merciless", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[153194] = {
			"Briny Bubble", -- [1]
			"The Eternal Palace", -- [2]
		},
		[149611] = {
			"Apetagonizer 3000", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[137838] = {
			"Rampaging Owlbeast", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[145026] = {
			"Swifttail Scavenger", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[151147] = {
			"Hati", -- [1]
			"Alterac Valley", -- [2]
		},
		[151659] = {
			"Rocket Tonk", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[116550] = {
			"Spectral Patron", -- [1]
			"Return to Karazhan", -- [2]
		},
		[157811] = {
			"Lilliam Sparkspindle", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[122605] = {
			"Recently Petrified Foe", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[61989] = {
			"Cursed Mogu Sculpture", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[59819] = {
			"Artillery", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[129598] = {
			"Freehold Pack Mule", -- [1]
			"Freehold", -- [2]
		},
		[134768] = {
			"Sandskitter the Relentless", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[153552] = {
			"Weeping Wraith", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[172647] = {
			"Parasitic Infestor", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[56876] = {
			"Krik'thik Sapper", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[153196] = {
			"Scrapbone Grunter", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[146552] = {
			"Kul Tiran Tideweaver", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[158315] = {
			"Eye of Chaos", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[22874] = {
			"Coilskar Harpooner", -- [1]
			"Black Temple", -- [2]
		},
		[134769] = {
			"Jagged Claw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[155767] = {
			"Grul'taj", -- [1]
			"The Eternal Palace", -- [2]
		},
		[129599] = {
			"Cutwater Knife Juggler", -- [1]
			"Freehold", -- [2]
		},
		[138195] = {
			"Servant of Thros", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[158158] = {
			"Forge-Guard Hurrul", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[132733] = {
			"Justine Frost", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[99649] = {
			"Dreadlord Mendacius", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[78583] = {
			"Dominator Turret", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[34607] = {
			"Nerubian Burrower", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[146892] = {
			"Fleshrot Marauder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139388] = {
			"Zess'ez", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60710] = {
			"Subetai the Swift", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[165483] = {
			"Nathrian Hierarch", -- [1]
			"Castle Nathria", -- [2]
		},
		[77559] = {
			"Solar Magnifier", -- [1]
			"Skyreach", -- [2]
		},
		[76877] = {
			"Gruul", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[65317] = {
			"Xiang", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[132746] = {
			"Frostscale Broodmother", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[98370] = {
			"Ghostly Councilor", -- [1]
			"Black Rook Hold", -- [2]
		},
		[13358] = {
			"Stormpike Bowman", -- [1]
			"Alterac Valley", -- [2]
		},
		[97097] = {
			"Helarjar Champion", -- [1]
			"Maw of Souls", -- [2]
		},
		[152699] = {
			"Voidbound Berserker", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[132051] = {
			"Blood Tick", -- [1]
			"The Underrot", -- [2]
		},
		[141938] = {
			"Ashvane Sniper", -- [1]
			"Siege of Boralus", -- [2]
		},
		[139393] = {
			"Mirelurk Clutchguard", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[167532] = {
			"Heavin the Breaker", -- [1]
			"Theater of Pain", -- [2]
		},
		[112709] = {
			"Promenade Guard", -- [1]
			"The Nighthold", -- [2]
		},
		[164461] = {
			"Sathel the Accursed", -- [1]
			"Theater of Pain", -- [2]
		},
		[120556] = {
			"Dreadwing", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[17798] = {
			"Warlord Kalithresh", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[157807] = {
			"Mawsworn Soulweaver", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[54952] = {
			"Brittle Ghoul", -- [1]
			"End Time", -- [2]
		},
		[34605] = {
			"Swarm Scarab", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[167533] = {
			"Advent Nevermore", -- [1]
			"Theater of Pain", -- [2]
		},
		[155760] = {
			"Tank Buster MK2", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[129601] = {
			"Cutwater Harpooner", -- [1]
			"Freehold", -- [2]
		},
		[136832] = {
			"Witherbranch Berserker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[136821] = {
			"Gulan Sharphorn", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[170093] = {
			"Mawsworn Seeker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140425] = {
			"Surefoot", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[167022] = {
			"Battlesewn Render", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[167534] = {
			"Rek the Hardened", -- [1]
			"Theater of Pain", -- [2]
		},
		[147571] = {
			"Pa'kura Priestess", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[164463] = {
			"Paceran the Virulent", -- [1]
			"Theater of Pain", -- [2]
		},
		[150653] = {
			"Blackwater Behemoth", -- [1]
			"The Eternal Palace", -- [2]
		},
		[136822] = {
			"Gulan Spear Thrower", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[59518] = {
			"Bloated Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[81224] = {
			"Bladespire Sorcerer", -- [1]
			"Highmaul", -- [2]
		},
		[130620] = {
			"Frostfencer Seraphi", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[43438] = {
			"Corborus", -- [1]
			"The Stonecore", -- [2]
		},
		[85748] = {
			"Iron Mauler", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[119103] = {
			"Sable Enforcer", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[53545] = {
			"Molten Spewer", -- [1]
			"Firelands", -- [2]
		},
		[136823] = {
			"Gulan Brute", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[96587] = {
			"Felsworn Infester", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[162417] = {
			"Anubisath Sentinel", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[54700] = {
			"Time-Twisted Nightsaber", -- [1]
			"End Time", -- [2]
		},
		[167536] = {
			"Harugia the Bloodthirsty", -- [1]
			"Theater of Pain", -- [2]
		},
		[155763] = {
			"Darkweaver Kar'dress", -- [1]
			"The Eternal Palace", -- [2]
		},
		[59051] = {
			"Strife", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[46379] = {
			"Vicious Thug", -- [1]
			"Stormwind Stockade", -- [2]
		},
		[136824] = {
			"Gulan Flamecaller", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[76874] = {
			"Dreadwing", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[21338] = {
			"Coilfang Leper", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[130621] = {
			"Squallshaper Bryson", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[152704] = {
			"Crawling Corruption", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[155764] = {
			"Rak'sha the Swift", -- [1]
			"The Eternal Palace", -- [2]
		},
		[69964] = {
			"Kanrethad Ebonlocke", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[161408] = {
			"Malicious Growth", -- [1]
			"The Underrot", -- [2]
		},
		[136825] = {
			"Gulan Oathguard", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[157812] = {
			"Billibub Cogspinner", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[132742] = {
			"Flamescale Strider", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[132743] = {
			"Flamescale Wavebreaker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[167538] = {
			"Dokigg the Brutalizer", -- [1]
			"Theater of Pain", -- [2]
		},
		[146893] = {
			"Fleshrot Mystic", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[62205] = {
			"Wing Leader Ner'onok", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[68173] = {
			"Freed Imp", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[136826] = {
			"Gulan Firespeaker", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[157813] = {
			"Sprite Jumpsprocket", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140429] = {
			"Drifthopper the Swift", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[130622] = {
			"Squallshaper Auran", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136839] = {
			"Mrogan", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[139386] = {
			"Forked-Tongue", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[148940] = {
			"Kaldorei Chimaera", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[98384] = {
			"Razormouth", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[138375] = {
			"Smoos", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[174194] = {
			"Court Executor", -- [1]
			"Castle Nathria", -- [2]
		},
		[150136] = {
			"Faceless Render", -- [1]
			"Uldir Scenario", -- [2]
		},
		[162933] = {
			"Thought Harvester", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[127049] = {
			"Drywhisker Surveyor", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[139387] = {
			"Nassa the Cold-Blooded", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[62632] = {
			"Sik'thik Engineer", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[68174] = {
			"Unbound Nightlord", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[136828] = {
			"Witherbranch Warrior", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[11663] = {
			"Flamewaker Healer", -- [1]
			"Molten Core", -- [2]
		},
		[150137] = {
			"Faceless Subduer", -- [1]
			"Uldir Scenario", -- [2]
		},
		[154744] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[77557] = {
			"Admiral Gar'an", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[155768] = {
			"Squallbinder Mal'ur", -- [1]
			"The Eternal Palace", -- [2]
		},
		[148613] = {
			"Commander Broadside", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[126185] = {
			"Zian-Ti Shadowcaster", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136829] = {
			"Witherbranch Axe Thrower", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[97264] = {
			"Hatecoil Shellbreaker", -- [1]
			"Eye of Azshara", -- [2]
		},
		[158328] = {
			"Il'gynoth", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[145030] = {
			"Arctic Poacher", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[39854] = {
			"Azureborne Guardian", -- [1]
			"Grim Batol", -- [2]
		},
		[139389] = {
			"Steelscale Volshasis", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60585] = {
			"Elder Regail", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[129600] = {
			"Bilge Rat Brinescale", -- [1]
			"Freehold", -- [2]
		},
		[136830] = {
			"Witherbranch Headhunter", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[174197] = {
			"Battlefield Ritualist", -- [1]
			"Theater of Pain", -- [2]
		},
		[150139] = {
			"K'thxx the Void Hunter", -- [1]
			"Uldir Scenario", -- [2]
		},
		[63275] = {
			"Corrupted Protector", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[138888] = {
			"Bloodwake Soothsayer", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139390] = {
			"Scaleguard Sarrisz", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140424] = {
			"Scythehorn", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[156794] = {
			"SI:7 Light-Hunter", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[136831] = {
			"Witherbranch Witch Doctor", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[155276] = {
			"Bursting Cragfish", -- [1]
			"The Eternal Palace", -- [2]
		},
		[138889] = {
			"Uvuld the Forseer", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[163459] = {
			"Forsworn Mender", -- [1]
			"Spires of Ascension", -- [2]
		},
		[147069] = {
			"Spirit of Xuen", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139391] = {
			"Darkwave Assassin", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[62633] = {
			"Sik'thik Builder", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[68176] = {
			"Unbound Centurion", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[54699] = {
			"Time-Twisted Nightsaber", -- [1]
			"End Time", -- [2]
		},
		[168578] = {
			"Fungalmancer", -- [1]
			"Plaguefall", -- [2]
		},
		[154758] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[167033] = {
			"Putrid Shambler", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[134795] = {
			"Veiled Hermit", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139392] = {
			"Mirelurk Saurok", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[44976] = {
			"Neferset Plaguebringer", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[140426] = {
			"Moonbeard", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[136833] = {
			"Witherbranch Venom Priest", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[130791] = {
			"Khut'een", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[150142] = {
			"Scrapbone Trashtosser", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138369] = {
			"Footbomb Hooligan", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[116549] = {
			"Backup Singer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[168058] = {
			"Infused Quill-feather", -- [1]
			"Sanguine Depths", -- [2]
		},
		[60586] = {
			"Elder Asani", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[129602] = {
			"Irontide Enforcer", -- [1]
			"Freehold", -- [2]
		},
		[56747] = {
			"Gu Cloudstrike", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[56875] = {
			"Krik'thik Demolisher", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[166523] = {
			"Vesper Totem", -- [1]
			"Theater of Pain", -- [2]
		},
		[138370] = {
			"Horko", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134787] = {
			"Spineclaw Crab", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[139394] = {
			"Mirelurk Bog Priest", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[164476] = {
			"Tortured Amalgamation", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[152703] = {
			"Walkie Shockie X1", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[136835] = {
			"Kin'toga Beastbane", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[76884] = {
			"Cruelfang", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[166524] = {
			"Deathwalker", -- [1]
			"Theater of Pain", -- [2]
		},
		[22939] = {
			"Temple Concubine", -- [1]
			"Black Temple", -- [2]
		},
		[134788] = {
			"Spineclaw Rockshell", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139395] = {
			"Mirelurk Bogtender", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[168572] = {
			"Fungi Stormer", -- [1]
			"Plaguefall", -- [2]
		},
		[46382] = {
			"Petty Criminal", -- [1]
			"Stormwind Stockade", -- [2]
		},
		[136836] = {
			"Shadowbreaker Urzula", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[155272] = {
			"Blackwater Oracle", -- [1]
			"The Eternal Palace", -- [2]
		},
		[154240] = {
			"Azshara's Devoted", -- [1]
			"The Eternal Palace", -- [2]
		},
		[127048] = {
			"Drywhisker Digger", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[134789] = {
			"Monstrous Spineclaw", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[163966] = {
			"Dread Siphonist", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[148618] = {
			"Archdruid Andrenius", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[148610] = {
			"Druid of the Branch", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[136837] = {
			"Venomancer Ant'su", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[104014] = {
			"Dastardly Thief", -- [1]
			"Icecrown Citadel", -- [2]
		},
		[150146] = {
			"Scrapbone Shaman", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[104270] = {
			"Guardian Construct", -- [1]
			"Court of Stars", -- [2]
		},
		[108361] = {
			"Crystalline Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[139397] = {
			"Mirelurk Lurker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168574] = {
			"Pestilent Harvester", -- [1]
			"Plaguefall", -- [2]
		},
		[148611] = {
			"Yoru'cha", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136838] = {
			"Zgordo the Brutalizer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[149635] = {
			"Blooming Protector", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[143306] = {
			"Majestic Penguin", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138374] = {
			"Sand Fur", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134791] = {
			"Luminous Crawler", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139398] = {
			"Mirelurk Assassin", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[173189] = {
			"Nathrian Hawkeye", -- [1]
			"Castle Nathria", -- [2]
		},
		[86607] = {
			"Iron Flame Technician", -- [1]
			"Highmaul", -- [2]
		},
		[132744] = {
			"Frostscale Hydra", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[161416] = {
			"Aqir Shadowcrafter", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[44977] = {
			"Neferset Torturer", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[134280] = {
			"Vindicator Baatul", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[163457] = {
			"Forsworn Vanguard", -- [1]
			"Spires of Ascension", -- [2]
		},
		[139399] = {
			"Mirelurk Basher", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139406] = {
			"Hassan the Bloody Scale", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[152708] = {
			"Mawsworn Seeker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[132745] = {
			"Frostscale Wanderer", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[134800] = {
			"Hardened Snapjaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136139] = {
			"Mechanized Peacekeeper", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[106059] = {
			"Warp Shade", -- [1]
			"The Arcway", -- [2]
		},
		[163458] = {
			"Forsworn Castigator", -- [1]
			"Spires of Ascension", -- [2]
		},
		[139400] = {
			"Mirelurk Rivercaller", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135817] = {
			"Zephyr", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148614] = {
			"Kul Tiran Cannoneer", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136841] = {
			"Thu'zun the Vile", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[148621] = {
			"Jek'kwa", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[171656] = {
			"Venomous Sniper Captain", -- [1]
			"Plaguefall", -- [2]
		},
		[145039] = {
			"Snowstalker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134794] = {
			"Darklurker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[167566] = {
			"Bleakwing Assassin", -- [1]
			"Castle Nathria", -- [2]
		},
		[135818] = {
			"Gust Soldier", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136330] = {
			"Soul Thorns", -- [1]
			"Waycrest Manor", -- [2]
		},
		[165515] = {
			"Depraved Darkblade", -- [1]
			"Halls of Atonement", -- [2]
		},
		[56877] = {
			"Raigonn", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[155790] = {
			"Mawsworn Acolyte", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[134283] = {
			"Anchorite Lanna", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138890] = {
			"Dargulf the Spirit-Seeker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148624] = {
			"Echo of Pa'ku", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[135819] = {
			"Living Tornado", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[86609] = {
			"Iron Warmaster", -- [1]
			"Highmaul", -- [2]
		},
		[145033] = {
			"Arctic Hunter", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[174210] = {
			"Blighted Sludge-Spewer", -- [1]
			"Theater of Pain", -- [2]
		},
		[22876] = {
			"Coilskar Soothsayer", -- [1]
			"Black Temple", -- [2]
		},
		[134284] = {
			"Fallen Deathspeaker", -- [1]
			"The Underrot", -- [2]
		},
		[142986] = {
			"King Varian Wrynn", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[139403] = {
			"Arassaz the Invader", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[76116] = {
			"Diving Chakram Spinner", -- [1]
			"Skyreach", -- [2]
		},
		[140427] = {
			"Craghoof Herdfather", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[136844] = {
			"Sandscalp Warrior", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[11664] = {
			"Flamewaker Elite", -- [1]
			"Molten Core", -- [2]
		},
		[158343] = {
			"Organ of Corruption", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[114251] = {
			"Galindre", -- [1]
			"Return to Karazhan", -- [2]
		},
		[134797] = {
			"Ocean Recluse", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139404] = {
			"High Prophet Massas", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[131726] = {
			"Gunnolf the Ferocious", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140428] = {
			"Chasm-Jumper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145035] = {
			"Swifttail Courser", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[78932] = {
			"Driving Gale-Caller", -- [1]
			"Skyreach", -- [2]
		},
		[150154] = {
			"Saurolisk Bonenipper", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[134286] = {
			"Archmage Tamuura", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134798] = {
			"Abyss Crawler", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139405] = {
			"Wavebringer Sezzes'an", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[131727] = {
			"Fenrae the Cunning", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[160904] = {
			"Image of Absolution", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[136846] = {
			"Sandscalp Blood Drinker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[104273] = {
			"Jazshariu", -- [1]
			"Court of Stars", -- [2]
		},
		[148625] = {
			"Echo of Krag'wa", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139417] = {
			"Rotwood the Cursed", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[53167] = {
			"Unbound Pyrelord", -- [1]
			"Firelands", -- [2]
		},
		[61485] = {
			"General Pa'valak", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[131728] = {
			"Raul the Tenacious", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[86611] = {
			"Mind Fungus", -- [1]
			"Highmaul", -- [2]
		},
		[136847] = {
			"Sandscalp Shadow Hunter", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[78933] = {
			"Herald of Sunrise", -- [1]
			"Skyreach", -- [2]
		},
		[99664] = {
			"Restless Soul", -- [1]
			"Black Rook Hold", -- [2]
		},
		[146887] = {
			"Ghern the Rancid", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[54191] = {
			"Risen Ghoul", -- [1]
			"End Time", -- [2]
		},
		[139407] = {
			"Fangterror", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[131729] = {
			"Lyco", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140431] = {
			"Craghoof Goat", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[136848] = {
			"Sandscalp Soothsayer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[72791] = {
			"Lingering Corruption", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[17797] = {
			"Hydromancer Thespia", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[140441] = {
			"Muskflank Calf", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[134801] = {
			"Cracked-Shell", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[163978] = {
			"Darkwhisper Cultist", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[146885] = {
			"Foulshriek", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[86612] = {
			"Spore Shooter", -- [1]
			"Highmaul", -- [2]
		},
		[136849] = {
			"Sandscalp Berserker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[104274] = {
			"Baalgar the Watchful", -- [1]
			"Court of Stars", -- [2]
		},
		[139413] = {
			"Mirelurk Oasis-Speaker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[104016] = {
			"Covetous Hoarder", -- [1]
			"Icecrown Citadel", -- [2]
		},
		[134802] = {
			"Razorback", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[112718] = {
			"Sidereal Familiar", -- [1]
			"The Nighthold", -- [2]
		},
		[131731] = {
			"Sown Lasher", -- [1]
			"Waycrest Manor", -- [2]
		},
		[148623] = {
			"Echo of Gonk", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[132755] = {
			"Breakbeak Scavenger", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[157634] = {
			"Flameforge Enforcer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[150159] = {
			"King Gobbamak", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[156818] = {
			"Wrathion", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[155278] = {
			"Shimmerskin Pufferfish", -- [1]
			"The Eternal Palace", -- [2]
		},
		[139410] = {
			"Visz the Silent Blade", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[136855] = {
			"Molten Vordo", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140434] = {
			"Craghoof Rockhorn", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145041] = {
			"Swifttail Stalker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139415] = {
			"Slitherscale", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[22877] = {
			"Coilskar Wrangler", -- [1]
			"Black Temple", -- [2]
		},
		[138387] = {
			"Mangol", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134804] = {
			"Timeless Runeback", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139411] = {
			"Many-Fangs", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138393] = {
			"Biter", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140435] = {
			"Greyfur", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135322] = {
			"The Golden Serpent", -- [1]
			"Kings' Rest", -- [2]
		},
		[168594] = {
			"Chamber Sentinel", -- [1]
			"Sanguine Depths", -- [2]
		},
		[5283] = {
			"Nightmare Wanderer", -- [1]
			"Sunken Temple", -- [2]
		},
		[130635] = {
			"Stonefury", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[134805] = {
			"Wandering Behemoth", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139412] = {
			"Gashasz", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[135829] = {
			"Dustwind", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140436] = {
			"Snorthoof", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[52530] = {
			"Alysrazor", -- [1]
			"Firelands", -- [2]
		},
		[146072] = {
			"Shredder Technician", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[171455] = {
			"Stonewall Gargon", -- [1]
			"Sanguine Depths", -- [2]
		},
		[138389] = {
			"Smasha", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134806] = {
			"Bloodsnapper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[155793] = {
			"Skeletal Remains", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[135830] = {
			"Galefury", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140437] = {
			"Slow Olo", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134599] = {
			"Imbued Stormcaller", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[140442] = {
			"Muskflank Yak", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[165824] = {
			"Nar'zudah", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[167055] = {
			"Rot Flinger", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[134807] = {
			"Ancient Spineshell", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139414] = {
			"Mire Priest Vassz", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168591] = {
			"Ravenous Dreadbat", -- [1]
			"Sanguine Depths", -- [2]
		},
		[98900] = {
			"Wyrmtongue Trickster", -- [1]
			"Black Rook Hold", -- [2]
		},
		[132760] = {
			"Plains Creeper", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[66652] = {
			"Lesser Volatile Energy", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[162449] = {
			"Puddle Strider", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[138391] = {
			"Norko the Thrower", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[104275] = {
			"Imacu'tya", -- [1]
			"Court of Stars", -- [2]
		},
		[62511] = {
			"Amber-Shaper Un'sok", -- [1]
			"Heart of Fear", -- [2]
		},
		[144837] = {
			"Darkshore Stag", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[140439] = {
			"Muskflank Herdleader", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[165521] = {
			"Lady Inerva Darkvein", -- [1]
			"Castle Nathria", -- [2]
		},
		[97365] = {
			"Seacursed Mistmender", -- [1]
			"Maw of Souls", -- [2]
		},
		[137880] = {
			"Northfold Defender", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[138392] = {
			"Bono", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[142999] = {
			"Rhonin", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[139416] = {
			"Volshas", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148118] = {
			"Caravan Brutosaur", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[165010] = {
			"Congealed Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[145047] = {
			"Forsaken Blight Thrower", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[149144] = {
			"Jaina's Tide Elemental", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[137881] = {
			"Northfold Knight", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[60208] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[22878] = {
			"Aqueous Lord", -- [1]
			"Black Temple", -- [2]
		},
		[155797] = {
			"Animated Guardian", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[135834] = {
			"Vile Cloud", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148631] = {
			"Unexploded Ordnance", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136858] = {
			"Jan'li", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[126181] = {
			"Ramut the Black", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[137882] = {
			"Northfold Arbalest", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[130638] = {
			"Vicejaw Crocolisk", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[143001] = {
			"Kirin Tor Invoker", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[130788] = {
			"Taghira", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148120] = {
			"Kul Tiran Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136347] = {
			"Tidesage Initiate", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[136859] = {
			"Bloodscalp", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[143002] = {
			"Kirin Tor Invoker", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[150168] = {
			"Toxic Monstrosity", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[122086] = {
			"Slitherblade Ironscale", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[104277] = {
			"Legion Hound", -- [1]
			"Court of Stars", -- [2]
		},
		[139419] = {
			"High Oracle Asayza", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[164501] = {
			"Mistcaller", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[140443] = {
			"Muskflank Charger", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[136860] = {
			"Tracker Vu'ka", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[11665] = {
			"Lava Annihilator", -- [1]
			"Molten Core", -- [2]
		},
		[150169] = {
			"Toxic Lurker", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[130639] = {
			"Vicejaw Chomper", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[147098] = {
			"Spirit of Xuen", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139420] = {
			"Bog Defender Vaszash", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135837] = {
			"Cyclonic Lieutenant", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[140444] = {
			"Muskflank Bull", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[136861] = {
			"Duskstalker Kuli", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[56754] = {
			"Azure Serpent", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[40320] = {
			"Valiona", -- [1]
			"Grim Batol", -- [2]
		},
		[113128] = {
			"Withered Skulker", -- [1]
			"The Nighthold", -- [2]
		},
		[104278] = {
			"Felbound Enforcer", -- [1]
			"Court of Stars", -- [2]
		},
		[139421] = {
			"Gekkaz Moss-Scaled", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135838] = {
			"Grimebreeze", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[157337] = {
			"Spawn of Shad'har", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[136862] = {
			"Orgo", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[132754] = {
			"Highland Strider", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[44981] = {
			"Oathsworn Skinner", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[130640] = {
			"Vicejaw Sawtooth", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[130896] = {
			"Blackout Barrel", -- [1]
			"Freehold", -- [2]
		},
		[139422] = {
			"Scaled Krolusk Tamer", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[135839] = {
			"Swampgas", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[145053] = {
			"Eldritch Abomination", -- [1]
			"Crucible of Storms", -- [2]
		},
		[136863] = {
			"Great Mota", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[153755] = {
			"Naeno Megacrash", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[139813] = {
			"Senior Producer Gixi", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[99307] = {
			"Skjal", -- [1]
			"Maw of Souls", -- [2]
		},
		[135329] = {
			"Matron Bryndle", -- [1]
			"Waycrest Manor", -- [2]
		},
		[153244] = {
			"Oblivion Elemental", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[147614] = {
			"Dark Iron Primalist", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140447] = {
			"Demolishing Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[136864] = {
			"Uguu the Feared", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[136865] = {
			"Uzan the Sandreaver", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[105705] = {
			"Bound Energy", -- [1]
			"Court of Stars", -- [2]
		},
		[145058] = {
			"Shadefeather Raven", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[102232] = {
			"Rockbound Trapper", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[122963] = {
			"Rezan", -- [1]
			"Atal'Dazar", -- [2]
		},
		[164506] = {
			"Ancient Captain", -- [1]
			"Theater of Pain", -- [2]
		},
		[136353] = {
			"Colossal Tentacle", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[173720] = {
			"Mistveil Gorgegullet", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[72945] = {
			"Dragonmaw Bonecrusher", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[146079] = {
			"7th Legion Gyropilot", -- [1]
			"Siege of Boralus", -- [2]
		},
		[97259] = {
			"Blazing Hydra Spawn", -- [1]
			"Eye of Azshara", -- [2]
		},
		[44982] = {
			"Neferset Darkcaster", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[139425] = {
			"Crazed Incubator", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[146596] = {
			"Darkscale Myrmidon", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[140449] = {
			"Thickflank", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[134821] = {
			"Vilegaze Petrifier", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139429] = {
			"Stonebound Warrior", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[114264] = {
			"Midnight", -- [1]
			"Return to Karazhan", -- [2]
		},
		[114262] = {
			"Attumen the Huntsman", -- [1]
			"Return to Karazhan", -- [2]
		},
		[143009] = {
			"Daelin Proudmoore", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[139430] = {
			"Zaliz' Eternal Hound", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[127315] = {
			"Reanimation Totem", -- [1]
			"Atal'Dazar", -- [2]
		},
		[140450] = {
			"Dunu the Blind", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[161437] = {
			"Explosive Scarab", -- [1]
			"The Underrot", -- [2]
		},
		[173729] = {
			"Manifestation of Pride", -- [1]
			"Theater of Pain", -- [2]
		},
		[147621] = {
			"Dark Iron Vanguard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[120405] = {
			"Dreadwing", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[147105] = {
			"Solid Ice", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[139432] = {
			"Lu'si", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[13617] = {
			"Stormpike Stable Master", -- [1]
			"Alterac Valley", -- [2]
		},
		[140451] = {
			"Doting Calfmother", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[58803] = {
			"Residual Hatred", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[153760] = {
			"Enthralled Footman", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[158367] = {
			"Basher Tentacle", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[53500] = {
			"Living Meteor", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[143011] = {
			"Sandy Perch", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[122965] = {
			"Vol'kaal", -- [1]
			"Atal'Dazar", -- [2]
		},
		[164510] = {
			"Shambling Arbalest", -- [1]
			"Theater of Pain", -- [2]
		},
		[140452] = {
			"Pikehorn the Sleeper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145059] = {
			"Cunning Nightwing", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[155813] = {
			"Court Attendant", -- [1]
			"The Eternal Palace", -- [2]
		},
		[79200] = {
			"Blackrock Forge Specialist", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[61434] = {
			"Sik'thik Vanguard", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[134822] = {
			"Gritplate Matriarch", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[56372] = {
			"Eye of Occu'thar", -- [1]
			"Baradin Hold", -- [2]
		},
		[135846] = {
			"Sand-Crusted Striker", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[140453] = {
			"Bramblefur Herdleader", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145060] = {
			"Monstrous Shadefeather", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[56884] = {
			"Corrupted Taran Zhu", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[53116] = {
			"Unbound Blazing Elemental", -- [1]
			"Firelands", -- [2]
		},
		[130644] = {
			"Daggertooth", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134823] = {
			"Unbreakable Crystalspine", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[155810] = {
			"Frozen Sentry", -- [1]
			"The Eternal Palace", -- [2]
		},
		[64947] = {
			"Mogu'shan Warden", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[140454] = {
			"Many-Braids the Elder", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[145061] = {
			"Screeching Nightwing", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[161953] = {
			"Inimot, the Radiant Blade", -- [1]
			"Halls of Origination", -- [2]
		},
		[89] = {
			"Infernal", -- [1]
			"Theater of Pain", -- [2]
		},
		[129367] = {
			"Bilge Rat Tempest", -- [1]
			"Siege of Boralus", -- [2]
		},
		[33722] = {
			"Storm Tempered Keeper", -- [1]
			"Ulduar", -- [2]
		},
		[139431] = {
			"Guardian of Tombs", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153022] = {
			"Snang", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[140455] = {
			"Bramblefur Calf", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[34234] = {
			"Runeforged Sentry", -- [1]
			"Ulduar", -- [2]
		},
		[157356] = {
			"Extractor Thelsara", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[158371] = {
			"Zardeth of the Black Claw", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[42808] = {
			"Stonecore Flayer", -- [1]
			"The Stonecore", -- [2]
		},
		[12018] = {
			"Majordomo Executus", -- [1]
			"Molten Core", -- [2]
		},
		[155812] = {
			"Mawsworn Ritualist", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[122970] = {
			"Shadowblade Stalker", -- [1]
			"Atal'Dazar", -- [2]
		},
		[140456] = {
			"Bramblefur Musken", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140968] = {
			"Garnetback Striker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[157354] = {
			"Vexiona", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[17796] = {
			"Mekgineer Steamrigger", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[129369] = {
			"Irontide Raider", -- [1]
			"Siege of Boralus", -- [2]
		},
		[116569] = {
			"Razorjaw Wavemender", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[139433] = {
			"Sister of Anguish", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129366] = {
			"Bilge Rat Buccaneer", -- [1]
			"Siege of Boralus", -- [2]
		},
		[140457] = {
			"Bramblefur Grazer", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[157349] = {
			"Void Boar", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[136880] = {
			"Bristlemane Quilboar", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140979] = {
			"Greatfangs", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[98280] = {
			"Risen Arcanist", -- [1]
			"Black Rook Hold", -- [2]
		},
		[163492] = {
			"Rabid Wolf", -- [1]
			"Redridge - 9xp Bastion", -- [2]
		},
		[122968] = {
			"Yazma", -- [1]
			"Atal'Dazar", -- [2]
		},
		[139946] = {
			"Heart Guardian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[140458] = {
			"Bramblefur Bull", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[145065] = {
			"Fledgling Nightwing", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[170147] = {
			"Volatile Memory", -- [1]
			"De Other Side", -- [2]
		},
		[120153] = {
			"Eonic Defender", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[171171] = {
			"Mawsworn Archer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[134828] = {
			"Aqualing", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[168105] = {
			"Empowered Mawsworn Flametender", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[164517] = {
			"Tred'ova", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[140976] = {
			"Bore Worm", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[97119] = {
			"Shroud Hound", -- [1]
			"Maw of Souls", -- [2]
		},
		[11666] = {
			"Firewalker", -- [1]
			"Molten Core", -- [2]
		},
		[158375] = {
			"Corruptor Tentacle", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[171172] = {
			"Mawsworn Shackler", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140985] = {
			"Acidic Worm", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[168101] = {
			"Empowered Deadsoul Shade", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[150190] = {
			"HK-8 Aerial Oppression Unit", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[165030] = {
			"Lady Inerva Darkvein", -- [1]
			"Castle Nathria Scenario", -- [2]
		},
		[95072] = {
			"Greater Earth Elemental", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[72943] = {
			"Dragonmaw Proto-Drake", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[158376] = {
			"Psychus", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[171173] = {
			"Mawsworn Shadestalker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[143020] = {
			"Gorak Tul", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[168102] = {
			"Empowered Deadsoul Echo", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[139949] = {
			"Plague Doctor", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[153532] = {
			"Aqir Mindhunter", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[140973] = {
			"Bore Tunneler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[67177] = {
			"Zar'thik Supplicant", -- [1]
			"Heart of Fear", -- [2]
		},
		[140977] = {
			"Jadescale Gnasher", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[139442] = {
			"Backbreaker Zukan", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[157366] = {
			"Void Hunter", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139438] = {
			"Soul-Bringer Togan", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140983] = {
			"Frostbore Burster", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[160937] = {
			"Night Terror", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[140974] = {
			"Eldercraw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[62005] = {
			"Beast", -- [1]
			"Eye of the Storm", -- [2]
		},
		[146365] = {
			"Blazing Fireguard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140978] = {
			"Doomtunnel", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[153531] = {
			"Aqir Bonecrusher", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[168104] = {
			"Empowered Flameforge Master", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[152236] = {
			"Lady Ashvane", -- [1]
			"The Eternal Palace", -- [2]
		},
		[168108] = {
			"Empowered Lumbering Creation", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140975] = {
			"Youngercraw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[101476] = {
			"Molten Charskin", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[139444] = {
			"Necrolord Zian", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[42810] = {
			"Crystalspawn Giant", -- [1]
			"The Stonecore", -- [2]
		},
		[102375] = {
			"Runecarver Slave", -- [1]
			"Maw of Souls", -- [2]
		},
		[122971] = {
			"Dazar'ai Juggernaut", -- [1]
			"Atal'Dazar", -- [2]
		},
		[12259] = {
			"Gehennas", -- [1]
			"Molten Core", -- [2]
		},
		[154554] = {
			"Amathet Guardian", -- [1]
			"Halls of Origination", -- [2]
		},
		[136881] = {
			"Bristlemane Pathfinder", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[168109] = {
			"Empowered Mawsworn Ritualist", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[142000] = {
			"Haunting Tendril", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[79462] = {
			"Blinding Solar Flare", -- [1]
			"Skyreach", -- [2]
		},
		[104288] = {
			"Trilliax", -- [1]
			"The Nighthold", -- [2]
		},
		[168106] = {
			"Empowered Mawsworn Guard", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[129370] = {
			"Irontide Waveshaper", -- [1]
			"Siege of Boralus", -- [2]
		},
		[56631] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[136882] = {
			"Bristlemane Defender", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[52409] = {
			"Ragnaros", -- [1]
			"Firelands", -- [2]
		},
		[165556] = {
			"Fleeting Manifestation", -- [1]
			"Sanguine Depths", -- [2]
		},
		[12099] = {
			"Firesworn", -- [1]
			"Molten Core", -- [2]
		},
		[114526] = {
			"Ghostly Understudy", -- [1]
			"Return to Karazhan", -- [2]
		},
		[168107] = {
			"Empowered Mawsworn Interceptor", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[120158] = {
			"Volatile Corruption", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[42428] = {
			"Devout Follower", -- [1]
			"The Stonecore", -- [2]
		},
		[136883] = {
			"Bristlemane Thorncaller", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140982] = {
			"Icecracker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[22881] = {
			"Aqueous Surger", -- [1]
			"Black Temple", -- [2]
		},
		[79463] = {
			"Radiant Supernova", -- [1]
			"Skyreach", -- [2]
		},
		[163501] = {
			"Forsworn Skirmisher", -- [1]
			"Spires of Ascension", -- [2]
		},
		[139443] = {
			"Spinebender Kuntai", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[129371] = {
			"Riptide Shredder", -- [1]
			"Siege of Boralus", -- [2]
		},
		[130653] = {
			"Wanton Sapper", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[58807] = {
			"Vestige of Hatred", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[63030] = {
			"Enslaved Bonesmasher", -- [1]
			"Heart of Fear", -- [2]
		},
		[145851] = {
			"Kaldorei Hippogryph Rider", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[163506] = {
			"Forsworn Stealthclaw", -- [1]
			"Spires of Ascension", -- [2]
		},
		[140984] = {
			"Frostbore Worm", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[122973] = {
			"Dazar'ai Confessor", -- [1]
			"Atal'Dazar", -- [2]
		},
		[146103] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[157365] = {
			"Crackling Stalker", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[136885] = {
			"Bristlemane Bramble-Weaver", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[61240] = {
			"Glintrok Skulker", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[79208] = {
			"Blackrock Enforcer", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[171181] = {
			"Territorial Bladebeak", -- [1]
			"De Other Side", -- [2]
		},
		[163503] = {
			"Etherdiver", -- [1]
			"Spires of Ascension", -- [2]
		},
		[139445] = {
			"Tumat", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[129372] = {
			"Blacktar Bomber", -- [1]
			"Siege of Boralus", -- [2]
		},
		[140986] = {
			"Acidic Burrower", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140981] = {
			"Gnashing Horror", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[73197] = {
			"Lesser Sha Puddle", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[150195] = {
			"Gnome-Eating Slime", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[61239] = {
			"Glintrok Oracle", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[72941] = {
			"Dragonmaw Grunt", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[155831] = {
			"Mawsworn Soulbinder", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[61623] = {
			"Sap Globule", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[148921] = {
			"Kaldorei Glaive Thrower", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[136887] = {
			"Needlemane", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[132797] = {
			"Pinegraze Calf", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[11667] = {
			"Flameguard", -- [1]
			"Molten Core", -- [2]
		},
		[54073] = {
			"Flamewaker Hound Master", -- [1]
			"Firelands", -- [2]
		},
		[138428] = {
			"Spitefin Myrmidon", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168112] = {
			"General Kaal", -- [1]
			"Castle Nathria", -- [2]
		},
		[129373] = {
			"Dockhound Packmaster", -- [1]
			"Siege of Boralus", -- [2]
		},
		[68204] = {
			"Unbound Rogue", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[136888] = {
			"Dirt-Speaker Barrul", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[63031] = {
			"Set'thik Fanatic", -- [1]
			"Heart of Fear", -- [2]
		},
		[146102] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[171184] = {
			"Mythresh, Sky's Talons", -- [1]
			"De Other Side", -- [2]
		},
		[130909] = {
			"Fetid Maggot", -- [1]
			"The Underrot", -- [2]
		},
		[155828] = {
			"Runecarved Colossus", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[1863] = {
			"Jhorneth", -- [1]
			"Isle of Conquest", -- [2]
		},
		[43324] = {
			"Cho'gall", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[66413] = {
			"Yeasty Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[140990] = {
			"Bonescale Spitter", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[64183] = {
			"Enormous Stone Quilen", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[79466] = {
			"Initiate of the Rising Sun", -- [1]
			"Skyreach", -- [2]
		},
		[11859] = {
			"Doomguard", -- [1]
			"Castle Nathria", -- [2]
		},
		[159416] = {
			"Spiked Tentacle", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[153527] = {
			"Aqir Swarmleader", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[68205] = {
			"Unbound Succubus", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[84841] = {
			"Iron Dockworker", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[144825] = {
			"Toxinbelly Croaker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[146104] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138426] = {
			"Fogsail Pirate", -- [1]
			"Siege of Boralus", -- [2]
		},
		[140989] = {
			"Bonescale Worm", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[98406] = {
			"Embershard Scorpion", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[168627] = {
			"Plaguebinder", -- [1]
			"Plaguefall", -- [2]
		},
		[147896] = {
			"Zandalari Crusader", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[136891] = {
			"Tuskbreaker the Scarred", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[174773] = {
			"Spiteful Shade", -- [1]
			"Sanguine Depths", -- [2]
		},
		[146105] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[150712] = {
			"Trixie Tazer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[146872] = {
			"Kachota the Exiled", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[112739] = {
			"Shadowy Overfiend", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[167607] = {
			"Stoneborn Slasher", -- [1]
			"Halls of Atonement", -- [2]
		},
		[68206] = {
			"Unbound Shivarra", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[140987] = {
			"Fleshmelter the Insatiable", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[63032] = {
			"Sra'thik Shield Master", -- [1]
			"Heart of Fear", -- [2]
		},
		[146106] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[171188] = {
			"Plaguebound Devoted", -- [1]
			"Plaguefall", -- [2]
		},
		[102246] = {
			"Anub'esset", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[85225] = {
			"Gorian Sorcerer", -- [1]
			"Highmaul", -- [2]
		},
		[33216] = {
			"Mechagnome Pilot", -- [1]
			"Ulduar", -- [2]
		},
		[98919] = {
			"Seacursed Swiftblade", -- [1]
			"Maw of Souls", -- [2]
		},
		[140988] = {
			"Steelshred", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[137405] = {
			"Gripping Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[146107] = {
			"Living Bomb", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138429] = {
			"Spitefin Tidebinder", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[39870] = {
			"Twilight Firecatcher", -- [1]
			"Grim Batol", -- [2]
		},
		[129758] = {
			"Irontide Grenadier", -- [1]
			"Freehold", -- [2]
		},
		[76141] = {
			"Araknath", -- [1]
			"Skyreach", -- [2]
		},
		[148667] = {
			"Rastari Punisher", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[56762] = {
			"Yu'lon", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[56890] = {
			"Krik'thik Infiltrator", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[130400] = {
			"Irontide Crusher", -- [1]
			"Freehold", -- [2]
		},
		[101991] = {
			"Nightmare Dweller", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[159417] = {
			"Demented Knife-Twister", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[151739] = {
			"Ma'haat the Indomitable", -- [1]
			"Neltharion's Lair - HoA Scenario", -- [2]
		},
		[168882] = {
			"Fleeting Manifestation", -- [1]
			"Sanguine Depths", -- [2]
		},
		[104676] = {
			"Waning Time Particle", -- [1]
			"The Nighthold", -- [2]
		},
		[53691] = {
			"Shannox", -- [1]
			"Firelands", -- [2]
		},
		[79469] = {
			"Whirling Dervish", -- [1]
			"Skyreach", -- [2]
		},
		[146109] = {
			"Midnight Charger", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138431] = {
			"Tidemistress Najula", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[104295] = {
			"Blazing Imp", -- [1]
			"Court of Stars", -- [2]
		},
		[112741] = {
			"Wrathguard Decimator", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[140991] = {
			"Marrowbore", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[132803] = {
			"Rockmane Wendigo", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[58810] = {
			"Fragment of Hatred", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[146111] = {
			"Twenty Points", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[146110] = {
			"Waxing Moon", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138432] = {
			"Tidemistress Nessa", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[157620] = {
			"Prophet Skitra", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[138433] = {
			"Tidemistress Vessana", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[100713] = {
			"Rockbait Fisher", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[140993] = {
			"Darktunnel Ambusher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[132802] = {
			"Craghorn Yeti", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[122847] = {
			"Umbral Priestess", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[124259] = {
			"Jungle Tiger", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134338] = {
			"Tidesage Enforcer", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[167610] = {
			"Stonefiend Anklebiter", -- [1]
			"Halls of Atonement", -- [2]
		},
		[139457] = {
			"Stonebound Quilen", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[76143] = {
			"Rukhran", -- [1]
			"Skyreach", -- [2]
		},
		[13139] = {
			"Commander Randolph", -- [1]
			"Alterac Valley", -- [2]
		},
		[56763] = {
			"Regenerating Sha", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[150965] = {
			"Mawsworn Shackler", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146112] = {
			"Inkfur Behemoth", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[61242] = {
			"Glintrok Ironhide", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[167611] = {
			"Stoneborn Eviscerator", -- [1]
			"Halls of Atonement", -- [2]
		},
		[138434] = {
			"Spitefin Tempest Witch", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[168406] = {
			"Waltzing Venthyr", -- [1]
			"Castle Nathria", -- [2]
		},
		[22883] = {
			"Aqueous Spawn", -- [1]
			"Black Temple", -- [2]
		},
		[146114] = {
			"Surging Winds", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[76266] = {
			"High Sage Viryx", -- [1]
			"Skyreach", -- [2]
		},
		[146113] = {
			"Thunderhoof", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[22947] = {
			"Mother Shahraz", -- [1]
			"Black Temple", -- [2]
		},
		[167612] = {
			"Stoneborn Reaver", -- [1]
			"Halls of Atonement", -- [2]
		},
		[139459] = {
			"Stonebound Soldier", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[118374] = {
			"Captain Yathae Moonstrike", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[148673] = {
			"Vessel of Bwonsamdi", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140995] = {
			"Ruinstalker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[59835] = {
			"Krik'thik Swarmer", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[166589] = {
			"Animated Weapon", -- [1]
			"Sanguine Depths", -- [2]
		},
		[138436] = {
			"Lord Coilfin", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[139461] = {
			"Stonebound Rockmaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139460] = {
			"Stonebound Earthweaver", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[132807] = {
			"Zian-Ti Quilen", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[130404] = {
			"Vermin Trapper", -- [1]
			"Freehold", -- [2]
		},
		[140996] = {
			"Deepbore", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145603] = {
			"Goblin Harvester", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[61243] = {
			"Gekkan", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[138437] = {
			"Szerris the Invader", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[163520] = {
			"Forsworn Squad-Leader", -- [1]
			"Spires of Ascension", -- [2]
		},
		[135366] = {
			"Blacktooth Arsonist", -- [1]
			"Tol Dagor", -- [2]
		},
		[76145] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[56636] = {
			"Commander Ri'mok", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[113512] = {
			"Putrid Sludge", -- [1]
			"The Nighthold", -- [2]
		},
		[166079] = {
			"Brittlebone Crossbowman", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[146116] = {
			"Needleback Forager", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138438] = {
			"Tidereaver Steelfang", -- [1]
			"Havenswood (Islands 2)", -- [2]
		},
		[159425] = {
			"Occult Shadowmender", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139462] = {
			"Stonebound Shale-Speaker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148164] = {
			"Boomshot Specialist", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[156866] = {
			"Ra-den", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[134796] = {
			"King Spineclaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140295] = {
			"Snowfur Pup", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[139463] = {
			"Stonebound Annihilator", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138439] = {
			"Slitherqueen Valla", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138440] = {
			"Lady Assana", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[2630] = {
			"Earthbind Totem", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[76146] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[5291] = {
			"Hakkari Frostwing", -- [1]
			"Sunken Temple", -- [2]
		},
		[58812] = {
			"Hateful Essence", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[63035] = {
			"Zar'thik Zealot", -- [1]
			"Heart of Fear", -- [2]
		},
		[146118] = {
			"Territorial Needleback", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[130661] = {
			"Venture Co. Earthshaper", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[126429] = {
			"Encrusted Coralback", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[139464] = {
			"Zian-Ti Howler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144071] = {
			"Irontide Waveshaper", -- [1]
			"Siege of Boralus", -- [2]
		},
		[139396] = {
			"Mirelurk Guardian", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[122969] = {
			"Zanchuli Witch-Doctor", -- [1]
			"Atal'Dazar", -- [2]
		},
		[39873] = {
			"Twilight Wyrmcaller", -- [1]
			"Grim Batol", -- [2]
		},
		[146119] = {
			"Needleback Brute", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138441] = {
			"Songstress of the Deep", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[104300] = {
			"Shadow Mistress", -- [1]
			"Court of Stars", -- [2]
		},
		[155845] = {
			"Crushing Depths", -- [1]
			"The Eternal Palace", -- [2]
		},
		[165059] = {
			"Crimson Protector", -- [1]
			"Castle Nathria Scenario", -- [2]
		},
		[56637] = {
			"Ook-Ook", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[56765] = {
			"Destroying Sha", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[163524] = {
			"Kyrian Dark-Praetor", -- [1]
			"Spires of Ascension", -- [2]
		},
		[133835] = {
			"Feral Bloodswarmer", -- [1]
			"The Underrot", -- [2]
		},
		[102253] = {
			"Understone Demolisher", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[130918] = {
			"Archelion Great Turtle", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139466] = {
			"Cobalt Stoneguard", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[156642] = {
			"Enthralled Laborer", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[98926] = {
			"Shadow Hunter", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[53694] = {
			"Riplimb", -- [1]
			"Firelands", -- [2]
		},
		[155094] = {
			"Mechagon Trooper", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[22884] = {
			"Leviathan", -- [1]
			"Black Temple", -- [2]
		},
		[138443] = {
			"Scaleguard Buleth", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[86613] = {
			"Fungal Flesh-Eater", -- [1]
			"Highmaul", -- [2]
		},
		[151752] = {
			"Voidswarm", -- [1]
			"Emerald Dream - HoA Scenario", -- [2]
		},
		[126963] = {
			"Gwyndra Wildhammer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[165061] = {
			"Crimson Assassin", -- [1]
			"Castle Nathria Scenario", -- [2]
		},
		[63036] = {
			"Kor'thik Extremist", -- [1]
			"Heart of Fear", -- [2]
		},
		[11668] = {
			"Firelord", -- [1]
			"Molten Core", -- [2]
		},
		[167109] = {
			"Skeletal Vanguard", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[138444] = {
			"General Vesparak", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139700] = {
			"Brineshell Sea Shaman", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[139468] = {
			"Spineripper Ku-Kon", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[164550] = {
			"Slithering Ooze", -- [1]
			"Plaguefall", -- [2]
		},
		[169157] = {
			"Mudlump", -- [1]
			"Castle Nathria", -- [2]
		},
		[147378] = {
			"Treasury Protector", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[76376] = {
			"Skyreach Arcanologist", -- [1]
			"Skyreach", -- [2]
		},
		[80719] = {
			"Iron Smith", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[11988] = {
			"Golemagg the Incinerator", -- [1]
			"Molten Core", -- [2]
		},
		[139469] = {
			"Zu-Xan of Thunder", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[151754] = {
			"Void Haunt", -- [1]
			"Emerald Dream - HoA Scenario", -- [2]
		},
		[165805] = {
			"Shade of Kael'thas", -- [1]
			"Castle Nathria", -- [2]
		},
		[129640] = {
			"Snarling Dockhound", -- [1]
			"Siege of Boralus", -- [2]
		},
		[56766] = {
			"Volatile Energy", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[167111] = {
			"Spinemaw Staghorn", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[114284] = {
			"Elfyra", -- [1]
			"Return to Karazhan", -- [2]
		},
		[61245] = {
			"Capacitor Totem", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139470] = {
			"Serpent Master Xisho", -- [1]
			"Snowblossom Village (Islands 3)", -- [2]
		},
		[122986] = {
			"Wild Skyscreamer", -- [1]
			"Atal'Dazar", -- [2]
		},
		[164552] = {
			"Rotmarrow Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[45377] = {
			"Augh", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[53695] = {
			"Rageface", -- [1]
			"Firelands", -- [2]
		},
		[71543] = {
			"Immerseus", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[87411] = {
			"Workshop Guardian", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138447] = {
			"Battle-Maiden Salaria", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[62397] = {
			"Wind Lord Mel'jarak", -- [1]
			"Heart of Fear", -- [2]
		},
		[139471] = {
			"Bugan the Flesh-Crusher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[117776] = {
			"Shadow Council Warlock", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[98081] = {
			"Bellowing Idol", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[162508] = {
			"Anubisath Sentinel", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[77687] = {
			"Grom'kar Man-at-Arms", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[158411] = {
			"Unstable Servant", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[167113] = {
			"Spinemaw Acidgullet", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[114541] = {
			"Spectral Patron", -- [1]
			"Return to Karazhan", -- [2]
		},
		[139472] = {
			"Stone-Lord Qinsho", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139474] = {
			"Qor-Xin the Earth-Caller", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[165066] = {
			"Huntsman Altimor", -- [1]
			"Castle Nathria", -- [2]
		},
		[44922] = {
			"Oathsworn Axemaster", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[64061] = {
			"Mogu'shan Warden", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[150222] = {
			"Gunker", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[167116] = {
			"Spinemaw Reaver", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[164557] = {
			"Shard of Halkias", -- [1]
			"Halls of Atonement", -- [2]
		},
		[139473] = {
			"Stone Machinist Nu-Xin", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[164555] = {
			"Millificent Manastorm", -- [1]
			"De Other Side", -- [2]
		},
		[165067] = {
			"Margore", -- [1]
			"Castle Nathria", -- [2]
		},
		[132819] = {
			"Rustpelt Pup", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[56895] = {
			"Weak Spot", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[81270] = {
			"Gorian Guardsman", -- [1]
			"Highmaul", -- [2]
		},
		[167115] = {
			"Necromancer Warcaster", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[114542] = {
			"Ghostly Philanthropist", -- [1]
			"Return to Karazhan", -- [2]
		},
		[45122] = {
			"Oathsworn Captain", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[164556] = {
			"Millhouse Manastorm", -- [1]
			"De Other Side", -- [2]
		},
		[45378] = {
			"Augh", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[132820] = {
			"Mudsnout Piglet", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[150959] = {
			"Mawsworn Interceptor", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[22885] = {
			"Dragon Turtle", -- [1]
			"Black Temple", -- [2]
		},
		[22949] = {
			"Gathios the Shatterer", -- [1]
			"Black Temple", -- [2]
		},
		[126427] = {
			"Branchlord Aldrus", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[139475] = {
			"Jade-Formed Bonesnapper", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135892] = {
			"Unleashed Inferno", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[154030] = {
			"Oddly Large Mawrat", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[42691] = {
			"Stonecore Rift Conjurer", -- [1]
			"The Stonecore", -- [2]
		},
		[23397] = {
			"Illidari Blood Lord", -- [1]
			"Black Temple", -- [2]
		},
		[137940] = {
			"Safety Shark", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[167117] = {
			"Spinemaw Larva", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[59801] = {
			"Krik'thik Wind Shaper", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[139476] = {
			"Stonebound Monstrosity", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[164558] = {
			"Hakkar the Soulflayer", -- [1]
			"De Other Side", -- [2]
		},
		[19622] = {
			"Kael'thas Sunstrider", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[90997] = {
			"Mightstone Breaker", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[157904] = {
			"Aqir Scarab", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[146131] = {
			"Bartok the Burrower", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[92387] = {
			"Drums of War", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[56439] = {
			"Sha of Doubt", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[150958] = {
			"Mawsworn Guard", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[135894] = {
			"Fire Elemental", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[33846] = {
			"Dark Rune Sentinel", -- [1]
			"Ulduar", -- [2]
		},
		[114288] = {
			"Skeletal Warrior", -- [1]
			"Maw of Souls", -- [2]
		},
		[95861] = {
			"Hatecoil Oracle", -- [1]
			"Eye of Azshara", -- [2]
		},
		[155860] = {
			"Shirakess Voidreaper", -- [1]
			"The Eternal Palace", -- [2]
		},
		[61247] = {
			"Glintrok Greenhorn", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[53185] = {
			"Flamewaker Overseer", -- [1]
			"Firelands", -- [2]
		},
		[146134] = {
			"Speedy", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135895] = {
			"Blazing Spark", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[45379] = {
			"Augh", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[99188] = {
			"Waterlogged Soul Guard", -- [1]
			"Maw of Souls", -- [2]
		},
		[168361] = {
			"Fen Hornet", -- [1]
			"Plaguefall", -- [2]
		},
		[133848] = {
			"Encyclopedia Antagonistica", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[99956] = {
			"Fel-Infused Fury", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[147374] = {
			"Barrier", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[155859] = {
			"Vizja'ra", -- [1]
			"The Eternal Palace", -- [2]
		},
		[76154] = {
			"Skyreach Raven Whisperer", -- [1]
			"Skyreach", -- [2]
		},
		[139480] = {
			"Stonebound Protector", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[121711] = {
			"Bilespray Lasher", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[130521] = {
			"Freehold Deckhand", -- [1]
			"Freehold", -- [2]
		},
		[42692] = {
			"Stonecore Bruiser", -- [1]
			"The Stonecore", -- [2]
		},
		[114289] = {
			"Skeletal Sorcerer", -- [1]
			"Maw of Souls", -- [2]
		},
		[138968] = {
			"Zian-Ti Ironmaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[114801] = {
			"Spectral Apprentice", -- [1]
			"Return to Karazhan", -- [2]
		},
		[98677] = {
			"Rook Spiderling", -- [1]
			"Black Rook Hold", -- [2]
		},
		[156884] = {
			"Essence of Vita", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[78714] = {
			"Kargath Bladefist", -- [1]
			"Highmaul", -- [2]
		},
		[64063] = {
			"Mogu'shan Arcanist", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[164562] = {
			"Depraved Houndmaster", -- [1]
			"Halls of Atonement", -- [2]
		},
		[164563] = {
			"Vicious Gargon", -- [1]
			"Halls of Atonement", -- [2]
		},
		[138969] = {
			"Zian-Ti Spirit", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[98425] = {
			"Unstable Amalgamation", -- [1]
			"The Arcway", -- [2]
		},
		[168658] = {
			"Forsworn Devastator", -- [1]
			"Spires of Ascension", -- [2]
		},
		[133852] = {
			"Living Rot", -- [1]
			"The Underrot", -- [2]
		},
		[134364] = {
			"Faithless Tender", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[138972] = {
			"Zian-Ti Cloudbreaker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131812] = {
			"Heartsbane Soulcharmer", -- [1]
			"Waycrest Manor", -- [2]
		},
		[138475] = {
			"Tyrantion", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138970] = {
			"Vengeful Spirit", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[114802] = {
			"Spectral Journeyman", -- [1]
			"Return to Karazhan", -- [2]
		},
		[164567] = {
			"Ingra Maloch", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[165076] = {
			"Gluttonous Tick", -- [1]
			"Sanguine Depths", -- [2]
		},
		[91000] = {
			"Vileshard Hulk", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[53187] = {
			"Flamewaker Animator", -- [1]
			"Firelands", -- [2]
		},
		[174802] = {
			"Venomous Sniper", -- [1]
			"Plaguefall", -- [2]
		},
		[22950] = {
			"High Nethermancer Zerevor", -- [1]
			"Black Temple", -- [2]
		},
		[138971] = {
			"Zian-Ti Serpent", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[114804] = {
			"Spectral Charger", -- [1]
			"Return to Karazhan", -- [2]
		},
		[170199] = {
			"Harnessed Specter", -- [1]
			"Castle Nathria", -- [2]
		},
		[168153] = {
			"Plagueroc", -- [1]
			"Plaguefall", -- [2]
		},
		[59458] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[11669] = {
			"Flame Imp", -- [1]
			"Molten Core", -- [2]
		},
		[138466] = {
			"Obsidian Whelp", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[146650] = {
			"Champion Sentinel", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[118642] = {
			"Dreadwing", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[114803] = {
			"Spectral Stable Hand", -- [1]
			"Return to Karazhan", -- [2]
		},
		[138978] = {
			"Gargantuan Muckfin", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[61634] = {
			"Commander Vo'jak", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[91001] = {
			"Tarspitter Lurker", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[170197] = {
			"Conjured Manifestation", -- [1]
			"Castle Nathria", -- [2]
		},
		[146139] = {
			"Goldspine", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[112251] = {
			"Putrid Sludge", -- [1]
			"The Nighthold", -- [2]
		},
		[22951] = {
			"Lady Malande", -- [1]
			"Black Temple", -- [2]
		},
		[12098] = {
			"Sulfuron Harbinger", -- [1]
			"Molten Core", -- [2]
		},
		[113012] = {
			"Felsworn Chaos-Mage", -- [1]
			"The Nighthold", -- [2]
		},
		[151978] = {
			"Waterstrider", -- [1]
			"Snowblossom Village (Islands 3)", -- [2]
		},
		[84859] = {
			"Iron Cleaver", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138467] = {
			"Obsidian Dragonkin", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146140] = {
			"Quilldozer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[146652] = {
			"Bolstered Deathguard", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[102263] = {
			"Skorpyron", -- [1]
			"The Nighthold", -- [2]
		},
		[139486] = {
			"Skycrack", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135903] = {
			"Manifestation of the Deep", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[168156] = {
			"Remornia", -- [1]
			"Castle Nathria", -- [2]
		},
		[99192] = {
			"Shade of Xavius", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[119923] = {
			"Helblaze Soulmender", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[162534] = {
			"Anubisath Sentinel", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146653] = {
			"Champion Huntress", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[100216] = {
			"Hatecoil Wrangler", -- [1]
			"Eye of Azshara", -- [2]
		},
		[132837] = {
			"Beach Strider", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[113013] = {
			"Felsworn Shadowblade", -- [1]
			"The Nighthold", -- [2]
		},
		[157608] = {
			"Faceless Willbreaker", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[84860] = {
			"Iron Earthbinder", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[133345] = {
			"Feckless Assistant", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[77182] = {
			"Oregorger", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138464] = {
			"Ashvane Deckhand", -- [1]
			"Siege of Boralus", -- [2]
		},
		[145123] = {
			"Myara Nightsong", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[151773] = {
			"Junkyard D.0.G.", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138982] = {
			"Muckfin Murloc", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138990] = {
			"Urgl the Blind", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[91003] = {
			"Rokmora", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[98173] = {
			"Mystic Ssa'veh", -- [1]
			"Eye of Azshara", -- [2]
		},
		[42696] = {
			"Stonecore Warbringer", -- [1]
			"The Stonecore", -- [2]
		},
		[138465] = {
			"Ashvane Cannoneer", -- [1]
			"Siege of Boralus", -- [2]
		},
		[102269] = {
			"Felstalker Ravener", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[155869] = {
			"Shirakess Shadowcaster", -- [1]
			"The Eternal Palace", -- [2]
		},
		[131819] = {
			"Coven Diviner", -- [1]
			"Waycrest Manor", -- [2]
		},
		[128631] = {
			"Tidal Clickshell", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[132835] = {
			"Dreadfang Snake", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[137442] = {
			"High Sorceress Marala", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[102781] = {
			"Fel Bat Pup", -- [1]
			"Black Rook Hold", -- [2]
		},
		[61250] = {
			"Sorcerer Mogu", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[53188] = {
			"Flamewaker Subjugator", -- [1]
			"Firelands", -- [2]
		},
		[98426] = {
			"Unstable Ooze", -- [1]
			"The Arcway", -- [2]
		},
		[119157] = {
			"Felguard", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[138988] = {
			"Mrgl-Eye", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[91004] = {
			"Ularogg Cragshaper", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[59461] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[22887] = {
			"High Warlord Naj'entus", -- [1]
			"Black Temple", -- [2]
		},
		[146657] = {
			"Veteran Sentinel", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[62402] = {
			"Kor'thik Elite Blademaster", -- [1]
			"Heart of Fear", -- [2]
		},
		[155871] = {
			"Voidbound Terror", -- [1]
			"The Eternal Palace", -- [2]
		},
		[64068] = {
			"Mogu'shan Engine Keeper", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[160990] = {
			"Image of Absolution", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[165597] = {
			"Patchwerk Soldier", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[133870] = {
			"Diseased Lasher", -- [1]
			"The Underrot", -- [2]
		},
		[42695] = {
			"Stonecore Sentry", -- [1]
			"The Stonecore", -- [2]
		},
		[138468] = {
			"Obsidian Flamecaller", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138980] = {
			"Muckfin Raider", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[155872] = {
			"Trapped Saurok", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[148194] = {
			"Icy Barrier", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[144611] = {
			"Coralback Scuttler", -- [1]
			"The Eternal Palace", -- [2]
		},
		[91005] = {
			"Naraxas", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[134060] = {
			"Lord Stormsong", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[120182] = {
			"Tormented Priestess", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[138469] = {
			"Obsidian Scalebane", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[138981] = {
			"Muckfin Oracle", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[155873] = {
			"Darkcast Annihilator", -- [1]
			"The Eternal Palace", -- [2]
		},
		[148195] = {
			"Hateful Shade", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[163559] = {
			"Royal Servant", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[136934] = {
			"Weapons Tester", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[150250] = {
			"Pistonhead Blaster", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138989] = {
			"Saltfin", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[138470] = {
			"Obsidian Drake", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[53189] = {
			"Molten Elemental", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[53575] = {
			"Lava Wielder", -- [1]
			"Firelands", -- [2]
		},
		[62405] = {
			"Sra'thik Amber-Trapper", -- [1]
			"Heart of Fear", -- [2]
		},
		[157419] = {
			"Void-Twisted Whelp", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[91006] = {
			"Rockback Gnasher", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[120188] = {
			"Wailing Soul", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[134898] = {
			"Venomfang Recluse", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138471] = {
			"Obsidian Wyrmguard", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138983] = {
			"Muckfin Tidehunter", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[102272] = {
			"Felguard Destroyer", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[131817] = {
			"Cragmaw the Infested", -- [1]
			"The Underrot", -- [2]
		},
		[134899] = {
			"Venomfang Lurker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[169696] = {
			"Mire Soldier", -- [1]
			"Plaguefall", -- [2]
		},
		[162018] = {
			"Temple Guard", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[130421] = {
			"Serpent Ward", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138472] = {
			"Obsidian Captain", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138984] = {
			"Scarscale", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[59460] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[131818] = {
			"Marked Sister", -- [1]
			"Waycrest Manor", -- [2]
		},
		[66181] = {
			"Zar'thik Supplicant", -- [1]
			"Heart of Fear", -- [2]
		},
		[91007] = {
			"Dargrul", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[78978] = {
			"Darkshard Gnasher", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[39625] = {
			"General Umbriss", -- [1]
			"Grim Batol", -- [2]
		},
		[138473] = {
			"Stygia", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138985] = {
			"Old Grmgl", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[22056] = {
			"Coilfang Strider", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[148199] = {
			"Screeching Phantasm", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[150254] = {
			"Scraphound", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[134908] = {
			"Bloodfang", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[162020] = {
			"Priestess of Elune", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[158437] = {
			"Fallen Taskmaster", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[112255] = {
			"Sludgerax", -- [1]
			"The Nighthold", -- [2]
		},
		[138986] = {
			"Borgl the Seeker", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[102273] = {
			"Doomguard Infiltrator", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[148200] = {
			"Restless Bones", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[169196] = {
			"Crimson Cabalist", -- [1]
			"Castle Nathria", -- [2]
		},
		[91008] = {
			"Rockbound Pelter", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[162021] = {
			"Temple Archer", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[87520] = {
			"Animated Slag", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[22952] = {
			"Veras Darkshadow", -- [1]
			"Black Temple", -- [2]
		},
		[138987] = {
			"Muckfin High Oracle", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[134388] = {
			"A Knot of Snakes", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[131821] = {
			"Faceless Maiden", -- [1]
			"Waycrest Manor", -- [2]
		},
		[170228] = {
			"Bone Husk", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[161510] = {
			"Mindrend Tentacle", -- [1]
			"The Underrot", -- [2]
		},
		[21696] = {
			"Steam Surger", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[150249] = {
			"Pistonhead Scrapper", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[73349] = {
			"Tormented Initiate", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[134893] = {
			"Ironweb Spider", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[123001] = {
			"Dark Water", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134389] = {
			"Venomous Ophidian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[152809] = {
			"Alx'kov the Infested", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[135925] = {
			"Pyroblaze", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[119930] = {
			"Dreadwing", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[39626] = {
			"Crimsonborne Warlord", -- [1]
			"Grim Batol", -- [2]
		},
		[138477] = {
			"Talonguard Vrykiss", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134894] = {
			"Ironweb Spinner", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131311] = {
			"Unleashed Azerite", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[131823] = {
			"Sister Malady", -- [1]
			"Waycrest Manor", -- [2]
		},
		[12118] = {
			"Lucifron", -- [1]
			"Molten Core", -- [2]
		},
		[145132] = {
			"Veteran Deathguard", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[145644] = {
			"Bwonsamdi", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[150251] = {
			"Pistonhead Mechanic", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[140541] = {
			"Kindleweb Creeper", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[45001] = {
			"Enslaved Bandit", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[141566] = {
			"Scrimshaw Gutter", -- [1]
			"Siege of Boralus", -- [2]
		},
		[131824] = {
			"Sister Solena", -- [1]
			"Waycrest Manor", -- [2]
		},
		[148716] = {
			"Risen Soul", -- [1]
			"The Underrot", -- [2]
		},
		[99200] = {
			"Dresaron", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[78981] = {
			"Iron Gunnery Sergeant", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[154347] = {
			"Void-Twisted Corruptor", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[138479] = {
			"Obsidian Overlord", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138991] = {
			"Grrl", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[138485] = {
			"Nuzoriak the Experimenter", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[131825] = {
			"Sister Briar", -- [1]
			"Waycrest Manor", -- [2]
		},
		[98691] = {
			"Risen Scout", -- [1]
			"Black Rook Hold", -- [2]
		},
		[132849] = {
			"Grizzlefur Cub", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[133361] = {
			"Wasting Servant", -- [1]
			"Waycrest Manor", -- [2]
		},
		[150253] = {
			"Weaponized Crawler", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[22956] = {
			"Sister of Pain", -- [1]
			"Black Temple", -- [2]
		},
		[138992] = {
			"Muckfin Puddlejumper", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[91781] = {
			"Hatecoil Warrior", -- [1]
			"Eye of Azshara", -- [2]
		},
		[168681] = {
			"Forsworn Helion", -- [1]
			"Spires of Ascension", -- [2]
		},
		[150773] = {
			"Shimmerskin Pufferfish", -- [1]
			"The Eternal Palace", -- [2]
		},
		[98693] = {
			"Shackled Servitor", -- [1]
			"Maw of Souls", -- [2]
		},
		[146678] = {
			"Ancient Protector", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[137969] = {
			"Interment Construct", -- [1]
			"Kings' Rest", -- [2]
		},
		[138481] = {
			"Chromitus", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[64453] = {
			"Set'thik Windblade", -- [1]
			"Heart of Fear", -- [2]
		},
		[172265] = {
			"Remnant of Fury", -- [1]
			"Sanguine Depths", -- [2]
		},
		[44234] = {
			"Vicious Leech", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[125828] = {
			"Kattè", -- [1]
			"Atal'Dazar", -- [2]
		},
		[126847] = {
			"Captain Raoul", -- [1]
			"Freehold", -- [2]
		},
		[137458] = {
			"Rotting Spore", -- [1]
			"The Underrot", -- [2]
		},
		[102282] = {
			"Lord Malgath", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[138482] = {
			"Kaluriak the Alchemist", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[416] = {
			"Jaktog", -- [1]
			"Crucible of Storms", -- [2]
		},
		[417] = {
			"Sloozhem", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[135923] = {
			"Hound of Gazzran", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135931] = {
			"Ashstone", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[91784] = {
			"Warlord Parjesh", -- [1]
			"Eye of Azshara", -- [2]
		},
		[62408] = {
			"Zar'thik Battle-Mender", -- [1]
			"Heart of Fear", -- [2]
		},
		[152312] = {
			"Azsh'ari Witch", -- [1]
			"The Eternal Palace", -- [2]
		},
		[138483] = {
			"Obsidian Monstrosity", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134900] = {
			"Venomfang Spider", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[152324] = {
			"Aldwin Laughlin", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[135924] = {
			"Molten Fury", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[152816] = {
			"Stormling", -- [1]
			"The Eternal Palace", -- [2]
		},
		[162038] = {
			"Regal Mistdancer", -- [1]
			"Sanguine Depths", -- [2]
		},
		[23337] = {
			"Illidari Centurion", -- [1]
			"Black Temple", -- [2]
		},
		[165111] = {
			"Drust Spiteclaw", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[138484] = {
			"Obsidian Prophet", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[91790] = {
			"Mak'rana Siltwalker", -- [1]
			"Eye of Azshara", -- [2]
		},
		[131318] = {
			"Elder Leaxa", -- [1]
			"The Underrot", -- [2]
		},
		[160495] = {
			"Maniacal Soulbinder", -- [1]
			"Theater of Pain", -- [2]
		},
		[162040] = {
			"Grand Overseer", -- [1]
			"Sanguine Depths", -- [2]
		},
		[138515] = {
			"Endalion", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[115844] = {
			"Goroth", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[91786] = {
			"Gritslime Snail", -- [1]
			"Eye of Azshara", -- [2]
		},
		[134390] = {
			"Sand-crusted Striker", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[64454] = {
			"Zar'thik Augurer", -- [1]
			"Heart of Fear", -- [2]
		},
		[138507] = {
			"Warlord Ultriss", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135926] = {
			"Smolderheart", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[40268] = {
			"Twilight War-Mage", -- [1]
			"Grim Batol", -- [2]
		},
		[113536] = {
			"Emberhusk Dominator", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[60999] = {
			"Sha of Fear", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[155900] = {
			"Zsal'iss", -- [1]
			"The Eternal Palace", -- [2]
		},
		[167151] = {
			"Frail Spotter", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[126845] = {
			"Captain Jolly", -- [1]
			"Freehold", -- [2]
		},
		[119940] = {
			"Fallen Priestess", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[45259] = {
			"Servant of Siamat", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[139530] = {
			"Earth-Wrought Siegebreaker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[137474] = {
			"King Timalji", -- [1]
			"Kings' Rest", -- [2]
		},
		[140545] = {
			"Broodqueen Flareanae", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[120191] = {
			"Eternal Soulguard", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[91782] = {
			"Hatecoil Crusher", -- [1]
			"Eye of Azshara", -- [2]
		},
		[138999] = {
			"Elder Ordol", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[22955] = {
			"Charming Courtesan", -- [1]
			"Black Temple", -- [2]
		},
		[42188] = {
			"Ozruk", -- [1]
			"The Stonecore", -- [2]
		},
		[21695] = {
			"Tidal Surger", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[113537] = {
			"Emberhusk Dominator", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[157439] = {
			"Fury of N'Zoth", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146850] = {
			"Grand Master Ulrich", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[163058] = {
			"Mistveil Defender", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[134905] = {
			"Shadeweb Huntress", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[59464] = {
			"Hopper", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[135929] = {
			"Baron Blazehollow", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[98949] = {
			"Smashspite the Hateful", -- [1]
			"Black Rook Hold", -- [2]
		},
		[99033] = {
			"Helarjar Mistcaller", -- [1]
			"Maw of Souls", -- [2]
		},
		[138509] = {
			"Spellbinder Ulura", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[158452] = {
			"Mindtwist Tendril", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[138489] = {
			"Shadow of Zul", -- [1]
			"Kings' Rest", -- [2]
		},
		[139001] = {
			"Wildlands Ursa", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[151798] = {
			"Vexiona", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[135930] = {
			"Lavarok", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[40269] = {
			"Enslaved Thunder Spirit", -- [1]
			"Grim Batol", -- [2]
		},
		[157441] = {
			"Void Wraith", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[130436] = {
			"Off-Duty Laborer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[136100] = {
			"Sunken Denizen", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[91794] = {
			"Saltscale Lurker", -- [1]
			"Eye of Azshara", -- [2]
		},
		[139002] = {
			"Wildlands Totemic", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[162049] = {
			"Vestige of Doubt", -- [1]
			"Sanguine Depths", -- [2]
		},
		[152311] = {
			"Zanj'ir Myrmidon", -- [1]
			"The Eternal Palace", -- [2]
		},
		[165108] = {
			"Illusionary Clone", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[153335] = {
			"Potent Spark", -- [1]
			"The Eternal Palace", -- [2]
		},
		[138659] = {
			"Risen Hound", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[166644] = {
			"Artificer Xy'mox", -- [1]
			"Castle Nathria", -- [2]
		},
		[22954] = {
			"Illidari Fearbringer", -- [1]
			"Black Temple", -- [2]
		},
		[139003] = {
			"Wildlands Warrior", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[91789] = {
			"Lady Hatecoil", -- [1]
			"Eye of Azshara", -- [2]
		},
		[135932] = {
			"Volcanar", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[121473] = {
			"Coercitor Nixa", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[78233] = {
			"Darkshard Crystalback", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[63048] = {
			"Kor'thik Slicer", -- [1]
			"Heart of Fear", -- [2]
		},
		[23402] = {
			"Illidari Battle-mage", -- [1]
			"Black Temple", -- [2]
		},
		[142587] = {
			"Devouring Maggot", -- [1]
			"Waycrest Manor", -- [2]
		},
		[139004] = {
			"Wildlands Shaman", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[151801] = {
			"Amathet Zealot", -- [1]
			"Halls of Origination", -- [2]
		},
		[152313] = {
			"Dreadcoil Hulk", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140540] = {
			"Kindleweb Clutchkeeper", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[76946] = {
			"Faultline", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[162039] = {
			"Wicked Oppressor", -- [1]
			"Sanguine Depths", -- [2]
		},
		[120194] = {
			"Ghostly Acolyte", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[91785] = {
			"Wandering Shellback", -- [1]
			"Eye of Azshara", -- [2]
		},
		[139005] = {
			"Wildlands Tracker", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[95885] = {
			"Tirathon Saltheril", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[117123] = {
			"Tidescale Legionnaire", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[40270] = {
			"Twilight Thundercaller", -- [1]
			"Grim Batol", -- [2]
		},
		[5277] = {
			"Nightmare Scalebane", -- [1]
			"Sunken Temple", -- [2]
		},
		[56906] = {
			"Saboteur Kip'tilak", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[130437] = {
			"Mine Rat", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[52558] = {
			"Lord Rhyolith", -- [1]
			"Firelands", -- [2]
		},
		[139006] = {
			"Wildlands Furbolg", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[59598] = {
			"Lesser Sha", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[98696] = {
			"Illysanna Ravencrest", -- [1]
			"Black Rook Hold", -- [2]
		},
		[140542] = {
			"Kindleweb Spider", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[132864] = {
			"Juvenile Knucklebump", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[162041] = {
			"Grubby Dirtcruncher", -- [1]
			"Sanguine Depths", -- [2]
		},
		[138505] = {
			"Evolved Clutch-Warden", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138495] = {
			"Twilight Commander", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[8440] = {
			"Avatar of Hakkar", -- [1]
			"Sunken Temple", -- [2]
		},
		[155899] = {
			"Sak'ja", -- [1]
			"The Eternal Palace", -- [2]
		},
		[148221] = {
			"Risen Hulk", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[144638] = {
			"Grong the Revenant", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[58826] = {
			"Zao Sunseeker", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[63049] = {
			"Set'thik Swiftblade", -- [1]
			"Heart of Fear", -- [2]
		},
		[91796] = {
			"Skrog Wavecrasher", -- [1]
			"Eye of Azshara", -- [2]
		},
		[146686] = {
			"Cowled Plaguebringer", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[91792] = {
			"Stormwake Hydra", -- [1]
			"Eye of Azshara", -- [2]
		},
		[127106] = {
			"Irontide Officer", -- [1]
			"Freehold", -- [2]
		},
		[43214] = {
			"Slabhide", -- [1]
			"The Stonecore", -- [2]
		},
		[157447] = {
			"Fanatical Cultist", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[141056] = {
			"Tide Lord Makuna", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[137473] = {
			"Guard Captain Atu", -- [1]
			"Kings' Rest", -- [2]
		},
		[137484] = {
			"King A'akul", -- [1]
			"Kings' Rest", -- [2]
		},
		[91787] = {
			"Cove Seagull", -- [1]
			"Eye of Azshara", -- [2]
		},
		[134914] = {
			"Trapdoor Spider", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[56395] = {
			"Shado-Pan Novice", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[120201] = {
			"Spectral Guardian", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[80526] = {
			"Stubborn Ironhoof", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[95887] = {
			"Glazer", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[170234] = {
			"Oppressive Banner", -- [1]
			"Theater of Pain", -- [2]
		},
		[132885] = {
			"Air Elemental", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138498] = {
			"Twilight Drake", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[162715] = {
			"Fanatical Cultist", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[172282] = {
			"Web Wrap", -- [1]
			"Plaguefall", -- [2]
		},
		[162056] = {
			"Rockbound Sprite", -- [1]
			"Sanguine Depths", -- [2]
		},
		[98954] = {
			"Felsworn Myrmidon", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[132868] = {
			"Congealed Azerite", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[119941] = {
			"Soul Residue", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[146187] = {
			"Firesting Dominator", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138499] = {
			"Twilight Dragonkin", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134916] = {
			"Trapdoor Hunter", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[148894] = {
			"Lost Soul", -- [1]
			"The Underrot", -- [2]
		},
		[168700] = {
			"Pestering Fiend", -- [1]
			"Castle Nathria", -- [2]
		},
		[157450] = {
			"Spellbound Ritualist", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[136964] = {
			"High Perch Arbalest", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[23339] = {
			"Illidari Heartseeker", -- [1]
			"Black Temple", -- [2]
		},
		[146178] = {
			"Azurespine", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138500] = {
			"Twilight Scalesister", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[171772] = {
			"Mistveil Defender", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[139680] = {
			"Lightless Hunter", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[123269] = {
			"Kook", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[162057] = {
			"Chamber Sentinel", -- [1]
			"Sanguine Depths", -- [2]
		},
		[132879] = {
			"Crystalline Giant", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[162047] = {
			"Insatiable Brute", -- [1]
			"Sanguine Depths", -- [2]
		},
		[137989] = {
			"Embalming Fluid", -- [1]
			"Kings' Rest", -- [2]
		},
		[138501] = {
			"Twilight Whelp", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[64458] = {
			"Kor'thik Warsinger", -- [1]
			"Heart of Fear", -- [2]
		},
		[123274] = {
			"Saltfur Brawler", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[131847] = {
			"Waycrest Reveler", -- [1]
			"Waycrest Manor", -- [2]
		},
		[40272] = {
			"Ascended Rockbreaker", -- [1]
			"Grim Batol", -- [2]
		},
		[141061] = {
			"Servant of Thros", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[137478] = {
			"Queen Wasi", -- [1]
			"Kings' Rest", -- [2]
		},
		[61131] = {
			"Mogu'shan Secret-Keeper", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[138502] = {
			"Naroviak Wyrm-Bender", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[45007] = {
			"Enslaved Bandit", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[41040] = {
			"Twisted Visage", -- [1]
			"Grim Batol", -- [2]
		},
		[123270] = {
			"Chef Gru", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[128649] = {
			"Sergeant Bainbridge", -- [1]
			"Siege of Boralus", -- [2]
		},
		[157442] = {
			"Gaze of Madness", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[133384] = {
			"Merektha", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[150276] = {
			"Heavy Scrapbot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138503] = {
			"Overseer of Twilight", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138512] = {
			"Thorisiona", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[151812] = {
			"Detect-o-Bot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[131849] = {
			"Crazed Marksman", -- [1]
			"Waycrest Manor", -- [2]
		},
		[62795] = {
			"Sik'thik Warden", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[148893] = {
			"Tormented Soul", -- [1]
			"The Underrot", -- [2]
		},
		[174335] = {
			"Stone Legion Skirmisher", -- [1]
			"Castle Nathria", -- [2]
		},
		[97677] = {
			"Barbed Spiderling", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[138504] = {
			"General Drakkarion", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148244] = {
			"Fallen Disciple", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[155908] = {
			"Deathspeaker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[131850] = {
			"Maddened Survivalist", -- [1]
			"Waycrest Manor", -- [2]
		},
		[162058] = {
			"Ventunax", -- [1]
			"Spires of Ascension", -- [2]
		},
		[98706] = {
			"Commander Shemdah'sohn", -- [1]
			"Black Rook Hold", -- [2]
		},
		[162051] = {
			"Frenzied Ghoul", -- [1]
			"Sanguine Depths", -- [2]
		},
		[87771] = {
			"Slagshop Worker", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[95886] = {
			"Ash'Golm", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[134418] = {
			"Drowned Depthbringer", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[139529] = {
			"Muklai", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152326] = {
			"Kyra Boucher", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140553] = {
			"Broodqueen Shuzasz", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139539] = {
			"Tavok, Hammer of the Empress", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[22957] = {
			"Priestess of Dementia", -- [1]
			"Black Temple", -- [2]
		},
		[97678] = {
			"Aranasi Broodmother", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[138506] = {
			"Crimsonscale", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[53619] = {
			"Druid of the Flame", -- [1]
			"Firelands", -- [2]
		},
		[127111] = {
			"Irontide Oarsman", -- [1]
			"Freehold", -- [2]
		},
		[123272] = {
			"Saltfur Fish-Sticker", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[105617] = {
			"Eredar Chaosbringer", -- [1]
			"The Arcway", -- [2]
		},
		[127879] = {
			"Shieldbearer of Zul", -- [1]
			"Atal'Dazar", -- [2]
		},
		[147868] = {
			"Frenzied Saurid", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[146185] = {
			"Firesting Drone", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[163077] = {
			"Azules", -- [1]
			"Spires of Ascension", -- [2]
		},
		[163086] = {
			"Rancid Gasbag", -- [1]
			"Theater of Pain", -- [2]
		},
		[151816] = {
			"Deadsoul Scavenger", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146844] = {
			"Olfkrig the Indentured", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[98963] = {
			"Blazing Imp", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[132877] = {
			"Dankscale", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[133389] = {
			"Galvazzt", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[146186] = {
			"Firesting Warrior", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138508] = {
			"Unbreakable Vortax", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[128652] = {
			"Viq'Goth", -- [1]
			"Siege of Boralus", -- [2]
		},
		[151817] = {
			"Deadsoul Devil", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[148243] = {
			"Fallen Disciple", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[132887] = {
			"Deathsting Hatchling", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[76253] = {
			"Dread Raven Hatchling", -- [1]
			"Skyreach", -- [2]
		},
		[137485] = {
			"Bloodsworn Agent", -- [1]
			"Kings' Rest", -- [2]
		},
		[103822] = {
			"Treant", -- [1]
			"Theater of Pain", -- [2]
		},
		[95888] = {
			"Cordana Felsong", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[39890] = {
			"Twilight Earthshaper", -- [1]
			"Grim Batol", -- [2]
		},
		[151818] = {
			"Deadsoul Miscreation", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[60621] = {
			"Corrupted Waters", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[139677] = {
			"Depth-Caller", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[157449] = {
			"Sinister Soulcarver", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[137486] = {
			"Queen Patlaa", -- [1]
			"Kings' Rest", -- [2]
		},
		[146188] = {
			"Firesting Dominator", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138510] = {
			"Twilight Doomcaller", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[102287] = {
			"Emberhusk Dominator", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[116691] = {
			"Belac", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[152331] = {
			"Captain Lancy Revshon", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[146843] = {
			"Spiked Ghoul", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[33236] = {
			"Steelforged Defender", -- [1]
			"Ulduar", -- [2]
		},
		[137487] = {
			"Skeletal Hunting Raptor", -- [1]
			"Kings' Rest", -- [2]
		},
		[99728] = {
			"Grimguard", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[138511] = {
			"Azurescale", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134940] = {
			"Bristlethorn Piercer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135959] = {
			"Quakestomp the Rumbler", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[152332] = {
			"Lara Moore", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140059] = {
			"Grizzlefur Mauler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136976] = {
			"T'zala", -- [1]
			"Kings' Rest", -- [2]
		},
		[63053] = {
			"Garalon's Leg", -- [1]
			"Heart of Fear", -- [2]
		},
		[163089] = {
			"Disgusting Refuse", -- [1]
			"Theater of Pain", -- [2]
		},
		[134417] = {
			"Deepsea Ritualist", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[160663] = {
			"Essence of Nightmare", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139536] = {
			"Zara'thik Drone", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131858] = {
			"Thornguard", -- [1]
			"Waycrest Manor", -- [2]
		},
		[59726] = {
			"Peril", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[157452] = {
			"Nightmare Antigen", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[162059] = {
			"Kin-Tara", -- [1]
			"Spires of Ascension", -- [2]
		},
		[174856] = {
			"Slithering Ooze", -- [1]
			"Plaguefall", -- [2]
		},
		[138513] = {
			"Vyrantion", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[152852] = {
			"Pashmar the Fanatical", -- [1]
			"The Eternal Palace", -- [2]
		},
		[155917] = {
			"Azsh'ari Stormcaller", -- [1]
			"The Eternal Palace", -- [2]
		},
		[97173] = {
			"Restless Tides", -- [1]
			"Eye of Azshara", -- [2]
		},
		[80534] = {
			"Ornery Ironhoof", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[97170] = {
			"Hatecoil Wavebinder", -- [1]
			"Eye of Azshara", -- [2]
		},
		[162060] = {
			"Oryphrion", -- [1]
			"Spires of Ascension", -- [2]
		},
		[174857] = {
			"Slithering Ooze", -- [1]
			"Plaguefall", -- [2]
		},
		[138514] = {
			"Athiona", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[167691] = {
			"Stasis Trap", -- [1]
			"Castle Nathria", -- [2]
		},
		[139538] = {
			"Wall-Breaker Ha'vik", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[123276] = {
			"Saltfur Sandrunner", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140562] = {
			"Brimstone Hound", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[33237] = {
			"Ulduar Colossus", -- [1]
			"Ulduar", -- [2]
		},
		[162061] = {
			"Devos", -- [1]
			"Spires of Ascension", -- [2]
		},
		[158478] = {
			"Corruption Tumor", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[128651] = {
			"Hadal Darkfathom", -- [1]
			"Siege of Boralus", -- [2]
		},
		[58319] = {
			"Lesser Sha", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[155919] = {
			"Stormling", -- [1]
			"The Eternal Palace", -- [2]
		},
		[152853] = {
			"Silivaz the Zealous", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140563] = {
			"Brimstone Tracker", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[97171] = {
			"Hatecoil Arcanist", -- [1]
			"Eye of Azshara", -- [2]
		},
		[126092] = {
			"Slitherblade Gladiator", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[173840] = {
			"Plaguebound Devoted", -- [1]
			"Plaguefall", -- [2]
		},
		[138516] = {
			"Twilight Evolutionist", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[147218] = {
			"Spirit of Gold", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[155920] = {
			"Azsh'ari Galeblade", -- [1]
			"The Eternal Palace", -- [2]
		},
		[168717] = {
			"Forsworn Justicar", -- [1]
			"Spires of Ascension", -- [2]
		},
		[140564] = {
			"Brimstone Lavamaw", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[150295] = {
			"Tank Buster MK1", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[119950] = {
			"Brimstone Infernal", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[139034] = {
			"Razorfin Impaler", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[91797] = {
			"King Deepbeard", -- [1]
			"Eye of Azshara", -- [2]
		},
		[39892] = {
			"Enslaved Burning Ember", -- [1]
			"Grim Batol", -- [2]
		},
		[131356] = {
			"Jungle Stalker", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131863] = {
			"Raal the Gluttonous", -- [1]
			"Waycrest Manor", -- [2]
		},
		[136470] = {
			"Refreshment Vendor", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[97172] = {
			"Saltsea Droplet", -- [1]
			"Eye of Azshara", -- [2]
		},
		[153874] = {
			"Mawsworn Sentry", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[139035] = {
			"Razorfin Aqualyte", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134423] = {
			"Abyss Dweller", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[129231] = {
			"Rixxa Fluxflame", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[159510] = {
			"Eye of the Depths", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[131864] = {
			"Gorak Tul", -- [1]
			"Waycrest Manor", -- [2]
		},
		[33110] = {
			"Dark Rune Acolyte", -- [1]
			"Ulduar", -- [2]
		},
		[118930] = {
			"Ixallon the Soulbreaker", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[72350] = {
			"Dragonmaw Elite Grunt", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[133912] = {
			"Bloodsworn Defiler", -- [1]
			"The Underrot", -- [2]
		},
		[120463] = {
			"Undersea Custodian", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[120719] = {
			"Lunar Priestess", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[62543] = {
			"Blade Lord Ta'yak", -- [1]
			"Heart of Fear", -- [2]
		},
		[137627] = {
			"Constricting Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[165137] = {
			"Zolramus Gatekeeper", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[136984] = {
			"Reban", -- [1]
			"Kings' Rest", -- [2]
		},
		[126094] = {
			"Slitherblade Wavecaller", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[150293] = {
			"Mechagon Prowler", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[149400] = {
			"Royal Dreadguard", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[139032] = {
			"Razorfin Waveguard", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[69791] = {
			"Longwoman", -- [1]
			"Waycrest Manor", -- [2]
		},
		[135961] = {
			"Deepstone Crusher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[165138] = {
			"Blight Bag", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[39381] = {
			"Crimsonborne Guardian", -- [1]
			"Grim Batol", -- [2]
		},
		[169751] = {
			"Ashen Wasp", -- [1]
			"Theater of Pain", -- [2]
		},
		[87448] = {
			"Ironworker", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[49267] = {
			"Crystal Shard", -- [1]
			"The Stonecore", -- [2]
		},
		[120720] = {
			"Lunar Guard", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[98203] = {
			"Ivanyr", -- [1]
			"The Arcway", -- [2]
		},
		[135962] = {
			"Crag Rager", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[156949] = {
			"Armsmaster Terenson", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[157461] = {
			"Mycelial Cyst", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[153878] = {
			"Mawsworn Archer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[105876] = {
			"Enchanted Broodling", -- [1]
			"The Arcway", -- [2]
		},
		[138650] = {
			"Tide-Lost Champion", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[61392] = {
			"Harthak Flameseeker", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[127119] = {
			"Freehold Deckhand", -- [1]
			"Freehold", -- [2]
		},
		[140058] = {
			"Grizzlefur Patriarch", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[78491] = {
			"Brackenspore", -- [1]
			"Highmaul", -- [2]
		},
		[132892] = {
			"Giddyleaf", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153879] = {
			"Deadsoul Shadow", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[139039] = {
			"Eso the Fathom-Hunter", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[81114] = {
			"Gronnling Laborer", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[120721] = {
			"Lunar Archer", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[161562] = {
			"General Shar'az", -- [1]
			"Halls of Origination", -- [2]
		},
		[135964] = {
			"Rumbling Earth", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139040] = {
			"Deep Oracle Unani", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[69792] = {
			"Longwoman", -- [1]
			"Waycrest Manor", -- [2]
		},
		[11673] = {
			"Ancient Core Hound", -- [1]
			"Molten Core", -- [2]
		},
		[150297] = {
			"Mechagon Renormalizer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[100249] = {
			"Channeler Varisz", -- [1]
			"Eye of Azshara", -- [2]
		},
		[139036] = {
			"Razorfin Javelineer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[151833] = {
			"Wandering Soul", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140060] = {
			"Grizzlefur Bear", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[116689] = {
			"Atrigan", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[136989] = {
			"Newstead Militia", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[32857] = {
			"Stormcaller Brundir", -- [1]
			"Ulduar", -- [2]
		},
		[16056] = {
			"Diseased Maggot", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[144160] = {
			"Chopper Redhook", -- [1]
			"Siege of Boralus", -- [2]
		},
		[139037] = {
			"Razorfin Jinyu", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[12057] = {
			"Garr", -- [1]
			"Molten Core", -- [2]
		},
		[140061] = {
			"Grizzlefur Den-Mother", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[56658] = {
			"Corrupt Droplet", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[136990] = {
			"Cursed Ankali", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[153882] = {
			"Deadsoul Spirit", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[137625] = {
			"Demolishing Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[100250] = {
			"Binder Ashioi", -- [1]
			"Eye of Azshara", -- [2]
		},
		[139038] = {
			"Kaihu", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[155930] = {
			"Deephive Chosen", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[45269] = {
			"Servant of Siamat", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[21694] = {
			"Bog Overlord", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[136991] = {
			"Blood-Hunter Dazal'ai", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[127381] = {
			"Silt Crab", -- [1]
			"Tol Dagor", -- [2]
		},
		[139044] = {
			"Wavemender Asha", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[98970] = {
			"Latosius", -- [1]
			"Black Rook Hold", -- [2]
		},
		[100248] = {
			"Ritualist Lesha", -- [1]
			"Eye of Azshara", -- [2]
		},
		[151836] = {
			"Void Horror", -- [1]
			"Emerald Dream - HoA Scenario", -- [2]
		},
		[140063] = {
			"Smashmaw the Man-Eater", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72351] = {
			"Dragonmaw Flagbearer", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[157467] = {
			"Void Ascendant", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146838] = {
			"Brittle Skeleton", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[138016] = {
			"Darokk", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[146326] = {
			"Headhunter Gal'wana", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[151325] = {
			"Alarm-o-Bot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[172312] = {
			"Spinemaw Gorger", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[148254] = {
			"Frost Shard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139043] = {
			"Tidestriker Ocho", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[169753] = {
			"Famished Tick", -- [1]
			"Sanguine Depths", -- [2]
		},
		[153885] = {
			"Deadsoul Shambler", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[173339] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[139045] = {
			"Speaker Juchi", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139041] = {
			"Aquamancer Lushu", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[17968] = {
			"Archimonde", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[140065] = {
			"Muskhide", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72352] = {
			"Dragonmaw Ebon Stalker", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[114584] = {
			"Phantom Crew", -- [1]
			"Return to Karazhan", -- [2]
		},
		[126099] = {
			"Duskcoat Den-Mother", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[123286] = {
			"Southsea Gambler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140070] = {
			"Bloodscent the Tracker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139042] = {
			"Spearmaster Kashai", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[151839] = {
			"Restless Soul", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135971] = {
			"Faithless Conscript", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[33113] = {
			"Flame Leviathan", -- [1]
			"Ulduar", -- [2]
		},
		[145185] = {
			"Gnomercy 4.U.", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138647] = {
			"Hjana Fogbringer", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138019] = {
			"Kul Tiran Vanguard", -- [1]
			"Siege of Boralus", -- [2]
		},
		[22959] = {
			"Spellbound Attendant", -- [1]
			"Black Temple", -- [2]
		},
		[134948] = {
			"Thicket Stalker", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[147745] = {
			"The Indomitable", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140067] = {
			"Rustpelt Alpha", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72353] = {
			"Dragonmaw Flameslinger", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[132901] = {
			"Gulan Yaungol", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[126100] = {
			"Duskcoat Prowler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[98206] = {
			"General Xakal", -- [1]
			"The Arcway", -- [2]
		},
		[134437] = {
			"Medic Bot", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[151329] = {
			"Warden Skoldus", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[127124] = {
			"Freehold Barhand", -- [1]
			"Freehold", -- [2]
		},
		[140068] = {
			"Rustpelt Snarler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[98205] = {
			"Corstilax", -- [1]
			"The Arcway", -- [2]
		},
		[153377] = {
			"Goop", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[123287] = {
			"Southsea Swashbuckler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[162591] = {
			"Ben Howell", -- [1]
			"Redridge - 9xp Bastion", -- [2]
		},
		[64338] = {
			"Instructor Kli'thak", -- [1]
			"Heart of Fear", -- [2]
		},
		[171805] = {
			"Research Scribe", -- [1]
			"Sanguine Depths", -- [2]
		},
		[140694] = {
			"Gorgejaw the Glutton", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140069] = {
			"Rustpelt Wolf", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72354] = {
			"Dragonmaw Bonecrusher", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[132903] = {
			"Witherbranch Villager", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[126101] = {
			"Duskcoat Huntress", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[61139] = {
			"Shan-xi Watershaper", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[65362] = {
			"Minion of Doubt", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[151331] = {
			"Cellblock Sentinel", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[5134] = {
			"Jonivera Farmountain", -- [1]
			"Alterac Valley", -- [2]
		},
		[135975] = {
			"Off-Duty Laborer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[163622] = {
			"Goregrind Bits", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[132904] = {
			"Sandscalp Villager", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[137511] = {
			"Bilge Rat Cutthroat", -- [1]
			"Siege of Boralus", -- [2]
		},
		[139670] = {
			"Morgok", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[111004] = {
			"Gelatinized Decay", -- [1]
			"The Emerald Nightmare", -- [2]
		},
		[33754] = {
			"Dark Rune Thunderer", -- [1]
			"Ulduar", -- [2]
		},
		[53206] = {
			"Hell Hound", -- [1]
			"Firelands", -- [2]
		},
		[140071] = {
			"Old One-Fang", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[123288] = {
			"Southsea Cannoneer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[157475] = {
			"Synthesis Growth", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[22960] = {
			"Dragonmaw Wyrmcaller", -- [1]
			"Black Temple", -- [2]
		},
		[122263] = {
			"Spineshell Snapjaw", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[163621] = {
			"Goregrind", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[151333] = {
			"Sentinel Shard", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[151845] = {
			"Lieutenant N'ot", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140072] = {
			"Direprowl the Ravager", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140693] = {
			"Hisskarath", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[161571] = {
			"Anubisath Sentinel", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[137516] = {
			"Ashvane Invader", -- [1]
			"Siege of Boralus", -- [2]
		},
		[98207] = {
			"Nal'tira", -- [1]
			"The Arcway", -- [2]
		},
		[64339] = {
			"Instructor Tak'thok", -- [1]
			"Heart of Fear", -- [2]
		},
		[163619] = {
			"Zolramus Bonecarver", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[60399] = {
			"Qin-xi", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[140073] = {
			"Rabidmaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144680] = {
			"Frida Ironbellows", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[97182] = {
			"Night Watch Mariner", -- [1]
			"Maw of Souls", -- [2]
		},
		[146835] = {
			"Ghoul", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[122264] = {
			"Elder Spineshell", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[140076] = {
			"Knucklebump Silverback", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[163620] = {
			"Rotspew", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[145195] = {
			"Dredge Fleet Destroyer", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[140074] = {
			"Sharptooth", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[163623] = {
			"Rotspew Leftovers", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[135470] = {
			"Aka'ali the Conqueror", -- [1]
			"Kings' Rest", -- [2]
		},
		[168845] = {
			"Astronos", -- [1]
			"Spires of Ascension", -- [2]
		},
		[143763] = {
			"Lieutenant Elda", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[120473] = {
			"Tidescale Combatant", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[33755] = {
			"Dark Rune Ravager", -- [1]
			"Ulduar", -- [2]
		},
		[72358] = {
			"Kor'kron Cannon", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[140075] = {
			"Canus", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[72357] = {
			"Lieutenant Krugruk", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[34267] = {
			"Parts Recovery Technician", -- [1]
			"Ulduar", -- [2]
		},
		[105629] = {
			"Wyrmtongue Scavenger", -- [1]
			"The Arcway", -- [2]
		},
		[81315] = {
			"Iron Crack-Shot", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[77476] = {
			"Iron Crack-Shot", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[102302] = {
			"Portal Keeper", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[146834] = {
			"Necromancer Master", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[123289] = {
			"Sparkleshell Deathclaw", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[144683] = {
			"Ra'wani Kanae", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[132910] = {
			"Bristlemane Squealer", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[137517] = {
			"Ashvane Destroyer", -- [1]
			"Siege of Boralus", -- [2]
		},
		[16057] = {
			"Rotting Maggot", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[64340] = {
			"Instructor Maltik", -- [1]
			"Heart of Fear", -- [2]
		},
		[155433] = {
			"Void-Touched Emissary", -- [1]
			"Freehold", -- [2]
		},
		[155945] = {
			"Gherus the Chained", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140077] = {
			"Knucklebump Stomper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[121498] = {
			"Twilight Soul", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[130299] = {
			"Droplet", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[98208] = {
			"Advisor Vandros", -- [1]
			"The Arcway", -- [2]
		},
		[133935] = {
			"Animated Guardian", -- [1]
			"Kings' Rest", -- [2]
		},
		[77477] = {
			"Marak the Blooded", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[155434] = {
			"Emissary of the Tides", -- [1]
			"Freehold", -- [2]
		},
		[145298] = {
			"Feral Hungerer", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140078] = {
			"Knucklebump Gorilla", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152875] = {
			"Massive Crusher", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[137007] = {
			"High Perch Defender", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[101074] = {
			"Hatespawn Whelpling", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[168844] = {
			"Lakesis", -- [1]
			"Spires of Ascension", -- [2]
		},
		[58198] = {
			"Shado-Pan Disciple", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[128921] = {
			"Duskcoat Tiger", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135472] = {
			"Zanazal the Wise", -- [1]
			"Kings' Rest", -- [2]
		},
		[152364] = {
			"Radiance of Azshara", -- [1]
			"The Eternal Palace", -- [2]
		},
		[139667] = {
			"Seer Grglok", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[97185] = {
			"The Grimewalker", -- [1]
			"Maw of Souls", -- [2]
		},
		[123290] = {
			"Sparkleshell Clacker", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138643] = {
			"Kvaldir Berserker", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[157483] = {
			"Ysedra the Darkener", -- [1]
			"Halls of Origination", -- [2]
		},
		[151850] = {
			"Commander Dilik", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[155432] = {
			"Enchanted Emissary", -- [1]
			"Freehold", -- [2]
		},
		[123291] = {
			"Sparkleshell Crab", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[144785] = {
			"Nagtar Wolfsbane", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[168843] = {
			"Klotos", -- [1]
			"Spires of Ascension", -- [2]
		},
		[137521] = {
			"Irontide Powdershot", -- [1]
			"Siege of Boralus", -- [2]
		},
		[139666] = {
			"Orgl the Totemic", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[64341] = {
			"Instructor Zarik", -- [1]
			"Heart of Fear", -- [2]
		},
		[132913] = {
			"Island Ettin", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[151854] = {
			"Deathseeker Loshok", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138642] = {
			"Kvaldir Reaver", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[122265] = {
			"Saltfur Smasher", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[136391] = {
			"Heart Guardian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[102430] = {
			"Tarspitter Slug", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[81318] = {
			"Iron Gunnery Sergeant", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[140689] = {
			"Dreadfang Slitherer", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[61398] = {
			"Xin the Weaponmaster", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[135475] = {
			"Kula the Butcher", -- [1]
			"Kings' Rest", -- [2]
		},
		[168747] = {
			"Venomfang", -- [1]
			"Plaguefall", -- [2]
		},
		[123292] = {
			"Sparkleshell Pincher", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[61910] = {
			"Resin Flake", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[145305] = {
			"Feral Hulk", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[137012] = {
			"Newstead Huntsman", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[120477] = {
			"Deep Stalker", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[146831] = {
			"Kul Tiran Stormbringer", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[155951] = {
			"Ruffer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[140083] = {
			"Kula the Thunderer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144690] = {
			"Mestrah", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[34269] = {
			"XR-949 Salvagebot", -- [1]
			"Ulduar", -- [2]
		},
		[56719] = {
			"Sha of Violence", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[59479] = {
			"Yan-Zhu the Uncasked", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[39900] = {
			"Enslaved Rock Elemental", -- [1]
			"Grim Batol", -- [2]
		},
		[173448] = {
			"Dragost", -- [1]
			"Castle Nathria", -- [2]
		},
		[155952] = {
			"Suffer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[135989] = {
			"Shieldbearer of Zul", -- [1]
			"Atal'Dazar", -- [2]
		},
		[144691] = {
			"Ma'ra Grimfang", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[132918] = {
			"Spitefin Raider", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[133430] = {
			"Venture Co. Mastermind", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[155953] = {
			"C'Thuffer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[139664] = {
			"Dampscale Terrorfin", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[60375] = {
			"Zandalari Skullcharger", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[131383] = {
			"Sporecaller Zancha", -- [1]
			"The Underrot", -- [2]
		},
		[140085] = {
			"Pinegraze Greatstag", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144692] = {
			"Anathos Firecaller", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[56792] = {
			"Figment of Doubt", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[118175] = {
			"Storm Elemental", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[133943] = {
			"Minion of Zul", -- [1]
			"Kings' Rest", -- [2]
		},
		[36701] = {
			"Raging Spirit", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[144693] = {
			"Manceroy Flamefist", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[151859] = {
			"Tomb Scarab", -- [1]
			"Halls of Origination", -- [2]
		},
		[140086] = {
			"Pinegraze Courser", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[33118] = {
			"Ignis the Furnace Master", -- [1]
			"Ulduar", -- [2]
		},
		[132920] = {
			"Shadow Serpent", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[133432] = {
			"Venture Co. Alchemist", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[133944] = {
			"Aspix", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[163121] = {
			"Stitched Vanguard", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[41948] = {
			"Chromatic Prototype", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[140087] = {
			"Pinegraze Doe", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[34014] = {
			"Sanctum Sentry", -- [1]
			"Ulduar", -- [2]
		},
		[21362] = {
			"Phoenix", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[132921] = {
			"Tidemistress Sser'ah", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[118176] = {
			"Thundershock", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[63191] = {
			"Garalon", -- [1]
			"Heart of Fear", -- [2]
		},
		[163122] = {
			"Brittlebone Warrior", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[136592] = {
			"Flynn Fairwind", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[162099] = {
			"General Kaal", -- [1]
			"Sanguine Depths", -- [2]
		},
		[140088] = {
			"Stonehorn the Charger", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[173360] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[132922] = {
			"Enslaved Murloc", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[43612] = {
			"High Prophet Barim", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[146884] = {
			"Warlord Hjelskard", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[128969] = {
			"Ashvane Commander", -- [1]
			"Siege of Boralus", -- [2]
		},
		[162100] = {
			"Kryxis the Voracious", -- [1]
			"Sanguine Depths", -- [2]
		},
		[151862] = {
			"Spiritwalker Fe'sal", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140089] = {
			"Gloamhoof the Elder", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[173361] = {
			"Slimy Morsel", -- [1]
			"Plaguefall", -- [2]
		},
		[132923] = {
			"Coldlight Murloc", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[105636] = {
			"Understone Drudge", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[145211] = {
			"Thunderscale Whelpling", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[146744] = {
			"Ashen Enforcer", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[167731] = {
			"Separation Assistant", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[140091] = {
			"Snowhoof", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140090] = {
			"Ana'tashe", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[146746] = {
			"Honorbound Conqueror", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[39390] = {
			"Twilight Drake", -- [1]
			"Grim Batol", -- [2]
		},
		[133436] = {
			"Venture Co. Skyscorcher", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[22898] = {
			"Supremus", -- [1]
			"Black Temple", -- [2]
		},
		[22962] = {
			"Priestess of Delight", -- [1]
			"Black Temple", -- [2]
		},
		[31216] = {
			"Brainx", -- [1]
			"Theater of Pain", -- [2]
		},
		[112803] = {
			"Astrologer Jarin", -- [1]
			"The Nighthold", -- [2]
		},
		[117154] = {
			"Razorjaw Acolyte", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[42333] = {
			"High Priestess Azil", -- [1]
			"The Stonecore", -- [2]
		},
		[34271] = {
			"XD-175 Compactobot", -- [1]
			"Ulduar", -- [2]
		},
		[162102] = {
			"Grand Proctor Beryllia", -- [1]
			"Sanguine Depths", -- [2]
		},
		[162103] = {
			"Executor Tarvold", -- [1]
			"Sanguine Depths", -- [2]
		},
		[163126] = {
			"Brittlebone Mage", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[151353] = {
			"Mawrat", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[102566] = {
			"Grimhorn the Enslaver", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[140092] = {
			"Longstrider", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138558] = {
			"Faceless One", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[153401] = {
			"K'thir Dominator", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[133438] = {
			"Stromgarde Sorceress", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[102351] = {
			"Mana Wyrm", -- [1]
			"The Arcway", -- [2]
		},
		[120482] = {
			"Tidescale Seacaller", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[128928] = {
			"Crab Egg", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[168246] = {
			"Reanimated Crossbowman", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[76205] = {
			"Blooded Bladefeather", -- [1]
			"Skyreach", -- [2]
		},
		[52571] = {
			"Majordomo Staghelm", -- [1]
			"Firelands", -- [2]
		},
		[102095] = {
			"Risen Lancer", -- [1]
			"Black Rook Hold", -- [2]
		},
		[76973] = {
			"Hans'gar", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[135999] = {
			"Heliodor", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[163128] = {
			"Zolramus Sorcerer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[98728] = {
			"Acidic Bile", -- [1]
			"The Arcway", -- [2]
		},
		[72662] = {
			"Vanity", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[140094] = {
			"Mudsnout Thornback", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[40306] = {
			"Twilight Armsmaster", -- [1]
			"Grim Batol", -- [2]
		},
		[76307] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[139661] = {
			"Dampscale Forager", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[138559] = {
			"Forgotten One", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[83628] = {
			"Lunarfall Goren", -- [1]
			"SMV Alliance Garrison Level 3", -- [2]
		},
		[136000] = {
			"Beryllus", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[148797] = {
			"Magus of the Dead", -- [1]
			"Eye of the Storm", -- [2]
		},
		[4255] = {
			"Brogus Thunderbrew", -- [1]
			"Alterac Valley", -- [2]
		},
		[72367] = {
			"Dragonmaw Tidal Shaman", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[157486] = {
			"Horrific Hemorrhage", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[76974] = {
			"Franzok", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146238] = {
			"Blacksting", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138560] = {
			"Faceless Horror", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138557] = {
			"Living Corruption", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[57109] = {
			"Minion of Doubt", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[140096] = {
			"Mudsnout Boar", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[137026] = {
			"Newstead Hound", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[77487] = {
			"Grom'kar Firemender", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[43614] = {
			"Lockmaw", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[138563] = {
			"Vudax", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138561] = {
			"Faceless Mindlasher", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[171396] = {
			"Kyrian Goliath", -- [1]
			"Theater of Pain", -- [2]
		},
		[32865] = {
			"Thorim", -- [1]
			"Ulduar", -- [2]
		},
		[140097] = {
			"Great Dirtbelly", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140609] = {
			"Ravenous Mako", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[149311] = {
			"Shandris Feathermoon", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[140098] = {
			"Vicious Scarhide", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146240] = {
			"AzerMEK Beam Target", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[138562] = {
			"Void Maggot", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[124580] = {
			"Grotto Terrapin", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[160061] = {
			"Crawling Corruption", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[136003] = {
			"Gravellus", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[148290] = {
			"Crazed Crankshot Engineer", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[149312] = {
			"Ferocious Swiftclaw", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[117194] = {
			"Thrashbite the Scornful", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[39392] = {
			"Faceless Corruptor", -- [1]
			"Grim Batol", -- [2]
		},
		[22963] = {
			"Bonechewer Worker", -- [1]
			"Black Temple", -- [2]
		},
		[128967] = {
			"Ashvane Sniper", -- [1]
			"Siege of Boralus", -- [2]
		},
		[151872] = {
			"Grip of Horror", -- [1]
			"Emerald Dream - HoA Scenario", -- [2]
		},
		[140099] = {
			"Thundersnort the Loud", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[129699] = {
			"Ludwig Von Tortollan", -- [1]
			"Freehold", -- [2]
		},
		[34273] = {
			"XB-488 Disposalbot", -- [1]
			"Ulduar", -- [2]
		},
		[138635] = {
			"Commander Husan", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[162693] = {
			"Nalthor the Rimebinder", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[138564] = {
			"Kshuun", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[146755] = {
			"Slavering Skullcleaver", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[165764] = {
			"Rockbound Vanquisher", -- [1]
			"Castle Nathria", -- [2]
		},
		[140100] = {
			"Warsnort", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[138566] = {
			"Nyl'sozz", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[137029] = {
			"Ordnance Specialist", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[78001] = {
			"Cloudburst Totem", -- [1]
			"Crucible of Storms", -- [2]
		},
		[41073] = {
			"Twilight Armsmaster", -- [1]
			"Grim Batol", -- [2]
		},
		[124581] = {
			"Spineshell Snapper", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[114634] = {
			"Undying Servant", -- [1]
			"Return to Karazhan", -- [2]
		},
		[80048] = {
			"Vul'gor", -- [1]
			"Highmaul", -- [2]
		},
		[140101] = {
			"Swampwallow", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[152898] = {
			"Deadsoul Chorus", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146757] = {
			"Dark Executor", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[56924] = {
			"Inflamed Hozen Brawler", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[146244] = {
			"Stinging Fiend", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146756] = {
			"Energized Storm", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[162692] = {
			"Amarth", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[5135] = {
			"Svalbrad Farmountain", -- [1]
			"Alterac Valley", -- [2]
		},
		[98732] = {
			"Plagued Rat", -- [1]
			"The Arcway", -- [2]
		},
		[135496] = {
			"Cami Cogwizzle", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[173953] = {
			"Loyal Gargon", -- [1]
			"Castle Nathria", -- [2]
		},
		[132491] = {
			"Kul Tiran Marksman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[146245] = {
			"Skitterwing", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138567] = {
			"Shathhoth the Punisher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[71603] = {
			"Sha Puddle", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[151876] = {
			"Wandering Spirit", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[40177] = {
			"Forgemaster Throngus", -- [1]
			"Grim Batol", -- [2]
		},
		[113321] = {
			"Shambling Hungerer", -- [1]
			"The Nighthold", -- [2]
		},
		[135562] = {
			"Venomous Ophidian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[17917] = {
			"Coilfang Water Elemental", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[21364] = {
			"Phoenix Egg", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[138568] = {
			"Shuk'shuguun the Subjugator", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146246] = {
			"Ovix the Toxic", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[131402] = {
			"Underrot Tick", -- [1]
			"The Underrot", -- [2]
		},
		[98733] = {
			"Withered Fiend", -- [1]
			"The Arcway", -- [2]
		},
		[145223] = {
			"Thunderscale Adolescent", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[107435] = {
			"Suspicious Noble", -- [1]
			"Court of Stars", -- [2]
		},
		[162115] = {
			"Koda Steelclaw", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[146247] = {
			"White Death", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146759] = {
			"Treasury Protector", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[44895] = {
			"Augh", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[165762] = {
			"Soul Infuser", -- [1]
			"Castle Nathria", -- [2]
		},
		[56541] = {
			"Master Snowdrift", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[138570] = {
			"Herald Razzaqi", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[145224] = {
			"Thunderscale Drake", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[162116] = {
			"Lyanis Moonfall", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[133963] = {
			"Test Subject", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[146760] = {
			"Mighty Guardian Spirit", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[136011] = {
			"Bloodstone", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[32867] = {
			"Steelbreaker", -- [1]
			"Ulduar", -- [2]
		},
		[140106] = {
			"Deathsting Broodwatcher", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148615] = {
			"Div'yane", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[114633] = {
			"Spectral Valet", -- [1]
			"Return to Karazhan", -- [2]
		},
		[162117] = {
			"Tyrande Whisperwind", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[119977] = {
			"Stranglevine Lasher", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[22964] = {
			"Sister of Pleasure", -- [1]
			"Black Temple", -- [2]
		},
		[23028] = {
			"Bonechewer Taskmaster", -- [1]
			"Black Temple", -- [2]
		},
		[100526] = {
			"Tormented Bloodseeker", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[136012] = {
			"Mountanus the Immovable", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140619] = {
			"Coastal Fathomjaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140107] = {
			"Deathsting Lasher", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[145129] = {
			"Deathguard Champion", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[105419] = {
			"Dire Basilisk", -- [1]
			"Eye of the Storm", -- [2]
		},
		[138572] = {
			"General Uvosh", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[134990] = {
			"Charged Dust Devil", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[151881] = {
			"Abyssal Commander Sivara", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140108] = {
			"Deathsting Scorpid", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140620] = {
			"South Sea Stinger", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[147787] = {
			"7th Legion Battlemage", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[119978] = {
			"Fulminating Lasher", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[146251] = {
			"Sister Katherine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[95920] = {
			"Animated Storm", -- [1]
			"Eye of Azshara", -- [2]
		},
		[60381] = {
			"Zandalari Infiltrator", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[100527] = {
			"Dreadfire Imp", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[145228] = {
			"Valja", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[40290] = {
			"Crimsonborne Seer", -- [1]
			"Grim Batol", -- [2]
		},
		[97200] = {
			"Seacursed Soulkeeper", -- [1]
			"Maw of Souls", -- [2]
		},
		[138565] = {
			"My'lyth", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[136006] = {
			"Rowdy Reveler", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[44897] = {
			"Pygmy Scout", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[134991] = {
			"Sandfury Stonefist", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[131408] = {
			"Venture Muscle", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[162689] = {
			"Surgeon Stitchflesh", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[149591] = {
			"Rastari Marksman", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[123818] = {
			"Surf Darter", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[103217] = {
			"Crystalline Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[138063] = {
			"Posh Vacationer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[138575] = {
			"General Shuul'aqar", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[124582] = {
			"Chasm-Hunter", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[121003] = {
			"Rez the Tombwatcher", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[152396] = {
			"Guardian of Azeroth", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[42845] = {
			"Rock Borer", -- [1]
			"The Stonecore", -- [2]
		},
		[139654] = {
			"Dampscale Mudskipper", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[114632] = {
			"Spectral Attendant", -- [1]
			"Return to Karazhan", -- [2]
		},
		[138064] = {
			"Posh Vacationer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[146766] = {
			"Greater Serpent Totem", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[134993] = {
			"Mchimba the Embalmer", -- [1]
			"Kings' Rest", -- [2]
		},
		[131410] = {
			"Gargantuan Venomscale", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[138630] = {
			"Cleric Izzad", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[151960] = {
			"Suntouched Acolyte", -- [1]
			"Halls of Origination", -- [2]
		},
		[119724] = {
			"Tidal Surger", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[131407] = {
			"Venture Goon", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[72658] = {
			"Amalgamated Hubris", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[138577] = {
			"Crushing Tentacle", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134994] = {
			"Spectral Headhunter", -- [1]
			"Kings' Rest", -- [2]
		},
		[164171] = {
			"Honored Duelist", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[140677] = {
			"Hulking Frostbeard", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[40291] = {
			"Azureborne Seer", -- [1]
			"Grim Batol", -- [2]
		},
		[121004] = {
			"Razorjaw Myrmidon", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[56927] = {
			"Hozen Party Animal", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[138066] = {
			"Posh Vacationer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[44898] = {
			"Pygmy Firebreather", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[103225] = {
			"Acidmaw Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[135046] = {
			"Crawmog", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[103381] = {
			"Jailer Cage", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[101549] = {
			"Arcane Minion", -- [1]
			"Black Rook Hold", -- [2]
		},
		[138576] = {
			"Faceless Tendril", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[146769] = {
			"Druid of the Claw", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[133972] = {
			"Heavy Cannon", -- [1]
			"Tol Dagor", -- [2]
		},
		[138579] = {
			"Giant Claw Tentacle", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138648] = {
			"Sigrid the Shroud-Weaver", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140794] = {
			"Scartalon", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[104881] = {
			"Spellblade Aluriel", -- [1]
			"The Nighthold", -- [2]
		},
		[165197] = {
			"Skeletal Monstrosity", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[139652] = {
			"Coldlight Coastrunner", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[132005] = {
			"Grayson Bell", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[138068] = {
			"Posh Vacationer", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[146770] = {
			"Druid of the Claw", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[126848] = {
			"Captain Eudora", -- [1]
			"Freehold", -- [2]
		},
		[59487] = {
			"Bubble Shield", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[146256] = {
			"Laminaria", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[150859] = {
			"Za'qul", -- [1]
			"The Eternal Palace", -- [2]
		},
		[171333] = {
			"Atal'ai Devoted", -- [1]
			"De Other Side", -- [2]
		},
		[34161] = {
			"Mechanostriker 54-A", -- [1]
			"Ulduar", -- [2]
		},
		[133836] = {
			"Reanimated Guardian", -- [1]
			"The Underrot", -- [2]
		},
		[171341] = {
			"Bladebeak Hatchling", -- [1]
			"De Other Side", -- [2]
		},
		[136010] = {
			"Faceted Earthbreaker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[100531] = {
			"Bloodtainted Fury", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[135044] = {
			"Shredmaw the Voracious", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[52577] = {
			"Left Foot", -- [1]
			"Firelands", -- [2]
		},
		[149331] = {
			"Luminous Azerite", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[133463] = {
			"Venture Co. War Machine", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[95947] = {
			"Mak'rana Hardshell", -- [1]
			"Eye of Azshara", -- [2]
		},
		[171342] = {
			"Juvenile Runestag", -- [1]
			"De Other Side", -- [2]
		},
		[118703] = {
			"Felborne Botanist", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[148119] = {
			"Furious Merchant", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[100529] = {
			"Hatespawn Slime", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[140630] = {
			"Ornate Puffer", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140690] = {
			"Dreadfang Viper", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[140674] = {
			"Deephowl", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[17252] = {
			"Krimnixx", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[171343] = {
			"Bladebeak Matriarch", -- [1]
			"De Other Side", -- [2]
		},
		[140066] = {
			"Axeclaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[164177] = {
			"Royal Nightcloak", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[163708] = {
			"Umbral Gatekeeper", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[140631] = {
			"South Sea Ray", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[158035] = {
			"Magister Umbric", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[105651] = {
			"Dreadborne Seer", -- [1]
			"The Arcway", -- [2]
		},
		[118690] = {
			"Wrathguard Invader", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[137449] = {
			"Dust Devil", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[118704] = {
			"Dul'zak", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[152910] = {
			"Queen Azshara", -- [1]
			"The Eternal Palace", -- [2]
		},
		[98435] = {
			"Unstable Oozeling", -- [1]
			"The Arcway", -- [2]
		},
		[140632] = {
			"Scaleback Snapper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[149334] = {
			"Tectonic Azerite", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[90998] = {
			"Blightshard Shaper", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[102094] = {
			"Risen Swordsman", -- [1]
			"Black Rook Hold", -- [2]
		},
		[139097] = {
			"Sandswept Marksman", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[60384] = {
			"Zandalari Pterror Wing", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[138625] = {
			"Amathet Enforcer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[44260] = {
			"Venomfang Crocolisk", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[153942] = {
			"Annihilator Lak'hal", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[149335] = {
			"Tumultuous Azerite", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[56929] = {
			"Krik'thik Protectorate", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[61389] = {
			"Kargesh Highguard", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[151027] = {
			"Thornguard Burton", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[118705] = {
			"Nal'asha", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[32871] = {
			"Algalon the Observer", -- [1]
			"Ulduar", -- [2]
		},
		[140672] = {
			"Dusthide the Mangy", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[98761] = {
			"Shredlock", -- [1]
			"Maw of Souls", -- [2]
		},
		[149336] = {
			"Basaltic Azerite", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[153943] = {
			"Decimator Shiq'voth", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[164218] = {
			"Lord Chamberlain", -- [1]
			"Halls of Atonement", -- [2]
		},
		[163157] = {
			"Amarth", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[23030] = {
			"Dragonmaw Sky Stalker", -- [1]
			"Black Temple", -- [2]
		},
		[75964] = {
			"Ranjit", -- [1]
			"Skyreach", -- [2]
		},
		[140123] = {
			"Weaponmaster Halu", -- [1]
			"Kings' Rest", -- [2]
		},
		[118724] = {
			"Helblaze Felbringer", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[145242] = {
			"Scalefiend", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[138624] = {
			"Amathet Champion", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[56589] = {
			"Striker Ga'dok", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[149337] = {
			"Coalesced Azerite", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[118706] = {
			"Necrotic Spiderling", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[53087] = {
			"Right Foot", -- [1]
			"Firelands", -- [2]
		},
		[140671] = {
			"Feralclaw the Rager", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136541] = {
			"Bile Oozeling", -- [1]
			"Waycrest Manor", -- [2]
		},
		[59873] = {
			"Corrupt Living Water", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[4257] = {
			"Lana Thunderbrew", -- [1]
			"Alterac Valley", -- [2]
		},
		[162647] = {
			"Willing Sacrifice", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139658] = {
			"Coldlight Murkdweller", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[140681] = {
			"Gurudu The Gorge", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[54123] = {
			"Echo of Sylvanas", -- [1]
			"End Time", -- [2]
		},
		[44261] = {
			"Sharptalon Eagle", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[150396] = {
			"Aerial Unit R-21/X", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[149339] = {
			"Permeated Azerite", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[56930] = {
			"Krik'thik Swarm Bringer", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[97720] = {
			"Blightshard Skitter", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[40166] = {
			"Enslaved Gronn Brute", -- [1]
			"Grim Batol", -- [2]
		},
		[135007] = {
			"Orb Guardian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[102583] = {
			"Fel Scorcher", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[158041] = {
			"N'Zoth the Corruptor", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[144733] = {
			"Deathguard Captain Vandel", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[140670] = {
			"Hulking Rockmane", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[76309] = {
			"Grand Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[111563] = {
			"Duskwatch Guard", -- [1]
			"Court of Stars", -- [2]
		},
		[139758] = {
			"Annie Two-Pistols", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[33768] = {
			"Rubble", -- [1]
			"Ulduar", -- [2]
		},
		[151900] = {
			"Horrific Summoner", -- [1]
			"The Eternal Palace", -- [2]
		},
		[27829] = {
			"Ebon Gargoyle", -- [1]
			"Theater of Pain", -- [2]
		},
		[101414] = {
			"Saltscale Skulker", -- [1]
			"Eye of Azshara", -- [2]
		},
		[149341] = {
			"Vitrified Azerite", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[72895] = {
			"Burning Berserker", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[162133] = {
			"General Kaal", -- [1]
			"Sanguine Depths", -- [2]
		},
		[126642] = {
			"Sandyback Crab", -- [1]
			"Siege of Boralus", -- [2]
		},
		[126093] = {
			"Slitherblade Saurok", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[102584] = {
			"Malignant Defiler", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[12127] = {
			"Stormpike Guardsman", -- [1]
			"Alterac Valley", -- [2]
		},
		[140171] = {
			"Mistfur", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[137057] = {
			"Gurthani the Elder", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[43622] = {
			"Corrupting Adherent", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[128434] = {
			"Feasting Skyscreamer", -- [1]
			"Atal'Dazar", -- [2]
		},
		[64353] = {
			"Set'thik Gale-Slicer", -- [1]
			"Heart of Fear", -- [2]
		},
		[60386] = {
			"Zandalari Terror Rider", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[151902] = {
			"Vile Spirit", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[40167] = {
			"Twilight Beguiler", -- [1]
			"Grim Batol", -- [2]
		},
		[147835] = {
			"Rastari Alpha", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[149343] = {
			"Frenzy Imbued Azerite", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138569] = {
			"Harbinger Vor'zzyx", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138653] = {
			"Hosvir of the Rotting Hull", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[146753] = {
			"Kul Tiran Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[126832] = {
			"Skycap'n Kragg", -- [1]
			"Freehold", -- [2]
		},
		[32873] = {
			"Ancient Rune Giant", -- [1]
			"Ulduar", -- [2]
		},
		[100532] = {
			"Bloodtainted Burster", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[32872] = {
			"Runic Colossus", -- [1]
			"Ulduar", -- [2]
		},
		[53732] = {
			"Unbound Smoldering Elemental", -- [1]
			"Firelands", -- [2]
		},
		[87229] = {
			"Iron Blood Mage", -- [1]
			"Highmaul", -- [2]
		},
		[128435] = {
			"Toxic Saurid", -- [1]
			"Atal'Dazar", -- [2]
		},
		[98759] = {
			"Vicious Manafang", -- [1]
			"The Arcway", -- [2]
		},
		[45097] = {
			"Oathsworn Tamer", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[136083] = {
			"Forgotten Denizen", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[99541] = {
			"Risen Skulker", -- [1]
			"Eye of the Storm", -- [2]
		},
		[140643] = {
			"Ferocious Craghorn", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[137060] = {
			"Dunecaster Mu'na", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[164185] = {
			"Echelon", -- [1]
			"Halls of Atonement", -- [2]
		},
		[137059] = {
			"Headshrinker Gaha", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[56764] = {
			"Consuming Sha", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[159578] = {
			"Exposed Synapse", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[140155] = {
			"Rabid Rotclaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[164702] = {
			"Carrion Worm", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[136549] = {
			"Ashvane Cannoneer", -- [1]
			"Siege of Boralus", -- [2]
		},
		[137061] = {
			"Suluz Wind-Tamer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[61387] = {
			"Quilen Guardian", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[173447] = {
			"Mushroom Mine", -- [1]
			"Plaguefall", -- [2]
		},
		[116407] = {
			"Harjatan", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[100539] = {
			"Taintheart Deadeye", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[164191] = {
			"Noble Courtier", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[134012] = {
			"Taskmaster Askari", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[5913] = {
			"Tremor Totem", -- [1]
			"Crucible of Storms", -- [2]
		},
		[137062] = {
			"Blood-Hunter Akal", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[145273] = {
			"The Hand of In'zashi", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[131411] = {
			"Venomscale Monitor", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[144249] = {
			"Omega Buster", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[139110] = {
			"Spark Channeler", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[32874] = {
			"Iron Ring Guard", -- [1]
			"Ulduar", -- [2]
		},
		[116939] = {
			"Fallen Avatar", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[72408] = {
			"Anti-Air Turret", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[54507] = {
			"Time-Twisted Scourge Beast", -- [1]
			"End Time", -- [2]
		},
		[138623] = {
			"Amathet Archer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135052] = {
			"Blight Toad", -- [1]
			"Waycrest Manor", -- [2]
		},
		[164705] = {
			"Pestilence Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[161140] = {
			"Bwemba", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[92350] = {
			"Understone Drudge", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[5280] = {
			"Nightmare Wyrmkin", -- [1]
			"Sunken Temple", -- [2]
		},
		[144248] = {
			"Head Machinist Sparkflux", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[137064] = {
			"Valorcall Marksman", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[133482] = {
			"Crawler Mine", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[130485] = {
			"Mechanized Peacekeeper", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[164707] = {
			"Congealed Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[118712] = {
			"Felstrider Enforcer", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[170850] = {
			"Raging Bloodhorn", -- [1]
			"Theater of Pain", -- [2]
		},
		[144231] = {
			"Rowdy Reveler", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[124351] = {
			"Kunzen Boneripper", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[32875] = {
			"Iron Honor Guard", -- [1]
			"Ulduar", -- [2]
		},
		[17721] = {
			"Coilfang Engineer", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[154469] = {
			"First Arcanist Thalyssra", -- [1]
			"The Eternal Palace", -- [2]
		},
		[64355] = {
			"Kor'thik Silentwing", -- [1]
			"Heart of Fear", -- [2]
		},
		[149353] = {
			"Incandescent Azergem Crystalback", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[59752] = {
			"Shado-Pan Ambusher", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[144232] = {
			"Rowdy Reveler", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[161124] = {
			"Urg'roth, Breaker of Heroes", -- [1]
			"Waycrest Manor", -- [2]
		},
		[149351] = {
			"Rhodochrosite", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[102335] = {
			"Portal Guardian", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[158565] = {
			"Naros", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[53094] = {
			"Patriarch Fire Turtle", -- [1]
			"Firelands", -- [2]
		},
		[118713] = {
			"Felstrider Orbcaster", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[131436] = {
			"Chosen Blood Matron", -- [1]
			"The Underrot", -- [2]
		},
		[136043] = {
			"Brackish", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[77252] = {
			"Ore Crate", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[137067] = {
			"Valorcall Defender", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[137579] = {
			"Unbound Azerite", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[33515] = {
			"Auriaya", -- [1]
			"Ulduar", -- [2]
		},
		[144246] = {
			"K.U.-J.0.", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[165222] = {
			"Zolramus Bonemender", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[118716] = {
			"Bilespray Lasher", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[136044] = {
			"Venomswell", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[130488] = {
			"Mech Jockey", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[137068] = {
			"Valorcall Cavalry", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[53223] = {
			"Flamewaker Beast Handler", -- [1]
			"Firelands", -- [2]
		},
		[158567] = {
			"Tormented Kor'kron Annihilator", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[8319] = {
			"Nightmare Whelp", -- [1]
			"Sunken Temple", -- [2]
		},
		[118714] = {
			"Hellblaze Temptress", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[129469] = {
			"Deepsea Crawler", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[136045] = {
			"Crushtide", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[144747] = {
			"Pa'ku's Aspect", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[149354] = {
			"Monstrous Azergem Crystalback", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[158056] = {
			"Rat", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[92610] = {
			"Understone Drummer", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[102336] = {
			"Portal Keeper", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[59494] = {
			"Yeasty Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[129208] = {
			"Dread Captain Lockwood", -- [1]
			"Siege of Boralus", -- [2]
		},
		[138103] = {
			"Stromgarde Arbalest", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[56678] = {
			"Jade Staff", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[149355] = {
			"Aberrant Azergem Crystalback", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[61029] = {
			"Primal Fire Elemental", -- [1]
			"Theater of Pain", -- [2]
		},
		[162664] = {
			"Aqir Swarmer", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[53095] = {
			"Matriarch Fire Turtle", -- [1]
			"Firelands", -- [2]
		},
		[118715] = {
			"Reanimated Templar", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[32876] = {
			"Dark Rune Champion", -- [1]
			"Ulduar", -- [2]
		},
		[136047] = {
			"Iceheart", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152939] = {
			"Boundless Corruption", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[145261] = {
			"Opulence", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[33388] = {
			"Dark Rune Guardian", -- [1]
			"Ulduar", -- [2]
		},
		[64357] = {
			"Kor'thik Swarmer", -- [1]
			"Heart of Fear", -- [2]
		},
		[75975] = {
			"Skyreach Overlord", -- [1]
			"Skyreach", -- [2]
		},
		[140662] = {
			"Elder Greatfur", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[151916] = {
			"Zaegra Sharpaxe", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[156523] = {
			"Maut", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[98756] = {
			"Arcane Anomaly", -- [1]
			"The Arcway", -- [2]
		},
		[32878] = {
			"Dark Rune Evoker", -- [1]
			"Ulduar", -- [2]
		},
		[114624] = {
			"Arcane Warden", -- [1]
			"Return to Karazhan", -- [2]
		},
		[130489] = {
			"Dazarian Stalker", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[118460] = {
			"Engine of Souls", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[163690] = {
			"Shath'Yar Scribe", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[151917] = {
			"Tar'al Bonespitter", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[136049] = {
			"Algenon", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[80071] = {
			"Bladespire Sorcerer", -- [1]
			"Highmaul", -- [2]
		},
		[149358] = {
			"Colossal Azergem Crystalback", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[17722] = {
			"Coilfang Sorceress", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[136051] = {
			"Fathomus", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134514] = {
			"Abyssal Cultist", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[138100] = {
			"Stromgarde Footman", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[151918] = {
			"Raz'kah of the North", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[136050] = {
			"Gorestream", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140657] = {
			"Craghorn Behemoth", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[149359] = {
			"Azerite Behemoth", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[131445] = {
			"Block Warden", -- [1]
			"Tol Dagor", -- [2]
		},
		[140659] = {
			"Ragestomp", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[53096] = {
			"Fire Turtle Hatchling", -- [1]
			"Firelands", -- [2]
		},
		[118717] = {
			"Helblaze Imp", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[32877] = {
			"Dark Rune Warbringer", -- [1]
			"Ulduar", -- [2]
		},
		[61670] = {
			"Sik'thik Demolisher", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[140658] = {
			"Bristlefur", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[169835] = {
			"Prince Renathal", -- [1]
			"Castle Nathria", -- [2]
		},
		[91332] = {
			"Stoneclaw Hunter", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[79303] = {
			"Adorned Bladetalon", -- [1]
			"Skyreach", -- [2]
		},
		[95939] = {
			"Skrog Tidestomper", -- [1]
			"Eye of Azshara", -- [2]
		},
		[134005] = {
			"Shalebiter", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[147825] = {
			"7th Legion Medic", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140147] = {
			"Great Ursu", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144754] = {
			"Fa'thuul the Feared", -- [1]
			"Crucible of Storms", -- [2]
		},
		[160112] = {
			"Stone Legion Nightblade", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[162158] = {
			"Starving Prisoner", -- [1]
			"Sanguine Depths", -- [2]
		},
		[105921] = {
			"Nightborne Spellsword", -- [1]
			"The Arcway", -- [2]
		},
		[118718] = {
			"Book of Eternal Winter", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[98243] = {
			"Soul-Torn Champion", -- [1]
			"Black Rook Hold", -- [2]
		},
		[59751] = {
			"Shado-Pan Warden", -- [1]
			"Shado-Pan Monastery", -- [2]
		},
		[140148] = {
			"Rampaging Grizzlefur", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140660] = {
			"Big-Horn", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[145267] = {
			"AzerMEK Mk. II", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[124349] = {
			"Kunzen Leafeater", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138101] = {
			"Stromgarde Sorcerer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[64358] = {
			"Set'thik Tempest", -- [1]
			"Heart of Fear", -- [2]
		},
		[144755] = {
			"Zaxasj the Speaker", -- [1]
			"Crucible of Storms", -- [2]
		},
		[147827] = {
			"7th Legion Marine", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[144244] = {
			"The Platinum Pummeler", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[140661] = {
			"Valethunder", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[121790] = {
			"Fleetlord Dominator", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[111295] = {
			"Domesticated Manasaber", -- [1]
			"The Nighthold", -- [2]
		},
		[138102] = {
			"Stromgarde Priestess", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[53224] = {
			"Flamewaker Taskmaster", -- [1]
			"Firelands", -- [2]
		},
		[118719] = {
			"Wyrmtongue Scavenger", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[147828] = {
			"7th Legion Cavalier", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[144245] = {
			"South Sea Glider", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[144757] = {
			"Edgard Shadeclaw", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[75976] = {
			"Low-Born Arakkoa", -- [1]
			"Skyreach", -- [2]
		},
		[137591] = {
			"Healing Tide Totem", -- [1]
			"Kings' Rest", -- [2]
		},
		[124350] = {
			"Kunzen Crusher", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[137585] = {
			"Earthgrab Totem", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[171887] = {
			"Slimy Smorgasbord", -- [1]
			"Plaguefall", -- [2]
		},
		[147829] = {
			"Rastari Beastmaster", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140151] = {
			"Rotclaw Cub", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140663] = {
			"Mountain Lord Grum", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[58856] = {
			"Haunting Sha", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[143215] = {
			"Orca", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[47720] = {
			"Camel", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[171376] = {
			"Head Custodian Javlin", -- [1]
			"Sanguine Depths", -- [2]
		},
		[114625] = {
			"Phantom Guest", -- [1]
			"Return to Karazhan", -- [2]
		},
		[147830] = {
			"Rastari Flamespeaker", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[140152] = {
			"Rotclaw Mauler", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144759] = {
			"Keeper Dagda", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[39405] = {
			"Crimsonborne Seer", -- [1]
			"Grim Batol", -- [2]
		},
		[115905] = {
			"Fel Soul", -- [1]
			"The Nighthold", -- [2]
		},
		[138105] = {
			"Veteran of Stromgarde", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[53222] = {
			"Flamewaker Centurion", -- [1]
			"Firelands", -- [2]
		},
		[154470] = {
			"Shandris Feathermoon", -- [1]
			"The Eternal Palace", -- [2]
		},
		[129214] = {
			"Coin-Operated Crowd Pummeler", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[140153] = {
			"Rotclaw Bear", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[169330] = {
			"Mucky Grunt", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[139626] = {
			"Dredged Sailor", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[105915] = {
			"Nightborne Reclaimer", -- [1]
			"The Arcway", -- [2]
		},
		[129470] = {
			"Deepsea Crab", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135002] = {
			"Demonic Tyrant", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[114626] = {
			"Forlorn Spirit", -- [1]
			"Return to Karazhan", -- [2]
		},
		[144789] = {
			"Ranah Saberclaw", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140154] = {
			"Rotclaw Patriarch", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[55659] = {
			"Wild Imp", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[61928] = {
			"Sik'thik Guardian", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[126918] = {
			"Irontide Crackshot", -- [1]
			"Freehold", -- [2]
		},
		[124352] = {
			"Kunzen Stalker", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[131431] = {
			"Safety Inspection Bot", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[144637] = {
			"Grong", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[121011] = {
			"Tidescale Witch", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[129471] = {
			"Deepsea Sandcrawler", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[131009] = {
			"Spirit of Gold", -- [1]
			"Atal'Dazar", -- [2]
		},
		[145274] = {
			"Yalat's Bulwark", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[104215] = {
			"Patrol Captain Gerdo", -- [1]
			"Court of Stars", -- [2]
		},
		[135049] = {
			"Dreadwing Raven", -- [1]
			"Waycrest Manor", -- [2]
		},
		[134331] = {
			"King Rahu'ai", -- [1]
			"Kings' Rest", -- [2]
		},
		[148665] = {
			"Rastari Royal Guard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[63592] = {
			"Set'thik Gustwing", -- [1]
			"Heart of Fear", -- [2]
		},
		[140156] = {
			"Vilemaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144776] = {
			"Airyn Swiftfeet", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[77231] = {
			"Enforcer Sorka", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[60009] = {
			"Feng the Accursed", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[124353] = {
			"Kunzen Hozen", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[151901] = {
			"Restless Spirit", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[120770] = {
			"Felguard Destroyer", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[168310] = {
			"Plagueroc", -- [1]
			"Plaguefall", -- [2]
		},
		[140157] = {
			"Rotclaw Cub-Eater", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140669] = {
			"Rockmane Howler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[124583] = {
			"Garnetback Worm", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[148617] = {
			"Akunda the Devout", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[147225] = {
			"Azerite Extractor", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[112973] = {
			"Duskwatch Weaver", -- [1]
			"The Nighthold", -- [2]
		},
		[118723] = {
			"Gazerax", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[149338] = {
			"Volatile Azerite", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140158] = {
			"Bilesoaked Rotclaw", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144765] = {
			"Asithra Diresong", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[61929] = {
			"Sik'thik Amber-Weaver", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[166264] = {
			"Spare Parts", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[124354] = {
			"Kunzen Hunter", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[146813] = {
			"Gunther the Gray", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[170838] = {
			"Unyielding Contender", -- [1]
			"Theater of Pain", -- [2]
		},
		[135552] = {
			"Deathtouched Slaver", -- [1]
			"Waycrest Manor", -- [2]
		},
		[140159] = {
			"Dreadgrowl the Pustulent", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[132481] = {
			"Kul Tiran Vanguard", -- [1]
			"Siege of Boralus", -- [2]
		},
		[72655] = {
			"Fragment of Pride", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[44980] = {
			"Neferset Theurgist", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[150397] = {
			"King Mechagon", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[171384] = {
			"Research Scribe", -- [1]
			"Sanguine Depths", -- [2]
		},
		[114629] = {
			"Spectral Retainer", -- [1]
			"Return to Karazhan", -- [2]
		},
		[63593] = {
			"Set'thik Zephyrian", -- [1]
			"Heart of Fear", -- [2]
		},
		[140160] = {
			"Boilhide the Raging", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144767] = {
			"Gonk's Aspect", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[170323] = {
			"General Grashaal", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[166266] = {
			"Spare Parts", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[158588] = {
			"Gamon", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[120516] = {
			"Razorjaw Swiftfin", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[39909] = {
			"Azureborne Warlord", -- [1]
			"Grim Batol", -- [2]
		},
		[118700] = {
			"Felblight Stalker", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[146876] = {
			"Machitu the Brutal", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[140673] = {
			"Ragesnarl", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[77893] = {
			"Grasping Earth", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146253] = {
			"Brother Joseph", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[76945] = {
			"Ironcrusher", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138626] = {
			"Amathet Zealot", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135043] = {
			"Vicious Vicejaw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[56915] = {
			"Sun", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[137097] = {
			"Valorcall Spellweaver", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[111303] = {
			"Nightborne Sage", -- [1]
			"The Nighthold", -- [2]
		},
		[137091] = {
			"High Perch Initiate", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[151886] = {
			"Detached Thought", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[34164] = {
			"Mechagnome Battletank", -- [1]
			"Ulduar", -- [2]
		},
		[138627] = {
			"Amathet Hierophant", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[62442] = {
			"Tsulong", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[139651] = {
			"Coldlight Deepseer", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[19668] = {
			"Shadowfiend", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[140675] = {
			"Den Mother Mugo", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[137092] = {
			"Valorcall Faithful", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[130435] = {
			"Addled Thug", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[148522] = {
			"Ice Block", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138628] = {
			"Amathet Priest", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135045] = {
			"Spinesnapper", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[63594] = {
			"Coagulated Amber", -- [1]
			"Heart of Fear", -- [2]
		},
		[131974] = {
			"Lieutenant Valen", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[140676] = {
			"Gigantic Stoneback", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138061] = {
			"Venture Co. Longshoreman", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[122284] = {
			"Greater Jungle Stalker", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[148272] = {
			"Crankshot Flame Turret", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[138629] = {
			"Vicar Djosa", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[167806] = {
			"Animated Sin", -- [1]
			"Halls of Atonement", -- [2]
		},
		[168318] = {
			"Forsworn Goliath", -- [1]
			"Spires of Ascension", -- [2]
		},
		[138446] = {
			"Fathom-Caller Zelissa", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[144772] = {
			"Lady Tamakeen", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[173949] = {
			"Nathrian Soldier", -- [1]
			"Castle Nathria", -- [2]
		},
		[49045] = {
			"Augh", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[103344] = {
			"Oakheart", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[85711] = {
			"Aquatic Technician", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[163712] = {
			"Dying Voidspawn", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[32882] = {
			"Jormungar Behemoth", -- [1]
			"Ulduar", -- [2]
		},
		[68175] = {
			"Unbound Bonemender", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[140678] = {
			"Frostbeard Howler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[78801] = {
			"Darkshard Acidback", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[39450] = {
			"Trogg Dweller", -- [1]
			"Grim Batol", -- [2]
		},
		[134024] = {
			"Devouring Maggot", -- [1]
			"Waycrest Manor", -- [2]
		},
		[138631] = {
			"Pathfinder Qadim", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135048] = {
			"Gorestained Piglet", -- [1]
			"Waycrest Manor", -- [2]
		},
		[139655] = {
			"Coldlight Seer", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[164737] = {
			"Brood Ambusher", -- [1]
			"Plaguefall", -- [2]
		},
		[140679] = {
			"Frostbeard Wendigo", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[157571] = {
			"Mawsworn Flametender", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[152905] = {
			"Tower Sentinel", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[44896] = {
			"Pygmy Brute", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[138632] = {
			"Guardian Asuda", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[118728] = {
			"Ghastly Bonewarden", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[139656] = {
			"Coldlight Oracle", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140168] = {
			"Elder Chest-Thump", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140680] = {
			"Frozenhorn Rampager", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[157572] = {
			"Mawsworn Firecaller", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[140292] = {
			"Snowfur Alpha", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[162691] = {
			"Blightbone", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[138633] = {
			"Brother Maat", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60396] = {
			"Emperor's Rage", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[139657] = {
			"Coldlight Shorestriker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[117193] = {
			"Agronox", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[165251] = {
			"Illusionary Vulpin", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[165763] = {
			"Vile Occultist", -- [1]
			"Castle Nathria", -- [2]
		},
		[166275] = {
			"Mistveil Shaper", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[170882] = {
			"Bone Magus", -- [1]
			"Theater of Pain", -- [2]
		},
		[138634] = {
			"Prophet Lapisa", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[126919] = {
			"Irontide Stormcaller", -- [1]
			"Freehold", -- [2]
		},
		[143753] = {
			"Vazun Starspeaker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140102] = {
			"Razorhog", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140682] = {
			"Glacierfist", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[169859] = {
			"Observer Zelgar", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[166276] = {
			"Mistveil Guardian", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[128455] = {
			"T'lonja", -- [1]
			"Atal'Dazar", -- [2]
		},
		[87761] = {
			"Dungeoneer's Training Dummy", -- [1]
			"FW Horde Garrison Level 3", -- [2]
		},
		[120777] = {
			"Guardian Sentry", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[139659] = {
			"Dampscale Oracle", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[136076] = {
			"Agitated Nimbus", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[140683] = {
			"Darkfur the Smasher", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72661] = {
			"Zeal", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[111528] = {
			"Deathroot Ancient", -- [1]
			"The Emerald Nightmare", -- [2]
		},
		[136005] = {
			"Rowdy Reveler", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[138636] = {
			"Prince Abari", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[172858] = {
			"Stone Legion Goliath", -- [1]
			"Castle Nathria", -- [2]
		},
		[139660] = {
			"Dampscale Murloc", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[168837] = {
			"Stealthling", -- [1]
			"Plaguefall", -- [2]
		},
		[140684] = {
			"Crushstomp", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[169861] = {
			"Ickor Bileflesh", -- [1]
			"Plaguefall", -- [2]
		},
		[53616] = {
			"Kar the Everburning", -- [1]
			"Firelands", -- [2]
		},
		[140095] = {
			"Mudsnout Gorer", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[146827] = {
			"Feral Dog", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60397] = {
			"Emperor's Strength", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[168326] = {
			"Shattered Visage", -- [1]
			"De Other Side", -- [2]
		},
		[12096] = {
			"Stormpike Quartermaster", -- [1]
			"Alterac Valley", -- [2]
		},
		[140685] = {
			"Elderhorn", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[133007] = {
			"Unbound Abomination", -- [1]
			"The Underrot", -- [2]
		},
		[137614] = {
			"Demolishing Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[101839] = {
			"Risen Companion", -- [1]
			"Black Rook Hold", -- [2]
		},
		[146828] = {
			"Feral Pup", -- [1]
			"Havenswood (Islands 2)", -- [2]
		},
		[53231] = {
			"Lava Scion", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[139662] = {
			"Dampscale Raincaller", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[140093] = {
			"Pinegraze Fawnmother", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[112804] = {
			"Trained Shadescale", -- [1]
			"The Nighthold", -- [2]
		},
		[137103] = {
			"Blood Visage", -- [1]
			"The Underrot", -- [2]
		},
		[72365] = {
			"Dragonmaw Cannoneer", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[138556] = {
			"Tainted Ooze", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[146829] = {
			"Undying Guardian", -- [1]
			"Crucible of Storms", -- [2]
		},
		[120779] = {
			"Helblaze Felbringer", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[139663] = {
			"Dampscale Reedweaver", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[54511] = {
			"Time-Twisted Geist", -- [1]
			"End Time", -- [2]
		},
		[144782] = {
			"Brother Bruen", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[169265] = {
			"Creepy Crawler", -- [1]
			"Plaguefall", -- [2]
		},
		[156980] = {
			"Essence of Void", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[134157] = {
			"Shadow-Borne Warrior", -- [1]
			"Kings' Rest", -- [2]
		},
		[87719] = {
			"Ogron Hauler", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146740] = {
			"Mag'har Beastlord", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[63597] = {
			"Coagulated Amber", -- [1]
			"Heart of Fear", -- [2]
		},
		[132919] = {
			"Spitefin Behemoth", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[63853] = {
			"Zar'thik Supplicant", -- [1]
			"Heart of Fear", -- [2]
		},
		[123293] = {
			"Royal Sand Crab", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[158092] = {
			"Fallen Heartpiercer", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140084] = {
			"Crushknuckle", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[138641] = {
			"Kvaldir Dreadbringer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60398] = {
			"Emperor's Courage", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[135474] = {
			"Thistle Acolyte", -- [1]
			"Waycrest Manor", -- [2]
		},
		[126215] = {
			"Zian-Ti Darkweaver", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144784] = {
			"Charg \"The Boisterous\"", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140082] = {
			"Gibb", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[105715] = {
			"Watchful Inquisitor", -- [1]
			"Court of Stars", -- [2]
		},
		[146320] = {
			"Prelate Za'lan", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[146832] = {
			"Necromancer Disciple", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[147344] = {
			"Opulence", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[32885] = {
			"Captured Mercenary Soldier", -- [1]
			"Ulduar", -- [2]
		},
		[98770] = {
			"Wrathguard Felblade", -- [1]
			"The Arcway", -- [2]
		},
		[165260] = {
			"Oozing Leftovers", -- [1]
			"Theater of Pain", -- [2]
		},
		[135764] = {
			"Explosive Totem", -- [1]
			"Kings' Rest", -- [2]
		},
		[139678] = {
			"Shoal-Walker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[98177] = {
			"Glayvianna Soulrender", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[146833] = {
			"Necromancer Conjurer", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[130655] = {
			"Bobby Howlis", -- [1]
			"Tol Dagor", -- [2]
		},
		[129227] = {
			"Azerokk", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[54512] = {
			"Time-Twisted Sentinel", -- [1]
			"End Time", -- [2]
		},
		[140691] = {
			"Giant Dreadfang", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[157583] = {
			"Forge Keeper", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[122266] = {
			"Spineshell Turtle", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[146322] = {
			"Siegebreaker Roka", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138644] = {
			"Kvaldir Cursewalker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152874] = {
			"Vez'okk the Lightless", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[139668] = {
			"Wavebinder Gorgl", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140180] = {
			"Brutalgore", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[140692] = {
			"Bloodbore", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[157584] = {
			"Flameforge Master", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146731] = {
			"Zombie Dust Totem", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[60143] = {
			"Gara'jal the Spiritbinder", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[138645] = {
			"Kvaldir Soulflayer", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[159632] = {
			"Cultist Shadowblade", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[139669] = {
			"Shaman Garmr", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[140181] = {
			"Cragtusk", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[101075] = {
			"Wormspeaker Devout", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[113307] = {
			"Chronowraith", -- [1]
			"The Nighthold", -- [2]
		},
		[105682] = {
			"Felguard Destroyer", -- [1]
			"The Arcway", -- [2]
		},
		[36597] = {
			"The Lich King", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[138646] = {
			"Kvaldir Mistcaller", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[159633] = {
			"Cultist Executioner", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[32886] = {
			"Dark Rune Acolyte", -- [1]
			"Ulduar", -- [2]
		},
		[140182] = {
			"Trampleleaf the Jungle Quake", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[53617] = {
			"Molten Erupter", -- [1]
			"Firelands", -- [2]
		},
		[148262] = {
			"Tidewater Elemental", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[163618] = {
			"Zolramus Necromancer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[91808] = {
			"Serpentrix", -- [1]
			"Eye of Azshara", -- [2]
		},
		[146837] = {
			"Treasury Sentinel", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[59605] = {
			"Sodden Hozen Brawler", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[139671] = {
			"Sharkslayer Mugluk", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[140183] = {
			"Old Muckhide", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140695] = {
			"Albino Dreadfang", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[150818] = {
			"Disturbed Blood Globule", -- [1]
			"Uldir Scenario", -- [2]
		},
		[123285] = {
			"Southsea Swabbie", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134041] = {
			"Infected Peasant", -- [1]
			"Waycrest Manor", -- [2]
		},
		[130765] = {
			"Jungle Stalker Cub", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[151841] = {
			"Burgthok the Herald", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[139672] = {
			"Gibberfin", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[151840] = {
			"Vile Soul", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140696] = {
			"Da'zu the Feared", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[145303] = {
			"Kaldorei Glaive Thrower", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[120016] = {
			"Necrotic Spiderling", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[136483] = {
			"Ashvane Deckhand", -- [1]
			"Siege of Boralus", -- [2]
		},
		[138649] = {
			"Vulf Stormshore", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[60400] = {
			"Jan-xi", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[139673] = {
			"Many-Teeth", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[140064] = {
			"Bloodsoaked Grizzlefur", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140697] = {
			"Vile Asp", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[145304] = {
			"Feral Strangler", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[137626] = {
			"Demolishing Terror", -- [1]
			"Siege of Boralus", -- [2]
		},
		[171799] = {
			"Depths Warden", -- [1]
			"Sanguine Depths", -- [2]
		},
		[146840] = {
			"Skeleton Guardian", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[63570] = {
			"Sra'thik Pool-Tender", -- [1]
			"Heart of Fear", -- [2]
		},
		[139674] = {
			"Deepscale", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[140062] = {
			"Diremaul", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[161173] = {
			"Abyssal Watcher", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[169875] = {
			"Shackled Soul", -- [1]
			"Theater of Pain", -- [2]
		},
		[22846] = {
			"Ashtongue Stormcaller", -- [1]
			"Black Temple", -- [2]
		},
		[134941] = {
			"Bristlethorn Spider", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[113043] = {
			"Abyss Watcher", -- [1]
			"The Nighthold", -- [2]
		},
		[112595] = {
			"Shal'dorei Archmage", -- [1]
			"The Nighthold", -- [2]
		},
		[139675] = {
			"Fathom-Seeker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[159514] = {
			"Blood of Ny'alotha", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[135963] = {
			"Earth Elemental", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134939] = {
			"Bristlethorn Maneater", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[126095] = {
			"Vyliss", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139033] = {
			"Razorfin Watershaper", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[138652] = {
			"Tide-Cursed Mistress", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[126928] = {
			"Irontide Corsair", -- [1]
			"Freehold", -- [2]
		},
		[139676] = {
			"Wave-Speaker Ormrg", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[15936] = {
			"Heigan the Unclean", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[150292] = {
			"Mechagon Cavalry", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[145307] = {
			"Forsaken Laborer", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[79068] = {
			"Iron Grunt", -- [1]
			"Highmaul", -- [2]
		},
		[56912] = {
			"Krik'thik Engulfer", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[64368] = {
			"Apparition of Fear", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[112596] = {
			"Duskwatch Warden", -- [1]
			"The Nighthold", -- [2]
		},
		[129232] = {
			"Mogul Razdunk", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[104918] = {
			"Vigilant Duskwatch", -- [1]
			"Court of Stars", -- [2]
		},
		[144796] = {
			"High Tinker Mekkatorque", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[173973] = {
			"Nathrian Tracker", -- [1]
			"Castle Nathria", -- [2]
		},
		[48756] = {
			"Hooked Net", -- [1]
			"Grim Batol", -- [2]
		},
		[58959] = {
			"Piprik", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[138654] = {
			"Vestar of the Tattered Sail", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[80791] = {
			"Grom'kar Man-at-Arms", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[168343] = {
			"Patchwerk Soldier", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[98965] = {
			"Kur'talos Ravencrest", -- [1]
			"Black Rook Hold", -- [2]
		},
		[152987] = {
			"Faceless Willbreaker", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[157594] = {
			"Lesser Void Elemental", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[139537] = {
			"Zara'thik Kunchong", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[87515] = {
			"Iron Flame Binder", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146845] = {
			"Jared the Jagged", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[123275] = {
			"Saltfur Hozen", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[139679] = {
			"Argl", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[144286] = {
			"Asset Manager", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[152988] = {
			"Faceless Shadowcaller", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[96657] = {
			"Blade Dancer Illianna", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[81117] = {
			"Karnor the Cruel", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[154524] = {
			"K'thir Mindcarver", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[102104] = {
			"Enslaved Shieldmaiden", -- [1]
			"Maw of Souls", -- [2]
		},
		[12056] = {
			"Baron Geddon", -- [1]
			"Molten Core", -- [2]
		},
		[98521] = {
			"Lord Etheldrin Ravencrest", -- [1]
			"Black Rook Hold", -- [2]
		},
		[91793] = {
			"Seaspray Crab", -- [1]
			"Eye of Azshara", -- [2]
		},
		[173464] = {
			"Deplina", -- [1]
			"Castle Nathria", -- [2]
		},
		[149406] = {
			"Kaldorei Dark Ranger", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[135958] = {
			"Malachite", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[99801] = {
			"Destructor Tentacle", -- [1]
			"Maw of Souls", -- [2]
		},
		[146847] = {
			"Summoner Laniella", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[60402] = {
			"Zandalari Fire-Dancer", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[139681] = {
			"Bleakfin", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[151815] = {
			"Deadsoul Echo", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[40273] = {
			"Ascended Waterlasher", -- [1]
			"Grim Batol", -- [2]
		},
		[151814] = {
			"Deadsoul Shade", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[166299] = {
			"Mistveil Tender", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[162716] = {
			"Spellbound Ritualist", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146848] = {
			"Eerie Conglomeration", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[123271] = {
			"Saltfur Stick-Thrower", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[131492] = {
			"Devout Blood Priest", -- [1]
			"The Underrot", -- [2]
		},
		[152479] = {
			"Void-Twisted Whelp", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[173466] = {
			"Fara", -- [1]
			"Castle Nathria", -- [2]
		},
		[140038] = {
			"Abyssal Eel", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[22847] = {
			"Ashtongue Primalist", -- [1]
			"Black Temple", -- [2]
		},
		[162717] = {
			"Sinister Soulcarver", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146849] = {
			"Spirit Master Rowena", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[147202] = {
			"Animated Azershard", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[23403] = {
			"Illidari Assassin", -- [1]
			"Black Temple", -- [2]
		},
		[156575] = {
			"Dark Inquisitor Xanesh", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[162046] = {
			"Famished Tick", -- [1]
			"Sanguine Depths", -- [2]
		},
		[97163] = {
			"Cursed Falke", -- [1]
			"Maw of Souls", -- [2]
		},
		[166301] = {
			"Mistveil Stalker", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[162718] = {
			"Iron-Willed Enforcer", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[138660] = {
			"Mist Hound", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140546] = {
			"Broodqueen Vyl'tilac", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[168718] = {
			"Forsworn Warden", -- [1]
			"Spires of Ascension", -- [2]
		},
		[133379] = {
			"Adderis", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[103130] = {
			"Timeless Wraith", -- [1]
			"The Arcway", -- [2]
		},
		[138497] = {
			"Twilight Scalesworn", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[166302] = {
			"Corpse Harvester", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[162719] = {
			"Void Ascendant", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[138496] = {
			"Twilight Drakonaar", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134912] = {
			"Violet Creeper", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[164255] = {
			"Globgrog", -- [1]
			"Plaguefall", -- [2]
		},
		[156577] = {
			"Therum Deepforge", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[173469] = {
			"Kullan", -- [1]
			"Castle Nathria", -- [2]
		},
		[141565] = {
			"Kul Tiran Footman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[12119] = {
			"Flamewaker Protector", -- [1]
			"Molten Core", -- [2]
		},
		[138493] = {
			"Minion of Zul", -- [1]
			"Kings' Rest", -- [2]
		},
		[146852] = {
			"Konrad the Enslaver", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[65522] = {
			"Bubble Shield", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[79505] = {
			"Solar Flare", -- [1]
			"Skyreach", -- [2]
		},
		[144293] = {
			"Waste Processing Unit", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[152995] = {
			"Warden of Souls", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[157602] = {
			"Drest'agath", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[166304] = {
			"Mistveil Stinger", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[134056] = {
			"Aqu'sirr", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[146853] = {
			"Kefolkis the Unburied", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[91783] = {
			"Hatecoil Stormweaver", -- [1]
			"Eye of Azshara", -- [2]
		},
		[121047] = {
			"Deeploc", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[144294] = {
			"Mechagon Tinkerer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[138487] = {
			"Obsidian Wing-Spreader", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[157603] = {
			"Void Globule", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[138486] = {
			"Aluriak", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[126422] = {
			"Coralback Scuttler", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[146854] = {
			"Stella Darkpaw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[163746] = {
			"Walkie Shockie X1", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[119000] = {
			"Dreadbeard", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[144295] = {
			"Mechagon Mechanic", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[144807] = {
			"Ravenous Stalker", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[157604] = {
			"Crawling Corruption", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[162030] = {
			"Darkwhisper Ritualist", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[134058] = {
			"Galecaller Faye", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[146855] = {
			"Akina", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[11671] = {
			"Core Hound", -- [1]
			"Molten Core", -- [2]
		},
		[88288] = {
			"Dungeoneer's Training Dummy", -- [1]
			"FW Horde Garrison Level 3", -- [2]
		},
		[144296] = {
			"Spider Tank", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[119169] = {
			"Fulminating Lasher", -- [1]
			"Cathedral of Eternal Night", -- [2]
		},
		[157605] = {
			"Burrowing Appendage", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[102788] = {
			"Felspite Dominator", -- [1]
			"Black Rook Hold", -- [2]
		},
		[126423] = {
			"Coralback Crab", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[146856] = {
			"Ashen Raider", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[40953] = {
			"Khaaphom", -- [1]
			"Grim Batol", -- [2]
		},
		[139690] = {
			"Brineshell Seacaller", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[53494] = {
			"Baleroc", -- [1]
			"Firelands", -- [2]
		},
		[134895] = {
			"Ironweb Weaver", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[135406] = {
			"Animated Gold", -- [1]
			"Kings' Rest", -- [2]
		},
		[22848] = {
			"Storm Fury", -- [1]
			"Black Temple", -- [2]
		},
		[87521] = {
			"Iron Slag-Shaper", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146857] = {
			"Honorbound Conqueror", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[112603] = {
			"Terrace Grove-Tender", -- [1]
			"The Nighthold", -- [2]
		},
		[164261] = {
			"Hungering Destroyer", -- [1]
			"Castle Nathria", -- [2]
		},
		[144298] = {
			"Defense Bot Mk III", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[23400] = {
			"Illidari Archon", -- [1]
			"Black Temple", -- [2]
		},
		[157607] = {
			"Faceless Shadowcaller", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[156406] = {
			"Voidbound Honor Guard", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[126424] = {
			"Coralback Surfcrawler", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[164578] = {
			"Stitchflesh's Creation", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[147370] = {
			"Bladeguard Kaja", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[168357] = {
			"Zolramus Sorcerer", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[144299] = {
			"Workshop Defender", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[59459] = {
			"Hopling", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[169893] = {
			"Nefarious Darkspeaker", -- [1]
			"Theater of Pain", -- [2]
		},
		[151785] = {
			"Void-Twisted Wyrmkiller", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[161502] = {
			"Ravenous Fleshfiend", -- [1]
			"Waycrest Manor", -- [2]
		},
		[146859] = {
			"Enslaved Rock Elemental", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138979] = {
			"Muckfin Tidecaller", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[96480] = {
			"Viletongue Belcher", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[144300] = {
			"Mechagon Citizen", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[148907] = {
			"Prismatic Image", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[157609] = {
			"K'thir Mindcarver", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[126169] = {
			"Jungle King Runtu", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[134063] = {
			"Brother Ironhull", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[146860] = {
			"Mistscorn Marauder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[165594] = {
			"Coldheart Ambusher", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[160169] = {
			"Honored Duelist", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[144301] = {
			"Living Waste", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[153003] = {
			"Soul Fragment", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[157610] = {
			"K'thir Dominator", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[73342] = {
			"Fallen Pool Tender", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[162729] = {
			"Patchwerk Soldier", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[146861] = {
			"Slavering Skullcleaver", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[104415] = {
			"Chronomatic Anomaly", -- [1]
			"The Nighthold", -- [2]
		},
		[139695] = {
			"Swipeclaw", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[77692] = {
			"Kromog", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[62837] = {
			"Grand Empress Shek'zeer", -- [1]
			"Heart of Fear", -- [2]
		},
		[130522] = {
			"Freehold Shipmate", -- [1]
			"Freehold", -- [2]
		},
		[120651] = {
			"Explosives", -- [1]
			"Atal'Dazar", -- [2]
		},
		[73191] = {
			"Aqueous Defender", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[146862] = {
			"Mistscorn Subjugator", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[102368] = {
			"Felguard Destroyer", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[164266] = {
			"Domina Venomblade", -- [1]
			"Plaguefall", -- [2]
		},
		[144303] = {
			"G.U.A.R.D.", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[132530] = {
			"Kul Tiran Vanguard", -- [1]
			"Siege of Boralus", -- [2]
		},
		[157612] = {
			"Eye of Drest'agath", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[166608] = {
			"Mueh'zala", -- [1]
			"De Other Side", -- [2]
		},
		[114544] = {
			"Skeletal Usher", -- [1]
			"Return to Karazhan", -- [2]
		},
		[146863] = {
			"Mistscorn Ravager", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[167119] = {
			"Beckoned Wraith", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[164267] = {
			"Margrave Stradama", -- [1]
			"Plaguefall", -- [2]
		},
		[87780] = {
			"Slagshop Brute", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[135893] = {
			"Burning Emberguard", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[157613] = {
			"Maw of Drest'agath", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[122076] = {
			"Snow Orb", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[105952] = {
			"Withered Manawraith", -- [1]
			"The Arcway", -- [2]
		},
		[146864] = {
			"Mistscorn Earthbinder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[147376] = {
			"Barrier", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139698] = {
			"Clattercraw the Oracle", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[111071] = {
			"Pulsauron", -- [1]
			"The Nighthold", -- [2]
		},
		[132532] = {
			"Kul Tiran Marksman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[157614] = {
			"Tentacle of Drest'agath", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[133556] = {
			"Razak Ironsides", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[145616] = {
			"King Rastakhan", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[56511] = {
			"Corrupt Living Water", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[77942] = {
			"Primal Storm Elemental", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[169159] = {
			"Unstable Canister", -- [1]
			"Plaguefall", -- [2]
		},
		[151755] = {
			"Shadehound", -- [1]
			"Emerald Dream - HoA Scenario", -- [2]
		},
		[14283] = {
			"Stormpike Owl", -- [1]
			"Alterac Valley", -- [2]
		},
		[130011] = {
			"Irontide Buccaneer", -- [1]
			"Freehold", -- [2]
		},
		[133557] = {
			"Razak Ironsides", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[134069] = {
			"Vol'zith the Whisperer", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[146866] = {
			"Enslaved Frost Elemental", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[98275] = {
			"Risen Archer", -- [1]
			"Black Rook Hold", -- [2]
		},
		[168365] = {
			"Fungret Shroomtender", -- [1]
			"Plaguefall", -- [2]
		},
		[138847] = {
			"Battle-Mender Ka'vaz", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[173484] = {
			"Conjured Manifestation", -- [1]
			"Castle Nathria", -- [2]
		},
		[134764] = {
			"Clattershell", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139467] = {
			"Qinsu the Granite Fist", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[135647] = {
			"Ituakee", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146867] = {
			"Mistscorn Sharphorn", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[122984] = {
			"Dazar'ai Colossus", -- [1]
			"Atal'Dazar", -- [2]
		},
		[170690] = {
			"Diseased Horror", -- [1]
			"Theater of Pain", -- [2]
		},
		[168878] = {
			"Rigged Plagueborer", -- [1]
			"Plaguefall", -- [2]
		},
		[132299] = {
			"Angry Treant", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[130012] = {
			"Irontide Ravager", -- [1]
			"Freehold", -- [2]
		},
		[155219] = {
			"Gormling Spitter", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[57080] = {
			"Corrupted Scroll", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[131785] = {
			"Buzzing Drone", -- [1]
			"Tol Dagor", -- [2]
		},
		[122846] = {
			"Leftovers", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[155271] = {
			"Abyssal Spearhunter", -- [1]
			"The Eternal Palace", -- [2]
		},
		[122967] = {
			"Priestess Alun'za", -- [1]
			"Atal'Dazar", -- [2]
		},
		[107114] = {
			"Tormenting Orb", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[167615] = {
			"Depraved Darkblade", -- [1]
			"Halls of Atonement", -- [2]
		},
		[101995] = {
			"Festerface", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[170927] = {
			"Slithering Ooze", -- [1]
			"Plaguefall", -- [2]
		},
		[146869] = {
			"Gyrum the Virulent", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[151476] = {
			"Blastatron X-80", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[135365] = {
			"Matron Alma", -- [1]
			"Waycrest Manor", -- [2]
		},
		[62711] = {
			"Amber Monstrosity", -- [1]
			"Heart of Fear", -- [2]
		},
		[144822] = {
			"Golden Flametongue", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[76778] = {
			"Life-Pact Familiar", -- [1]
			"Skyreach", -- [2]
		},
		[105699] = {
			"Mana Saber", -- [1]
			"Court of Stars", -- [2]
		},
		[136893] = {
			"Groundshaker Aggan", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[146870] = {
			"Spellbinder Ohnazae", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[102372] = {
			"Felhound Mage Slayer", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[98533] = {
			"Foul Mother", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[144311] = {
			"Orb Guardian", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[151742] = {
			"Void-Twisted Invader", -- [1]
			"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
		},
		[169905] = {
			"Risen Warlord", -- [1]
			"De Other Side", -- [2]
		},
		[79082] = {
			"Mind Fungus", -- [1]
			"Highmaul", -- [2]
		},
		[140992] = {
			"Corpseburster", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[146871] = {
			"Matriarch Nas'naya", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[173714] = {
			"Mistveil Nightblossom", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[147895] = {
			"Rezani Disciple", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[76267] = {
			"Solar Zealot", -- [1]
			"Skyreach", -- [2]
		},
		[144824] = {
			"Slimeskin Toad", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153526] = {
			"Aqir Swarmer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[170418] = {
			"Goxul the Devourer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[154550] = {
			"Amathet Sun Priest", -- [1]
			"Halls of Origination", -- [2]
		},
		[44924] = {
			"Oathsworn Myrmidon", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[138430] = {
			"Fogsail Cannoneer", -- [1]
			"Siege of Boralus", -- [2]
		},
		[160181] = {
			"Royal Arcanist", -- [1]
			"Revendreth Scenario", -- [2]
		},
		[111075] = {
			"Chaotoid", -- [1]
			"The Nighthold", -- [2]
		},
		[1933] = {
			"Sheep", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[145337] = {
			"Sandclaw Crab", -- [1]
			"The Eternal Palace", -- [2]
		},
		[170419] = {
			"Lost Dredger", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[157368] = {
			"Velinaria", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[146873] = {
			"Murderous Tempest", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[23394] = {
			"Promenade Sentinel", -- [1]
			"Black Temple", -- [2]
		},
		[160182] = {
			"Void Initiate", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[172979] = {
			"Honeydew Sporeflutterer", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[144826] = {
			"Man-Eater", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[79467] = {
			"Adept of the Dawn", -- [1]
			"Skyreach", -- [2]
		},
		[145850] = {
			"Gilnean Defuser", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[154552] = {
			"Amathet Zealot", -- [1]
			"Halls of Origination", -- [2]
		},
		[146874] = {
			"Windcaller Mariah", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[155830] = {
			"Mawsworn Disciple", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[160183] = {
			"Void Fanatic", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[165560] = {
			"Gormling Larva", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[144827] = {
			"Bogbelcher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[168113] = {
			"General Grashaal", -- [1]
			"Castle Nathria", -- [2]
		},
		[158136] = {
			"Inquisitor Darkspeak", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[76906] = {
			"Operator Thogar", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[146875] = {
			"Valimok the Vicious", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[138427] = {
			"Spitefin Harpooner", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[156089] = {
			"Aqir Venomweaver", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[168886] = {
			"Virulax Blightweaver", -- [1]
			"Plaguefall", -- [2]
		},
		[140980] = {
			"Jadescale Worm", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[136890] = {
			"Iron Orkas", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[72942] = {
			"Dragonmaw Flagbearer", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[162744] = {
			"Nekthara the Mangler", -- [1]
			"Theater of Pain", -- [2]
		},
		[53115] = {
			"Molten Lord", -- [1]
			"Firelands", -- [2]
		},
		[122850] = {
			"Umbral Guard", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[136884] = {
			"Bristlethorn Battleguard", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[98792] = {
			"Wyrmtongue Scavenger", -- [1]
			"Black Rook Hold", -- [2]
		},
		[144829] = {
			"Thundercroak", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[61945] = {
			"Gurthan Iron Maw", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[141495] = {
			"Kul Tiran Footman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[154555] = {
			"Amathet Artificer", -- [1]
			"Halls of Origination", -- [2]
		},
		[122972] = {
			"Dazar'ai Augur", -- [1]
			"Atal'Dazar", -- [2]
		},
		[159405] = {
			"Aqir Scarab", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[172981] = {
			"Kyrian Stitchwerk", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[152508] = {
			"Dusky Tremorbeast", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[121571] = {
			"Дух зверя", -- [1]
			"Isle of Conquest", -- [2]
		},
		[169912] = {
			"Enraged Mask", -- [1]
			"De Other Side", -- [2]
		},
		[105703] = {
			"Mana Wyrm", -- [1]
			"Court of Stars", -- [2]
		},
		[146366] = {
			"Molten Hound", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[171448] = {
			"Dreadful Huntmaster", -- [1]
			"Sanguine Depths", -- [2]
		},
		[122851] = {
			"Umbral Archer", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[34944] = {
			"Keep Cannon", -- [1]
			"Isle of Conquest", -- [2]
		},
		[160699] = {
			"Angry Mailemental", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[155824] = {
			"Lumbering Creation", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[117596] = {
			"Razorjaw Gladiator", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[158140] = {
			"Frenzied Rat", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[146367] = {
			"Char'golm", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139439] = {
			"Duskbinder Zuun", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[60410] = {
			"Elegon", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[12050] = {
			"Stormpike Defender", -- [1]
			"Alterac Valley", -- [2]
		},
		[145067] = {
			"Shadefeather Hatchling", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[40319] = {
			"Drahga Shadowburner", -- [1]
			"Grim Batol", -- [2]
		},
		[76132] = {
			"Soaring Chakram Master", -- [1]
			"Skyreach", -- [2]
		},
		[105704] = {
			"Arcane Manifestation", -- [1]
			"Court of Stars", -- [2]
		},
		[155814] = {
			"Eldritch Understudy", -- [1]
			"The Eternal Palace", -- [2]
		},
		[44926] = {
			"Oathsworn Wanderer", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[53244] = {
			"Flamewaker Trainee", -- [1]
			"Firelands", -- [2]
		},
		[145064] = {
			"Blaze", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168891] = {
			"Rigged Plagueborer", -- [1]
			"Plaguefall", -- [2]
		},
		[136643] = {
			"Azerite Extractor", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[61946] = {
			"Harthak Stormcaller", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[140970] = {
			"Cragburster", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[168099] = {
			"Empowered Coldheart Javelineer", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146881] = {
			"Soothsayer Brinvulf", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[163260] = {
			"Vicious Ghoul", -- [1]
			"Redridge - 9xp Bastion", -- [2]
		},
		[132773] = {
			"Boulderfist Enforcer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[152512] = {
			"Stormwraith", -- [1]
			"The Eternal Palace", -- [2]
		},
		[146880] = {
			"Gholvran the Cryptic", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[149441] = {
			"Frozen Ballista", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[162238] = {
			"Darkwhisper Cultist", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[146370] = {
			"Dark Iron Vanguard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[146882] = {
			"Gargantuan Blighthound", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[157340] = {
			"Skeletal Remains", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[2442] = {
			"Cow", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[165529] = {
			"Depraved Collector", -- [1]
			"Halls of Atonement", -- [2]
		},
		[43391] = {
			"Millhouse Manastorm", -- [1]
			"The Stonecore", -- [2]
		},
		[78832] = {
			"Grom'kar Man-at-Arms", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[140440] = {
			"Bloodfur the Gorer", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[146371] = {
			"Dark Iron Primalist", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[146883] = {
			"Houndmaster Angvold", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[155618] = {
			"Zanj'ir Huntress", -- [1]
			"The Eternal Palace", -- [2]
		},
		[131527] = {
			"Lord Waycrest", -- [1]
			"Waycrest Manor", -- [2]
		},
		[160704] = {
			"Letter Encrusted Void Globule", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[144836] = {
			"Spikey", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[40448] = {
			"Twilight Enforcer", -- [1]
			"Grim Batol", -- [2]
		},
		[105706] = {
			"Priestess of Misery", -- [1]
			"The Arcway", -- [2]
		},
		[36609] = {
			"Val'kyr Shadowguard", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[65402] = {
			"Gurthan Swiftblade", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[155586] = {
			"Arathor Ancestor", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[5139] = {
			"Kurdrum Barleybeard", -- [1]
			"Alterac Valley", -- [2]
		},
		[111081] = {
			"Fulminant", -- [1]
			"The Nighthold", -- [2]
		},
		[161217] = {
			"Aqir Skitterer", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[61947] = {
			"Kargesh Ribcrusher", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[158146] = {
			"Fallen Riftwalker", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[58108] = {
			"Krik'thik Infiltrator", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[134600] = {
			"Sandswept Marksman", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[157333] = {
			"Darkwhisper Cultist", -- [1]
			"Blackwing Descent Scenario", -- [2]
		},
		[168384] = {
			"Flesh Construct", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[172991] = {
			"Drust Soulcleaver", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[161218] = {
			"Aqir Crusher", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[137160] = {
			"Valorcall Engineer", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[72947] = {
			"Kor'kron Demolisher", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[150165] = {
			"Slime Elemental", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[146886] = {
			"Hrolskald the Fetid", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140438] = {
			"Old Longtooth", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[152722] = {
			"Fallen Voidspeaker", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[152517] = {
			"Deadsoul Lifetaker", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[144839] = {
			"Whitetail Doe", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[153541] = {
			"Slavemaster Ul'rok", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[138388] = {
			"Kung", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[154565] = {
			"Loyal Myrmidon", -- [1]
			"The Eternal Palace", -- [2]
		},
		[134602] = {
			"Shrouded Fang", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[17951] = {
			"Steamrigger Mechanic", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[155791] = {
			"Horrific Shrieker", -- [1]
			"The Eternal Palace", -- [2]
		},
		[150160] = {
			"Scrapbone Bully", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[144840] = {
			"Mottled Fawn", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[113998] = {
			"Mightstone Breaker", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[122088] = {
			"Slitherblade Skulker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[152718] = {
			"Alleria Windrunner", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140432] = {
			"Craghoof Leaper", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[61436] = {
			"Sik'thik Bladedancer", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[54319] = {
			"Nora", -- [1]
			"Alterac Valley", -- [2]
		},
		[164804] = {
			"Droman Oulfarran", -- [1]
			"Mists of Tirna Scithe", -- [2]
		},
		[53630] = {
			"Unstable Pyrelord", -- [1]
			"Firelands", -- [2]
		},
		[173190] = {
			"Court Hawkeye", -- [1]
			"Castle Nathria", -- [2]
		},
		[145865] = {
			"Worgen Musketeer", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[138187] = {
			"Grotesque Horror", -- [1]
			"The Underrot", -- [2]
		},
		[146889] = {
			"Fleshrot Deathwalker", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[167876] = {
			"Inquisitor Sigar", -- [1]
			"Halls of Atonement", -- [2]
		},
		[155273] = {
			"Garval the Vanquisher", -- [1]
			"The Eternal Palace", -- [2]
		},
		[136845] = {
			"Sandscalp Axe Thrower", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[144842] = {
			"Tide Crawler", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[169924] = {
			"Veteran Stoneguard", -- [1]
			"Castle Nathria", -- [2]
		},
		[122089] = {
			"Slitherblade Oracle", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[168580] = {
			"Plagueborer", -- [1]
			"Plaguefall", -- [2]
		},
		[146890] = {
			"Fleshrot Runeweaver", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[168579] = {
			"Fen Hatchling", -- [1]
			"Plaguefall", -- [2]
		},
		[152009] = {
			"Malfunctioning Scrapbot", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[145040] = {
			"Llorin the Clever", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[72276] = {
			"Amalgam of Corruption", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[169925] = {
			"Begrudging Waiter", -- [1]
			"Castle Nathria", -- [2]
		},
		[79092] = {
			"Fungal Flesh-Eater", -- [1]
			"Highmaul", -- [2]
		},
		[148622] = {
			"Echo of Kimbul", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[169601] = {
			"Stone Legion Commando", -- [1]
			"Castle Nathria", -- [2]
		},
		[129000] = {
			"Southsea Brawler", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134793] = {
			"Glowspine", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[12100] = {
			"Lava Reaver", -- [1]
			"Molten Core", -- [2]
		},
		[155275] = {
			"Tideshaper Korvess", -- [1]
			"The Eternal Palace", -- [2]
		},
		[130024] = {
			"Soggy Shiprat", -- [1]
			"Freehold", -- [2]
		},
		[122090] = {
			"Sarashas the Pillager", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[21212] = {
			"Lady Vashj", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[53119] = {
			"Flamewaker Forward Guard", -- [1]
			"Firelands", -- [2]
		},
		[140430] = {
			"Craghoof Bounder", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[138887] = {
			"Bloodwake Mystic", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[134799] = {
			"Fathomclaw", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[53631] = {
			"Cinderweb Spiderling", -- [1]
			"Firelands", -- [2]
		},
		[169927] = {
			"Putrid Butcher", -- [1]
			"Theater of Pain", -- [2]
		},
		[79093] = {
			"Skyreach Sun Talon", -- [1]
			"Skyreach", -- [2]
		},
		[54015] = {
			"Majordomo Staghelm", -- [1]
			"Firelands", -- [2]
		},
		[54143] = {
			"Molten Flamefather", -- [1]
			"Firelands", -- [2]
		},
		[147588] = {
			"Treasury Defender", -- [1]
			"Zandalari Treasury", -- [2]
		},
		[157825] = {
			"Crazed Tormenter", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[109038] = {
			"Solarist Tel'arn", -- [1]
			"The Nighthold", -- [2]
		},
		[148619] = {
			"Echo of Akunda", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[130025] = {
			"Irontide Thug", -- [1]
			"Tol Dagor", -- [2]
		},
		[133585] = {
			"Dizzy Dina", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[34564] = {
			"Anub'arak", -- [1]
			"Caverns of Time - Anniversary", -- [2]
		},
		[146894] = {
			"Fleshrot Cabalist", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[108360] = {
			"Acidmaw Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[168393] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[22875] = {
			"Coilskar Sea-Caller", -- [1]
			"Black Temple", -- [2]
		},
		[132740] = {
			"Venomscale Hydra", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[150143] = {
			"Scrapbone Grinder", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[136834] = {
			"Scalper Bazuulu", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[162763] = {
			"Soulforged Bonereaver", -- [1]
			"Theater of Pain", -- [2]
		},
		[146895] = {
			"Fleshrot Vandal", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[148607] = {
			"Kal'ia Pa'kuaya", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[168394] = {
			"Slimy Morsel", -- [1]
			"Plaguefall", -- [2]
		},
		[96754] = {
			"Harbaron", -- [1]
			"Maw of Souls", -- [2]
		},
		[134786] = {
			"Spineclaw Sandsnapper", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[130026] = {
			"Bilge Rat Seaspeaker", -- [1]
			"Tol Dagor", -- [2]
		},
		[158157] = {
			"Overlord Mathias Shaw", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[162764] = {
			"Twisted Appendage", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[53120] = {
			"Flamewaker Pathfinder", -- [1]
			"Firelands", -- [2]
		},
		[96584] = {
			"Immoliant Fury", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[54701] = {
			"Time-Twisted Huntress", -- [1]
			"End Time", -- [2]
		},
		[168907] = {
			"Slime Tentacle", -- [1]
			"Plaguefall", -- [2]
		},
		[144849] = {
			"Darkscale Scout", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[158327] = {
			"Crackling Shard", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[22853] = {
			"Illidari Defiler", -- [1]
			"Black Temple", -- [2]
		},
		[22917] = {
			"Illidan Stormrage", -- [1]
			"Black Temple", -- [2]
		},
		[134612] = {
			"Grasping Tentacles", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[146553] = {
			"Kul Tiran Strongarm", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[168396] = {
			"Plaguebelcher", -- [1]
			"Plaguefall", -- [2]
		},
		[109040] = {
			"Arcanist Tel'arn", -- [1]
			"The Nighthold", -- [2]
		},
		[144850] = {
			"Darkscale Siren", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[130027] = {
			"Ashvane Marine", -- [1]
			"Tol Dagor", -- [2]
		},
		[132741] = {
			"Flamescale Hydra", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[139384] = {
			"Slitherblade Striker", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[98035] = {
			"Dreadstalker", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[114671] = {
			"Fragmented Time Particle", -- [1]
			"The Nighthold", -- [2]
		},
		[59519] = {
			"Stout Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[108359] = {
			"Volatile Scorpid", -- [1]
			"The Nighthold", -- [2]
		},
		[88902] = {
			"Mol'dana Two-Blade", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[60583] = {
			"Protector Kaolan", -- [1]
			"Terrace of Endless Spring", -- [2]
		},
		[141939] = {
			"Ashvane Spotter", -- [1]
			"Siege of Boralus", -- [2]
		},
		[59820] = {
			"Pandaren Cannoneer", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[146899] = {
			"Ashen Deathguard", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[147411] = {
			"Blightguard Captain Thedric", -- [1]
			"Warfronts Darkshore - Alliance", -- [2]
		},
		[168398] = {
			"Slimy Morsel", -- [1]
			"Plaguefall", -- [2]
		},
		[164815] = {
			"Zolramus Siphoner", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[157137] = {
			"Terror Tendril", -- [1]
			"Halls of Origination", -- [2]
		},
		[130028] = {
			"Ashvane Priest", -- [1]
			"Tol Dagor", -- [2]
		},
		[133588] = {
			"Automatic Explosive Ejector", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[165481] = {
			"Ballroom Attendant", -- [1]
			"Castle Nathria", -- [2]
		},
		[155090] = {
			"Anodized Coilbearer", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[76102] = {
			"Air Familiar", -- [1]
			"Skyreach", -- [2]
		},
		[61567] = {
			"Vizier Jin'bak", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[132056] = {
			"Venture Co. Skyscorcher", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[165479] = {
			"Court Noble", -- [1]
			"Castle Nathria", -- [2]
		},
		[161745] = {
			"Hepthys", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[11662] = {
			"Flamewaker Priest", -- [1]
			"Molten Core", -- [2]
		},
		[33453] = {
			"Dark Rune Watcher", -- [1]
			"Ulduar", -- [2]
		},
		[134616] = {
			"Krolusk Pup", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[167888] = {
			"Immortal Shade of Kael'thas", -- [1]
			"Castle Nathria", -- [2]
		},
		[131545] = {
			"Lady Waycrest", -- [1]
			"Waycrest Manor", -- [2]
		},
		[129517] = {
			"Reanimated Raptor", -- [1]
			"Atal'Dazar", -- [2]
		},
		[121400] = {
			"Accusator Gnazh", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[161746] = {
			"Ossirat", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[126190] = {
			"Zian-Ti Brutalizer", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[133738] = {
			"Astralite Visara", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[134617] = {
			"Krolusk Hatchling", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[53121] = {
			"Flamewaker Cauterizer", -- [1]
			"Firelands", -- [2]
		},
		[59520] = {
			"Fizzy Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[140248] = {
			"Moonchaser the Swift", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[136665] = {
			"Ashvane Spotter", -- [1]
			"Tol Dagor", -- [2]
		},
		[136295] = {
			"Sunken Denizen", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[142949] = {
			"Theramore Citizen", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[17799] = {
			"Dreghood Slave", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[10981] = {
			"Loup", -- [1]
			"Eye of the Storm", -- [2]
		},
		[98363] = {
			"Grasping Tentacle", -- [1]
			"Maw of Souls", -- [2]
		},
		[135642] = {
			"Duskcoat Tiger Cub", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140249] = {
			"Slatehide", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[140390] = {
			"Onyx Bilefeaster", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[43430] = {
			"Stonecore Berserker", -- [1]
			"The Stonecore", -- [2]
		},
		[85241] = {
			"Night-Twisted Brute", -- [1]
			"Highmaul", -- [2]
		},
		[52498] = {
			"Beth'tilac", -- [1]
			"Firelands", -- [2]
		},
		[44932] = {
			"Oathsworn Pathfinder", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[104247] = {
			"Duskwatch Arcanist", -- [1]
			"Court of Stars", -- [2]
		},
		[147928] = {
			"Geoscatter", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140250] = {
			"Pinegraze Stag", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[159321] = {
			"Khateph", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[61345] = {
			"Mogu Archer", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[80400] = {
			"Iron Assembly Warden", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[138845] = {
			"Commander Jo'vak", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[146905] = {
			"Deranged Plaguefiend", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[167892] = {
			"Tormented Soul", -- [1]
			"Halls of Atonement", -- [2]
		},
		[129788] = {
			"Irontide Bonesaw", -- [1]
			"Freehold", -- [2]
		},
		[96759] = {
			"Helya", -- [1]
			"Maw of Souls", -- [2]
		},
		[131677] = {
			"Heartsbane Runeweaver", -- [1]
			"Waycrest Manor", -- [2]
		},
		[76796] = {
			"Heavy Spear", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[53794] = {
			"Smouldering Hatchling", -- [1]
			"Firelands", -- [2]
		},
		[151127] = {
			"Lord of Torment", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[146906] = {
			"Festering Hulk", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[131675] = {
			"Sandskitter Crab", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[59521] = {
			"Bubbling Brew Alemental", -- [1]
			"Stormstout Brewery", -- [2]
		},
		[148442] = {
			"Gnomish Commando", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138841] = {
			"Zara'thik Battlesinger", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[145371] = {
			"Uu'nat", -- [1]
			"Crucible of Storms", -- [2]
		},
		[158168] = {
			"Dark Disciple", -- [1]
			"Halls of Origination", -- [2]
		},
		[135258] = {
			"Irontide Marauder", -- [1]
			"Siege of Boralus", -- [2]
		},
		[146907] = {
			"Risen Marksman", -- [1]
			"8.1 Darkshore Scenario", -- [2]
		},
		[138838] = {
			"Zara'thik Mantid", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[135646] = {
			"Bloodstripe the Render", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[12101] = {
			"Lava Surger", -- [1]
			"Molten Core", -- [2]
		},
		[56706] = {
			"Krik'thik Bombardier", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[145372] = {
			"Wild Mooncaller", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[72958] = {
			"Dragonmaw Tidal Shaman", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[126449] = {
			"Siltspitter", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[155098] = {
			"Rexxar", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[171990] = {
			"Unyielding Shield", -- [1]
			"Castle Nathria", -- [2]
		},
		[32904] = {
			"Dark Rune Commoner", -- [1]
			"Ulduar", -- [2]
		},
		[155216] = {
			"Faeleaf Warden", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[161241] = {
			"Voidweaver Mal'thir", -- [1]
			"The Underrot", -- [2]
		},
		[159312] = {
			"Living Blood", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[72249] = {
			"Galakras", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[71993] = {
			"Desperation Spawn", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[139347] = {
			"Berserker Gola", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[71481] = {
			"Embodied Sorrow", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[147933] = {
			"Geoactive Azershard", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[136160] = {
			"King Dazar", -- [1]
			"Kings' Rest", -- [2]
		},
		[134739] = {
			"Purification Construct", -- [1]
			"Kings' Rest", -- [2]
		},
		[164427] = {
			"Reanimated Warrior", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[158171] = {
			"Faceless Destroyer", -- [1]
			"Halls of Origination", -- [2]
		},
		[159308] = {
			"Zealous Adherent", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146910] = {
			"Fleshrot Plaguetalon", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[43014] = {
			"Imp", -- [1]
			"The Stonecore", -- [2]
		},
		[135649] = {
			"Clawflurry", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[173016] = {
			"Corpse Collector", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[161243] = {
			"Samh'rek, Beckoner of Chaos", -- [1]
			"The Underrot", -- [2]
		},
		[76087] = {
			"Defense Construct", -- [1]
			"Skyreach", -- [2]
		},
		[139342] = {
			"Icetusk Warrior", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[17800] = {
			"Coilfang Myrmidon", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[146911] = {
			"Fleshrot Blighthound", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[167898] = {
			"Manifestation of Pride", -- [1]
			"Halls of Atonement", -- [2]
		},
		[147935] = {
			"Azergem Crawler", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[138829] = {
			"Ingel the Cunning", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[161244] = {
			"Blood of the Corruptor", -- [1]
			"The Underrot", -- [2]
		},
		[102446] = {
			"Fel Lord Betrug", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[105720] = {
			"Understone Drudge", -- [1]
			"Neltharion's Lair", -- [2]
		},
		[126451] = {
			"Crushclaw", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[59778] = {
			"Krik'thik Striker", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[45062] = {
			"Oathsworn Scorpid Keeper", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[41095] = {
			"Twilight Drake", -- [1]
			"Grim Batol", -- [2]
		},
		[98810] = {
			"Wrathguard Bladelord", -- [1]
			"Black Rook Hold", -- [2]
		},
		[135247] = {
			"Varigg", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[141282] = {
			"Kul Tiran Footman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[22855] = {
			"Illidari Nightlord", -- [1]
			"Black Temple", -- [2]
		},
		[146401] = {
			"Darkscale Dig-Slave", -- [1]
			"Warfronts Darkshore - Horde", -- [2]
		},
		[157253] = {
			"Ka'zir", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139337] = {
			"Icetusk Blood-Drinker", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[71476] = {
			"Embodied Misery", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[68098] = {
			"Ashtongue Worker", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[71734] = {
			"Sha of Pride", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[141283] = {
			"Kul Tiran Halberd", -- [1]
			"Siege of Boralus", -- [2]
		},
		[133605] = {
			"Escaped Convict", -- [1]
			"Tol Dagor", -- [2]
		},
		[140358] = {
			"Sorrowcall", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[134629] = {
			"Scaled Krolusk Rider", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[155616] = {
			"Zanj'ir Brute", -- [1]
			"The Eternal Palace", -- [2]
		},
		[152033] = {
			"Inconspicuous Plant", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[140260] = {
			"Runehoof Courser", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[148962] = {
			"Ravenous Stalker", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[141284] = {
			"Kul Tiran Wavetender", -- [1]
			"Siege of Boralus", -- [2]
		},
		[138821] = {
			"Bloodwake Warmaiden", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[138309] = {
			"Nibnub", -- [1]
			"Un'gol Ruins (Islands 1)", -- [2]
		},
		[68151] = {
			"Essence of Order", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[140356] = {
			"Brightscale Hatchling", -- [1]
			"Molten Cay (Islands 6)", -- [2]
		},
		[164414] = {
			"Reanimated Mage", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[156641] = {
			"Enthralled Weaponsmith", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[140773] = {
			"Deepsea Tidecrusher", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[141285] = {
			"Kul Tiran Marksman", -- [1]
			"Siege of Boralus", -- [2]
		},
		[151613] = {
			"Anti-Personnel Squirrel", -- [1]
			"Operation: Mechagon", -- [2]
		},
		[14187] = {
			"Athramanis", -- [1]
			"Alterac Valley", -- [2]
		},
		[155706] = {
			"Yox'ith", -- [1]
			"Mogu'shan Scenario", -- [2]
		},
		[45063] = {
			"Bonesnapper Scorpid", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[156130] = {
			"Lesser Zoatroid", -- [1]
			"The Eternal Palace", -- [2]
		},
		[61699] = {
			"Sik'thik Amberwing", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[153059] = {
			"Aethanel", -- [1]
			"The Eternal Palace", -- [2]
		},
		[161335] = {
			"Void Horror", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[59545] = {
			"The Golden Beetle", -- [1]
			"Temple of the Jade Serpent", -- [2]
		},
		[158690] = {
			"Cultist Tormenter", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[144954] = {
			"Bloodgorger", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[155619] = {
			"Zanj'ir Honor Guard", -- [1]
			"The Eternal Palace", -- [2]
		},
		[156131] = {
			"Zanj'ir Myrmidon", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140263] = {
			"Runehoof Stag", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[153060] = {
			"Cyranus", -- [1]
			"The Eternal Palace", -- [2]
		},
		[99365] = {
			"Taintheart Stalker", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[59800] = {
			"Krik'thik Rager", -- [1]
			"Gate of the Setting Sun", -- [2]
		},
		[106787] = {
			"Bitterbrine Slave", -- [1]
			"Eye of Azshara", -- [2]
		},
		[140343] = {
			"Razorwing", -- [1]
			"Whispering Reef (Islands 10)", -- [2]
		},
		[149556] = {
			"Eternal Enforcer", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[156132] = {
			"Azsh'ari Witch", -- [1]
			"The Eternal Palace", -- [2]
		},
		[140264] = {
			"Runehoof Calf", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[161251] = {
			"Cultist Sycophant", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[68139] = {
			"Suffering Soul Fragment", -- [1]
			"Pursuing the Black Harvest", -- [2]
		},
		[103685] = {
			"Tichondrius", -- [1]
			"The Nighthold", -- [2]
		},
		[17801] = {
			"Coilfang Siren", -- [1]
			"Coilfang: The Steamvault", -- [2]
		},
		[163862] = {
			"Defender of Many Eyes", -- [1]
			"Plaguefall", -- [2]
		},
		[117269] = {
			"Kil'jaeden", -- [1]
			"Tomb of Sargeras", -- [2]
		},
		[156133] = {
			"Dreadcoil Hulk", -- [1]
			"The Eternal Palace", -- [2]
		},
		[129526] = {
			"Bilge Rat Swabby", -- [1]
			"Freehold", -- [2]
		},
		[140777] = {
			"Gemshard Colossus", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[44819] = {
			"Siamat", -- [1]
			"Lost City of the Tol'vir", -- [2]
		},
		[134137] = {
			"Temple Attendant", -- [1]
			"Shrine of the Storm", -- [2]
		},
		[77337] = {
			"Aknor Steelbringer", -- [1]
			"Blackrock Foundry", -- [2]
		},
		[60043] = {
			"Jade Guardian", -- [1]
			"Mogu'shan Vaults", -- [2]
		},
		[61444] = {
			"Ming the Cunning", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[100364] = {
			"Spirit of Vengeance", -- [1]
			"Vault of the Wardens", -- [2]
		},
		[127479] = {
			"The Sand Queen", -- [1]
			"Tol Dagor", -- [2]
		},
		[157158] = {
			"Cultist Slavedriver", -- [1]
			"Horrific Vision of Stormwind", -- [2]
		},
		[131587] = {
			"Bewitched Captain", -- [1]
			"Waycrest Manor", -- [2]
		},
		[159219] = {
			"Umbral Seer", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[146409] = {
			"Lady Jaina Proudmoore", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[64917] = {
			"Sra'thik Ambercaller", -- [1]
			"Heart of Fear", -- [2]
		},
		[129015] = {
			"Southsea Third Mate", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[139755] = {
			"First Mate McNally", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[140267] = {
			"Greathorn Uwanu", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[136684] = {
			"Wildhammer Flame-Binder", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[62980] = {
			"Imperial Vizier Zor'lok", -- [1]
			"Heart of Fear", -- [2]
		},
		[145898] = {
			"Anointed Disciple", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[138220] = {
			"Blighted Malice", -- [1]
			"Thros, The Blighted Lands", -- [2]
		},
		[102672] = {
			"Nythendra", -- [1]
			"The Emerald Nightmare", -- [2]
		},
		[102398] = {
			"Blazing Infernal", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[139756] = {
			"Cutthroat Sheila", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[127480] = {
			"Stinging Parasite", -- [1]
			"Tol Dagor", -- [2]
		},
		[153065] = {
			"Voidbound Ravager", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[147968] = {
			"Agitated Azerite", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[140846] = {
			"Impish Breeze", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[147948] = {
			"Coagulated Azerite", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[129548] = {
			"Blacktooth Brute", -- [1]
			"Freehold", -- [2]
		},
		[129016] = {
			"Southsea Musketeer", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[96512] = {
			"Archdruid Glaidalis", -- [1]
			"Darkheart Thicket", -- [2]
		},
		[168934] = {
			"Enraged Spirit", -- [1]
			"De Other Side", -- [2]
		},
		[144876] = {
			"Apetagonizer 3000", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[165414] = {
			"Depraved Obliterator", -- [1]
			"Halls of Atonement", -- [2]
		},
		[147498] = {
			"Prelate Jakit", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[153130] = {
			"Greater Void Elemental", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[53127] = {
			"Fire Scorpion", -- [1]
			"Firelands", -- [2]
		},
		[61445] = {
			"Haiyan the Unstoppable", -- [1]
			"Mogu'shan Palace", -- [2]
		},
		[86275] = {
			"Gorian Enforcer", -- [1]
			"Highmaul", -- [2]
		},
		[61701] = {
			"Sik'thik Warrior", -- [1]
			"Siege of Niuzao Temple", -- [2]
		},
		[53639] = {
			"Flamewaker Cauterizer", -- [1]
			"Firelands", -- [2]
		},
		[147495] = {
			"Rastari Enforcer", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[168962] = {
			"Reborn Phoenix", -- [1]
			"Castle Nathria", -- [2]
		},
		[160291] = {
			"Ashwalker Assassin", -- [1]
			"Ny'alotha, the Waking City", -- [2]
		},
		[139304] = {
			"Solid Snake", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[168992] = {
			"Risen Cultist", -- [1]
			"De Other Side", -- [2]
		},
		[139759] = {
			"Mutineer Jalia", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[129529] = {
			"Blacktooth Scrapper", -- [1]
			"Freehold", -- [2]
		},
		[136688] = {
			"Fanatical Driller", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[167967] = {
			"Sentient Oil", -- [1]
			"De Other Side", -- [2]
		},
		[140325] = {
			"Stonehusk Scarab", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[96028] = {
			"Wrath of Azshara", -- [1]
			"Eye of Azshara", -- [2]
		},
		[169458] = {
			"Hecutis", -- [1]
			"Castle Nathria", -- [2]
		},
		[102400] = {
			"Eredar Shadow Mender", -- [1]
			"Assault on Violet Hold", -- [2]
		},
		[139760] = {
			"Head Navigator Franklin", -- [1]
			"The Dread Chain (Islands 4)", -- [2]
		},
		[127482] = {
			"Sewer Vicejaw", -- [1]
			"Tol Dagor", -- [2]
		},
		[139811] = {
			"Venture Sub-Lead", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[167964] = {
			"4.RF-4.RF", -- [1]
			"De Other Side", -- [2]
		},
		[137713] = {
			"Big Money Crab", -- [1]
			"The MOTHERLODE!!", -- [2]
		},
		[6500] = {
			"PiouPiou", -- [1]
			"Eye of the Storm", -- [2]
		},
		[132644] = {
			"Wolf Pup", -- [1]
			"Warfronts Arathi - Horde", -- [2]
		},
		[147439] = {
			"Molten Hound", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[139761] = {
			"Deckmaster O'Rourke", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[140273] = {
			"Runehoof Denkeeper", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[129786] = {
			"Brineshell Makrura", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[129553] = {
			"Dinomancer Kish'o", -- [1]
			"Atal'Dazar", -- [2]
		},
		[170474] = {
			"Brood Assassin", -- [1]
			"Plaguefall", -- [2]
		},
		[139807] = {
			"Venture Surveyor", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[53128] = {
			"Giant Fire Scorpion", -- [1]
			"Firelands", -- [2]
		},
		[147440] = {
			"Blazing Fireguard", -- [1]
			"Battle of Dazar'alor", -- [2]
		},
		[156142] = {
			"Seeker of Souls", -- [1]
			"Torghast, Tower of the Damned", -- [2]
		},
		[174100] = {
			"Nathrian Singuard", -- [1]
			"Castle Nathria", -- [2]
		},
		[53640] = {
			"Flamewaker Sentinel", -- [1]
			"Firelands", -- [2]
		},
		[33293] = {
			"XT-002 Deconstructor", -- [1]
			"Ulduar", -- [2]
		},
		[162326] = {
			"Priest", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[162325] = {
			"Warrior", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[167404] = {
			"Dauntless Champion", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[100354] = {
			"Grasping Tentacle", -- [1]
			"Maw of Souls", -- [2]
		},
		[156143] = {
			"Voidcrazed Hulk", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[168446] = {
			"Skeletal Monstrosity", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[165357] = {
			"Pestilence Slime", -- [1]
			"Plaguefall", -- [2]
		},
		[137204] = {
			"Hoodoo Hexer", -- [1]
			"Temple of Sethraliss", -- [2]
		},
		[54920] = {
			"Infinite Suppressor", -- [1]
			"End Time", -- [2]
		},
		[135192] = {
			"Honored Raptor", -- [1]
			"Kings' Rest", -- [2]
		},
		[171500] = {
			"Shuffling Corpse", -- [1]
			"The Necrotic Wake", -- [2]
		},
		[155657] = {
			"Huffer", -- [1]
			"Horrific Vision of Orgrimmar", -- [2]
		},
		[162318] = {
			"Monk", -- [1]
			"Vision of Ysera Scenario", -- [2]
		},
		[127484] = {
			"Jes Howlis", -- [1]
			"Tol Dagor", -- [2]
		},
		[130301] = {
			"Shadow Hunter Ju'loa", -- [1]
			"Verdant Wilds (Islands 8)", -- [2]
		},
		[164343] = {
			"Mawsworn Debilitator", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[164348] = {
			"Wandering Shade", -- [1]
			"Ardenweald Covenant Chapter 2 Scenario", -- [2]
		},
		[142324] = {
			"Bluefin Dolphin", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[167406] = {
			"Sire Denathrius", -- [1]
			"Castle Nathria", -- [2]
		},
		[147965] = {
			"Volatile Azerite", -- [1]
			"Skittering Hollow (Islands 5)", -- [2]
		},
		[147955] = {
			"Georb", -- [1]
			"The Rotting Mire (Islands 9)", -- [2]
		},
		[168942] = {
			"Death Speaker", -- [1]
			"De Other Side", -- [2]
		},
		[64902] = {
			"Kor'thik Fleshrender", -- [1]
			"Heart of Fear", -- [2]
		},
		[140298] = {
			"Gol'kun the Vicious", -- [1]
			"Crestfall (Islands 11)", -- [2]
		},
		[126205] = {
			"Profit-O-Matic", -- [1]
			"Jorundall (Islands 7)", -- [2]
		},
		[73226] = {
			"Lesser Sha Puddle", -- [1]
			"Siege of Orgrimmar", -- [2]
		},
		[12264] = {
			"Shazzrah", -- [1]
			"Molten Core", -- [2]
		},
	},
	["aura_grow_direction"] = 1,
	["indicator_anchor"] = {
		["x"] = 0,
	},
	["health_selection_overlay_alpha"] = 0.199999988079071,
	["minor_height_scale"] = 0.9999999403953552,
	["aura_padding"] = 0.7999999523162842,
	["last_news_time"] = 1550158598,
	["cast_statusbar_fadeout_time"] = 0.3999999761581421,
	["aura_stack_size"] = 9,
	["aura_height2"] = 14,
	["aura_show_crowdcontrol"] = true,
	["health_cutoff"] = false,
	["aura_border_colors"] = {
		["enrage"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["steal_or_purge"] = {
			0.2784313725490196, -- [1]
			0.9215686274509803, -- [2]
			0.9803921568627451, -- [3]
		},
		["crowdcontrol"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["offensive"] = {
			nil, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["is_show_all"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["defensive"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
		},
		["is_buff"] = {
			nil, -- [1]
			0, -- [2]
			0, -- [3]
		},
	},
	["ui_parent_cast_strata"] = "DIALOG",
	["hook_data_trash"] = {
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local name = unitFrame.healthBar.unitName:GetText()\n    \n    if (name) then\n        unitFrame.healthBar.unitName:SetText(name:gsub('(%S+) ',function(t) return t:sub(1,1)..'.' end))\n    end\nend\n\n\n\n\n\n\n\n",
			},
			["__TrashAt"] = 1604708911,
			["Time"] = 1604708792,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["race"] = {
				},
			},
			["url"] = "https://wago.io/Rcm39UnZV/2",
			["Icon"] = "INTERFACE\\ICONS\\Ability_Spy",
			["Enabled"] = true,
			["Revision"] = 433,
			["semver"] = "1.0.1",
			["Author"] = "Zenshoes-Area 52",
			["Desc"] = "Abbreviates names on nameplates",
			["Prio"] = 99,
			["Name"] = "Abbreviated Names",
			["PlaterCore"] = 1,
			["version"] = 2,
			["HooksTemp"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local name = unitFrame.healthBar.unitName:GetText()\n    \n    if (name) then\n        unitFrame.healthBar.unitName:SetText(name:gsub('(%S+) ',function(t) return t:sub(1,1)..'.' end))\n    end\nend\n\n\n\n\n\n\n\n",
			},
			["Options"] = {
			},
		}, -- [1]
	},
	["script_auto_imported"] = {
		["Unit - Important"] = 10,
		["Aura - Buff Alert"] = 10,
		["Cast - Very Important"] = 10,
		["Explosion Affix M+"] = 10,
		["Aura - Debuff Alert"] = 10,
		["Cast - Ultra Important"] = 10,
		["Cast - Big Alert"] = 10,
		["Cast - Small Alert"] = 10,
		["Aura - Invalidate Unit"] = 1,
		["Color Change"] = 1,
		["Unit - Show Energy"] = 10,
		["Unit - Main Target"] = 10,
		["Aura - Blink Time Left"] = 10,
		["Aura Border Color"] = 1,
		["Countdown"] = 10,
		["Unit Power"] = 1,
		["Cast - Frontal Cone"] = 10,
		["Fixate"] = 10,
		["Cast - Tank Interrupt"] = 10,
		["Unit - Health Markers"] = 10,
		["Auto Set Skull"] = 10,
		["Fixate On You"] = 10,
	},
	["extra_icon_anchor"] = {
		["x"] = 10.08999633789063,
		["side"] = 2,
	},
	["ui_parent_buff2_strata"] = "DIALOG",
	["range_check_alpha"] = 1,
	["aura_frame2_anchor"] = {
		["y"] = 30.95999145507813,
		["side"] = 3,
	},
	["aura_alpha"] = 1,
	["indicator_faction"] = false,
	["transparency_behavior"] = 3,
	["spell_animations"] = false,
	["aura_consolidate"] = true,
	["health_statusbar_texture"] = "Melli",
	["hook_auto_imported"] = {
		["Blockade Encounter"] = 1,
		["Reorder Nameplate"] = 4,
		["Dont Have Aura"] = 1,
		["Players Targetting Amount"] = 4,
		["Color Automation"] = 1,
		["Bwonsamdi Reaping"] = 1,
		["Execute Range"] = 1,
		["Jaina Encounter"] = 6,
		["Aura Reorder"] = 2,
		["Cast Bar Icon Config"] = 2,
		["Extra Border"] = 2,
		["Combo Points"] = 4,
		["Hide Neutral Units"] = 1,
		["Target Color"] = 3,
		["Attacking Specific Unit"] = 1,
		["Targetting Alpha"] = 3,
	},
	["minor_width_scale"] = 0.9999999403953552,
	["indicator_pet"] = false,
	["color_lerp_speed"] = 7,
	["aura_frame1_anchor"] = {
		["y"] = 6.849990844726563,
		["x"] = 0.8000030517578125,
		["side"] = 7,
	},
	["honor_blizzard_plate_alpha"] = true,
	["indicator_rare"] = false,
	["aura_height"] = 14,
	["non_targeted_alpha_enabled"] = true,
	["cast_statusbar_bgtexture"] = "Melli",
	["target_indicator"] = "Double Arrows",
	["saved_cvars"] = {
		["ShowNamePlateLoseAggroFlash"] = "1",
		["ShowClassColorInNameplate"] = "1",
		["nameplateOverlapV"] = "1.1",
		["nameplateLargeTopInset"] = "0.010867934674025",
		["nameplateShowEnemyMinus"] = "1",
		["nameplateSelfTopInset"] = "0.5",
		["nameplateMotionSpeed"] = "0.05",
		["nameplateShowSelf"] = "0",
		["nameplateShowFriendlyTotems"] = "0",
		["nameplateShowEnemyMinions"] = "1",
		["nameplateShowFriendlyPets"] = "0",
		["nameplateShowFriendlyNPCs"] = "0",
		["nameplateSelectedScale"] = "1.15",
		["nameplatePersonalShowInCombat"] = "1",
		["nameplatePersonalShowWithTarget"] = "0",
		["nameplateSelfAlpha"] = "1",
		["nameplateShowFriendlyMinions"] = "0",
		["nameplateResourceOnTarget"] = "0",
		["nameplateMotion"] = "1",
		["NamePlateHorizontalScale"] = "1",
		["nameplateMinScale"] = "1",
		["nameplateMaxDistance"] = "100",
		["nameplateOtherTopInset"] = "0.010867934674025",
		["nameplateSelfScale"] = "1",
		["nameplateSelfBottomInset"] = "0.2",
		["nameplateShowAll"] = "1",
		["nameplateShowFriendlyGuardians"] = "0",
		["nameplateOccludedAlphaMult"] = "0.4",
		["nameplatePersonalHideDelaySeconds"] = "0.2",
		["nameplatePersonalShowAlways"] = "0",
		["nameplateGlobalScale"] = "1",
		["NamePlateVerticalScale"] = "1",
	},
	["login_counter"] = 3979,
	["click_space_friendly"] = {
		50, -- [1]
		1, -- [2]
	},
	["aura_stack_font"] = "Naowh",
	["hide_friendly_castbars"] = true,
	["OptionsPanelDB"] = {
		["PlaterOptionsPanelFrame"] = {
			["scale"] = 1,
		},
	},
	["hover_highlight_alpha"] = 0.199999988079071,
	["plate_config"] = {
		["player"] = {
			["spellpercent_text_font"] = "10089",
			["level_text_size"] = 11,
			["cast"] = {
				115, -- [1]
				8, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["x"] = 2,
				["side"] = 5,
			},
			["big_actorname_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["level_text_font"] = "10089",
			["percent_text_color"] = {
				0.937254901960784, -- [1]
				0.976470588235294, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "10089",
			["big_actorname_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["mana_incombat"] = {
				100, -- [1]
				4, -- [2]
			},
			["all_names"] = true,
			["big_actortitle_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 12,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["big_actortitle_text_font"] = "10089",
			["spellpercent_text_size"] = 11,
			["big_actortitle_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["cast_incombat"] = {
				115, -- [1]
				8, -- [2]
			},
			["big_actorname_text_size"] = 10,
			["spellname_text_anchor"] = {
				["side"] = 3,
			},
			["big_actortitle_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["spellname_text_font"] = "10089",
			["big_actorname_text_outline"] = "OUTLINE",
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["mana"] = {
				100, -- [1]
				4, -- [2]
			},
			["big_actorname_text_font"] = "10089",
			["level_text_alpha"] = 1,
			["percent_text_size"] = 11,
			["percent_text_font"] = "10089",
			["big_actortitle_text_size"] = 10,
			["quest_enabled"] = true,
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.867896929383278, -- [4]
			},
			["spellname_text_size"] = 12,
			["health_incombat"] = {
				115, -- [1]
				15, -- [2]
			},
			["health"] = {
				115, -- [1]
				15, -- [2]
			},
			["power_percent_text_size"] = 8,
			["actorname_text_anchor"] = {
				["y"] = 1,
				["side"] = 1,
			},
			["actorname_text_size"] = 13,
			["level_text_enabled"] = true,
		},
		["friendlyplayer"] = {
			["big_actorname_text_size"] = 9,
			["spellpercent_text_font"] = "AvantGarde",
			["level_text_size"] = 9,
			["actorname_use_class_color"] = true,
			["cast"] = {
				50, -- [1]
				7, -- [2]
			},
			["fixed_class_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["spellpercent_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = 1.009994506835938,
			},
			["spellname_text_outline"] = "OUTLINE",
			["big_actorname_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["level_text_font"] = "AvantGarde",
			["percent_text_color"] = {
				0.937254901960784, -- [1]
				0.976470588235294, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["big_actorname_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["mana_incombat"] = {
				nil, -- [1]
				4, -- [2]
			},
			["all_names"] = true,
			["big_actortitle_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 6,
			["only_damaged"] = false,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["only_thename"] = true,
			["big_actortitle_text_font"] = "AvantGarde",
			["percent_text_ooc"] = true,
			["level_text_anchor"] = {
				["y"] = 2.519996643066406,
				["x"] = 1.489997863769531,
			},
			["big_actortitle_text_shadow_color_offset"] = {
				1, -- [1]
				-1, -- [2]
			},
			["cast_incombat"] = {
				105, -- [1]
				7, -- [2]
			},
			["spellname_text_size"] = 8,
			["actorname_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["spellname_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = -1.010002136230469,
				["side"] = 10,
			},
			["big_actortitle_text_shadow_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["percent_text_anchor"] = {
				["y"] = -0.4000015258789063,
				["x"] = 0.04000091552734375,
			},
			["spellname_text_font"] = "AvantGarde",
			["big_actorname_text_outline"] = "OUTLINE",
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.8700000047683716, -- [4]
			},
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["mana"] = {
				nil, -- [1]
				4, -- [2]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["spellpercent_text_size"] = 8,
			["big_actortitle_text_size"] = 9,
			["level_text_alpha"] = 1,
			["percent_text_size"] = 8,
			["percent_text_font"] = "AvantGarde",
			["buff_frame_y_offset"] = 0,
			["quest_enabled"] = true,
			["percent_text_enabled"] = true,
			["health_incombat"] = {
				120, -- [1]
				10, -- [2]
			},
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["actorname_text_size"] = 7,
			["actorname_text_anchor"] = {
				["y"] = 9.799995422363281,
				["x"] = -1.300003051757813,
				["side"] = 9,
			},
			["big_actorname_text_font"] = "AvantGarde",
			["spellpercent_text_enabled"] = true,
		},
		["friendlynpc"] = {
			["actorname_use_friends_color"] = true,
			["spellpercent_text_font"] = "Naowh",
			["actorname_friend_color"] = {
				0.71, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["level_text_size"] = 9,
			["actorname_use_class_color"] = false,
			["cast"] = {
				105, -- [1]
				6, -- [2]
			},
			["fixed_class_color"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
			},
			["spellpercent_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = 1.009994506835938,
			},
			["actorname_text_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0.8700000047683716, -- [4]
			},
			["percent_text_show_decimals"] = false,
			["spellname_text_outline"] = "OUTLINE",
			["click_through"] = true,
			["level_text_font"] = "Naowh",
			["percent_text_color"] = {
				0.937254901960784, -- [1]
				0.976470588235294, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["actorname_use_guild_color"] = true,
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 8,
			["only_damaged"] = false,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["only_thename"] = true,
			["big_actortitle_text_font"] = "Naowh",
			["spellpercent_text_size"] = 8,
			["level_text_anchor"] = {
				["y"] = 2.519996643066406,
				["x"] = 1.489997863769531,
			},
			["percent_text_enabled"] = true,
			["cast_incombat"] = {
				105, -- [1]
				6, -- [2]
			},
			["actorname_text_shadow_color"] = {
				nil, -- [1]
				nil, -- [2]
				nil, -- [3]
				0, -- [4]
			},
			["spellname_text_anchor"] = {
				["y"] = -7.980003356933594,
				["x"] = -1.010002136230469,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = 4.699996948242188,
				["x"] = -0.3600006103515625,
				["side"] = 5,
			},
			["castbar_offset"] = -0.9000015258789062,
			["spellname_text_font"] = "Naowh",
			["only_names"] = false,
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["actorname_text_size"] = 9,
			["power_percent_text_font"] = "Accidental Presidency",
			["show_guild_name"] = false,
			["actorname_text_anchor"] = {
				["y"] = 0.9000015258789062,
				["x"] = 0.6999969482421875,
				["side"] = 1,
			},
			["spellpercent_text_enabled"] = true,
			["percent_text_font"] = "Naowh",
			["actorname_guild_color"] = {
				0.498039, -- [1]
				1, -- [2]
				0.2, -- [3]
				1, -- [4]
			},
			["percent_text_ooc"] = true,
			["big_actortitle_text_size"] = 9,
			["spellname_text_size"] = 8,
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["enabled"] = false,
			["big_actorname_text_font"] = "Naowh",
			["level_text_alpha"] = 1,
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
		},
		["enemyplayer"] = {
			["castbar_offset"] = -0.9000015258789062,
			["spellpercent_text_font"] = "Naowh",
			["cast"] = {
				120, -- [1]
				14, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["y"] = 0.6699981689453125,
				["x"] = 0.0099945068359375,
			},
			["spellname_text_outline"] = "OUTLINE",
			["level_text_font"] = "Naowh",
			["percent_text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["all_names"] = true,
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 9,
			["quest_color_enemy"] = {
				1, -- [1]
				0.369, -- [2]
				0, -- [3]
			},
			["big_actortitle_text_font"] = "Naowh",
			["spellpercent_text_size"] = 8,
			["level_text_anchor"] = {
				["y"] = 1.199996948242188,
				["x"] = -1,
			},
			["cast_incombat"] = {
				nil, -- [1]
				14, -- [2]
			},
			["spellname_text_anchor"] = {
				["y"] = -0.9000015258789062,
				["x"] = 0.5,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = -3.700004577636719,
				["x"] = -1,
				["side"] = 7,
			},
			["spellname_text_font"] = "Naowh",
			["quest_color_neutral"] = {
				1, -- [1]
				0.65, -- [2]
				0, -- [3]
			},
			["actorname_text_size"] = 10,
			["big_actorname_text_font"] = "Naowh",
			["percent_text_show_decimals"] = false,
			["level_text_outline"] = "OUTLINE",
			["level_text_alpha"] = 1,
			["spellpercent_text_enabled"] = false,
			["big_actortitle_text_size"] = 9,
			["percent_text_font"] = "Naowh",
			["quest_enabled"] = true,
			["spellname_text_size"] = 9,
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["power_percent_text_font"] = "Accidental Presidency",
			["actorname_text_anchor"] = {
				["y"] = -3.800003051757813,
				["x"] = 2,
				["side"] = 1,
			},
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
			["percent_show_health"] = false,
			["level_text_enabled"] = false,
		},
		["enemynpc"] = {
			["castbar_offset"] = -0.9000015258789062,
			["spellpercent_text_font"] = "Naowh",
			["level_text_size"] = 10,
			["cast"] = {
				120, -- [1]
				14, -- [2]
			},
			["spellpercent_text_anchor"] = {
				["y"] = 0.6699981689453125,
				["x"] = 0.0099945068359375,
			},
			["percent_text_show_decimals"] = false,
			["level_text_font"] = "Naowh",
			["percent_text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["actorname_text_font"] = "Naowh",
			["actorname_text_outline"] = "OUTLINE",
			["actorname_text_spacing"] = 9,
			["big_actortitle_text_font"] = "Naowh",
			["level_text_anchor"] = {
				["y"] = 1.199996948242188,
				["x"] = -1,
			},
			["spellname_text_anchor"] = {
				["y"] = -0.9000015258789062,
				["x"] = 0.5,
				["side"] = 10,
			},
			["percent_text_anchor"] = {
				["y"] = -3.700004577636719,
				["x"] = -1,
				["side"] = 7,
			},
			["spellname_text_font"] = "Naowh",
			["actorname_text_size"] = 10,
			["big_actorname_text_size"] = 9,
			["power_percent_text_font"] = "Accidental Presidency",
			["spellpercent_text_size"] = 8,
			["level_text_outline"] = "OUTLINE",
			["big_actortitle_text_size"] = 9,
			["level_text_alpha"] = 1,
			["spellpercent_text_enabled"] = false,
			["percent_text_font"] = "Naowh",
			["spellname_text_size"] = 9,
			["health"] = {
				120, -- [1]
				10, -- [2]
			},
			["big_actorname_text_font"] = "Naowh",
			["actorname_text_anchor"] = {
				["y"] = -3.800003051757813,
				["x"] = 2,
				["side"] = 1,
			},
			["health_incombat"] = {
				nil, -- [1]
				10, -- [2]
			},
			["percent_show_health"] = false,
			["level_text_enabled"] = false,
		},
	},
	["aura_y_offset"] = 6.849990844726563,
	["indicator_elite"] = false,
	["aura_width_personal"] = 23,
	["border_color"] = {
		nil, -- [1]
		nil, -- [2]
		nil, -- [3]
		1, -- [4]
	},
	["npc_colors"] = {
		[173044] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168393] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[172981] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167536] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164266] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167965] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168886] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[170490] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[167998] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163458] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168681] = {
			false, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168443] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165919] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165824] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[146409] = {
			false, -- [1]
			false, -- [2]
			"darkgreen", -- [3]
		},
		[168396] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163459] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[166396] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163618] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[174175] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167111] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162047] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[170572] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168572] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166302] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164921] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[167493] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168446] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[165414] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165430] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[173447] = {
			true, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[162744] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162049] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164506] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[168318] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164510] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168717] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[164557] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[174210] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[167876] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163520] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167607] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[169861] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163619] = {
			true, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[168718] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164414] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[160495] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[172265] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163128] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163620] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165872] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163862] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165222] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[166275] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[171799] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[169905] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163157] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168418] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168942] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165529] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[163894] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[174197] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164562] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[155433] = {
			false, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[169927] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[167533] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166276] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168578] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162038] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162689] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[161895] = {
			true, -- [1]
			false, -- [2]
			"magenta", -- [3]
		},
		[155434] = {
			false, -- [1]
			false, -- [2]
			"violet", -- [3]
		},
		[168658] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168420] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[170690] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163086] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[168357] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168992] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[168627] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162039] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162317] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163524] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[170850] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162103] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[170882] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164929] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[167612] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[162040] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[162691] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[171343] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165197] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[163882] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[146753] = {
			false, -- [1]
			false, -- [2]
			"blue", -- [3]
		},
		[165946] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[173016] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[169893] = {
			true, -- [1]
			false, -- [2]
			"mediumslateblue", -- [3]
		},
		[162692] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166589] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[165137] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163121] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[171376] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[163126] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[164185] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[135246] = {
			false, -- [1]
			false, -- [2]
			"white", -- [3]
		},
		[163891] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[165076] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
		[148120] = {
			false, -- [1]
			false, -- [2]
			"blue", -- [3]
		},
		[163621] = {
			true, -- [1]
			false, -- [2]
			"deepskyblue", -- [3]
		},
		[166299] = {
			true, -- [1]
			false, -- [2]
			"aqua", -- [3]
		},
	},
	["transparency_behavior_on_friendlies"] = true,
	["hook_data"] = {
		{
			["Enabled"] = true,
			["Revision"] = 232,
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Kastfall-Azralon",
			["Name"] = "Attacking Specific Unit [Plater]",
			["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1601121216,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Nameplate Updated",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["role"] = {
				},
			},
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
			["Options"] = {
			},
		}, -- [1]
		{
			["Enabled"] = true,
			["Revision"] = 53,
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Ditador-Azralon",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["race"] = {
				},
			},
			["Desc"] = "Change the color of the aura timer by it's time left",
			["Hooks"] = {
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    envTable.Alpha = {\n        critical = 1,\n        warning = 0.8,\n        okay = 0.7,\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Name"] = "Paint Aura Timers",
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Nameplate Updated",
			["Time"] = 1599766452,
			["Icon"] = "Interface\\Timer\\Challenges-Logo",
			["Options"] = {
			},
		}, -- [2]
		{
			["Enabled"] = true,
			["Revision"] = 65,
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Izimode-Azralon",
			["Name"] = "Change Prediction Color",
			["Desc"] = "Change the color for the heal absorb, heal prediction and shield amount indicators.",
			["Hooks"] = {
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --heal absorb\n    unitFrame.healthBar.healAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.HealAbsorbColor))\n    \n    --shield absorb\n    unitFrame.healthBar.shieldAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldsColor))\n    \n    --incoming heal\n    unitFrame.healthBar.incomingHealIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.IncomingHealColor))\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}           \n    \n    --make sure to enable the desired indicators at /plater options > Advanced tab > Show Heal/Shield Prediction\n    \n    --color when the heal absorb indicator\n    envTable.HealAbsorbColor = \"maroon\"\n    \n    --color of incoming heal indicator\n    envTable.IncomingHealColor = \"darkgreen\"\n    \n    --color of shield indicator\n    envTable.ShieldsColor = \"#C59000\"    \n    \nend\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1598973126,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["race"] = {
				},
			},
			["Icon"] = 1035048,
			["Options"] = {
			},
		}, -- [3]
		{
			["Enabled"] = true,
			["Revision"] = 64,
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Izimode-Azralon",
			["Name"] = "Cast Bar Border",
			["Desc"] = "Adds a pixels perfect border around the cast bar.",
			["Hooks"] = {
				["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder:Hide()\n    end    \nend",
				["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    \n    --hide the icon of the spell, may require /reload after changing\n    envTable.HideIcon = false\n    \n    --border settings\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    --update the border\n    function envTable.UpdateBorder (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.CastBarBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.CastBarBorder:SetBorderSizes (size, size, size, size)\n        castBar.CastBarBorder:UpdateSizes()        \n        \n        if (envTable.HideIcon) then\n            castBar.Icon:Hide()\n        end\n        \n        castBar.CastBarBorder:Show()\n    end\n    \n    --create thee border\n    if (not unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder = CreateFrame (\"frame\", nil, unitFrame.castBar, \"NamePlateFullBorderTemplate\")\n    end\n    \nend\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1599239638,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Constructor",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["role"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["Icon"] = 133004,
			["Options"] = {
			},
		}, -- [4]
		{
			["Enabled"] = true,
			["Revision"] = 52,
			["OptionsValues"] = {
			},
			["HooksTemp"] = {
			},
			["Author"] = "Izimode-Azralon",
			["Name"] = "Cast Icon Border",
			["Desc"] = "Adds a pixels perfect border around the cast bar spell icon.",
			["Hooks"] = {
				["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.castBar.IconOverlayFrame) then\n        unitFrame.castBar.IconOverlayFrame:Hide()\n    end\n    \nend\n\n\n\n\n",
				["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.AnchorSide = \"right\"\n    envTable.BorderThickness = 1\n    envTable.BorderColor = \"black\"\n    \n    --private\n    function envTable.BuildFrames (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.IconBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.IconBorder:SetBorderSizes (size, size, size, size)\n        castBar.IconBorder:UpdateSizes()\n        \n        local icon = castBar.Icon\n        if (envTable.AnchorSide == \"left\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\")\n            icon:SetPoint (\"bottomright\", castBar, \"bottomleft\")\n            icon:SetWidth (icon:GetHeight())\n            \n        elseif (envTable.AnchorSide == \"right\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\")\n            icon:SetPoint (\"bottomleft\", castBar, \"bottomright\")\n            icon:SetWidth (icon:GetHeight())\n            \n        end\n        \n        icon:Show()\n        castBar.IconOverlayFrame:Show()\n    end\n    \n    if (not unitFrame.castBar.IconOverlayFrame) then\n        --icon support frame\n        unitFrame.castBar.IconOverlayFrame = CreateFrame (\"frame\", nil, unitFrame.castBar)\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"topleft\", unitFrame.castBar.Icon, \"topleft\")\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"bottomright\", unitFrame.castBar.Icon, \"bottomright\")\n        \n        unitFrame.castBar.IconBorder = CreateFrame (\"frame\", nil,  unitFrame.castBar.IconOverlayFrame, \"NamePlateFullBorderTemplate\")\n    end    \n    \nend\n\n\n\n\n",
			},
			["Prio"] = 99,
			["Time"] = 1599239648,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Constructor",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["role"] = {
				},
			},
			["Icon"] = 133004,
			["Options"] = {
			},
		}, -- [5]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateRaidMark (unitFrame, unitId)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --normal Marker\n    envTable.Size = 18\n    envTable.Anchor = {\n        side = 8, -- Right side\n        x = -2, \n        y = 0,\n    }\n    \n    --Name only Marker\n    envTable.SpecialSize = 22\n    envTable.SpecialAnchor = {\n        side = 8, -- Right side\n        x = -2, \n        y = 2,\n    }\n    \n    envTable.UpdateRaidMark = function (unitFrame, unitId)\n        local plateFrame = C_NamePlate.GetNamePlateForUnit (unitId)\n        local marker = plateFrame.unitFrame.PlaterRaidTargetFrame\n        if marker then\n            if plateFrame.IsFriendlyPlayerWithoutHealthBar or\n            plateFrame.IsNpcWithoutHealthBar then\n                marker:SetSize (envTable.SpecialSize, envTable.SpecialSize)\n                Plater.SetAnchor (marker, envTable.SpecialAnchor, unitFrame.ActorNameSpecial)\n            else\n                --marker:SetSize (envTable.Size, envTable.Size)\n                --Plater.SetAnchor (marker, envTable.Anchor, unitFrame.unitName)\n            end\n        end\n    end\n    \nend",
			},
			["Time"] = 1604708800,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["race"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["url"] = "",
			["Icon"] = 878218,
			["Enabled"] = true,
			["Revision"] = 650,
			["semver"] = "",
			["Author"] = "호불-아즈샤라",
			["Desc"] = "Raidmark in the Unitname",
			["Prio"] = 99,
			["Name"] = "Raidmark in the Unitname",
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["HooksTemp"] = {
			},
			["version"] = -1,
		}, -- [6]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "Player Logon",
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable, modTable)\n    --insert code here\n    \nend",
				["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    --insert code here\n    \nend",
				["Initialization"] = "function (modTable)\n    --insert code here\n    \nend",
				["Player Logon"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- /RELOAD AFTER IMPORTING OR CHANGING THE SCRIPT\n    -- SELECT THE INDICATOR AT THE TARGET TAB\n    \n    Plater.TargetIndicators    [\"Double Arrows\"] = {\n        path = [[Interface\\Addons\\SharedMedia_MyMedia\\background\\arrow_glow.tga]],\n        coords = {\n            {0, 1, 0, 1}, \n            {1, 0, 0, 1}\n        },\n        desaturated = false,\n        width = 18,\n        height = 16,\n        x = 16,\n        y = 0,\n        blend = \"ADD\",\n        color = \"#ffffff\",\n    }    \n    \nend",
			},
			["Time"] = 1599778603,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["affix"] = {
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["url"] = "https://wago.io/4zFNU4AvR/1",
			["Icon"] = 236174,
			["Enabled"] = true,
			["Revision"] = 146,
			["semver"] = "1.0.0",
			["Author"] = "�r��ne-Kel'thuzad",
			["Desc"] = "Adds double arrow as a target indicators option",
			["Prio"] = 99,
			["Name"] = "Naowh Arrow Target",
			["PlaterCore"] = 1,
			["Options"] = {
				{
					["Type"] = 1,
					["Key"] = "option1",
					["Value"] = {
						0.3882352941176471, -- [1]
						0.8313725490196078, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["Name"] = "Option 1",
					["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
					["Desc"] = "",
				}, -- [1]
			},
			["HooksTemp"] = {
			},
			["version"] = 1,
		}, -- [7]
		{
			["Enabled"] = true,
			["Revision"] = 53,
			["semver"] = "1.0.1",
			["HooksTemp"] = {
			},
			["Name"] = "Cast Target on Spell Name",
			["Author"] = "Izimode-Azralon",
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["role"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["Desc"] = "Show the cast target name with the spell name",
			["Hooks"] = {
				["Cast Update"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n",
				["Cast Start"] = "function (self, unitId, unitFrame, envTable, modTable)\n    envTable.UpdateCastBarName(unitId, unitFrame.castBar)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --percent of total cast bar size, default: 60% spell name\n    local spellNameSize = 0.60\n    \n    --update function\n    function envTable.UpdateCastBarName(unitId, castBar)\n        --do nothing if interrupted\n        if castBar.IsInterrupted then\n            return\n            \n        end\n        \n        --get the target's unitId \n        local targetUnitId = unitId .. \"target\"\n        \n        --does the unit exists?\n        if (UnitExists(targetUnitId)) then\n            \n            --get the target name\n            local targetName = UnitName(targetUnitId)\n            \n            --does the target name exists?\n            if (targetName) then\n                --get the current spell name\n                local spellName = castBar.SpellName\n                --reset the text in the cast bar\n                castBar.Text:SetText(spellName)\n                \n                --paint the target name with the player's class color\n                local targetNameByColor = Plater.SetTextColorByClass (targetUnitId, targetName)\n                \n                --castbar width\n                local castBarWidth = castBar:GetWidth()\n                DetailsFramework:TruncateText (castBar.Text, castBarWidth * spellNameSize)\n                \n                --set the new text in the castbar spell name fontstring\n                local currentText = castBar.Text:GetText()\n                castBar.Text:SetText(currentText .. \" [\" .. targetNameByColor .. \"]\")\n                DetailsFramework:TruncateText (castBar.Text, castBarWidth)                \n            end\n        end\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
			},
			["Prio"] = 99,
			["version"] = 2,
			["PlaterCore"] = 1,
			["LastHookEdited"] = "Constructor",
			["url"] = "https://wago.io/pj8kSlqkK/2",
			["Icon"] = 2126355,
			["Time"] = 1599246501,
		}, -- [8]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "Constructor",
			["Hooks"] = {
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CheckAggro (unitFrame)\nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CheckAggro (unitFrame)\nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    function envTable.CheckAggro (unitFrame)\n        --if the player isn't in combat, ignore this check\n        if (not Plater.IsInCombat()) then\n            return\n        end\n        \n        --if this unit isn't in combat, ignore\n        if (not unitFrame.InCombat) then\n            return \n        end\n        \n        --player is a tank?\n        if (Plater.PlayerIsTank) then\n            --player isn't tanking this unit?\n            if (not unitFrame.namePlateThreatIsTanking) then\n                --check if a second tank is tanking it\n                if (Plater.ZoneInstanceType == \"raid\") then\n                    --return a list with the name of tanks in the raid\n                    local tankPlayersInTheRaid = Plater.GetTanks()\n                    \n                    --get the target name of this unit\n                    local unitTargetName = UnitName (unitFrame.targetUnitID)\n                    \n                    --check if the unit isn't targeting another tank in the raid and paint the color\n                    if (not tankPlayersInTheRaid [unitTargetName]) then\n                        Plater.SetNameplateColor (unitFrame, Plater.db.profile.tank.colors.noaggro)\n                    else\n                        --another tank is tanking this unit\n                        --do nothing\n                    end\n                    \n                else\n                    Plater.SetNameplateColor (unitFrame, Plater.db.profile.tank.colors.noaggro)\n                end\n            end\n            \n        else\n            --player is a dps or healer\n            if (unitFrame.namePlateThreatIsTanking) then\n                Plater.SetNameplateColor (unitFrame, Plater.db.profile.dps.colors.aggro)\n            end\n            \n        end        \n    end\nend\n\n\n\n\n\n\n",
			},
			["Time"] = 1600692026,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["role"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["url"] = "https://wago.io/id_wRWfKp/2",
			["Icon"] = "Interface\\AddOns\\Plater\\media\\checked_64",
			["Enabled"] = true,
			["Revision"] = 29,
			["Options"] = {
			},
			["Author"] = "Kastfall-Azralon",
			["Desc"] = "When a mob is attacking you, force show the threat color. For tanks, force threat color if the mob is not attacking you.",
			["Prio"] = 99,
			["version"] = 2,
			["PlaterCore"] = 1,
			["Name"] = "Force Threat Color",
			["HooksTemp"] = {
			},
			["semver"] = "1.0.1",
		}, -- [9]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    local mark = unitId and GetRaidTargetIndex(unitId)\n    envTable.namer(unitId, mark, true, false, false, \"Created\")\n    \nend",
				["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    -- Catch all \n    envTable.namer(unitId, GetRaidTargetIndex(unitId), true, false, false, \"Updated\")\n    \nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    envTable.namer(unitId, GetRaidTargetIndex(unitId), true, false, false, \"Added\")\n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    -- used for nameColouring\n    -- AARRGGBB\n    local markerToHex = {\n        [1] = \"FFEAEA0D\", -- Yellow 5 Point Star\n        [2] = \"FFEAB10D\", -- Orange Circle\n        [3] = \"FFCD00FF\", -- Purple Diamond\n        [4] = \"FF06D425\", -- Green Triangle\n        [5] = \"FFB3E3D8\", -- Light Blue Moon\n        [6] = \"FF0CD2EA\", -- Blue Square\n        [7] = \"FFD6210B\", -- Red Cross\n        [8] = \"FFFFFFFF\", -- White Skull\n    }\n    \n    -- Makes it so you take their first name e.g Jessie Howlis -> Jessie\n    -- Old way was some degen fucking shit this is easier\n    local nameBlacklist = {\n        [\"the\"] = true,\n        [\"of\"] = true,\n        [\"Tentacle\"] = true,\n        [\"Apprentice\"] = true,  \n        [\"Denizen\"] = true,\n        [\"Emissary\"] = true,\n        [\"Howlis\"] = true, \n        [\"Terror\"] = true, \n        [\"Totem\"] = true, \n        [\"Waycrest\"] = true,\n        [\"Dummy\"] = true, -- Testing Purposes\n        [\"Aspect\"] = true\n    }\n    \n    \n    -- Override for names, Thanks to Nnoggie for all of the dungeon ones\n    local renameTable = {\n        -- Testing\n        [\"Fleshripper Vulture\"] = \"Shit Bird\",\n        [\"Roaming Nibbler\"] = \"Roaming Saurid\",\n        -- Grand Delusions\n        [\"Thing From Beyond\"] = \"Ion Hazzikostas\",\n        -- Plaguefall\n        [\"Plagueroc\"] = \"Plaguecock\",\n        [\"Doctor Ickus\"] = \"Dickus\",\n        -- Sanguine Depths\n        [\"Animated Weapon\"] = \"Assclapper\",\n        [\"Kryxis the Voracious\"] = \"Steroid Stomper\",\n        [\"Frenzied Ghoul\"] = \"Death\",\n        [\"General Kaal\"] = \"Daddy Kaal\",\n        -- Mists of Tirna Scithe\n        [\"Droman Oulfarran\"] = \"Simp Tree\",\n        [\"Mistcaller\"] = \"Lady UwU\",\n        [\"Tred'ova\"] = \"Tred'killya\",\n        \n    }\n    \n    \n    \n    -- @unitId  unitID for mob e.g nameplate1\n    -- @marker Raid Target ID\n    -- @nameColouring Enables text to be coloured by raid marker \n    -- @isBoss Boolean for enabling this on boss mobs, Do i want this?? no idea\n    -- @debugMode Test mode for using dummy's\n    -- @debugEntry Which hook it came from\n    function envTable.namer(unitId, marker, nameColouring, isBoss, debugMode, debugEntry)\n        if unitId then\n            \n            local name = UnitName(unitId)\n            local a, b, c, d, e, f = strsplit(' ', name, 5)\n            local unitName\n            -- Testing mode\n            if debugMode then\n                print(\"DebugMode: \"..debugEntry..\" - Checking for dummy name\")\n                if b == \"Dummy\" or c == \"Dummy\" or d == \"Dummy\" or e == \"Dummy\" or f == \"Dummy\" then\n                    local lastName = b:find(\"Dummy\") and b or c:find(\"Dummy\") and c or d:find(\"Dummy\") and d\n                    print(\"DebugMode: \"..debugEntry..\" - Dummy Found!\")\n                    unitName = name ~=nil and lastName\n                end\n            end\n            \n            \n            if nameBlacklist[b] then\n                unitName = name ~=nil and (a or b or c or d or e or f) or nil\n            else\n                unitName = name ~=nil and (f or e or d or c or b or a) or ni\n            end\n            \n            if unitId and marker == nil and nameColouring then\n                marker = 8\n            end\n            \n            \n            \n            if unitName == nil then\n                unitName = name\n            end\n            \n            \n            if renameTable[name] then\n                unitName = renameTable[name]\n            end\n            \n            if unitId and marker and nameColouring then\n                unitFrame.healthBar.unitName:SetText(WrapTextInColorCode(unitName, markerToHex[marker]))\n            elseif unitId then\n                unitFrame.healthBar.unitName:SetText(unitName)\n            end\n        end   \n    end\nend",
			},
			["Time"] = 1604708847,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
				},
				["map_ids"] = {
				},
				["race"] = {
				},
				["pvptalent"] = {
				},
				["role"] = {
				},
				["affix"] = {
				},
				["encounter_ids"] = {
				},
				["spec"] = {
				},
			},
			["url"] = "",
			["Icon"] = "INTERFACE\\ICONS\\Ability_Monk_Ascension",
			["Enabled"] = true,
			["Revision"] = 84,
			["semver"] = "",
			["Author"] = "Rhk-Tarren Mill",
			["Desc"] = "Aimed at making calls in dungeons simpler by using the last name of a mob or first name of certains ones i.e Jessie Howlis -> Jessie",
			["Name"] = "M+ Renamer",
			["PlaterCore"] = 1,
			["version"] = -1,
			["HooksTemp"] = {
			},
			["Options"] = {
			},
		}, -- [10]
		{
			["OptionsValues"] = {
			},
			["LastHookEdited"] = "",
			["Hooks"] = {
				["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
				["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
				["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
				["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
				["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
				["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
				["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
				["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {0/128, 21/128, 101/128, 122/128},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {3/128, 18/128, 81/128, 96/128},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = (namePlateWidth - sizes.width * comboPoints)  / comboPoints \n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                if i == 1 then\n                    comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace/2, 0)\n                else\n                    comboPoint:SetPoint (\"left\", envTable.ComboPoints[i-1], \"right\", reservedSpace, 0)\n                end\n                \n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
			},
			["Time"] = 1605128220,
			["LoadConditions"] = {
				["talent"] = {
				},
				["group"] = {
				},
				["class"] = {
					["Enabled"] = true,
					["DRUID"] = true,
					["ROGUE"] = true,
				},
				["map_ids"] = {
				},
				["role"] = {
				},
				["pvptalent"] = {
				},
				["spec"] = {
					["103"] = true,
					["Enabled"] = true,
				},
				["race"] = {
				},
				["encounter_ids"] = {
				},
				["affix"] = {
				},
			},
			["url"] = "",
			["Icon"] = 135426,
			["Enabled"] = false,
			["Revision"] = 255,
			["semver"] = "",
			["Author"] = "Izimode-Azralon",
			["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
			["Prio"] = 99,
			["Name"] = "Combo Points [Plater]",
			["PlaterCore"] = 1,
			["Options"] = {
			},
			["HooksTemp"] = {
			},
			["version"] = -1,
		}, -- [11]
	},
	["aura_width"] = 22,
	["health_statusbar_bgcolor"] = {
		0.1294117647058823, -- [1]
		0.1294117647058823, -- [2]
		0.1294117647058823, -- [3]
		1, -- [4]
	},
	["buff_frame_anchor_and_size_migrated"] = true,
	["pet_width_scale"] = 0.9999999403953552,
	["quick_hide"] = true,
	["target_highlight_color"] = {
		1, -- [1]
		1, -- [2]
	},
	["resources"] = {
		["y_offset_target"] = 20,
		["y_offset_target_withauras"] = 32,
	},
	["extra_icon_auras"] = {
		277242, -- [1]
	},
	["castbar_target_font"] = "Naowh",
	["ui_parent_cast_level"] = 1,
	["ui_parent_buff2_level"] = 1,
	["range_check_in_range_or_target_alpha_friendlies"] = 1,
	["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark4",
	["pet_height_scale"] = 0.9999999403953552,
	["aura_x_offset"] = 0.8000030517578125,
	["first_run3"] = true,
	["ui_parent_buff_strata"] = "DIALOG",
	["aura_stack_color"] = {
		nil, -- [1]
		0.945098039215686, -- [2]
		0.937254901960784, -- [3]
	},
	["ui_parent_buff_level"] = 1,
	["aura_width2"] = 22,
	["health_statusbar_bgtexture"] = "Melli",
	["indicator_raidmark_anchor"] = {
		["y"] = 2,
		["x"] = 0,
		["side"] = 9,
	},
	["range_check_alpha_friendlies"] = 1,
	["aura_show_enrage"] = true,
	["aura_tracker"] = {
		["buff_banned"] = {
			[269278] = true,
			[326450] = true,
			[226512] = true,
			[273984] = true,
			[322569] = true,
			[290027] = true,
			[210761] = true,
			[209153] = true,
			[283627] = true,
			[283108] = true,
			[268353] = true,
			[340702] = true,
			[312978] = true,
			[333737] = true,
			[333227] = true,
			[196555] = true,
			[321952] = true,
			[324736] = true,
			[290049] = true,
		},
		["debuff_banned"] = {
			[176219] = true,
			[270920] = true,
			[280287] = true,
			[125174] = true,
			[240196] = true,
			[287687] = true,
			[281242] = true,
			[255723] = true,
			[258406] = true,
			[88075] = true,
			[201431] = true,
			[288293] = true,
			[290357] = true,
			[226943] = true,
			[292485] = true,
			[235484] = true,
			[118905] = true,
			[288581] = true,
			[291058] = true,
			[299091] = true,
			[113746] = true,
			[283661] = true,
			[278232] = true,
			[328175] = true,
			[284678] = true,
			[135378] = true,
			[259870] = true,
			[81441] = true,
			[292649] = true,
			[190481] = true,
			[294895] = true,
			[127963] = true,
			[290110] = true,
			[175940] = true,
			[79092] = true,
			[268353] = true,
			[295953] = true,
			[294334] = true,
			[292224] = true,
			[340007] = true,
			[207167] = true,
			[197277] = true,
			[77505] = true,
			[127797] = true,
			[273984] = true,
			[262000] = true,
			[240029] = true,
			[107079] = true,
			[204301] = true,
			[280321] = true,
			[290432] = true,
			[281828] = true,
			[339137] = true,
			[292306] = true,
			[255958] = true,
			[216170] = true,
			[285290] = true,
			[208709] = true,
			[208714] = true,
			[288588] = true,
			[262304] = true,
			[38767] = true,
			[292164] = true,
			[292785] = true,
			[312978] = true,
			[278468] = true,
			[267195] = true,
			[251922] = true,
			[205202] = true,
			[102359] = true,
			[275996] = true,
			[264942] = true,
			[254415] = true,
			[50245] = true,
			[290438] = true,
			[285136] = true,
			[178072] = true,
			[289645] = true,
			[268341] = true,
			[99] = true,
			[247685] = true,
			[292156] = true,
			[248987] = true,
			[333526] = true,
			[273867] = true,
			[263073] = true,
			[328287] = true,
			[285266] = true,
			[251750] = true,
			[279869] = true,
			[177454] = true,
			[171153] = true,
			[295459] = true,
			[263672] = true,
			[145067] = true,
			[284379] = true,
			[290105] = true,
			[214429] = true,
			[295282] = true,
			[283618] = true,
			[259837] = true,
			[270474] = true,
			[295884] = true,
			[282476] = true,
			[213369] = true,
			[295240] = true,
			[264263] = true,
		},
		["debuff_tracked"] = {
			[336449] = true,
			[328175] = true,
			[321020] = true,
		},
		["buff_tracked"] = {
			[209859] = true,
			[331743] = true,
			[273432] = true,
			[321764] = true,
			[226512] = true,
			[265160] = true,
			[327808] = true,
			[333737] = true,
			[262092] = true,
			[328175] = true,
		},
	},
	["aura_timer_text_font"] = "Naowh",
	["cast_statusbar_color"] = {
		nil, -- [1]
		0.9333333333333333, -- [2]
		0.4313725490196079, -- [3]
		0.9600000008940697, -- [4]
	},
	["first_run2"] = true,
	["castbar_icon_show"] = false,
	["indicator_extra_raidmark"] = false,
	["castbar_framelevel"] = 0,
	["target_shady_combat_only"] = false,
	["ui_parent_base_strata"] = "DIALOG",
	["not_affecting_combat_alpha"] = 1,
	["target_highlight_alpha"] = 0.7999999523162842,
	["news_frame"] = {
		["PlaterNewsFrame"] = {
			["scale"] = 1,
		},
	},
	["auto_toggle_stacking_enabled"] = true,
	["aura_stack_anchor"] = {
		["y"] = -4.600000381469727,
	},
	["indicator_raidmark_scale"] = 0.9899999499320984,
	["target_shady_alpha"] = 0.5999999642372131,
	["cast_statusbar_spark_alpha"] = 0.7999999523162842,
	["aura_height_personal"] = 19,
	["health_selection_overlay"] = "Melli Dark",
	["target_highlight_height"] = 12,
	["cast_statusbar_bgcolor"] = {
		0.09803921568627451, -- [1]
		0.09803921568627451, -- [2]
		0.09803921568627451, -- [3]
		0.6088716983795166, -- [4]
	},
	["indicator_spec"] = false,
	["color_override_colors"] = {
		[3] = {
			0.996078431372549, -- [1]
			0.2980392156862745, -- [2]
			0.3098039215686275, -- [3]
		},
		[4] = {
			1, -- [1]
			0.9333333333333333, -- [2]
			0.4313725490196079, -- [3]
		},
		[5] = {
			0.3803921568627451, -- [1]
			0.8745098039215686, -- [2]
			0.2313725490196079, -- [3]
		},
	},
	["health_animation_time_dilatation"] = 1.059999942779541,
	["aura_cooldown_reverse"] = false,
	["patch_version"] = 13,
	["range_check_in_range_or_target_alpha"] = 1,
	["aura_timer_text_size"] = 9,
	["number_region_first_run"] = true,
	["script_data_trash"] = {
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["Time"] = 1596198403,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
			["Icon"] = 135996,
			["Enabled"] = true,
			["Revision"] = 159,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["__TrashAt"] = 1605125081,
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
			["Prio"] = 99,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
			["SpellIds"] = {
			},
			["PlaterCore"] = 1,
			["Name"] = "Unit - Important [Plater]",
			["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
			["NpcNames"] = {
				"135029", -- [1]
				"134388", -- [2]
				"134612", -- [3]
				"133361", -- [4]
				"136330", -- [5]
				"130896", -- [6]
				"129758", -- [7]
				"Healing Tide Totem", -- [8]
				"131009", -- [9]
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
		}, -- [1]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["Time"] = 1554683973,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 400,
			["Options"] = {
			},
			["Author"] = "Tercioo-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
			["SpellIds"] = {
				275826, -- [1]
				272888, -- [2]
				272659, -- [3]
				267901, -- [4]
				267830, -- [5]
				265393, -- [6]
				328175, -- [7]
			},
			["PlaterCore"] = 1,
			["Name"] = "Aura - Buff Alert [Plater]",
			["Desc"] = "Add the buff name in the trigger box.",
			["NpcNames"] = {
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
		}, -- [2]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1578054150,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
			["NpcNames"] = {
			},
			["Enabled"] = false,
			["Revision"] = 392,
			["Options"] = {
			},
			["Author"] = "Bombad�o-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Name"] = "Cast - Very Important [Plater]",
			["PlaterCore"] = 1,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				257785, -- [1]
				267237, -- [2]
				266951, -- [3]
				267273, -- [4]
				267433, -- [5]
				263066, -- [6]
				255577, -- [7]
				255371, -- [8]
			},
		}, -- [3]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
			["Time"] = 1596198411,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
			["Icon"] = 2175503,
			["Enabled"] = true,
			["Revision"] = 328,
			["Options"] = {
			},
			["Author"] = "Bombad�o-Azralon",
			["__TrashAt"] = 1605125081,
			["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
			["Prio"] = 99,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
			["SpellIds"] = {
				240446, -- [1]
				273577, -- [2]
			},
			["PlaterCore"] = 1,
			["Name"] = "Explosion Affix M+ [Plater]",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
			["NpcNames"] = {
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
		}, -- [4]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1538429739,
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
			["Enabled"] = true,
			["Revision"] = 232,
			["Options"] = {
			},
			["Author"] = "Tercioo-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
			["Name"] = "Aura - Debuff Alert [Plater]",
			["PlaterCore"] = 1,
			["__TrashAt"] = 1605125081,
			["SpellIds"] = {
			},
			["NpcNames"] = {
			},
			["Desc"] = "Add the debuff name in the trigger box.",
		}, -- [5]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Time"] = 1578054169,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
			["NpcNames"] = {
			},
			["Enabled"] = false,
			["Revision"] = 571,
			["Options"] = {
			},
			["Author"] = "Tercioo-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["Name"] = "Cast - Big Alert [Plater]",
			["PlaterCore"] = 1,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				258153, -- [1]
				258313, -- [2]
				257069, -- [3]
				274569, -- [4]
				278020, -- [5]
				261635, -- [6]
				272700, -- [7]
				280404, -- [8]
				268030, -- [9]
				265368, -- [10]
				263891, -- [11]
				264520, -- [12]
				265407, -- [13]
				278567, -- [14]
				278602, -- [15]
				258128, -- [16]
				257791, -- [17]
				258938, -- [18]
				265089, -- [19]
				272183, -- [20]
				256060, -- [21]
				257397, -- [22]
				257899, -- [23]
				269972, -- [24]
				270901, -- [25]
				270492, -- [26]
				268129, -- [27]
				268709, -- [28]
				263215, -- [29]
				268797, -- [30]
				262540, -- [31]
				262554, -- [32]
				253517, -- [33]
				255041, -- [34]
				252781, -- [35]
				250368, -- [36]
				258777, -- [37]
			},
		}, -- [6]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
			["Time"] = 1578054188,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
			["NpcNames"] = {
			},
			["Enabled"] = false,
			["Revision"] = 379,
			["Options"] = {
			},
			["Author"] = "Tercioo-Sylvanas",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
			["Name"] = "Cast - Small Alert [Plater]",
			["PlaterCore"] = 1,
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
			["SpellIds"] = {
				275192, -- [1]
				265912, -- [2]
				274438, -- [3]
				268317, -- [4]
				268375, -- [5]
				276767, -- [6]
				264105, -- [7]
				265876, -- [8]
				270464, -- [9]
				266106, -- [10]
				272180, -- [11]
				278961, -- [12]
				278755, -- [13]
				265468, -- [14]
				256405, -- [15]
				256897, -- [16]
				264101, -- [17]
				280604, -- [18]
				268702, -- [19]
				281621, -- [20]
				262515, -- [21]
				255824, -- [22]
				253583, -- [23]
				250096, -- [24]
			},
		}, -- [7]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
			["Time"] = 1554683973,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
			["Enabled"] = true,
			["Revision"] = 163,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
			["Name"] = "Aura - Blink by Time Left [Plater]",
			["PlaterCore"] = 1,
			["SpellIds"] = {
			},
			["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
			["NpcNames"] = {
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
		}, -- [8]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
			["ScriptType"] = 2,
			["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
			["Time"] = 1578054170,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
			["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
			["Enabled"] = false,
			["Revision"] = 174,
			["Options"] = {
			},
			["Author"] = "Izimode-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
			["SpellIds"] = {
				255952, -- [1]
				257426, -- [2]
				274400, -- [3]
				272609, -- [4]
				269843, -- [5]
				269029, -- [6]
				272827, -- [7]
				269266, -- [8]
				263912, -- [9]
				264923, -- [10]
				258864, -- [11]
				256955, -- [12]
				265540, -- [13]
				260793, -- [14]
				270003, -- [15]
				270507, -- [16]
				257337, -- [17]
				268415, -- [18]
				275907, -- [19]
				268865, -- [20]
				260669, -- [21]
				260280, -- [22]
				253239, -- [23]
				265541, -- [24]
				250258, -- [25]
			},
			["PlaterCore"] = 1,
			["Name"] = "Cast - Frontal Cone [Plater]",
			["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
			["NpcNames"] = {
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
		}, -- [9]
		{
			["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
			["ScriptType"] = 1,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
			["Time"] = 1601121232,
			["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
			["Icon"] = 1029718,
			["Enabled"] = true,
			["Revision"] = 192,
			["Options"] = {
			},
			["Author"] = "Celian-Sylvanas",
			["__TrashAt"] = 1605125081,
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
			["Prio"] = 99,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
			["SpellIds"] = {
				272584, -- [1]
				244653, -- [2]
			},
			["PlaterCore"] = 1,
			["Name"] = "Fixate [Plater]",
			["Desc"] = "Show above the nameplate who is the player fixated",
			["NpcNames"] = {
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
		}, -- [10]
		{
			["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
			["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
			["OptionsValues"] = {
			},
			["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["ScriptType"] = 3,
			["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["Time"] = 1578054197,
			["Temp_ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
			["Icon"] = 841383,
			["Enabled"] = true,
			["Revision"] = 195,
			["Options"] = {
			},
			["Author"] = "Tecno-Azralon",
			["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
			["__TrashAt"] = 1605125081,
			["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
			["SpellIds"] = {
				"spawn of g'huun", -- [1]
				"smuggled crawg", -- [2]
				"sergeant bainbridge", -- [3]
				"blacktooth scrapper", -- [4]
				"irontide grenadier", -- [5]
				"feral bloodswarmer", -- [6]
				"earthrager", -- [7]
				"crawler mine", -- [8]
				"rezan", -- [9]
			},
			["PlaterCore"] = 1,
			["Name"] = "Fixate On You [Plater]",
			["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
			["NpcNames"] = {
				"smuggled crawg", -- [1]
				"sergeant bainbridge", -- [2]
				"blacktooth scrapper", -- [3]
				"irontide grenadier", -- [4]
				"feral bloodswarmer", -- [5]
				"earthrager", -- [6]
				"crawler mine", -- [7]
				"rezan", -- [8]
				"136461", -- [9]
			},
			["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
		}, -- [11]
	},
	["aura2_x_offset"] = 0,
	["castbar_target_anchor"] = {
		["y"] = 8.349998474121094,
		["x"] = 24.72999572753906,
		["side"] = 6,
	},
	["aura2_grow_direction"] = 3,
	["cast_statusbar_texture"] = "Melli",
	["aura_cooldown_edge_texture"] = "Interface\\GLUES\\loadingOld",
	["healthbar_framelevel"] = 0,
	["dps"] = {
		["colors"] = {
			["aggro"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
				1, -- [4]
			},
			["notontank"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
				1, -- [4]
			},
			["noaggro"] = {
				0.7333333333333333, -- [1]
				0.196078431372549, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["pulling"] = {
				nil, -- [1]
				0.9333333333333333, -- [2]
				0.4313725490196079, -- [3]
				1, -- [4]
			},
		},
	},
	["ui_parent_target_strata"] = "DIALOG",
	["tank"] = {
		["colors"] = {
			["anothertank"] = {
				0.7333333333333333, -- [1]
				0.196078431372549, -- [2]
				nil, -- [3]
				1, -- [4]
			},
			["aggro"] = {
				0.3803921568627451, -- [1]
				0.8745098039215686, -- [2]
				0.2313725490196079, -- [3]
				1, -- [4]
			},
			["nocombat"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
				1, -- [4]
			},
			["noaggro"] = {
				0.996078431372549, -- [1]
				0.2980392156862745, -- [2]
				0.3098039215686275, -- [3]
				1, -- [4]
			},
			["pulling"] = {
				nil, -- [1]
				0.9333333333333333, -- [2]
				0.4313725490196079, -- [3]
				1, -- [4]
			},
		},
	},
	["captured_spells"] = {
		[164815] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[268604] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[306474] = {
			["type"] = "DEBUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[104445] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pepsímax",
			["npcID"] = 0,
		},
		[215479] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[115192] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[173260] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Drfabulous",
			["npcID"] = 0,
		},
		[214968] = {
			["source"] = "Naowhlul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268607] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[193475] = {
			["source"] = "Xerathas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[255141] = {
			["source"] = "Overpowerd-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[312107] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dengzi",
			["npcID"] = 0,
		},
		[275773] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Skarís",
			["encounterID"] = 2331,
		},
		[313643] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[281403] = {
			["source"] = "Gomthegrey-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[119415] = {
			["source"] = "Coruthas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[97026] = {
			["source"] = "Pourek-Bloodfeather",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[255654] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kaalter-Draenor",
			["npcID"] = 0,
		},
		[6360] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 1863,
		},
		[305970] = {
			["source"] = "Vynren-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[145629] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[342817] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Silkwood",
			["npcID"] = 0,
		},
		[238256] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dreanda-Blackrock",
			["npcID"] = 0,
		},
		[160726] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Morsica-Dentarg",
			["npcID"] = 0,
		},
		[270661] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[115450] = {
			["source"] = "Пуньлао-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[275779] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[280385] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Velir-Blackrock",
			["npcID"] = 0,
		},
		[301367] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heallerious",
			["npcID"] = 0,
		},
		[254633] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mocchi-Lightbringer",
			["npcID"] = 0,
		},
		[33625] = {
			["source"] = "Gold Shaman",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32340,
		},
		[408] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[118905] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Capacitor Totem",
			["npcID"] = 61245,
		},
		[6552] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[167381] = {
			["source"] = "Dungeoneer's Training Dummy",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 92168,
		},
		[200389] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cyclus",
			["npcID"] = 0,
		},
		[50769] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Schattengirl-Khaz'goroth",
			["npcID"] = 0,
		},
		[162264] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[221883] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Alindra-Malorne",
			["npcID"] = 0,
		},
		[224186] = {
			["source"] = "Wutei-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[57294] = {
			["source"] = "Doggfather-Gilneas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[190411] = {
			["source"] = "Sniedelwoods-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[228537] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[301886] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[341291] = {
			["source"] = "Ønly-Garrosh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[270670] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[124280] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[118779] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[120954] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[56463] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[254638] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mocchi-Lightbringer",
			["npcID"] = 0,
		},
		[313148] = {
			["source"] = "Doccý",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[203975] = {
			["source"] = "Cowbell",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[167385] = {
			["source"] = "Dungeoneer's Training Dummy",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 92168,
		},
		[196555] = {
			["source"] = "Maomaodh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272721] = {
			["source"] = "Mínnì-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[316220] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Nerly-Ravencrest",
			["npcID"] = 0,
		},
		[290121] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mugala",
			["npcID"] = 0,
		},
		[280398] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hauny",
			["npcID"] = 0,
		},
		[197835] = {
			["source"] = "Twocut",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[288075] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Víbés-Blackmoore",
			["npcID"] = 0,
		},
		[194509] = {
			["source"] = "Rootsman-Zenedar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[272723] = {
			["source"] = "Mínnì-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[298823] = {
			["source"] = "Leefke-Aman'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[45525] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Warsong Hold Mage",
			["npcID"] = 25420,
		},
		[235450] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sparakgonzo",
			["npcID"] = 0,
		},
		[23922] = {
			["source"] = "Shelga",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[126457] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rigdruid",
			["npcID"] = 0,
		},
		[303943] = {
			["source"] = "Seppelfricke-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[245686] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sarahsoftpaw",
			["npcID"] = 0,
		},
		[54353] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[58511] = {
			["source"] = "Urtrun Clanbringer",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 3370,
		},
		[199373] = {
			["npcID"] = 24207,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Army of the Dead",
			["encounterID"] = 2331,
		},
		[228287] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[64844] = {
			["source"] = "Bigolina-DieArguswacht",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[212423] = {
			["npcID"] = 99541,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Risen Skulker",
			["encounterID"] = 2331,
		},
		[267611] = {
			["source"] = "Clutchkicks",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[290640] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shiftmeow",
			["npcID"] = 0,
		},
		[3561] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ruuvi-Area52",
			["npcID"] = 0,
		},
		[256434] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tamatoa-Tichondrius",
			["npcID"] = 0,
		},
		[116095] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[276824] = {
			["source"] = "Floorpov",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[295248] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[215751] = {
			["source"] = "Тудигаар-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[278873] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Starzerg",
			["npcID"] = 0,
		},
		[97033] = {
			["source"] = "Discoinfurno-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[280409] = {
			["source"] = "Диаблоу-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[287062] = {
			["source"] = "Geckofists-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[254645] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mocchi-Lightbringer",
			["npcID"] = 0,
		},
		[5225] = {
			["source"] = "Rosalié-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[287063] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[198097] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[271711] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[58448] = {
			["source"] = "Derbulle",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1833] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[280412] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Perazhen-Draenor",
			["npcID"] = 0,
		},
		[97034] = {
			["source"] = "Çola",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[288601] = {
			["source"] = "Iluniell-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[196819] = {
			["source"] = "Twocut",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[7384] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[279902] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[298837] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Azurid",
			["npcID"] = 0,
		},
		[247227] = {
			["source"] = "Neridia-Blade'sEdge",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[61391] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[465] = {
			["type"] = "BUFF",
			["source"] = "Skarís",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[311121] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Spiked Tentacle",
			["npcID"] = 159416,
		},
		[210126] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sparakgonzo",
			["npcID"] = 0,
		},
		[295258] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[201427] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[298841] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Floorpov",
			["npcID"] = 0,
		},
		[204242] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[281954] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Блюдо-Ревущийфьорд",
			["npcID"] = 0,
		},
		[79892] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 96949,
		},
		[231621] = {
			["source"] = "Andral-Saurfang",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[102793] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[115203] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[214222] = {
			["type"] = "DEBUFF",
			["source"] = "Skarís",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[212431] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ballboar",
			["npcID"] = 0,
		},
		[172003] = {
			["source"] = "Gorich-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[305497] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[205523] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[185565] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[53140] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tragicman",
			["npcID"] = 0,
		},
		[251837] = {
			["source"] = "Phyrus-Quel'Thalas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[98444] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sailhatan",
			["npcID"] = 0,
		},
		[127230] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pandamónium-Xavius",
			["npcID"] = 0,
		},
		[127358] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ik'thik Warrior",
			["npcID"] = 65573,
		},
		[125439] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Spheniscidae-Quel'Thalas",
			["npcID"] = 0,
		},
		[3865] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fokintank",
			["npcID"] = 0,
		},
		[218574] = {
			["source"] = "Cithrel-AzjolNerub",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[5697] = {
			["source"] = "Silensha-Doomhammer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[123904] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1943] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[185311] = {
			["type"] = "BUFF",
			["source"] = "Iklaus",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[195802] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Yamauto",
			["npcID"] = 0,
		},
		[79638] = {
			["source"] = "Oofxd",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1953] = {
			["source"] = "Coruthas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[251839] = {
			["source"] = "Názgul-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[46168] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zopferl",
			["npcID"] = 0,
		},
		[58514] = {
			["source"] = "Orgrimmar Grunt",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 3296,
		},
		[256701] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[192221] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[327510] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[117892] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Saltfin Swimmer",
			["npcID"] = 126682,
		},
		[42650] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[256702] = {
			["source"] = "Lyrxss-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[213971] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 107736,
		},
		[208086] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[172008] = {
			["source"] = "Electriceel",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[319836] = {
			["source"] = "Aivornom",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[498] = {
			["source"] = "Almazia-Ulduar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[298343] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[280433] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[317791] = {
			["npcID"] = 163366,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Magus of the Dead",
			["encounterID"] = 2331,
		},
		[317792] = {
			["npcID"] = 163366,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Magus of the Dead",
			["encounterID"] = 2331,
		},
		[210391] = {
			["source"] = "Zaxiipala",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[255937] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Narcolies",
			["npcID"] = 0,
		},
		[98447] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[56468] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[192225] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kaffebrygger",
			["npcID"] = 0,
		},
		[48792] = {
			["source"] = "Naowhlul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53142] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Knellet",
			["npcID"] = 0,
		},
		[32752] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Wazkakle",
			["npcID"] = 0,
		},
		[228049] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Holypony",
			["npcID"] = 0,
		},
		[24724] = {
			["source"] = "Akhylla-AeriePeak",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[6201] = {
			["source"] = "Atheron-Ysera",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[147193] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Paeia-Aegwynn",
			["npcID"] = 0,
		},
		[188389] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[2094] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[2098] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[201695] = {
			["source"] = "Vaimee-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[527] = {
			["source"] = "Dauerhorny-Shattrath",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[253894] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Bootehbae-Draenor",
			["npcID"] = 0,
		},
		[58452] = {
			["source"] = "Azura-Malygos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[256453] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aggutar-Blackrock",
			["npcID"] = 0,
		},
		[8512] = {
			["source"] = "Kyralix-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[228563] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhqt",
			["npcID"] = 0,
		},
		[192229] = {
			["source"] = "Naowhlul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[172015] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Øxy-Un'Goro",
			["npcID"] = 0,
		},
		[191206] = {
			["source"] = "Vanamarilla-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[264070] = {
			["source"] = "Kul'krazahn",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 120899,
		},
		[253896] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Camlen-Draenor",
			["npcID"] = 0,
		},
		[203233] = {
			["source"] = "Pnaû",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[321388] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nebülla",
			["npcID"] = 0,
		},
		[171761] = {
			["source"] = "Meningitida-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[300919] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[205025] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Deeliah-Malygos",
			["npcID"] = 0,
		},
		[128260] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wowolf",
			["npcID"] = 0,
		},
		[191208] = {
			["source"] = "Rashomonn",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[213981] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sackstabber",
			["npcID"] = 0,
		},
		[153595] = {
			["source"] = "Icebebe-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[278917] = {
			["source"] = "Fear-Kor'gall",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[191210] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sports-Draenor",
			["npcID"] = 0,
		},
		[200166] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[212704] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Octofuchs-Alleria",
			["npcID"] = 0,
		},
		[118922] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[256459] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Azren",
			["npcID"] = 0,
		},
		[191211] = {
			["source"] = "Rorjin-Blackrock",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[242642] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Styin",
			["npcID"] = 0,
		},
		[171253] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kairli-Darkspear",
			["npcID"] = 0,
		},
		[6713] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32321,
		},
		[585] = {
			["source"] = "Helgurgoya",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[586] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rycn",
			["npcID"] = 0,
		},
		[105617] = {
			["source"] = "Oofxd",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[256460] = {
			["source"] = "Vldolock-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[589] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Paeia-Aegwynn",
			["npcID"] = 0,
		},
		[236502] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[204262] = {
			["source"] = "Nästrimmer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[227291] = {
			["npcID"] = 73967,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Niuzao",
			["encounterID"] = 2331,
		},
		[56471] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[29363] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 1554,
		},
		[190446] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[111759] = {
			["source"] = "Simsala-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[50842] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[199658] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[77472] = {
			["source"] = "Malipauk-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[277904] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Caliditas",
			["npcID"] = 0,
		},
		[34914] = {
			["source"] = "Priestitutex",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[106898] = {
			["source"] = "Naowhty",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272276] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[315265] = {
			["type"] = "BUFF",
			["source"] = "Vita Portal",
			["npcID"] = 161943,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[274837] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124682] = {
			["source"] = "Number Eight Aiko",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 105590,
		},
		[33763] = {
			["source"] = "Dildobaggins-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[264091] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kída",
			["npcID"] = 0,
		},
		[274838] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[58519] = {
			["source"] = "Orgrimmar Grunt",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 3296,
		},
		[279956] = {
			["source"] = "Naowhqt",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[210152] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[30451] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[223202] = {
			["source"] = "Thakarn-Draenor",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[143625] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zulppi-Zenedar",
			["npcID"] = 0,
		},
		[288146] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Trinia",
			["npcID"] = 0,
		},
		[315269] = {
			["type"] = "BUFF",
			["source"] = "Void Portal",
			["npcID"] = 161945,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[200174] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[227041] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[642] = {
			["source"] = "Raenar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[266144] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Gahz'ragon",
			["npcID"] = 120850,
		},
		[334208] = {
			["source"] = "Argent Healer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 171501,
		},
		[96026] = {
			["source"] = "Hag's Broom",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 51710,
		},
		[315787] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[273312] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[131347] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[222695] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Brucemelee-Alonsus",
			["npcID"] = 0,
		},
		[673] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sanyella-DunMorogh",
			["npcID"] = 0,
		},
		[5394] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[49309] = {
			["source"] = "Gold Shaman",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32340,
		},
		[168706] = {
			["source"] = "Tiléà",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[53595] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[19705] = {
			["source"] = "Друммаш-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[190456] = {
			["source"] = "Ichasi",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[79140] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[312722] = {
			["type"] = "BUFF",
			["source"] = "Nightmare Portal",
			["npcID"] = 160643,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[686] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[87840] = {
			["source"] = "Sômkéy-Blackrock",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[196342] = {
			["source"] = "Rengaró-Blackmoore",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[225512] = {
			["source"] = "Naowhlul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[289184] = {
			["source"] = "Groawler",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[2782] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[295838] = {
			["type"] = "DEBUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[702] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[703] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[2818] = {
			["source"] = "Streider-Emeriss",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[274346] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[297375] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[295840] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Øxy-Un'Goro",
			["npcID"] = 0,
		},
		[193530] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vrylol",
			["npcID"] = 0,
		},
		[712] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[273836] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[184575] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[295842] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ruffelgnob",
			["npcID"] = 0,
		},
		[290213] = {
			["source"] = "Ondae",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[197625] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Côrntêên",
			["npcID"] = 0,
		},
		[16827] = {
			["source"] = "Raptor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 165189,
		},
		[208628] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[176644] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shedon",
			["npcID"] = 0,
		},
		[224189] = {
			["type"] = "BUFF",
			["source"] = "Gorchar",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[202719] = {
			["source"] = "Anbefalt",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[307026] = {
			["source"] = "Kashchey",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[124275] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[205022] = {
			["source"] = "Majtebust",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[5217] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272817] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sonyanemska-Neptulon",
			["npcID"] = 0,
		},
		[113942] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Großmarschál-Nefarian",
			["npcID"] = 0,
		},
		[290608] = {
			["source"] = "Valrah",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[21401] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32340,
		},
		[295310] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[101643] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhqt",
			["npcID"] = 0,
		},
		[273842] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Velir-Blackrock",
			["npcID"] = 0,
		},
		[139546] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[19514] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 49808,
		},
		[195776] = {
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[256735] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kim-Kargath",
			["npcID"] = 0,
		},
		[556] = {
			["source"] = "Dszk-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[23736] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sayge",
			["npcID"] = 14822,
		},
		[744] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Forest Lurker",
			["npcID"] = 1195,
		},
		[310690] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[311202] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lënny-Kel'Thuzad",
			["npcID"] = 0,
		},
		[44178] = {
			["source"] = "Green Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32324,
		},
		[269239] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[109977] = {
			["source"] = "Mola",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 54601,
		},
		[220146] = {
			["source"] = "Unamused Imp",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 110721,
		},
		[187650] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[276827] = {
			["source"] = "Vintrævi-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[238270] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Monsi",
			["npcID"] = 0,
		},
		[104316] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[755] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[185562] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sheyma-Tirion",
			["npcID"] = 0,
		},
		[17843] = {
			["source"] = "Gold Priest",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32325,
		},
		[54029] = {
			["source"] = "Sunreaver Guardian Mage",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 29255,
		},
		[759] = {
			["source"] = "Vortensis-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[97056] = {
			["source"] = "Nikodan-Mazrigos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124274] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[238267] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Monsi",
			["npcID"] = 0,
		},
		[317859] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[195072] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[277943] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[253897] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Camlen-Draenor",
			["npcID"] = 0,
		},
		[688] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Comertrooper",
			["npcID"] = 0,
		},
		[295855] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Øxy-Un'Goro",
			["npcID"] = 0,
		},
		[96161] = {
			["source"] = "Lisko-Arygos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[196608] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[317861] = {
			["source"] = "Sorbos-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[59547] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[306603] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[193538] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[204019] = {
			["source"] = "Svampp",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[203981] = {
			["source"] = "Janushysama",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[19574] = {
			["source"] = "Zjinye",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[3110] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gelfip",
			["npcID"] = 416,
		},
		[213241] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[31884] = {
			["source"] = "Nevvi",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[781] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gingì",
			["encounterID"] = 2331,
		},
		[252383] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jespo-Onyxia",
			["npcID"] = 0,
		},
		[783] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[267201] = {
			["source"] = "Apatikus-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[243435] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[240039] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miyaku-Nordrassil",
			["npcID"] = 0,
		},
		[108292] = {
			["source"] = "Doccý",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[56477] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[23161] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Afflica",
			["npcID"] = 0,
		},
		[108446] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 17252,
		},
		[82326] = {
			["source"] = "Dânuri-Ysera",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[196099] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Phelumbra-Dentarg",
			["npcID"] = 0,
		},
		[337313] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[262115] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[213243] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[228050] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Guardian of the Forgotten Queen",
			["npcID"] = 114565,
		},
		[312750] = {
			["type"] = "BUFF",
			["source"] = "Essence of Nightmare",
			["npcID"] = 160663,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[274369] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bezy",
			["npcID"] = 0,
		},
		[299445] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Guha",
			["npcID"] = 0,
		},
		[8690] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["npcID"] = 0,
		},
		[341282] = {
			["source"] = "Ønly-Garrosh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[260069] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 131809,
		},
		[21562] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rycn",
			["npcID"] = 0,
		},
		[121471] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nazula",
			["npcID"] = 0,
		},
		[115098] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[234153] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[293671] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Schaluna-DunMorogh",
			["npcID"] = 0,
		},
		[273348] = {
			["source"] = "Mistí-Turalyon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[194310] = {
			["type"] = "DEBUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[260070] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 131834,
		},
		[194249] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[190984] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[187146] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Felnalu",
			["npcID"] = 0,
		},
		[274373] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[319919] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sinoviiamonk",
			["npcID"] = 0,
		},
		[56222] = {
			["source"] = "Sjyvsen",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[275909] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[818] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Johnsinclair",
			["npcID"] = 0,
		},
		[42514] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Pulsing Pumpkin",
			["npcID"] = 23694,
		},
		[304056] = {
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[34026] = {
			["source"] = "Zjinye",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[109304] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gingì",
			["encounterID"] = 2331,
		},
		[278981] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Primalpunk",
			["npcID"] = 0,
		},
		[254649] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tunaru",
			["npcID"] = 0,
		},
		[46352] = {
			["source"] = "Majtebust",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[307128] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[51533] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[217597] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[240037] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Minxiao-Lightbringer",
			["npcID"] = 0,
		},
		[50977] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arkris",
			["npcID"] = 0,
		},
		[303044] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Blowjab-Dentarg",
			["npcID"] = 0,
		},
		[19708] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mortivorex-Thrall",
			["npcID"] = 0,
		},
		[77489] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lengyu",
			["npcID"] = 0,
		},
		[300989] = {
			["source"] = "Laso",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[77575] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miniaugdk",
			["encounterID"] = 2331,
		},
		[15407] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Paeia-Aegwynn",
			["npcID"] = 0,
		},
		[298431] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[185358] = {
			["source"] = "Bíllie",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[53600] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[187917] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Morsica-Dentarg",
			["npcID"] = 0,
		},
		[261613] = {
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[170950] = {
			["source"] = "Caindros-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[22842] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[318391] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Great Worm From Beyond",
			["npcID"] = 152550,
		},
		[298433] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Сомах-Ревущийфьорд",
			["npcID"] = 0,
		},
		[224001] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Voideigh-Terokkar",
			["npcID"] = 0,
		},
		[6770] = {
			["source"] = "Streider-Emeriss",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[251832] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Сэфаэль-Ревущийфьорд",
			["npcID"] = 0,
		},
		[48099] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Icastflare",
			["npcID"] = 0,
		},
		[295373] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[243955] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Killwithme",
			["npcID"] = 0,
		},
		[225788] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[853] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Damula",
			["npcID"] = 0,
		},
		[303041] = {
			["source"] = "Callydon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[297412] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tain",
			["npcID"] = 0,
		},
		[97062] = {
			["source"] = "Permitscheme-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[274220] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[51661] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Philippjones",
			["npcID"] = 0,
		},
		[160029] = {
			["type"] = "DEBUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[324536] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Stinkybread",
			["npcID"] = 0,
		},
		[204213] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[311231] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Креветованый-Ревущийфьорд",
			["npcID"] = 0,
		},
		[295367] = {
			["type"] = "DEBUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[279503] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Helvetesmakt",
			["npcID"] = 0,
		},
		[251038] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 132999,
		},
		[298950] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mechanically-Shattrath",
			["npcID"] = 0,
		},
		[295368] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[288548] = {
			["npcID"] = 148797,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Magus of the Dead",
			["encounterID"] = 2331,
		},
		[125070] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Вайлини-Ревущийфьорд",
			["npcID"] = 0,
		},
		[260057] = {
			["source"] = "Priest of Gonk",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 131809,
		},
		[871] = {
			["source"] = "Gwennin",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[97063] = {
			["source"] = "Lucidy",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[298440] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Alund",
			["npcID"] = 0,
		},
		[176151] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Palebrew-Draenor",
			["npcID"] = 0,
		},
		[2825] = {
			["source"] = "Лисье-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[252402] = {
			["source"] = "Sàul-Rexxar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[62173] = {
			["source"] = "Tahly-Malygos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[14032] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32343,
		},
		[32182] = {
			["source"] = "Aloozz-Tyrande",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[266030] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cesdeia",
			["npcID"] = 0,
		},
		[298442] = {
			["source"] = "Uwukawaii-Karazhan",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[186387] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nxthunter",
			["npcID"] = 0,
		},
		[883] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arrtemis",
			["npcID"] = 0,
		},
		[56480] = {
			["source"] = "Tartar-Garrosh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[16191] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ferøx",
			["npcID"] = 0,
		},
		[27576] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[26297] = {
			["source"] = "Pnaû",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[204301] = {
			["source"] = "Svampp",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[30455] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[260072] = {
			["source"] = "Pa'kura Priest",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 131834,
		},
		[3562] = {
			["source"] = "Pint",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[3566] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jielkie-Turalyon",
			["npcID"] = 0,
		},
		[205766] = {
			["source"] = "Течпро-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[25046] = {
			["source"] = "Jukeinbush-Doomhammer",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[72968] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ruffelgnob",
			["npcID"] = 0,
		},
		[261616] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Katy Stampwhistle",
			["npcID"] = 132969,
		},
		[171804] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rahkar",
			["npcID"] = 0,
		},
		[19577] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kirau",
			["npcID"] = 0,
		},
		[27577] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gold Warrior",
			["npcID"] = 32322,
		},
		[203277] = {
			["source"] = "Nâmì-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[26745] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Alastair-DunMorogh",
			["npcID"] = 0,
		},
		[264114] = {
			["source"] = "Kul'krazahn",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 120899,
		},
		[202164] = {
			["source"] = "Moosebonk-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[119582] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[107428] = {
			["source"] = "Chailong-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[24858] = {
			["source"] = "Sassÿ-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[295378] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Stormar",
			["npcID"] = 0,
		},
		[269279] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[306637] = {
			["npcID"] = 0,
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[228354] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[216328] = {
			["source"] = "Dânuri-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[224772] = {
			["source"] = "Oxylos-Xavius",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[20572] = {
			["source"] = "Ichasi",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[116768] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[268769] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cb-Terokkar",
			["npcID"] = 0,
		},
		[23768] = {
			["source"] = "Sayge",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 14822,
		},
		[11327] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[33757] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[198837] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Risen Skulker",
			["npcID"] = 99541,
		},
		[195292] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[57100] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zandro-Lothar",
			["npcID"] = 0,
		},
		[275857] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nillerh",
			["npcID"] = 0,
		},
		[336135] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Thiberiá-Shattrath",
			["npcID"] = 0,
		},
		[297941] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[213771] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[315341] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[132403] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[288675] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Enchannican",
			["npcID"] = 0,
		},
		[271843] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sulàn-ArgentDawn",
			["npcID"] = 0,
		},
		[61471] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jespo-Onyxia",
			["npcID"] = 0,
		},
		[328136] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[322507] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[267560] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gatita",
			["npcID"] = 0,
		},
		[221885] = {
			["source"] = "Swirling-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[132627] = {
			["source"] = "Incera-Blutkessel",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[187929] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Curebank-DunMorogh",
			["npcID"] = 0,
		},
		[124273] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[41425] = {
			["type"] = "DEBUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[101545] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Renkama-AzjolNerub",
			["npcID"] = 0,
		},
		[268609] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Magghellesø",
			["npcID"] = 0,
		},
		[62175] = {
			["source"] = "Scantracx-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[228358] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[268776] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 130257,
		},
		[275429] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hèxos-Anub'arak",
			["npcID"] = 0,
		},
		[122783] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[273349] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[24753] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Røckû-Malorne",
			["npcID"] = 0,
		},
		[227847] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Floorpov",
			["npcID"] = 0,
		},
		[267558] = {
			["source"] = "Raxh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306654] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[158486] = {
			["source"] = "Lazkazbrez",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53] = {
			["source"] = "Twocut",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[325092] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[110884] = {
			["source"] = "Zhinü-Malfurion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101546] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[193759] = {
			["source"] = "Rámted-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[111400] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[48018] = {
			["source"] = "Kösareth-Turalyon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[108199] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[263151] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Chuqal-Magtheridon",
			["npcID"] = 0,
		},
		[239363] = {
			["source"] = "Naowhlul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[177130] = {
			["source"] = "Telbaru-Thrall",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[223499] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Helgemoose",
			["npcID"] = 0,
		},
		[546] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Berah",
			["npcID"] = 0,
		},
		[148539] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[250878] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Quickshaman",
			["npcID"] = 0,
		},
		[1329] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[263153] = {
			["source"] = "Vanamarilla-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[115313] = {
			["source"] = "Mistí-Turalyon",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[22812] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[264689] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[308188] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Strongone-Turalyon",
			["npcID"] = 0,
		},
		[304606] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Calywaly",
			["npcID"] = 0,
		},
		[974] = {
			["source"] = "Eitgar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[293142] = {
			["source"] = "Шинафай-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[265202] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lengyu",
			["npcID"] = 0,
		},
		[31224] = {
			["type"] = "BUFF",
			["source"] = "Iklaus",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[289283] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Шухерпвнз-Ревущийфьорд",
			["npcID"] = 0,
		},
		[288024] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Märc",
			["npcID"] = 0,
		},
		[980] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Deepshades",
			["encounterID"] = 2331,
		},
		[100780] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[982] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hunsun",
			["npcID"] = 0,
		},
		[146739] = {
			["source"] = "Tiraz-Draenor",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[199721] = {
			["source"] = "Jompx",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[126498] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nivilem",
			["npcID"] = 0,
		},
		[35859] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Nether Vapor",
			["npcID"] = 21002,
		},
		[48743] = {
			["source"] = "Jompx",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[285976] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Logiik",
			["npcID"] = 0,
		},
		[36589] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sinewy Wolf",
			["npcID"] = 31233,
		},
		[313310] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[304619] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Tirassia-Ysera",
			["npcID"] = 0,
		},
		[179748] = {
			["source"] = "Evapor-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[304611] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Calywaly",
			["npcID"] = 0,
		},
		[633] = {
			["source"] = "Clutchkicks",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[1066] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Odna-Arygos",
			["npcID"] = 0,
		},
		[13005] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Green Paladin",
			["npcID"] = 32342,
		},
		[304612] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Palachat-Hyjal",
			["npcID"] = 0,
		},
		[201754] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolf",
			["npcID"] = 165189,
		},
		[197916] = {
			["source"] = "Mistí-Turalyon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[47528] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ryzma",
			["npcID"] = 0,
		},
		[254474] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[274420] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[336126] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[105771] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[207640] = {
			["source"] = "Dildobaggins-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[132157] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mentia",
			["npcID"] = 0,
		},
		[191212] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mirablin-Malfurion",
			["npcID"] = 0,
		},
		[32216] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[256778] = {
			["source"] = "Bilakh-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[48168] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 96955,
		},
		[279028] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lënny-Kel'Thuzad",
			["npcID"] = 0,
		},
		[7744] = {
			["source"] = "Bubbakush-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[236299] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Magghellesø",
			["npcID"] = 0,
		},
		[218132] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[279029] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lënny-Kel'Thuzad",
			["npcID"] = 0,
		},
		[8122] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[5019] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Magghellesø",
			["npcID"] = 0,
		},
		[211881] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[212743] = {
			["source"] = "Twocut",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[207386] = {
			["source"] = "Tyskard-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272790] = {
			["source"] = "Ejie",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[1022] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hjälten",
			["npcID"] = 0,
		},
		[197919] = {
			["source"] = "Pong",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[116847] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[153397] = {
			["source"] = "Evapor-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[8212] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sonyanemska-Neptulon",
			["npcID"] = 0,
		},
		[97030] = {
			["source"] = "Eldernanook-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[216528] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zire",
			["npcID"] = 0,
		},
		[121253] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[288756] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Barbridy-DunMorogh",
			["npcID"] = 0,
		},
		[114052] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[49576] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[227099] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pall",
			["npcID"] = 0,
		},
		[1044] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hjälten",
			["npcID"] = 0,
		},
		[272893] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[179251] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jacqoxx-Thrall",
			["npcID"] = 0,
		},
		[193315] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[203554] = {
			["source"] = "Dildobaggins-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[257284] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sulea-Kil'jaeden",
			["npcID"] = 0,
		},
		[176569] = {
			["source"] = "Atradus-Arthas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[271194] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Redsusan",
			["npcID"] = 0,
		},
		[274430] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268801] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sandfury Thug",
			["npcID"] = 125460,
		},
		[1064] = {
			["source"] = "Malipauk-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[100784] = {
			["source"] = "Chailong-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[274431] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[40623] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Канотор-Ревущийфьорд",
			["npcID"] = 0,
		},
		[199736] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nanoblade-Thrall",
			["npcID"] = 0,
		},
		[83244] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Арамильвитре-Ревущийфьорд",
			["npcID"] = 0,
		},
		[102292] = {
			["source"] = "Darkmoon Steam Tonk",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 54588,
		},
		[225517] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Strongone-Turalyon",
			["npcID"] = 0,
		},
		[297995] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Temqo",
			["npcID"] = 0,
		},
		[209693] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Silkwood",
			["npcID"] = 0,
		},
		[55078] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[73920] = {
			["source"] = "Malipauk-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[772] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Minozor-Ravencrest",
			["npcID"] = 0,
		},
		[247563] = {
			["source"] = "Nofox",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[184362] = {
			["source"] = "Lanzhu",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[179256] = {
			["source"] = "Evapor-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[254472] = {
			["type"] = "BUFF",
			["source"] = "Narcolies",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[85256] = {
			["source"] = "Nevvi",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[43308] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sarahsoftpaw",
			["npcID"] = 0,
		},
		[326396] = {
			["source"] = "Orgramor-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[202274] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Gurkemeje",
			["npcID"] = 0,
		},
		[102417] = {
			["source"] = "Scantracx-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[8852] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 44162,
		},
		[289277] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vampíré",
			["npcID"] = 0,
		},
		[308212] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Todorokii",
			["npcID"] = 0,
		},
		[62179] = {
			["source"] = "Alanis-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[148541] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1715] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[260881] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Amvrosham",
			["npcID"] = 0,
		},
		[104318] = {
			["source"] = "Wild Imp",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 55659,
		},
		[15532] = {
			["source"] = "Green Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32324,
		},
		[272903] = {
			["type"] = "BUFF",
			["source"] = "Narcolies",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[273415] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Milleenie",
			["npcID"] = 0,
		},
		[256777] = {
			["source"] = "Балдьожь-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[269120] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[310530] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[306168] = {
			["type"] = "BUFF",
			["source"] = "Essence of Void",
			["npcID"] = 156980,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[2643] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Bslayer",
			["npcID"] = 0,
		},
		[14030] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Constable Astley",
			["npcID"] = 142371,
		},
		[131399] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 66272,
		},
		[193065] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Skräckslagen",
			["npcID"] = 0,
		},
		[81340] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[226329] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Вератас-Ревущийфьорд",
			["npcID"] = 0,
		},
		[197548] = {
			["source"] = "Зхб-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[232698] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naiad",
			["npcID"] = 0,
		},
		[265742] = {
			["source"] = "Catclerence-Malygos",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[318378] = {
			["source"] = "Naowhtwo",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[69826] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Soracka",
			["npcID"] = 0,
		},
		[51052] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grizzlydeath",
			["npcID"] = 0,
		},
		[269837] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Amani Thug",
			["npcID"] = 120843,
		},
		[24733] = {
			["source"] = "Vanamarilla-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[52127] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Amvrosham",
			["npcID"] = 0,
		},
		[297993] = {
			["source"] = "Maomaodh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[203819] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[268616] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tørrfisken",
			["npcID"] = 0,
		},
		[193310] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arazni-Kargath",
			["npcID"] = 0,
		},
		[5116] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kirau",
			["npcID"] = 0,
		},
		[196840] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[203814] = {
			["source"] = "Kalgresh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[334320] = {
			["source"] = "Sàul-Rexxar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[2367] = {
			["source"] = "Haufest-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[48107] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[79934] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 4563,
		},
		[2379] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kuqen",
			["npcID"] = 0,
		},
		[2383] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Innócent",
			["npcID"] = 0,
		},
		[155722] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[274447] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[96041] = {
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[35361] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 31228,
		},
		[316923] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Corrosive Digester",
			["npcID"] = 162828,
		},
		[192058] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[97462] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Daem-Arthas",
			["npcID"] = 0,
		},
		[297989] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Derfreund-DunMorogh",
			["npcID"] = 0,
		},
		[292360] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Satj",
			["npcID"] = 0,
		},
		[179252] = {
			["source"] = "Kinelory-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[285720] = {
			["source"] = "Zind-Zenedar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[300802] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Garrik-Baelgun",
			["npcID"] = 0,
		},
		[85948] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miniaugdk",
			["encounterID"] = 2331,
		},
		[85673] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Drzd-Blackmoore",
			["npcID"] = 0,
		},
		[281517] = {
			["source"] = "Gazlar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[225822] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Votro-Ysera",
			["npcID"] = 0,
		},
		[292362] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kubbarn",
			["npcID"] = 0,
		},
		[185394] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aydrax-BurningLegion",
			["npcID"] = 0,
		},
		[70340] = {
			["source"] = "Dankü-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[273428] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Palmén",
			["npcID"] = 0,
		},
		[292363] = {
			["source"] = "Valrah",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[2641] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Hunsun",
			["npcID"] = 0,
		},
		[33395] = {
			["source"] = "Wasserelementar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 78116,
		},
		[207400] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nineshock",
			["npcID"] = 0,
		},
		[11971] = {
			["source"] = "Karam Magespear",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 116308,
		},
		[195630] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[187698] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Damsan",
			["npcID"] = 0,
		},
		[300801] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[48108] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[96312] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
		},
		[33907] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 142294,
		},
		[119085] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Turbofox",
			["npcID"] = 0,
		},
		[308742] = {
			["source"] = "Assinka-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[160832] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pandamónium-Xavius",
			["npcID"] = 0,
		},
		[134477] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 17252,
		},
		[306184] = {
			["type"] = "DEBUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[187174] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[278559] = {
			["source"] = "Bloodwite-Twilight'sHammer",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[176888] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[236060] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[228128] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Avensis",
			["npcID"] = 0,
		},
		[246807] = {
			["source"] = "Clutchkicks",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[108211] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Morsica-Dentarg",
			["npcID"] = 0,
		},
		[18401] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fokintank",
			["npcID"] = 0,
		},
		[77762] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[292359] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Busheedoo-Draenor",
			["npcID"] = 0,
		},
		[12323] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[266018] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[273947] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[281413] = {
			["source"] = "Píggeldy-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[128301] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 65409,
		},
		[268856] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Perazhen-Draenor",
			["npcID"] = 0,
		},
		[261769] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[274792] = {
			["source"] = "Released Crawg",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 140149,
		},
		[209195] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 105590,
		},
		[14514] = {
			["source"] = "Green Mage",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32324,
		},
		[77130] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Darkathe",
			["npcID"] = 0,
		},
		[257044] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sulea-Kil'jaeden",
			["npcID"] = 0,
		},
		[24717] = {
			["source"] = "Vanamarilla-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[48045] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Paeia-Aegwynn",
			["npcID"] = 0,
		},
		[18499] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nixius",
			["npcID"] = 0,
		},
		[52437] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[179750] = {
			["source"] = "Evapor-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[285721] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Weeheal",
			["npcID"] = 0,
		},
		[12611] = {
			["source"] = "Green Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32324,
		},
		[259388] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Årtisell",
			["npcID"] = 0,
		},
		[207076] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aburon-Blackrock",
			["npcID"] = 0,
		},
		[5308] = {
			["source"] = "Lanzhu",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[1330] = {
			["source"] = "Streider-Emeriss",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[232854] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Baihu-Terenas",
			["npcID"] = 0,
		},
		[58984] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[40625] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Фретхья-Ревущийфьорд",
			["npcID"] = 0,
		},
		[236320] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[294935] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kubbarn",
			["npcID"] = 0,
		},
		[268836] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[31707] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Water Elemental",
			["npcID"] = 78116,
		},
		[126892] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[44185] = {
			["source"] = "Headless Horseman",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 23682,
		},
		[148540] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279584] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[236321] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 119052,
		},
		[280608] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grimnoldy-DunMorogh",
			["npcID"] = 0,
		},
		[289308] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[201223] = {
			["source"] = "Fredii-Bronzebeard",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279302] = {
			["source"] = "Mínnì-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[107574] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nixius",
			["npcID"] = 0,
		},
		[276743] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[81219] = {
			["source"] = "Stonard Wardrummer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 46749,
		},
		[312372] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Marshpilloww",
			["npcID"] = 0,
		},
		[280121] = {
			["source"] = "Kiritus-Lordaeron",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[185422] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Primalpunk",
			["npcID"] = 0,
		},
		[15090] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gold Priest",
			["npcID"] = 32325,
		},
		[196941] = {
			["type"] = "DEBUFF",
			["source"] = "Skarís",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[110645] = {
			["source"] = "Nattramn",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[60520] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Priestmemes",
			["npcID"] = 0,
		},
		[66051] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jockemon-Genjuros",
			["npcID"] = 0,
		},
		[32379] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[289349] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[325174] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Unknown",
			["npcID"] = 53006,
		},
		[49184] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ryzma",
			["npcID"] = 0,
		},
		[263725] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Magghellesø",
			["npcID"] = 0,
		},
		[58921] = {
			["source"] = "Father Kamaros",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32800,
		},
		[131178] = {
			["source"] = "Pandaren Scarecrow",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 66768,
		},
		[215598] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chailong-Drak'thul",
			["npcID"] = 0,
		},
		[290337] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Âris",
			["npcID"] = 0,
		},
		[267330] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[187708] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Damsan",
			["npcID"] = 0,
		},
		[55211] = {
			["source"] = "Tartar-Garrosh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[691] = {
			["source"] = "Atheron-Ysera",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[2823] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Morsica-Dentarg",
			["npcID"] = 0,
		},
		[3411] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Äppelpipa",
			["npcID"] = 0,
		},
		[203847] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Aydrax-BurningLegion",
			["npcID"] = 0,
		},
		[306715] = {
			["source"] = "Oofxd",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[24735] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chestnut-Bloodhoof",
			["npcID"] = 0,
		},
		[272940] = {
			["source"] = "Ärthë-BurningBlade",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[57770] = {
			["source"] = "Green Paladin",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32342,
		},
		[205473] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[124213] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lamoyio",
			["npcID"] = 0,
		},
		[89798] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Lord Victor Nefarius",
			["npcID"] = 49799,
		},
		[160331] = {
			["source"] = "Yeanova",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[33943] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[5740] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Thiberiá-Shattrath",
			["npcID"] = 0,
		},
		[3409] = {
			["source"] = "Streider-Emeriss",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[127359] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 65450,
		},
		[162997] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sigwald-Ysera",
			["npcID"] = 0,
		},
		[165961] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zenkay",
			["npcID"] = 0,
		},
		[119996] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lothic-Aszune",
			["npcID"] = 0,
		},
		[302917] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kuldar",
			["npcID"] = 0,
		},
		[170823] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[197690] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bértì-Area52",
			["npcID"] = 0,
		},
		[180735] = {
			["source"] = "Hahnmann-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[305395] = {
			["source"] = "Rúffy",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[297034] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nemidae",
			["npcID"] = 0,
		},
		[56814] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Eritheas",
			["npcID"] = 0,
		},
		[116014] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[1464] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[17] = {
			["source"] = "Jôm",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[148563] = {
			["source"] = "Silensha-Doomhammer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268852] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nightfaith",
			["npcID"] = 0,
		},
		[61353] = {
			["source"] = "Dagna Flintlock",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 96779,
		},
		[173895] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[110648] = {
			["source"] = "Parawietje-Twilight'sHammer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101872] = {
			["source"] = "Eywá-Ulduar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[68992] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Røckû-Malorne",
			["npcID"] = 0,
		},
		[1079] = {
			["source"] = "Kalinana-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[222256] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Alghael-Magtheridon",
			["npcID"] = 0,
		},
		[268854] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[47536] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[1490] = {
			["type"] = "DEBUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[2983] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[190784] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Narcolies",
			["encounterID"] = 2331,
		},
		[287790] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Japitarr",
			["npcID"] = 0,
		},
		[102558] = {
			["source"] = "Drugath-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[20473] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Skarís",
			["encounterID"] = 2331,
		},
		[169291] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[122278] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[273974] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[257413] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Belfen-DunMorogh",
			["npcID"] = 0,
		},
		[287280] = {
			["type"] = "DEBUFF",
			["source"] = "Skarís",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[170838] = {
			["source"] = "Nitaraa-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[287827] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Årtisell",
			["npcID"] = 0,
		},
		[218164] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Larilis-Turalyon",
			["npcID"] = 0,
		},
		[264764] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sodim",
			["npcID"] = 0,
		},
		[1706] = {
			["source"] = "Voxyä",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[48265] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
		},
		[237611] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chuqal-Magtheridon",
			["npcID"] = 0,
		},
		[196770] = {
			["source"] = "Skydrop",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124211] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tettiis",
			["npcID"] = 0,
		},
		[69070] = {
			["source"] = "Vus-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[118326] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ik'thik Slicewing",
			["npcID"] = 59832,
		},
		[102383] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[267325] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[325153] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Cb-Terokkar",
			["npcID"] = 0,
		},
		[17253] = {
			["source"] = "Serpent",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 165189,
		},
		[176458] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Blacksmithing Follower - Horde",
			["npcID"] = 88402,
		},
		[267326] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[269885] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[24736] = {
			["source"] = "Khàleesy-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[130489] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 66367,
		},
		[267327] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306732] = {
			["type"] = "BUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[237613] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chuqal-Magtheridon",
			["npcID"] = 0,
		},
		[58180] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124212] = {
			["source"] = "Puschlinger-Arygos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306733] = {
			["type"] = "BUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[280634] = {
			["source"] = "Andala-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[118455] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bslayer",
			["npcID"] = 0,
		},
		[267329] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101871] = {
			["source"] = "Nitaraa-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[280635] = {
			["source"] = "Apatikus-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[275006] = {
			["source"] = "Barbara-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[141917] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Elyah-Kargath",
			["npcID"] = 0,
		},
		[281178] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[322109] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Bufftransmog",
			["npcID"] = 0,
		},
		[212283] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Wõrstplâÿêr",
			["npcID"] = 0,
		},
		[267331] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[48181] = {
			["source"] = "Шинафай-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[131171] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[101568] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hræðsla",
			["npcID"] = 0,
		},
		[254503] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Elyah-Kargath",
			["npcID"] = 0,
		},
		[160597] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fuggz",
			["npcID"] = 0,
		},
		[132578] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[100] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[116670] = {
			["source"] = "Naowhqt",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[235313] = {
			["source"] = "Malizian",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1604] = {
			["source"] = "Stonard Warrior",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 46166,
		},
		[312041] = {
			["source"] = "Vynren-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[254504] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arazni-Kargath",
			["npcID"] = 0,
		},
		[3219] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kelenken-BurningLegion",
			["npcID"] = 0,
		},
		[117952] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[264776] = {
			["source"] = "Kikísek-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[61295] = {
			["source"] = "Littlesqueak",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[273988] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[192081] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[2061] = {
			["source"] = "Helgurgoya",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[8220] = {
			["source"] = "Mêêrès",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[126389] = {
			["source"] = "Yaaru",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[79865] = {
			["source"] = "Marud",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 47247,
		},
		[188499] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[33721] = {
			["source"] = "Doggfather-Gilneas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1784] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
		},
		[97061] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gnunt-Khadgar",
			["npcID"] = 0,
		},
		[31589] = {
			["source"] = "Vortensis-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[44212] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Peterman-Dentarg",
			["npcID"] = 0,
		},
		[160600] = {
			["source"] = "Tallisker",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[6572] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Thorck-Dentarg",
			["npcID"] = 0,
		},
		[104264] = {
			["source"] = "Poll",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[271433] = {
			["source"] = "Overpowerd-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[208705] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Blutlust-DunMorogh",
			["npcID"] = 0,
		},
		[268893] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[223306] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gudinnan-Aszune",
			["npcID"] = 0,
		},
		[287810] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[114108] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Schattengirl-Khaz'goroth",
			["npcID"] = 0,
		},
		[125883] = {
			["source"] = "Torius-Teldrassil",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[65386] = {
			["source"] = "Catrina",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 34383,
		},
		[260402] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[212800] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[28703] = {
			["source"] = "Dudieins-Blackrock",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268877] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bslayer",
			["npcID"] = 0,
		},
		[206931] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Helvetesmakt",
			["npcID"] = 0,
		},
		[24705] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[51505] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[268878] = {
			["source"] = "Tralukas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[1680] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[110744] = {
			["source"] = "Krisette",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[256044] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Overseer Korgus",
			["npcID"] = 127503,
		},
		[322101] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[193753] = {
			["source"] = "Erzah-Rexxar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[209731] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hakota-Kil'jaeden",
			["npcID"] = 0,
		},
		[162906] = {
			["source"] = "Zurazz-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[78675] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[296003] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sarahsoftpaw",
			["npcID"] = 0,
		},
		[316985] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[176212] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[290361] = {
			["source"] = "Tralukas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[8078] = {
			["source"] = "Karam Magespear",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 116308,
		},
		[150369] = {
			["source"] = "Evapor-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[86603] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 61838,
		},
		[109248] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sibsu",
			["npcID"] = 0,
		},
		[119611] = {
			["source"] = "Castrec-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[206662] = {
			["source"] = "Oofxd",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[19236] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[272119] = {
			["source"] = "Aprix",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124217] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Coilband",
			["npcID"] = 0,
		},
		[133994] = {
			["source"] = "Aaxxa-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[212036] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Velopriest",
			["npcID"] = 0,
		},
		[313918] = {
			["source"] = "Laso",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[97108] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Racher",
			["npcID"] = 0,
		},
		[185763] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[257408] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Brannda-Kargath",
			["npcID"] = 0,
		},
		[272979] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[221886] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sailhatan",
			["npcID"] = 0,
		},
		[327225] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[203849] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Killwithme",
			["npcID"] = 0,
		},
		[185123] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[47540] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[127928] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Silkwood",
			["npcID"] = 0,
		},
		[2649] = {
			["source"] = "Serpent",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 165189,
		},
		[268887] = {
			["type"] = "BUFF",
			["source"] = "Skarís",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[124218] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chekicpravde",
			["npcID"] = 0,
		},
		[313948] = {
			["source"] = "Мдииай-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[203850] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Trekt-Nemesis",
			["npcID"] = 0,
		},
		[269123] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[275699] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miniaugdk",
			["encounterID"] = 2331,
		},
		[102341] = {
			["source"] = "Enemy Tonk",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 54642,
		},
		[297035] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Invöker",
			["npcID"] = 0,
		},
		[1766] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[217668] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[255941] = {
			["source"] = "Clutchkicks",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[293866] = {
			["source"] = "Muremasa-Zenedar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[96890] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pyrofire-Wrathbringer",
			["npcID"] = 0,
		},
		[127801] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 65310,
		},
		[280149] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Seonni-DefiasBrotherhood",
			["npcID"] = 0,
		},
		[297037] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[3563] = {
			["source"] = "Dustyippeeh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[124219] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gulo",
			["npcID"] = 0,
		},
		[24450] = {
			["source"] = "Humar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 165189,
		},
		[53365] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[108238] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[212552] = {
			["source"] = "Naowhlul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[102342] = {
			["source"] = "Nofox",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[297039] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cápii",
			["npcID"] = 0,
		},
		[184662] = {
			["source"] = "Nentalia-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[115008] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Turbofox",
			["npcID"] = 0,
		},
		[284275] = {
			["source"] = "Sakuma-Quel'Thalas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[297040] = {
			["source"] = "Zòrg",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268894] = {
			["source"] = "Мэдэнова-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[97097] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kalinnia-Doomhammer",
			["npcID"] = 0,
		},
		[182104] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[188501] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[225603] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Keallina",
			["npcID"] = 0,
		},
		[162402] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zopferl",
			["npcID"] = 0,
		},
		[5221] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[342076] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bejjz",
			["npcID"] = 0,
		},
		[1822] = {
			["source"] = "Kalinana-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[16870] = {
			["source"] = "Dildobaggins-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[73685] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[333889] = {
			["source"] = "Tikigirl",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268897] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Iplaygolf",
			["npcID"] = 0,
		},
		[5277] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101838] = {
			["source"] = "Aaxxa-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[303211] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Takuya-Turalyon",
			["npcID"] = 0,
		},
		[63106] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Deepshades",
			["encounterID"] = 2331,
		},
		[298068] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ophio-Turalyon",
			["npcID"] = 0,
		},
		[44535] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[11426] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
		},
		[252216] = {
			["source"] = "Unschärfe-Nathrezim",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[281209] = {
			["source"] = "Construct-EmeraldDream",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[1850] = {
			["source"] = "Defilia",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[55090] = {
			["source"] = "Naowhlul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[8679] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Xtremly",
			["npcID"] = 0,
		},
		[1856] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[306090] = {
			["type"] = "BUFF",
			["source"] = "Essence of Vita",
			["npcID"] = 156884,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[156079] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kungfa-Ysera",
			["npcID"] = 0,
		},
		[268901] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Psyanide",
			["npcID"] = 0,
		},
		[2120] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[54710] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[313424] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Reikerogue-DunMorogh",
			["npcID"] = 0,
		},
		[31935] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[38204] = {
			["source"] = "Unbound Seer",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 33422,
		},
		[44425] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tørrfisken",
			["npcID"] = 0,
		},
		[61999] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miniaugdk",
			["encounterID"] = 2331,
		},
		[132483] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arazni-Kargath",
			["npcID"] = 0,
		},
		[66906] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hotchili",
			["npcID"] = 0,
		},
		[223203] = {
			["source"] = "Naowhlul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[106830] = {
			["source"] = "Vilkodud",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[118] = {
			["source"] = "Aivornom",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[32223] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Palnox",
			["npcID"] = 0,
		},
		[312915] = {
			["source"] = "Doccý",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[19366] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Ancient Core Hound",
			["npcID"] = 11673,
		},
		[268905] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[241222] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Camlen-Draenor",
			["npcID"] = 0,
		},
		[286305] = {
			["source"] = "Varok Saurfang",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 146011,
		},
		[48438] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[121536] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Rycn",
			["npcID"] = 0,
		},
		[280615] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[231390] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hotshot",
			["npcID"] = 0,
		},
		[206930] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[20615] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Gold Warrior",
			["npcID"] = 32322,
		},
		[221771] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[268895] = {
			["source"] = "Tralukas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[156779] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ingeraskurai-Saurfang",
			["npcID"] = 0,
		},
		[268908] = {
			["source"] = "Tralukas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[3839] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fokintank",
			["npcID"] = 0,
		},
		[250956] = {
			["source"] = "Sàul-Rexxar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[65628] = {
			["source"] = "Captured Razormane",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 34523,
		},
		[316531] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Äppelpipa",
			["npcID"] = 0,
		},
		[223819] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pall",
			["npcID"] = 0,
		},
		[209746] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[185438] = {
			["source"] = "Twocut",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[318038] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Darkathe",
			["npcID"] = 0,
		},
		[156077] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sverak-Magtheridon",
			["npcID"] = 0,
		},
		[42919] = {
			["source"] = "Morweneil-Turalyon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[316007] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Schattengirl-Khaz'goroth",
			["npcID"] = 0,
		},
		[105174] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[152175] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[12470] = {
			["source"] = "Gold Shaman",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32340,
		},
		[15572] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Constable Astley",
			["npcID"] = 142371,
		},
		[122] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[154797] = {
			["source"] = "Phyn-EmeraldDream",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279709] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[65629] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Captured Razormane",
			["npcID"] = 34523,
		},
		[24709] = {
			["source"] = "Lykka-Dentarg",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[84308] = {
			["source"] = "Nightbane Worgen",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 898,
		},
		[332083] = {
			["source"] = "Crusader Renn",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 170445,
		},
		[181346] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Amani Bear",
			["npcID"] = 130256,
		},
		[1966] = {
			["type"] = "BUFF",
			["source"] = "Iklaus",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[241221] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Minxiao-Lightbringer",
			["npcID"] = 0,
		},
		[261947] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[117828] = {
			["source"] = "Shaagar-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[259140] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Innócent",
			["npcID"] = 0,
		},
		[306273] = {
			["type"] = "DEBUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[209749] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[246851] = {
			["source"] = "Ejie",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[134522] = {
			["source"] = "Kudkoeman-Vek'nilash",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[312415] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 160465,
		},
		[94160] = {
			["source"] = "Tigerpala-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[247121] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[199003] = {
			["source"] = "Moosebonk-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[43194] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Yubelle-Blackrock",
			["npcID"] = 0,
		},
		[102227] = {
			["source"] = "Enemy Tonk",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 54642,
		},
		[262794] = {
			["source"] = "Venture Co. Mastermind",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 133430,
		},
		[154796] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Affore-Saurfang",
			["npcID"] = 0,
		},
		[241223] = {
			["source"] = "Scamàz-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[280177] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Koalasonv",
			["npcID"] = 0,
		},
		[19750] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Drzd-Blackmoore",
			["npcID"] = 0,
		},
		[17735] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Graz'mon",
			["npcID"] = 1860,
		},
		[273525] = {
			["source"] = "Sàul-Rexxar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[11974] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32343,
		},
		[192106] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Stormar",
			["npcID"] = 0,
		},
		[191840] = {
			["source"] = "Джомамма-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[241224] = {
			["source"] = "Nenosan-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[54261] = {
			["source"] = "Green Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32324,
		},
		[12054] = {
			["source"] = "Amani Warrior",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 120900,
		},
		[193333] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Votro-Ysera",
			["npcID"] = 0,
		},
		[306279] = {
			["type"] = "DEBUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[13750] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[257102] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[8116] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Skuggachan",
			["npcID"] = 0,
		},
		[241225] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Camlen-Draenor",
			["npcID"] = 0,
		},
		[292463] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pall",
			["npcID"] = 0,
		},
		[24331] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Harbor Saurid",
			["npcID"] = 126023,
		},
		[101260] = {
			["source"] = "Darkmoon Faire Mystic Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 54334,
		},
		[48518] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[219988] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[288882] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Garrik-Baelgun",
			["npcID"] = 0,
		},
		[120517] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Priestmemes",
			["npcID"] = 0,
		},
		[241226] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kev-Vek'nilash",
			["npcID"] = 0,
		},
		[12294] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[255098] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Iplaygolf",
			["npcID"] = 0,
		},
		[253895] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Bootehbae-Draenor",
			["npcID"] = 0,
		},
		[45242] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[24708] = {
			["source"] = "Gorich-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[24740] = {
			["source"] = "Vanamarilla-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[132480] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nivilem",
			["npcID"] = 0,
		},
		[257103] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[344179] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Luvmuscle",
			["npcID"] = 0,
		},
		[315496] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Morsica-Dentarg",
			["npcID"] = 0,
		},
		[147833] = {
			["source"] = "Ichasi",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[281721] = {
			["type"] = "DEBUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[258883] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[95826] = {
			["source"] = "Harbor Guard",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 142450,
		},
		[188313] = {
			["source"] = "Vldolock-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[202335] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Háon",
			["npcID"] = 0,
		},
		[12550] = {
			["source"] = "Deadwind Ogre Mage",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 7379,
		},
		[79962] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 96946,
		},
		[221526] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Killerkick-Saurfang",
			["npcID"] = 0,
		},
		[316522] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[142205] = {
			["source"] = "Chork-Dentarg",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[109132] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[152952] = {
			["source"] = "Kinelory-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[281724] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[278244] = {
			["source"] = "Overpowerd-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[264667] = {
			["source"] = "Wolf",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 165189,
		},
		[221527] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[69369] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hakota-Kil'jaeden",
			["npcID"] = 0,
		},
		[48889] = {
			["source"] = "Palomà",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[114250] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[136] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mexivina-Doomhammer",
			["npcID"] = 0,
		},
		[5487] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cõrntèën",
			["npcID"] = 0,
		},
		[343648] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[274598] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[215387] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chailong-Drak'thul",
			["npcID"] = 0,
		},
		[43196] = {
			["source"] = "Elowen-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[250960] = {
			["source"] = "Sàul-Rexxar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[212061] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sandfury Assassin",
			["npcID"] = 129525,
		},
		[276111] = {
			["source"] = "Qualbam-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[206432] = {
			["source"] = "Icebebe-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53751] = {
			["source"] = "Doggfather-Gilneas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[153722] = {
			["source"] = "Lunabel-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[139] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lengyu",
			["npcID"] = 0,
		},
		[192090] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[87024] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Planzo-Mannoroth",
			["npcID"] = 0,
		},
		[257096] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[30146] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wazkakle",
			["npcID"] = 0,
		},
		[104272] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zopferl",
			["npcID"] = 0,
		},
		[194384] = {
			["source"] = "Rootsman-Zenedar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[45181] = {
			["source"] = "Cirro-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[43198] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Yubelle-Blackrock",
			["npcID"] = 0,
		},
		[267402] = {
			["source"] = "Clutchkicks",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[275094] = {
			["source"] = "Bouchh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[257097] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[314484] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[9080] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32321,
		},
		[198813] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[183752] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[9128] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32322,
		},
		[3716] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Graz'mon",
			["npcID"] = 1860,
		},
		[335467] = {
			["source"] = "Ønly-Garrosh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[55095] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Ryzma",
			["npcID"] = 0,
		},
		[281404] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aleila",
			["npcID"] = 0,
		},
		[104273] = {
			["source"] = "Nikodan-Mazrigos",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[77758] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[224869] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Softwaree",
			["npcID"] = 0,
		},
		[90328] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 165189,
		},
		[43197] = {
			["source"] = "Lesterish",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[179057] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[257099] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[280286] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[2336] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bayerweizen-Blackmoore",
			["npcID"] = 0,
		},
		[298197] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[280713] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kim-Kargath",
			["npcID"] = 0,
		},
		[156071] = {
			["source"] = "Rikara-Darkspear",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[105809] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mirí",
			["npcID"] = 0,
		},
		[231895] = {
			["type"] = "BUFF",
			["source"] = "Narcolies",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[73313] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Argynvosth-Kazzak",
			["npcID"] = 0,
		},
		[77535] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[104274] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sverak-Magtheridon",
			["npcID"] = 0,
		},
		[263840] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolf",
			["npcID"] = 165189,
		},
		[15043] = {
			["source"] = "Green Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32324,
		},
		[12042] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Artazar",
			["npcID"] = 0,
		},
		[267410] = {
			["source"] = "Clutchkicks",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[280204] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[257101] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[56641] = {
			["source"] = "Rionakamura",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[18266] = {
			["source"] = "Underbelly Lowlife",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 116323,
		},
		[280205] = {
			["source"] = "Ownashs-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[102359] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[29348] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gringô-Sen'jin",
			["npcID"] = 0,
		},
		[238167] = {
			["source"] = "Ocîsly",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[48891] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[195692] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Elyah-Kargath",
			["npcID"] = 0,
		},
		[126664] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[104275] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nivilem",
			["npcID"] = 0,
		},
		[45053] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gokù-BurningLegion",
			["npcID"] = 0,
		},
		[286581] = {
			["source"] = "Streider-Emeriss",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[190831] = {
			["source"] = "Zerkadin-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[195181] = {
			["source"] = "Kudkoeman-Vek'nilash",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306819] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[51514] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[195949] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[97111] = {
			["source"] = "Oldshade",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[202602] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dengzi",
			["npcID"] = 0,
		},
		[155777] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Cyclus",
			["npcID"] = 0,
		},
		[105683] = {
			["source"] = "Illoxanda-Khaz'goroth",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[195182] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[2484] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[257104] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[279187] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[221543] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chiiqui-Stormreaver",
			["npcID"] = 0,
		},
		[24714] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[79968] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 61839,
		},
		[268953] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[129352] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Velioz",
			["npcID"] = 0,
		},
		[115151] = {
			["source"] = "Castrec-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[212056] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Skarís",
			["npcID"] = 0,
		},
		[268954] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[97112] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 0,
		},
		[284307] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nousuhumala-Bloodfeather",
			["npcID"] = 0,
		},
		[192473] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jockemon-Genjuros",
			["npcID"] = 0,
		},
		[93402] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[80868] = {
			["source"] = "Wetzstahl",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[48892] = {
			["source"] = "Sanctuserror-AeriePeak",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[220260] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[299661] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jopahe-Perenolde",
			["npcID"] = 0,
		},
		[104277] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Wowolf",
			["npcID"] = 0,
		},
		[97115] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bren",
			["npcID"] = 0,
		},
		[73320] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tìpsy",
			["npcID"] = 0,
		},
		[299662] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Warcolk",
			["npcID"] = 0,
		},
		[300174] = {
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[2580] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Warmo",
			["npcID"] = 0,
		},
		[264352] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Darslan",
			["npcID"] = 0,
		},
		[281240] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vampíré",
			["npcID"] = 0,
		},
		[97113] = {
			["source"] = "Bargura-Tichondrius",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[172] = {
			["source"] = "Tiraz-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[35395] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[299664] = {
			["source"] = "Aggasti",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279715] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[293714] = {
			["source"] = "Mbär-Kargath",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[298700] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lambard-AzjolNerub",
			["npcID"] = 0,
		},
		[35715] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Baggae",
			["npcID"] = 0,
		},
		[45438] = {
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[317065] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Spoìl",
			["npcID"] = 0,
		},
		[188534] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Missveja-Terokkar",
			["npcID"] = 0,
		},
		[131474] = {
			["source"] = "Barathos-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[238174] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dreanda-Blackrock",
			["npcID"] = 0,
		},
		[80354] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Koalasonv",
			["npcID"] = 0,
		},
		[297108] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[44415] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32343,
		},
		[123725] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[300691] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Àhp",
			["npcID"] = 0,
		},
		[123981] = {
			["source"] = "Rinnera-Aszune",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[209261] = {
			["source"] = "Алермион-ВечнаяПесня",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[296086] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[343737] = {
			["source"] = "Yu'lon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 165374,
		},
		[6660] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Constable Astley",
			["npcID"] = 142371,
		},
		[44544] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[257622] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[300693] = {
			["source"] = "Shaagar-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[333957] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[221544] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Thetick-Khadgar",
			["npcID"] = 0,
		},
		[8219] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sodim",
			["npcID"] = 0,
		},
		[35076] = {
			["source"] = "Wüstensturm-Aman'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53563] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hideki",
			["npcID"] = 0,
		},
		[247676] = {
			["source"] = "Krenoc-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[224871] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Camerian-Alleria",
			["npcID"] = 0,
		},
		[122470] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[273310] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[221545] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chiiqui-Stormreaver",
			["npcID"] = 0,
		},
		[298800] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[138130] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 69792,
		},
		[8921] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[259415] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Johnsinclair",
			["npcID"] = 0,
		},
		[345219] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[33917] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[17962] = {
			["source"] = "Shaagar-BurningLegion",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[137619] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[215661] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pall",
			["npcID"] = 0,
		},
		[236645] = {
			["source"] = "Sonyanemska-Neptulon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[323727] = {
			["source"] = "Zealous Neophyte",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 170166,
		},
		[24394] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Boar",
			["npcID"] = 165189,
		},
		[97116] = {
			["source"] = "Ipmanda",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[290464] = {
			["source"] = "Spectrall-Arathor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[297117] = {
			["source"] = "Xerafisk",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[116841] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[15286] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[202636] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hakota-Kil'jaeden",
			["npcID"] = 0,
		},
		[259161] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Amvrosham",
			["npcID"] = 0,
		},
		[264878] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bejjz",
			["npcID"] = 0,
		},
		[102560] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[295186] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Swagstép",
			["encounterID"] = 2331,
		},
		[196728] = {
			["npcID"] = 73967,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Niuzao",
			["encounterID"] = 2331,
		},
		[221548] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Antífact-Draenor",
			["npcID"] = 0,
		},
		[196733] = {
			["source"] = "Naowhqt",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[290467] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bobbitt",
			["npcID"] = 0,
		},
		[201846] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Luvmuscle",
			["npcID"] = 0,
		},
		[47541] = {
			["source"] = "Naowhlul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[119381] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[290468] = {
			["source"] = "Spectberom",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[267612] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[188034] = {
			["source"] = "Immark",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[22888] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[43265] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miniaugdk",
			["encounterID"] = 2331,
		},
		[280746] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rashq-DunMorogh",
			["npcID"] = 0,
		},
		[144787] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Magharry",
			["npcID"] = 0,
		},
		[185476] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Krandalf-Ambossar",
			["npcID"] = 0,
		},
		[268956] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[217200] = {
			["source"] = "Ejie",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[221550] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chuqal-Magtheridon",
			["npcID"] = 0,
		},
		[7837] = {
			["source"] = "Ondae",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[199545] = {
			["source"] = "Barbaru-Ysera",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124506] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[242551] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Muwei-Draenor",
			["npcID"] = 0,
		},
		[188031] = {
			["source"] = "Gaía-Destromath",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[173958] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[148627] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Сплюшка-Ревущийфьорд",
			["npcID"] = 0,
		},
		[30449] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[271538] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[134810] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kae Ti",
			["npcID"] = 68402,
		},
		[297126] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[117526] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sulea-Kil'jaeden",
			["npcID"] = 0,
		},
		[19434] = {
			["source"] = "Rionakamura",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[2948] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[210294] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dopebae-Drak'thul",
			["npcID"] = 0,
		},
		[188800] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Taureid-Darkspear",
			["npcID"] = 0,
		},
		[326809] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Bloodview-Terrordar",
			["npcID"] = 0,
		},
		[2964] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Estreja-DunMorogh",
			["npcID"] = 0,
		},
		[195457] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mechanix",
			["npcID"] = 0,
		},
		[29893] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Deepshades",
			["npcID"] = 0,
		},
		[188033] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nousuhumala-Bloodfeather",
			["npcID"] = 0,
		},
		[190336] = {
			["source"] = "Vortensis-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[123986] = {
			["source"] = "Chailong-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[57724] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Ruffelgnob",
			["npcID"] = 0,
		},
		[162794] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[11976] = {
			["source"] = "Marshtide Footman",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 46164,
		},
		[11640] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Green Priest",
			["npcID"] = 32343,
		},
		[198013] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[271543] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[188290] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[79976] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 61840,
		},
		[272260] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shaw-Nefarian",
			["npcID"] = 0,
		},
		[271544] = {
			["source"] = "Xerathas",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[312996] = {
			["type"] = "BUFF",
			["source"] = "Ra-den",
			["npcID"] = 156866,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[255074] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Alund",
			["npcID"] = 0,
		},
		[285362] = {
			["source"] = "Brentaria-Rexxar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[159902] = {
			["source"] = "Deimos",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[58875] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[186257] = {
			["source"] = "Pnaû",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[85222] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gudinnan-Aszune",
			["npcID"] = 0,
		},
		[185479] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ívy-DunMorogh",
			["npcID"] = 0,
		},
		[209785] = {
			["source"] = "Nevvi",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[278326] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[24712] = {
			["source"] = "Revoye-Vek'nilash",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124121] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Noseboy",
			["npcID"] = 0,
		},
		[79849] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 104091,
		},
		[79977] = {
			["source"] = "Alynblaze",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 98159,
		},
		[81262] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 47649,
		},
		[256611] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[238444] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Larilis-Turalyon",
			["npcID"] = 0,
		},
		[232559] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[121557] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rycn",
			["npcID"] = 0,
		},
		[197003] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53758] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Edziia-BurningLegion",
			["npcID"] = 0,
		},
		[53822] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Björndal-Kargath",
			["npcID"] = 0,
		},
		[176277] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[238189] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Todorokii",
			["npcID"] = 0,
		},
		[173956] = {
			["source"] = "Mortalism-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[73325] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[6262] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Deepshades",
			["encounterID"] = 2331,
		},
		[288343] = {
			["source"] = "Ønly-Garrosh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[260708] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lokras",
			["npcID"] = 0,
		},
		[34428] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[131490] = {
			["source"] = "Barathos-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306865] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[286393] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Prepatch-Aman'thul",
			["npcID"] = 0,
		},
		[22120] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pengsong",
			["npcID"] = 66587,
		},
		[185736] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sinoviiamonk",
			["npcID"] = 0,
		},
		[238191] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Monsi",
			["npcID"] = 0,
		},
		[1543] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gingì",
			["npcID"] = 0,
		},
		[65081] = {
			["source"] = "Minervus-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[147362] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kirau",
			["npcID"] = 0,
		},
		[322729] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[310959] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Glyphed Obelisk",
			["npcID"] = 159490,
		},
		[61243] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Муррняша-Ревущийфьорд",
			["npcID"] = 0,
		},
		[281792] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Яйцосудьбы-Ревущийфьорд",
			["npcID"] = 0,
		},
		[85739] = {
			["source"] = "Woobea-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[306866] = {
			["npcID"] = 156866,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ra-den",
			["encounterID"] = 2331,
		},
		[61684] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 165189,
		},
		[289467] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[88423] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Maion-Blackmoore",
			["npcID"] = 0,
		},
		[23881] = {
			["source"] = "Lanzhu",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[185482] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ursu-Dentarg",
			["npcID"] = 0,
		},
		[268998] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[115546] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[281744] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chitros-Draenor",
			["npcID"] = 0,
		},
		[196741] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[131493] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Côsma-Alleria",
			["npcID"] = 0,
		},
		[215607] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chailong-Drak'thul",
			["npcID"] = 0,
		},
		[203650] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[79468] = {
			["source"] = "Tiowen-Executus",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[245102] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Devlynn Styx",
			["npcID"] = 121527,
		},
		[11417] = {
			["source"] = "Lígeia-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[198533] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 60849,
		},
		[196742] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[258920] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[281795] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Яйцосудьбы-Ревущийфьорд",
			["npcID"] = 0,
		},
		[150429] = {
			["source"] = "Evapor-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[172010] = {
			["source"] = "Ateya",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[84714] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[225158] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Missveja-Terokkar",
			["npcID"] = 0,
		},
		[298836] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sodim",
			["npcID"] = 0,
		},
		[24713] = {
			["source"] = "Vechain-Magtheridon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[768] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Córntéén",
			["npcID"] = 0,
		},
		[166550] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Estreja-DunMorogh",
			["npcID"] = 0,
		},
		[32645] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[124503] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[288158] = {
			["source"] = "Cráckson-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[255595] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tide Lurker",
			["npcID"] = 126237,
		},
		[273232] = {
			["source"] = "Lillidàn-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[114780] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Сэфаэль-Ревущийфьорд",
			["npcID"] = 0,
		},
		[250284] = {
			["source"] = "Scrollsage Rooka",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 125312,
		},
		[201350] = {
			["source"] = "Tolik-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[343721] = {
			["source"] = "Clutchkicks",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[265754] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gurubashi Thug",
			["npcID"] = 125458,
		},
		[314040] = {
			["source"] = "Мдииай-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[191587] = {
			["type"] = "DEBUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[186254] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hamelun-Rexxar",
			["npcID"] = 0,
		},
		[115804] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[176203] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279754] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kfclover-Aegwynn",
			["npcID"] = 0,
		},
		[196980] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
		},
		[281791] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Tokiomi",
			["npcID"] = 0,
		},
		[100068] = {
			["source"] = "Crone's Broom",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 53761,
		},
		[98008] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nineshock",
			["npcID"] = 0,
		},
		[343724] = {
			["source"] = "Schten-Ravencrest",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[198793] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["npcID"] = 0,
		},
		[137639] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Clintoris-Drak'thul",
			["npcID"] = 0,
		},
		[3408] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Iklaus",
			["npcID"] = 0,
		},
		[298703] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hotshot",
			["npcID"] = 0,
		},
		[280780] = {
			["source"] = "Pogkaku",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[189838] = {
			["source"] = "Ophio-Turalyon",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[41635] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lengyu",
			["npcID"] = 0,
		},
		[13704] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32343,
		},
		[48707] = {
			["source"] = "Naowhlul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101604] = {
			["source"] = "Dulragg-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[114014] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Swagstép",
			["encounterID"] = 2331,
		},
		[116189] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[210053] = {
			["source"] = "Sturmgeist-DieewigeWacht",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[196718] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[113746] = {
			["type"] = "DEBUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[139176] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ardaya",
			["npcID"] = 0,
		},
		[278736] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Innócent",
			["npcID"] = 0,
		},
		[156064] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hellblazzer",
			["npcID"] = 0,
		},
		[205448] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[97109] = {
			["source"] = "Urijana-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[246152] = {
			["source"] = "Ejie",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[240418] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Puma-EmeraldDream",
			["npcID"] = 0,
		},
		[165532] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[186258] = {
			["source"] = "Pnaû",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[315584] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Iklaus",
			["npcID"] = 0,
		},
		[108366] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[296138] = {
			["source"] = "Krisette",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[11977] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 46166,
		},
		[297162] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[264761] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sodim",
			["npcID"] = 0,
		},
		[24710] = {
			["source"] = "Bujie-Alonsus",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[251836] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ramin",
			["npcID"] = 0,
		},
		[7845] = {
			["source"] = "Ondae",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[298839] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shenguni-Blackmoore",
			["npcID"] = 0,
		},
		[284277] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Guzaj-BurningLegion",
			["npcID"] = 0,
		},
		[203894] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 103112,
		},
		[32736] = {
			["source"] = "Green Warrior",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32321,
		},
		[316099] = {
			["source"] = "Шинафай-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[292364] = {
			["source"] = "Response",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[290512] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Babá-Kazzak",
			["npcID"] = 0,
		},
		[44614] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[166302] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 101527,
		},
		[36554] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
		},
		[24711] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Technoalex",
			["npcID"] = 0,
		},
		[22568] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[57723] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Jeanclaude-Nordrassil",
			["npcID"] = 0,
		},
		[8092] = {
			["source"] = "Delek",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[39586] = {
			["source"] = "Gold Shaman",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32340,
		},
		[264415] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mara-Anetheron",
			["npcID"] = 0,
		},
		[5143] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tørrfisken",
			["npcID"] = 0,
		},
		[3600] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 2630,
		},
		[205708] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[343173] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Xtremly",
			["npcID"] = 0,
		},
		[194679] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[227151] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Wõrstplâÿêr",
			["npcID"] = 0,
		},
		[190356] = {
			["source"] = "Icebebe-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[288981] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pyrofire-Wrathbringer",
			["npcID"] = 0,
		},
		[316043] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Damatain-Thrall",
			["npcID"] = 0,
		},
		[5215] = {
			["source"] = "Dildobaggins-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[56487] = {
			["source"] = "Tartar-Garrosh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[199027] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nazula",
			["npcID"] = 0,
		},
		[188196] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[277724] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[186263] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[80610] = {
			["source"] = "Catherine Leland",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 5494,
		},
		[156070] = {
			["source"] = "Sadh-Doomhammer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[203407] = {
			["source"] = "Moosecake",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[12544] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 474,
		},
		[264420] = {
			["source"] = "Naowhtwo",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[48517] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[138927] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[345209] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[163201] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Aiemlia",
			["npcID"] = 0,
		},
		[59008] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sinewy Wolf",
			["npcID"] = 31233,
		},
		[29544] = {
			["source"] = "Green Warrior",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32321,
		},
		[240510] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Эррис-Ревущийфьорд",
			["npcID"] = 0,
		},
		[257107] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[31687] = {
			["source"] = "Icebebe-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[204432] = {
			["source"] = "Друммаш-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[304851] = {
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[270564] = {
			["source"] = "Røgnârr-Shattrath",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[268955] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Rollharris-Terenas",
			["npcID"] = 0,
		},
		[176798] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Teutatos",
			["npcID"] = 0,
		},
		[51460] = {
			["source"] = "Naowhlul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[138417] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Erzulie",
			["npcID"] = 0,
		},
		[57729] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Brannda-Kargath",
			["npcID"] = 0,
		},
		[295047] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Luvineggz-Blackmoore",
			["npcID"] = 0,
		},
		[288477] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Thorpala",
			["npcID"] = 0,
		},
		[20707] = {
			["source"] = "Shaagar-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[156073] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nayev",
			["npcID"] = 0,
		},
		[277731] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[259455] = {
			["source"] = "Karaluxa-Doomhammer",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[138418] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Erzulie",
			["npcID"] = 0,
		},
		[28105] = {
			["source"] = "Jelno-Gilneas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[264760] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sodim",
			["npcID"] = 0,
		},
		[300761] = {
			["source"] = "Shaagar-BurningLegion",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[308189] = {
			["source"] = "Pnaû",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[194153] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[48890] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Racher",
			["npcID"] = 0,
		},
		[300762] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[138419] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Erzulie",
			["npcID"] = 0,
		},
		[34189] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 110737,
		},
		[231046] = {
			["source"] = "Deadlybush",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[270058] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nemidae",
			["npcID"] = 0,
		},
		[120] = {
			["source"] = "Icebebe-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[214621] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[8936] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[303344] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[138420] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Erzulie",
			["npcID"] = 0,
		},
		[259449] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dämmertanz-Alleria",
			["npcID"] = 0,
		},
		[128229] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wowolf",
			["npcID"] = 0,
		},
		[257095] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Misí",
			["npcID"] = 0,
		},
		[104773] = {
			["type"] = "BUFF",
			["source"] = "Deepshades",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[74589] = {
			["source"] = "Navaras-Gul'dan",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[102351] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Storjole",
			["npcID"] = 0,
		},
		[182512] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Nivilem",
			["npcID"] = 0,
		},
		[295137] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[16591] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Jaimee-Blackmoore",
			["npcID"] = 0,
		},
		[261602] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pandamónium-Xavius",
			["npcID"] = 0,
		},
		[274156] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Appelflapje",
			["npcID"] = 0,
		},
		[78674] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Zaeliamacbit",
			["npcID"] = 0,
		},
		[81141] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[46585] = {
			["source"] = "Mínnì-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[62574] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mmr-Malorne",
			["npcID"] = 0,
		},
		[268528] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[2006] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Skräckslagen",
			["npcID"] = 0,
		},
		[8004] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[7814] = {
			["source"] = "Aelaith",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 1863,
		},
		[270576] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[227723] = {
			["type"] = "BUFF",
			["source"] = "Gingì",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[6788] = {
			["source"] = "Jôm",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[80726] = {
			["source"] = "Rhalina-Baelgun",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[200025] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Mirí",
			["npcID"] = 0,
		},
		[29385] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Green Paladin",
			["npcID"] = 32342,
		},
		[7870] = {
			["source"] = "Glynvina",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 1863,
		},
		[54452] = {
			["source"] = "Anathèma-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[236021] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[101612] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[302307] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[259387] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Damsan",
			["npcID"] = 0,
		},
		[278767] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Luvineggz-Blackmoore",
			["npcID"] = 0,
		},
		[191920] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kairli-Darkspear",
			["npcID"] = 0,
		},
		[256739] = {
			["source"] = "Tikita",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[19134] = {
			["source"] = "Green Warrior",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32321,
		},
		[182993] = {
			["source"] = "Ndinga-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[32911] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Summoned Windfury Totem",
			["npcID"] = 22897,
		},
		[188370] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[268904] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[25771] = {
			["source"] = "Raenar",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[259454] = {
			["source"] = "Míller",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279793] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Schattengirl-Khaz'goroth",
			["npcID"] = 0,
		},
		[270070] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Trinia",
			["npcID"] = 0,
		},
		[268902] = {
			["source"] = "Tralukas",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[75002] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Black Ravager",
			["npcID"] = 628,
		},
		[197277] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[116] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[20271] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[54149] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Drzd-Blackmoore",
			["npcID"] = 0,
		},
		[268899] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[83958] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Corpscollect",
			["npcID"] = 0,
		},
		[313571] = {
			["type"] = "BUFF",
			["source"] = "Miniaugdk",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[130] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Inflamar",
			["npcID"] = 0,
		},
		[281843] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[115175] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Callyrolls-Terenas",
			["npcID"] = 0,
		},
		[188246] = {
			["source"] = "Arlaton",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[322118] = {
			["source"] = "Mistí-Turalyon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[341207] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272121] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Yenian",
			["npcID"] = 0,
		},
		[53390] = {
			["source"] = "Littlesqueak",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[289521] = {
			["source"] = "Naowhqt",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[287825] = {
			["source"] = "Vldolock-Drak'thul",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[273453] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lënny-Kel'Thuzad",
			["npcID"] = 0,
		},
		[274009] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Helvetesmakt",
			["npcID"] = 0,
		},
		[257410] = {
			["source"] = "Fisfia",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[34767] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[59395] = {
			["source"] = "Wickerman Guardian",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 15195,
		},
		[51271] = {
			["source"] = "Mínnì-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[289523] = {
			["source"] = "Wulamula",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[51399] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Decrept",
			["npcID"] = 0,
		},
		[304603] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Palachat-Hyjal",
			["npcID"] = 0,
		},
		[40120] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zarkifx",
			["npcID"] = 0,
		},
		[289524] = {
			["source"] = "Wulamula",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[163505] = {
			["source"] = "Kalinana-DunMorogh",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[130347] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 0,
		},
		[141928] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Elyah-Kargath",
			["npcID"] = 0,
		},
		[164273] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Asdfhej",
			["npcID"] = 0,
		},
		[275544] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[272126] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Molfar-Terokkar",
			["npcID"] = 0,
		},
		[158900] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pepsímax",
			["npcID"] = 0,
		},
		[90928] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ik'thik Slicewing",
			["npcID"] = 59832,
		},
		[56261] = {
			["source"] = "Alcarj-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[104430] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Pepsímax",
			["npcID"] = 0,
		},
		[198817] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nixius",
			["npcID"] = 0,
		},
		[54406] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nightfaith",
			["npcID"] = 0,
		},
		[294133] = {
			["source"] = "Мдииай-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[247225] = {
			["source"] = "Cocolores-Blackrock",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[303345] = {
			["source"] = "Мдииай-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[29386] = {
			["source"] = "Green Paladin",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32342,
		},
		[304369] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shardolight",
			["npcID"] = 0,
		},
		[6343] = {
			["source"] = "Floorpov",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[18562] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[128227] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wowolf",
			["npcID"] = 0,
		},
		[269571] = {
			["source"] = "Røgnârr-Shattrath",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[201633] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Earthen Wall Totem",
			["npcID"] = 100943,
		},
		[114282] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Schattengirl-Khaz'goroth",
			["npcID"] = 0,
		},
		[95987] = {
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[120679] = {
			["source"] = "Друммаш-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[268756] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Cb-Terokkar",
			["npcID"] = 0,
		},
		[67713] = {
			["source"] = "Amethor-Quel'Thalas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[276026] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hakota-Kil'jaeden",
			["npcID"] = 0,
		},
		[304372] = {
			["source"] = "Lazkazbrez",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[157228] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[342242] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Exile-Blackmoore",
			["npcID"] = 0,
		},
		[257415] = {
			["source"] = "Mistypops-Draenor",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[56467] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[55342] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Brainfreezer-Malorne",
			["npcID"] = 0,
		},
		[168115] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mázikeen-Khaz'goroth",
			["npcID"] = 0,
		},
		[128228] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wowolf",
			["npcID"] = 0,
		},
		[279810] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vrylol",
			["npcID"] = 0,
		},
		[294966] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vetrex",
			["npcID"] = 0,
		},
		[212182] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[97058] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dicscampi",
			["npcID"] = 0,
		},
		[269576] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Bejjz",
			["npcID"] = 0,
		},
		[100030] = {
			["source"] = "Crone's Broom",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 53761,
		},
		[342245] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lonathas",
			["npcID"] = 0,
		},
		[281402] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Budica-Frostmane",
			["npcID"] = 0,
		},
		[289324] = {
			["source"] = "Naowhqt",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[201636] = {
			["source"] = "Pandoraw-AzjolNerub",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[342246] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lonathas",
			["npcID"] = 0,
		},
		[153860] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gale",
			["npcID"] = 0,
		},
		[167898] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[49966] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Oxen",
			["npcID"] = 165189,
		},
		[342247] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lonathas",
			["npcID"] = 0,
		},
		[48778] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Hræðsla",
			["npcID"] = 0,
		},
		[128150] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[16739] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lonathas",
			["npcID"] = 0,
		},
		[301308] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[108271] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[34769] = {
			["source"] = "Raenar",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[191837] = {
			["source"] = "Джомамма-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[170820] = {
			["source"] = "Alluriel-Sen'jin",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[180736] = {
			["source"] = "Hahnmann-Alleria",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[24723] = {
			["source"] = "Gorich-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[104945] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Boralus Civilian",
			["npcID"] = 135603,
		},
		[127357] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chillwater Turtle",
			["npcID"] = 62160,
		},
		[53281] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[2337] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Myggaktivera",
			["npcID"] = 0,
		},
		[55016] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jespo-Onyxia",
			["npcID"] = 0,
		},
		[298009] = {
			["source"] = "Мегасс-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[108853] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Emmauwutson-Ysera",
			["npcID"] = 0,
		},
		[285959] = {
			["type"] = "BUFF",
			["source"] = "Mêêres",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[77764] = {
			["source"] = "Дудубу-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[204336] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[257420] = {
			["source"] = "Karuson-Teldrassil",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[237615] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Chuqal-Magtheridon",
			["npcID"] = 0,
		},
		[18960] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Urarnos",
			["npcID"] = 0,
		},
		[116844] = {
			["source"] = "Джомамма-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[6807] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[275936] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ezgrim",
			["npcID"] = 0,
		},
		[115181] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mêêres",
			["encounterID"] = 2331,
		},
		[23214] = {
			["source"] = "Lamo",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[279572] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Øxy-Un'Goro",
			["npcID"] = 0,
		},
		[292361] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Palnox",
			["npcID"] = 0,
		},
		[46604] = {
			["source"] = "Gold Mage",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32341,
		},
		[206803] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[264735] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Loque'nahak",
			["npcID"] = 165189,
		},
		[68996] = {
			["source"] = "Rengaró-Blackmoore",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[114158] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lohkoh",
			["npcID"] = 0,
		},
		[46924] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Milleenie",
			["npcID"] = 0,
		},
		[257422] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kim-Kargath",
			["npcID"] = 0,
		},
		[320763] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mana Tide Totem",
			["npcID"] = 10467,
		},
		[97463] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Daem-Arthas",
			["npcID"] = 0,
		},
		[225787] = {
			["source"] = "Floorpov",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53385] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[31850] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[313088] = {
			["type"] = "BUFF",
			["source"] = "Clickzz",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[126504] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nivilem",
			["npcID"] = 0,
		},
		[13323] = {
			["source"] = "Gold Mage",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 32341,
		},
		[125801] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Beast Handler Sujani",
			["npcID"] = 132066,
		},
		[232893] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Sicklikeme",
			["npcID"] = 0,
		},
		[195627] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[236298] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Magghellesø",
			["npcID"] = 0,
		},
		[112042] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 1860,
		},
		[193455] = {
			["source"] = "Ejie",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[128268] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 62162,
		},
		[257424] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Sneakin-Dentarg",
			["npcID"] = 0,
		},
		[194223] = {
			["source"] = "Пригарян-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[290819] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Meeres",
			["npcID"] = 0,
		},
		[205604] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[30283] = {
			["source"] = "Bubbakush-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[145205] = {
			["source"] = "Tyskard-Malorne",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[193456] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Vengance",
			["npcID"] = 0,
		},
		[204227] = {
			["source"] = "Unknown",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 115164,
		},
		[187827] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[187874] = {
			["source"] = "Poweryoga-Drak'thul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[264178] = {
			["source"] = "Wazkakle",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[54497] = {
			["source"] = "Feymoon-Bronzebeard",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[250261] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miscarus-Dentarg",
			["npcID"] = 0,
		},
		[120173] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[83242] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Mexivina-Doomhammer",
			["npcID"] = 0,
		},
		[106785] = {
			["source"] = "Doccý",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[26573] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Roketo",
			["npcID"] = 0,
		},
		[256456] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Gigagunther-Blackrock",
			["npcID"] = 0,
		},
		[203720] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[8221] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Xtremebones",
			["npcID"] = 0,
		},
		[299790] = {
			["source"] = "Диаблоу-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[294161] = {
			["source"] = "Laosen-Magtheridon",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[319237] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dengzi",
			["npcID"] = 0,
		},
		[24750] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Naowhtwo",
			["npcID"] = 0,
		},
		[288573] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Årtisell",
			["npcID"] = 0,
		},
		[198688] = {
			["source"] = "Dmtdealer",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[51723] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[256148] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Jemmá-Arygos",
			["npcID"] = 0,
		},
		[102297] = {
			["source"] = "Darkmoon Steam Tonk",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 54588,
		},
		[24732] = {
			["source"] = "Assinka-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[8042] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Geroijhaps",
			["npcID"] = 0,
		},
		[218279] = {
			["source"] = "Psik-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[198065] = {
			["source"] = "Fullermyste-AzjolNerub",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[296211] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[147402] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Biogasanlage",
			["npcID"] = 0,
		},
		[260243] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[162243] = {
			["source"] = "Lillidàn-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[248473] = {
			["source"] = "Xerathas",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[2645] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Amvrosham",
			["npcID"] = 0,
		},
		[167105] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Wolfhund-Blackmoore",
			["npcID"] = 0,
		},
		[183585] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Lightsworn Anchorite",
			["npcID"] = 109751,
		},
		[285978] = {
			["source"] = "Hammundo",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[186403] = {
			["source"] = "Floorpov",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[327942] = {
			["source"] = "Windfury Totem",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 6112,
		},
		[118000] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Myggaktivera",
			["npcID"] = 0,
		},
		[285979] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dengzi",
			["npcID"] = 0,
		},
		[228260] = {
			["source"] = "Канохаша-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[66238] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Bloodyrune",
			["npcID"] = 0,
		},
		[341385] = {
			["source"] = "Gazlar",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[300893] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[223143] = {
			["type"] = "BUFF",
			["source"] = "Narcolies",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[303380] = {
			["type"] = "BUFF",
			["source"] = "Swagstép",
			["npcID"] = 0,
			["event"] = "SPELL_AURA_APPLIED",
			["encounterID"] = 2331,
		},
		[231843] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Madspala",
			["npcID"] = 0,
		},
		[285981] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Spoìl",
			["npcID"] = 0,
		},
		[339] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fðrgðttên-Blackmoore",
			["npcID"] = 0,
		},
		[288613] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kakkmonstret",
			["npcID"] = 0,
		},
		[132564] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Arazni-Kargath",
			["npcID"] = 0,
		},
		[212653] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
		},
		[3714] = {
			["source"] = "Reppü-TwistingNether",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[6673] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Warmo",
			["npcID"] = 0,
		},
		[240032] = {
			["source"] = "Nenosan-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[49869] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Philippjones",
			["npcID"] = 0,
		},
		[152108] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Liffliff",
			["npcID"] = 0,
		},
		[255129] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Хамсам-Ревущийфьорд",
			["npcID"] = 0,
		},
		[198069] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Heidelbeeré-Shattrath",
			["npcID"] = 0,
		},
		[278350] = {
			["source"] = "Шинафай-Ревущийфьорд",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[152875] = {
			["source"] = "Evapor-Alleria",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272679] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gale",
			["npcID"] = 0,
		},
		[240033] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Boxfort",
			["npcID"] = 0,
		},
		[370] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[295384] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zeytax-Arthas",
			["npcID"] = 0,
		},
		[275863] = {
			["source"] = "Веэлин-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[259480] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Casteless Zandalari",
			["npcID"] = 131331,
		},
		[253595] = {
			["source"] = "Dkbruhh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[53209] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Kirau",
			["npcID"] = 0,
		},
		[198838] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[240034] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Miyaku-Nordrassil",
			["npcID"] = 0,
		},
		[278954] = {
			["source"] = "Svampp",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[288546] = {
			["npcID"] = 148797,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Magus of the Dead",
			["encounterID"] = 2331,
		},
		[49258] = {
			["source"] = "Tartar-Garrosh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[293664] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kukenknakk",
			["npcID"] = 0,
		},
		[183998] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lohkoh",
			["npcID"] = 0,
		},
		[257946] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Kirau",
			["npcID"] = 0,
		},
		[198839] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 100943,
		},
		[301411] = {
			["source"] = "Freejsa",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[213680] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Grerm",
			["npcID"] = 0,
		},
		[5672] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Unknown",
			["npcID"] = 3527,
		},
		[125551] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Cheerful",
			["npcID"] = 0,
		},
		[16595] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Daem-Arthas",
			["npcID"] = 0,
		},
		[247456] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Azazoth",
			["npcID"] = 0,
		},
		[313113] = {
			["source"] = "Streider-Emeriss",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[303390] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Holohan",
			["npcID"] = 0,
		},
		[57994] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[341260] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Âris",
			["npcID"] = 0,
		},
		[114165] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lohkoh",
			["npcID"] = 0,
		},
		[49998] = {
			["source"] = "Naowhlul",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[108280] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Shicu-Krag'jin",
			["npcID"] = 0,
		},
		[117405] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Sulea-Kil'jaeden",
			["npcID"] = 0,
		},
		[256455] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Каргоз-Ревущийфьорд",
			["npcID"] = 0,
		},
		[190653] = {
			["source"] = "Mortalism-Malorne",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[5784] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dotskin",
			["npcID"] = 0,
		},
		[1449] = {
			["source"] = "Icebebe-DunMorogh",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[94719] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dipernik",
			["npcID"] = 0,
		},
		[281036] = {
			["source"] = "Друммаш-Ревущийфьорд",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[305952] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dafarm",
			["npcID"] = 0,
		},
		[341263] = {
			["source"] = "Delek",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[1459] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Philwestside",
			["npcID"] = 0,
		},
		[48719] = {
			["source"] = "Longbein-DunMorogh",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[15786] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gold Shaman",
			["npcID"] = 32340,
		},
		[296230] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Gudinnan-Aszune",
			["npcID"] = 0,
		},
		[298357] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Primalpunk",
			["npcID"] = 0,
		},
		[83243] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Ryanbuttern",
			["npcID"] = 0,
		},
		[153626] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Lonathas",
			["npcID"] = 0,
		},
		[202425] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Zarije",
			["npcID"] = 0,
		},
		[147412] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Biogasanlage",
			["npcID"] = 0,
		},
		[23600] = {
			["source"] = "Unknown",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 32321,
		},
		[184770] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Fallelmao",
			["npcID"] = 0,
		},
		[80263] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Quickkaffe",
			["npcID"] = 0,
		},
		[164812] = {
			["source"] = "Andral-Saurfang",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[274739] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Xaczi",
			["npcID"] = 0,
		},
		[114051] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Dmas",
			["npcID"] = 0,
		},
		[47568] = {
			["source"] = "Mínnì-Blackmoore",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[264064] = {
			["source"] = "Kul'krazahn",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 120899,
		},
		[774] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Suxxy",
			["npcID"] = 0,
		},
		[53901] = {
			["source"] = "Ondae",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[23920] = {
			["source"] = "Floorpov",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[242599] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Pikvat",
			["npcID"] = 0,
		},
		[315681] = {
			["source"] = "Realzug",
			["type"] = "DEBUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[238268] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Monsi",
			["npcID"] = 0,
		},
		[52174] = {
			["source"] = "Moosebonk-Draenor",
			["event"] = "SPELL_CAST_SUCCESS",
			["npcID"] = 0,
		},
		[198589] = {
			["npcID"] = 0,
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Clickzz",
			["encounterID"] = 2331,
		},
		[185313] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Nazula",
			["npcID"] = 0,
		},
		[223665] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ugler-BurningLegion",
			["npcID"] = 0,
		},
		[55899] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Fokintank",
			["npcID"] = 0,
		},
		[115191] = {
			["source"] = "Streider-Emeriss",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[272733] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Bejjz",
			["npcID"] = 0,
		},
		[252362] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dafarm",
			["npcID"] = 0,
		},
		[252377] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Dafarm",
			["npcID"] = 0,
		},
		[113656] = {
			["source"] = "Chailong-Drak'thul",
			["type"] = "BUFF",
			["event"] = "SPELL_AURA_APPLIED",
			["npcID"] = 0,
		},
		[8143] = {
			["event"] = "SPELL_CAST_SUCCESS",
			["source"] = "Tsaiman",
			["npcID"] = 0,
		},
		[303438] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "DEBUFF",
			["source"] = "Holohan",
			["npcID"] = 0,
		},
		[201405] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Nissithi",
			["npcID"] = 0,
		},
		[251838] = {
			["event"] = "SPELL_AURA_APPLIED",
			["type"] = "BUFF",
			["source"] = "Ruzeer-Dentarg",
			["npcID"] = 0,
		},
	},
	["tap_denied_color"] = {
		0.372549019607843, -- [1]
		0.372549019607843, -- [2]
		0.372549019607843, -- [3]
		1, -- [4]
	},
	["auto_toggle_stacking"] = {
		["cities"] = true,
	},
	["cast_statusbar_spark_width"] = 4,
	["aura_cooldown_show_swipe"] = false,
}
