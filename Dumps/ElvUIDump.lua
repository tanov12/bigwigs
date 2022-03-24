local NUI = select(2, ...):unpack()

NUI.ElvUI = {}

NUI.ElvUI.HealDark = {
			["databars"] = {
				["threat"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
				},
				["reputation"] = {
					["enable"] = true,
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
				},
				["statusbar"] = "Melli",
				["experience"] = {
					["fontSize"] = 16,
					["fontOutline"] = "OUTLINE",
					["textFormat"] = "PERCENT",
					["width"] = 340,
					["font"] = "Naowh",
					["height"] = 5,
				},
				["azerite"] = {
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
					["textFormat"] = "PERCENT",
				},
				["colors"] = {
					["experience"] = {
						["a"] = 1,
					},
				},
			},
			["general"] = {
				["backdropfadecolor"] = {
					["a"] = 0.800000011920929,
					["b"] = 0.05882352941176471,
					["g"] = 0.05882352941176471,
					["r"] = 0.05882352941176471,
				},
				["valuecolor"] = {
					["b"] = 0.7882335782051086,
					["g"] = 0.188234880566597,
					["r"] = 0.639214277267456,
				},
				["loginmessage"] = false,
				["autoRoll"] = true,
				["altPowerBar"] = {
					["fontSize"] = 14,
					["font"] = "Naowh",
				},
				["minimap"] = {
					["locationFont"] = "Naowh",
				},
				["objectiveFrameHeight"] = 450,
				["totems"] = {
					["spacing"] = 2,
					["enable"] = false,
					["growthDirection"] = "HORIZONTAL",
				},
				["bottomPanel"] = false,
				["font"] = "Naowh",
			},
			["v11NamePlateReset"] = true,
			["auras"] = {
				["font"] = "GothamNarrowUltra",
				["buffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
				["fontOutline"] = "OUTLINE",
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
				},
				["countYOffset"] = 25,
				["timeYOffset"] = 8,
				["debuffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
			},
			["dbConverted"] = 12.13,
			["movers"] = {
				["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,226",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,245,364",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-5",
				["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,311,315",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,-192,-448",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,764",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,69,1014",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,465,321",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-148",
				["ElvUF_FocusCastbarMover"] = "TOP,ElvUIParent,TOP,0,-323",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,381",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-316,4",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,141,-4",
				["VehicleSeatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,527,29",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,53",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-21",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,321",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-465,321",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-224,291",
				["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-491",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,244,-358",
				["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,261,3",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,84",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,17",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,61",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-366,-346",
				["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-35",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,267,283",
				["AzeriteBarMover"] = "TOP,ElvUIParent,TOP,0,-7",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,119",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,212",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-457,-373",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,370",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-240",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,178",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,768",
				["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,236,433",
				["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-261,3",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1076",
				["BossHeaderMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-390,393",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,321",
				["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,478,251",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,480,386",
				["AlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,49,-35",
				["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,325",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-5,-5",
			},
			["tooltip"] = {
				["fontOutline"] = "OUTLINE",
				["healthBar"] = {
					["statusPosition"] = "TOP",
					["font"] = "vixar",
				},
				["font"] = "Naowh",
			},
			["unitframe"] = {
				["targetOnMouseDown"] = true,
				["fontSize"] = 14,
				["font"] = "Naowh",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["anchorPoint"] = "LEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["perrow"] = 2,
							["xOffset"] = -1,
						},
						["disableTargetGlow"] = true,
						["showPlayer"] = false,
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["height"] = 12,
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["buffs"] = {
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPRIGHT",
							["perrow"] = 2,
							["xOffset"] = -2,
						},
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["size"] = 12,
							["xOffset"] = -3,
							["yOffset"] = -10,
						},
						["horizontalSpacing"] = 1,
						["rdebuffs"] = {
							["xOffset"] = 28,
							["yOffset"] = 12,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 18,
						},
						["raidRoleIcons"] = {
							["position"] = "TOPRIGHT",
						},
						["buffIndicator"] = {
							["size"] = 10,
						},
						["roleIcon"] = {
							["xOffset"] = 1,
							["yOffset"] = -1,
							["enable"] = false,
						},
						["readycheckIcon"] = {
							["size"] = 14,
							["yOffset"] = 4,
						},
						["power"] = {
							["text_format"] = "",
							["yOffset"] = 2,
							["position"] = "BOTTOMRIGHT",
							["height"] = 3,
							["enable"] = false,
						},
						["width"] = 160,
						["health"] = {
							["position"] = "BOTTOM",
							["xOffset"] = 0,
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["orientation"] = "MIDDLE",
						["verticalSpacing"] = 10,
						["petsGroup"] = {
							["xOffset"] = 0,
						},
						["groupBy"] = "ROLE",
					},
					["pet"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["enable"] = true,
							["yOffset"] = 10,
							["anchorPoint"] = "LEFT",
							["priority"] = "Blacklist,Personal",
							["perrow"] = 1,
							["xOffset"] = -1,
						},
						["buffIndicator"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["width"] = 100,
						["infoPanel"] = {
							["height"] = 14,
						},
						["name"] = {
							["xOffset"] = 2,
							["text_format"] = "[name:short:translit]",
							["yOffset"] = -4,
						},
						["height"] = 12,
						["buffs"] = {
							["sizeOverride"] = 46,
							["priority"] = "CastByNPC",
						},
						["castbar"] = {
							["enable"] = false,
							["iconSize"] = 32,
							["width"] = 340,
							["height"] = 24,
						},
					},
					["boss"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -8,
						},
						["power"] = {
							["enable"] = false,
							["text_format"] = "[powercolor][power:percent]",
							["position"] = "LEFT",
							["height"] = 4,
							["xOffset"] = 2,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -14,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 1,
								["size"] = 14,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 160,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Boss,Blacklist",
							["xOffset"] = 2,
						},
						["castbar"] = {
							["width"] = 160,
							["height"] = 12,
						},
					},
					["raid"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -20,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["xOffset"] = 69,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["yOffset"] = -5,
								["position"] = "RIGHT",
							},
							["enable"] = false,
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
						},
						["disableTargetGlow"] = true,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["numGroups"] = 8,
						["verticalSpacing"] = -1,
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["yOffset"] = 3,
							["perrow"] = 6,
						},
						["threatStyle"] = "NONE",
						["customTexts"] = {
							["Absorb"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[absorbs]",
								["yOffset"] = -1,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = -1,
								["size"] = 14,
							},
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 2,
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 26,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
						["castbar"] = {
							["enable"] = false,
							["icon"] = false,
							["iconAttached"] = false,
							["width"] = 276,
							["height"] = 24,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["RestIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["height"] = 12,
							["hideonnpc"] = true,
							["enable"] = false,
						},
						["portrait"] = {
							["overlay"] = true,
							["overlayAlpha"] = 0.2,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["xOffset"] = -0.2,
						},
						["width"] = 220,
						["health"] = {
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["text_format"] = "[perhp]% || [health:current]",
							["yOffset"] = -17,
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["enable"] = false,
							["height"] = 15,
						},
					},
					["raid40"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 16,
							["enable"] = true,
							["yOffset"] = -17,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["xOffset"] = 69,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["roleIcon"] = {
							["xOffset"] = 1,
							["yOffset"] = -1,
						},
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["verticalSpacing"] = -1,
					},
					["focus"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["disableTargetGlow"] = true,
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 340,
							["height"] = 28,
							["latency"] = false,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["arena"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["maxDuration"] = 0,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["enable"] = false,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort]",
							["yOffset"] = 16,
						},
						["power"] = {
							["text_format"] = "",
							["xOffset"] = 2,
							["height"] = 4,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 180,
						["infoPanel"] = {
							["height"] = 16,
						},
						["health"] = {
							["xOffset"] = -2,
							["text_format"] = "[health:current] || [perhp]%",
						},
						["portrait"] = {
							["width"] = 35,
							["camDistanceScale"] = 1,
						},
						["height"] = 36,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -10,
							["anchorPoint"] = "TOPLEFT",
							["maxDuration"] = 0,
							["xOffset"] = 2,
						},
						["castbar"] = {
							["width"] = 180,
							["height"] = 12,
						},
					},
					["target"] = {
						["debuffs"] = {
							["sizeOverride"] = 24,
							["yOffset"] = 1,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Blacklist,Personal,CastByNPC",
							["perrow"] = 4,
							["attachTo"] = "FRAME",
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["offset"] = 3,
							["width"] = "spaced",
							["position"] = "BOTTOMLEFT",
							["height"] = 4,
							["xOffset"] = -7,
							["detachedWidth"] = 72,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -22,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 2,
								["size"] = 14,
							},
						},
						["width"] = 220,
						["portrait"] = {
							["overlay"] = true,
							["xOffset"] = 0.8400000000000001,
							["overlayAlpha"] = 0.2,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["rotation"] = 306,
						},
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -17,
						},
						["castbar"] = {
							["enable"] = false,
							["width"] = 220,
							["height"] = 20,
						},
						["height"] = 26,
						["buffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 18,
							["priority"] = "Blacklist,Personal,Boss,nonPersonal",
							["numrows"] = 2,
							["perrow"] = 5,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:short:translit]",
							["yOffset"] = 8,
						},
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
				},
				["smoothbars"] = true,
				["colors"] = {
					["customhealthbackdrop"] = true,
					["auraBarByType"] = false,
					["classResources"] = {
						["comboPoints"] = {
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [1]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [2]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [3]
						},
					},
					["castbar_backdrop"] = {
						["a"] = 0.6000000238418579,
						["b"] = 0.1490196078431373,
						["g"] = 0.1490196078431373,
						["r"] = 0.1490196078431373,
					},
					["tapped"] = {
						["b"] = 0.611764705882353,
						["g"] = 0.568627450980392,
						["r"] = 0.549019607843137,
					},
					["customcastbarbackdrop"] = true,
					["power_backdrop"] = {
						["b"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["r"] = 0.1019607843137255,
					},
					["auraBarBuff"] = {
						["b"] = 0.94,
						["g"] = 0.8,
						["r"] = 0.41,
					},
					["colorhealthbyvalue"] = false,
					["custompowerbackdrop"] = true,
					["health_backdrop"] = {
						["b"] = 0.7176470588235294,
						["g"] = 0.7176470588235294,
						["r"] = 0.7176470588235294,
					},
					["power"] = {
						["MANA"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["INSANITY"] = {
							["b"] = 0.690196078431373,
							["g"] = 0.141176470588235,
							["r"] = 0.549019607843137,
						},
						["ALT_POWER"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["MAELSTROM"] = {
							["g"] = 0.6392156862745098,
						},
					},
					["castColor"] = {
						["b"] = 1,
						["g"] = 0.63921568627451,
						["r"] = 0,
					},
					["transparentHealth"] = true,
					["frameGlow"] = {
						["mouseoverGlow"] = {
							["enable"] = false,
						},
					},
					["health"] = {
						["b"] = 0.05098039215686274,
						["g"] = 0.05098039215686274,
						["r"] = 0.05098039215686274,
					},
					["healPrediction"] = {
						["absorbs"] = {
							["a"] = 0.4000000357627869,
						},
						["overabsorbs"] = {
							["a"] = 0.4000000357627869,
						},
					},
				},
				["fontOutline"] = "OUTLINE",
				["statusbar"] = "Melli",
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
					},
					["threshold"] = -1,
				},
			},
			["datatexts"] = {
				["fontSize"] = 14,
				["font"] = "Naowh",
				["fontOutline"] = "OUTLINE",
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["RightMiniPanel"] = "ElvUI Config",
					["RightChatDataPanel"] = {
						["enable"] = false,
					},
					["MinimapPanel"] = {
						"Time", -- [1]
						"Time", -- [2]
						["panelTransparency"] = true,
						["numPoints"] = 1,
						["border"] = false,
						["backdrop"] = false,
					},
					["LeftChatDataPanel"] = {
						["enable"] = false,
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonsize"] = 28,
				},
				["fontOutline"] = "OUTLINE",
				["bar1"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["backdropSpacing"] = 1,
					["buttonsize"] = 28,
				},
				["font"] = "Naowh",
				["hotkeyTextXOffset"] = 1,
				["useDrawSwipeOnCharges"] = true,
				["barPet"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["bar6"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
				},
				["globalFadeAlpha"] = 1,
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["buttons"] = 11,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdropSpacing"] = 4,
					["buttons"] = 12,
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["hotkeyTextYOffset"] = -2,
				["macrotext"] = true,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["cooldown"] = {
					["checkSeconds"] = true,
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
						["fontSize"] = 14,
					},
					["threshold"] = -1,
				},
				["bar4"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
					["backdrop"] = false,
				},
			},
			["nameplates"] = {
				["plateSize"] = {
					["enemyHeight"] = 26,
				},
				["lowHealthThreshold"] = 0.01,
				["statusbar"] = "Melli",
				["filters"] = {
					["Caster mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Spawn of G'huun"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Enemy NPCs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Special mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_NonTarget"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Mark of the Crane"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Thing"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Void-Touched Emissary"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Emissary of the Tides"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_Target"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Shaman totems"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
				},
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 18,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 14,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -6,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["xOffset"] = 22,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
						},
					},
					["TARGET"] = {
						["glowStyle"] = "style7",
					},
					["FRIENDLY_NPC"] = {
						["castbar"] = {
							["font"] = "Naowh",
						},
						["questIcon"] = {
							["enable"] = false,
						},
					},
					["ENEMY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 22,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
							["xOffset"] = -2,
						},
						["level"] = {
							["fontSize"] = 12,
							["xOffset"] = 22,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["enable"] = false,
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 16,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["enable"] = false,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
							["maxDuration"] = 0,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -8,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
					},
					["FRIENDLY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -2,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 24,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["xOffset"] = 22,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["enable"] = false,
						},
						["power"] = {
							["displayAltPower"] = true,
						},
						["name"] = {
							["fontSize"] = 14,
							["yOffset"] = 16,
							["font"] = "Naowh",
							["position"] = "CENTER",
							["format"] = "[name:medium]",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -13,
							["iconSize"] = 27,
							["iconOffsetY"] = -1,
							["width"] = 160,
							["font"] = "Naowh",
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -2,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 24,
							["countFont"] = "Naowh",
						},
						["health"] = {
							["height"] = 18,
							["text"] = {
								["fontSize"] = 14,
								["font"] = "Naowh",
								["format"] = "[perhp]%",
								["xOffset"] = 1,
							},
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
					},
				},
				["colors"] = {
					["threat"] = {
						["goodTransition"] = {
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						},
						["goodColor"] = {
							["b"] = 0.231372549019608,
							["g"] = 0.874509803921569,
							["r"] = 0.380392156862745,
						},
						["badColor"] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["selection"] = {
						nil, -- [1]
						{
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						}, -- [2]
						{
							["b"] = 0.254901960784314,
							["g"] = 0.741176470588235,
							["r"] = 0.325490196078431,
						}, -- [3]
						[0] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["castbarDesaturate"] = false,
				},
				["smoothbars"] = true,
				["visibility"] = {
					["enemy"] = {
						["guardians"] = true,
						["totems"] = true,
					},
				},
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
						["fontSize"] = 22,
					},
					["threshold"] = -1,
				},
			},
			["bags"] = {
				["itemLevelFont"] = "vixar",
				["bagSize"] = 33,
				["moneyFormat"] = "BLIZZARD",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["countFont"] = "Naowh",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["countFontOutline"] = "OUTLINE",
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
					},
				},
				["itemLevelFontOutline"] = "OUTLINE",
			},
			["cooldown"] = {
				["secondsColor"] = {
					["b"] = 1,
				},
				["checkSeconds"] = true,
				["fonts"] = {
					["enable"] = true,
					["font"] = "Naowh",
				},
				["threshold"] = -1,
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["lfgIcons"] = false,
				["chatHistory"] = false,
				["tabFont"] = "Naowh",
				["separateSizes"] = true,
				["panelHeightRight"] = 266,
				["font"] = "Naowh",
				["panelWidth"] = 450,
				["fontSize"] = 12,
				["emotionIcons"] = false,
				["tabFontSize"] = 11,
				["editBoxPosition"] = "ABOVE_CHAT",
				["panelHeight"] = 210,
				["panelWidthRight"] = 230,
				["panelBackdrop"] = "HIDEBOTH",
			},
}

NUI.ElvUI.Heal = {
			["databars"] = {
				["threat"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
				},
				["reputation"] = {
					["enable"] = true,
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
				},
				["statusbar"] = "Melli",
				["colors"] = {
					["experience"] = {
						["a"] = 1,
					},
				},
				["azerite"] = {
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
					["textFormat"] = "PERCENT",
				},
				["experience"] = {
					["fontSize"] = 16,
					["fontOutline"] = "OUTLINE",
					["textFormat"] = "PERCENT",
					["width"] = 340,
					["font"] = "Naowh",
					["height"] = 5,
				},
			},
			["general"] = {
				["totems"] = {
					["spacing"] = 2,
					["enable"] = false,
					["growthDirection"] = "HORIZONTAL",
				},
				["backdropfadecolor"] = {
					["a"] = 0.800000011920929,
					["b"] = 0.05882352941176471,
					["g"] = 0.05882352941176471,
					["r"] = 0.05882352941176471,
				},
				["valuecolor"] = {
					["b"] = 0.7882335782051086,
					["g"] = 0.188234880566597,
					["r"] = 0.639214277267456,
				},
				["loginmessage"] = false,
				["autoRoll"] = true,
				["altPowerBar"] = {
					["fontSize"] = 14,
					["font"] = "Naowh",
				},
				["minimap"] = {
					["locationFont"] = "Naowh",
				},
				["objectiveFrameHeight"] = 450,
				["bottomPanel"] = false,
				["font"] = "Naowh",
			},
			["bags"] = {
				["itemLevelFont"] = "vixar",
				["bagSize"] = 33,
				["itemLevelFontOutline"] = "OUTLINE",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["countFont"] = "Naowh",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["countFontOutline"] = "OUTLINE",
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
					},
				},
				["moneyFormat"] = "BLIZZARD",
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["lfgIcons"] = false,
				["chatHistory"] = false,
				["tabFont"] = "Naowh",
				["separateSizes"] = true,
				["panelHeightRight"] = 266,
				["font"] = "Naowh",
				["panelWidth"] = 450,
				["fontSize"] = 12,
				["emotionIcons"] = false,
				["tabFontSize"] = 11,
				["editBoxPosition"] = "ABOVE_CHAT",
				["panelHeight"] = 210,
				["panelWidthRight"] = 230,
				["panelBackdrop"] = "HIDEBOTH",
			},
			["dbConverted"] = 12.13,
			["movers"] = {
				["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,226",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,245,363",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-5",
				["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,311,315",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,-192,-448",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,764",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-5,-5",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,465,321",
				["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,325",
				["ElvUF_FocusCastbarMover"] = "TOP,ElvUIParent,TOP,0,-323",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,381",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-316,4",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,141,-4",
				["VehicleSeatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,527,29",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,480,386",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-21",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-465,321",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,321",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,321",
				["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-491",
				["ElvUF_Raid40Mover"] = "TOPLEFT,ElvUIParent,TOPLEFT,244,-358",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["AzeriteBarMover"] = "TOP,ElvUIParent,TOP,0,-7",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,17",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,61",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-366,-346",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,119",
				["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,261,3",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-261,3",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,84",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-35",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,212",
				["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,236,433",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-240",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,178",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,768",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,370",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-457,-373",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,267,283",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1076",
				["BossHeaderMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-390,393",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-224,291",
				["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,478,251",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,53",
				["AlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,49,-35",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-148",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,69,1014",
			},
			["tooltip"] = {
				["fontOutline"] = "OUTLINE",
				["healthBar"] = {
					["statusPosition"] = "TOP",
					["font"] = "vixar",
				},
				["font"] = "Naowh",
			},
			["unitframe"] = {
				["targetOnMouseDown"] = true,
				["fontSize"] = 14,
				["font"] = "Naowh",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["anchorPoint"] = "LEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["perrow"] = 2,
							["xOffset"] = -1,
						},
						["disableTargetGlow"] = true,
						["showPlayer"] = false,
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["height"] = 12,
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["verticalSpacing"] = 10,
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["size"] = 12,
							["xOffset"] = -3,
							["yOffset"] = -10,
						},
						["horizontalSpacing"] = 1,
						["rdebuffs"] = {
							["xOffset"] = 28,
							["yOffset"] = 12,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 18,
						},
						["raidRoleIcons"] = {
							["position"] = "TOPRIGHT",
						},
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
							["yOffset"] = -1,
							["xOffset"] = 1,
						},
						["readycheckIcon"] = {
							["size"] = 14,
							["yOffset"] = 4,
						},
						["power"] = {
							["text_format"] = "",
							["yOffset"] = 2,
							["position"] = "BOTTOMRIGHT",
							["height"] = 3,
							["enable"] = false,
						},
						["width"] = 160,
						["health"] = {
							["position"] = "BOTTOM",
							["xOffset"] = 0,
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPRIGHT",
							["perrow"] = 2,
							["xOffset"] = -2,
						},
						["petsGroup"] = {
							["xOffset"] = 0,
						},
						["buffIndicator"] = {
							["size"] = 10,
						},
					},
					["pet"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["enable"] = true,
							["yOffset"] = 10,
							["anchorPoint"] = "LEFT",
							["priority"] = "Blacklist,Personal",
							["perrow"] = 1,
							["xOffset"] = -1,
						},
						["buffIndicator"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["iconSize"] = 32,
							["width"] = 340,
							["height"] = 24,
						},
						["width"] = 100,
						["infoPanel"] = {
							["height"] = 14,
						},
						["name"] = {
							["xOffset"] = 2,
							["text_format"] = "[name:short:translit]",
							["yOffset"] = -4,
						},
						["height"] = 12,
						["buffs"] = {
							["sizeOverride"] = 46,
							["priority"] = "CastByNPC",
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["yOffset"] = 3,
							["perrow"] = 6,
						},
						["portrait"] = {
							["overlay"] = true,
							["overlayAlpha"] = 0.2,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["xOffset"] = -0.2,
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["enable"] = false,
							["height"] = 15,
						},
						["threatStyle"] = "NONE",
						["customTexts"] = {
							["Absorb"] = {
								["attachTextTo"] = "Health",
								["xOffset"] = -1,
								["text_format"] = "[absorbs]",
								["yOffset"] = -1,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 14,
							},
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 2,
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 26,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
						["castbar"] = {
							["enable"] = false,
							["icon"] = false,
							["iconAttached"] = false,
							["width"] = 276,
							["height"] = 24,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["RestIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["height"] = 12,
							["hideonnpc"] = true,
							["enable"] = false,
						},
						["width"] = 220,
						["health"] = {
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["text_format"] = "[perhp]% || [health:current]",
							["yOffset"] = -17,
						},
					},
					["raid"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -20,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["verticalSpacing"] = -1,
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["enable"] = false,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["yOffset"] = -5,
								["position"] = "RIGHT",
							},
							["xOffset"] = 69,
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
						},
						["disableTargetGlow"] = true,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["numGroups"] = 8,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
					},
					["boss"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -8,
						},
						["castbar"] = {
							["width"] = 160,
							["height"] = 12,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["xOffset"] = 1,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -14,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 14,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 160,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Boss,Blacklist",
							["xOffset"] = 2,
						},
						["power"] = {
							["enable"] = false,
							["text_format"] = "[powercolor][power:percent]",
							["position"] = "LEFT",
							["height"] = 4,
							["xOffset"] = 2,
						},
					},
					["raid40"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 16,
							["enable"] = true,
							["yOffset"] = -17,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["verticalSpacing"] = -1,
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["xOffset"] = 69,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["roleIcon"] = {
							["xOffset"] = 1,
							["yOffset"] = -1,
						},
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
					},
					["focus"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["disableTargetGlow"] = true,
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 340,
							["height"] = 28,
							["latency"] = false,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["target"] = {
						["debuffs"] = {
							["sizeOverride"] = 24,
							["yOffset"] = 1,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Blacklist,Personal,CastByNPC",
							["perrow"] = 4,
							["attachTo"] = "FRAME",
						},
						["portrait"] = {
							["overlay"] = true,
							["xOffset"] = 0.8400000000000001,
							["overlayAlpha"] = 0.2,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["rotation"] = 306,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 220,
							["height"] = 20,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["xOffset"] = 2,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -22,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["enable"] = true,
								["size"] = 14,
							},
						},
						["width"] = 220,
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["offset"] = 3,
							["width"] = "spaced",
							["position"] = "BOTTOMLEFT",
							["height"] = 4,
							["xOffset"] = -7,
							["detachedWidth"] = 72,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:short:translit]",
							["yOffset"] = 8,
						},
						["height"] = 26,
						["buffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 18,
							["priority"] = "Blacklist,Personal,Boss,nonPersonal",
							["numrows"] = 2,
							["perrow"] = 5,
						},
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -17,
						},
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
					},
					["arena"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["maxDuration"] = 0,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["enable"] = false,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort]",
							["yOffset"] = 16,
						},
						["power"] = {
							["text_format"] = "",
							["xOffset"] = 2,
							["height"] = 4,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 180,
						["infoPanel"] = {
							["height"] = 16,
						},
						["health"] = {
							["xOffset"] = -2,
							["text_format"] = "[health:current] || [perhp]%",
						},
						["portrait"] = {
							["width"] = 35,
							["camDistanceScale"] = 1,
						},
						["height"] = 36,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -10,
							["anchorPoint"] = "TOPLEFT",
							["maxDuration"] = 0,
							["xOffset"] = 2,
						},
						["castbar"] = {
							["width"] = 180,
							["height"] = 12,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
				},
				["statusbar"] = "Melli",
				["colors"] = {
					["healthclass"] = true,
					["customhealthbackdrop"] = true,
					["classResources"] = {
						["comboPoints"] = {
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [1]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [2]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [3]
						},
					},
					["castbar_backdrop"] = {
						["a"] = 0.6000000238418579,
						["b"] = 0.1490196078431373,
						["g"] = 0.1490196078431373,
						["r"] = 0.1490196078431373,
					},
					["tapped"] = {
						["b"] = 0.611764705882353,
						["g"] = 0.568627450980392,
						["r"] = 0.549019607843137,
					},
					["customcastbarbackdrop"] = true,
					["power_backdrop"] = {
						["b"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["r"] = 0.1019607843137255,
					},
					["auraBarBuff"] = {
						["b"] = 0.94,
						["g"] = 0.8,
						["r"] = 0.41,
					},
					["colorhealthbyvalue"] = false,
					["custompowerbackdrop"] = true,
					["health_backdrop"] = {
						["b"] = 0.07058823529411765,
						["g"] = 0.07058823529411765,
						["r"] = 0.07058823529411765,
					},
					["power"] = {
						["MANA"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["INSANITY"] = {
							["b"] = 0.690196078431373,
							["g"] = 0.141176470588235,
							["r"] = 0.549019607843137,
						},
						["ALT_POWER"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["MAELSTROM"] = {
							["g"] = 0.6392156862745098,
						},
					},
					["castColor"] = {
						["b"] = 1,
						["g"] = 0.63921568627451,
						["r"] = 0,
					},
					["frameGlow"] = {
						["mouseoverGlow"] = {
							["enable"] = false,
						},
					},
					["health"] = {
						["b"] = 0,
						["g"] = 0,
						["r"] = 0,
					},
					["healPrediction"] = {
						["absorbs"] = {
							["a"] = 0.4000000357627869,
						},
						["overabsorbs"] = {
							["a"] = 0.4000000357627869,
						},
					},
					["auraBarByType"] = false,
				},
				["fontOutline"] = "OUTLINE",
				["smoothbars"] = true,
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
					},
				},
			},
			["datatexts"] = {
				["font"] = "Naowh",
				["fontSize"] = 14,
				["fontOutline"] = "OUTLINE",
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["RightMiniPanel"] = "ElvUI Config",
					["RightChatDataPanel"] = {
						["enable"] = false,
					},
					["MinimapPanel"] = {
						"Time", -- [1]
						"Time", -- [2]
						["numPoints"] = 1,
						["panelTransparency"] = true,
						["backdrop"] = false,
						["border"] = false,
					},
					["LeftChatDataPanel"] = {
						["enable"] = false,
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonsize"] = 28,
				},
				["fontOutline"] = "OUTLINE",
				["bar1"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["backdropSpacing"] = 1,
					["buttonsize"] = 28,
				},
				["font"] = "Naowh",
				["hotkeyTextXOffset"] = 1,
				["useDrawSwipeOnCharges"] = true,
				["barPet"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["bar6"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
				},
				["globalFadeAlpha"] = 1,
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["buttons"] = 11,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdropSpacing"] = 4,
					["buttons"] = 12,
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["hotkeyTextYOffset"] = -2,
				["macrotext"] = true,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
						["fontSize"] = 14,
					},
				},
				["bar4"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
					["backdrop"] = false,
				},
			},
			["nameplates"] = {
				["plateSize"] = {
					["enemyHeight"] = 26,
				},
				["lowHealthThreshold"] = 0.01,
				["smoothbars"] = true,
				["filters"] = {
					["Caster mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Spawn of G'huun"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Enemy NPCs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Special mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_NonTarget"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Shaman totems"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Thing"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Void-Touched Emissary"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Emissary of the Tides"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_Target"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Mark of the Crane"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
				},
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 18,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -6,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 14,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["xOffset"] = 22,
						},
					},
					["TARGET"] = {
						["glowStyle"] = "style7",
					},
					["FRIENDLY_NPC"] = {
						["castbar"] = {
							["font"] = "Naowh",
						},
						["questIcon"] = {
							["enable"] = false,
						},
					},
					["ENEMY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 22,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
							["xOffset"] = -2,
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -8,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["enable"] = false,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
							["maxDuration"] = 0,
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 16,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
					},
					["FRIENDLY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -2,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 24,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["power"] = {
							["displayAltPower"] = true,
						},
						["name"] = {
							["fontSize"] = 14,
							["yOffset"] = 16,
							["font"] = "Naowh",
							["position"] = "CENTER",
							["format"] = "[name:medium]",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -13,
							["iconSize"] = 27,
							["iconOffsetY"] = -1,
							["width"] = 160,
							["font"] = "Naowh",
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -2,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 24,
							["countFont"] = "Naowh",
						},
						["health"] = {
							["height"] = 18,
							["text"] = {
								["fontSize"] = 14,
								["font"] = "Naowh",
								["format"] = "[perhp]%",
								["xOffset"] = 1,
							},
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
					},
				},
				["colors"] = {
					["threat"] = {
						["goodTransition"] = {
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						},
						["goodColor"] = {
							["b"] = 0.231372549019608,
							["g"] = 0.874509803921569,
							["r"] = 0.380392156862745,
						},
						["badColor"] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["selection"] = {
						nil, -- [1]
						{
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						}, -- [2]
						{
							["b"] = 0.254901960784314,
							["g"] = 0.741176470588235,
							["r"] = 0.325490196078431,
						}, -- [3]
						[0] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["castbarDesaturate"] = false,
				},
				["statusbar"] = "Melli",
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
						["fontSize"] = 22,
					},
				},
				["visibility"] = {
					["enemy"] = {
						["guardians"] = true,
						["totems"] = true,
					},
				},
			},
			["v11NamePlateReset"] = true,
			["cooldown"] = {
				["secondsColor"] = {
					["b"] = 1,
				},
				["checkSeconds"] = true,
				["threshold"] = -1,
				["fonts"] = {
					["enable"] = true,
					["font"] = "Naowh",
				},
			},
			["auras"] = {
				["font"] = "GothamNarrowUltra",
				["buffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
				["fontOutline"] = "OUTLINE",
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
				},
				["countYOffset"] = 25,
				["timeYOffset"] = 8,
				["debuffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
			},
}

NUI.ElvUI.TankDark = {
			["databars"] = {
				["threat"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
				},
				["reputation"] = {
					["enable"] = true,
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
				},
				["statusbar"] = "Melli",
				["colors"] = {
					["experience"] = {
						["a"] = 1,
					},
				},
				["azerite"] = {
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
					["textFormat"] = "PERCENT",
				},
				["experience"] = {
					["fontSize"] = 16,
					["fontOutline"] = "OUTLINE",
					["textFormat"] = "PERCENT",
					["width"] = 340,
					["font"] = "Naowh",
					["height"] = 5,
				},
			},
			["general"] = {
				["totems"] = {
					["spacing"] = 2,
					["enable"] = false,
					["growthDirection"] = "HORIZONTAL",
				},
				["backdropfadecolor"] = {
					["a"] = 0.800000011920929,
					["b"] = 0.05882352941176471,
					["g"] = 0.05882352941176471,
					["r"] = 0.05882352941176471,
				},
				["valuecolor"] = {
					["b"] = 0.7882335782051086,
					["g"] = 0.188234880566597,
					["r"] = 0.639214277267456,
				},
				["loginmessage"] = false,
				["autoRoll"] = true,
				["altPowerBar"] = {
					["fontSize"] = 14,
					["font"] = "Naowh",
				},
				["minimap"] = {
					["locationFont"] = "Naowh",
				},
				["objectiveFrameHeight"] = 450,
				["bottomPanel"] = false,
				["font"] = "Naowh",
			},
			["bags"] = {
				["itemLevelFont"] = "vixar",
				["bagSize"] = 33,
				["itemLevelFontOutline"] = "OUTLINE",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["countFont"] = "Naowh",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["countFontOutline"] = "OUTLINE",
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
					},
				},
				["moneyFormat"] = "BLIZZARD",
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["lfgIcons"] = false,
				["chatHistory"] = false,
				["tabFont"] = "Naowh",
				["separateSizes"] = true,
				["panelHeightRight"] = 266,
				["font"] = "Naowh",
				["panelWidth"] = 450,
				["fontSize"] = 12,
				["emotionIcons"] = false,
				["tabFontSize"] = 11,
				["editBoxPosition"] = "ABOVE_CHAT",
				["panelHeight"] = 210,
				["panelWidthRight"] = 230,
				["panelBackdrop"] = "HIDEBOTH",
			},
			["dbConverted"] = 12.13,
			["movers"] = {
				["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,226",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,356",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-5",
				["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,311,315",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,-192,-448",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,764",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,69,1014",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,321",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-148",
				["ElvUF_FocusCastbarMover"] = "TOP,ElvUIParent,TOP,0,-323",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,381",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-316,4",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,141,-4",
				["VehicleSeatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,527,29",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,53",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-21",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,321",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-465,321",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-224,291",
				["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-491",
				["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,356",
				["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,261,3",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,84",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,17",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,61",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-366,-346",
				["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-35",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,267,283",
				["AzeriteBarMover"] = "TOP,ElvUIParent,TOP,0,-7",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,119",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,212",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-457,-373",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,370",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-240",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,178",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,768",
				["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,236,433",
				["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-261,3",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1076",
				["BossHeaderMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-390,393",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,321",
				["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,478,251",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,403,393",
				["AlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,49,-35",
				["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,325",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-5,-5",
			},
			["tooltip"] = {
				["fontOutline"] = "OUTLINE",
				["healthBar"] = {
					["statusPosition"] = "TOP",
					["font"] = "vixar",
				},
				["font"] = "Naowh",
			},
			["unitframe"] = {
				["targetOnMouseDown"] = true,
				["fontSize"] = 14,
				["font"] = "Naowh",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["yOffset"] = 3,
							["perrow"] = 6,
						},
						["portrait"] = {
							["overlay"] = true,
							["overlayAlpha"] = 0.2,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["xOffset"] = -0.2,
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["enable"] = false,
							["height"] = 15,
						},
						["threatStyle"] = "NONE",
						["customTexts"] = {
							["Absorb"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[absorbs]",
								["yOffset"] = -1,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = -1,
								["size"] = 14,
							},
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 2,
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 26,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
						["castbar"] = {
							["enable"] = false,
							["icon"] = false,
							["iconAttached"] = false,
							["width"] = 276,
							["height"] = 24,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["RestIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["height"] = 12,
							["hideonnpc"] = true,
							["enable"] = false,
						},
						["width"] = 220,
						["health"] = {
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["text_format"] = "[perhp]% || [health:current]",
							["yOffset"] = -17,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["raid"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -20,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["verticalSpacing"] = -1,
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["enable"] = false,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["yOffset"] = -5,
								["position"] = "RIGHT",
							},
							["xOffset"] = 69,
							["size"] = 17,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
						},
						["width"] = 90,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
					},
					["boss"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -8,
						},
						["castbar"] = {
							["width"] = 160,
							["height"] = 12,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -14,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 1,
								["size"] = 14,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 160,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Boss,Blacklist",
							["xOffset"] = 2,
						},
						["power"] = {
							["enable"] = false,
							["text_format"] = "[powercolor][power:percent]",
							["position"] = "LEFT",
							["height"] = 4,
							["xOffset"] = 2,
						},
					},
					["raid40"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 16,
							["enable"] = true,
							["yOffset"] = -17,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["xOffset"] = 1,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["xOffset"] = 69,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["roleIcon"] = {
							["xOffset"] = 1,
							["yOffset"] = -1,
						},
						["width"] = 90,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["verticalSpacing"] = -1,
					},
					["focus"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["disableTargetGlow"] = true,
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 340,
							["height"] = 28,
							["latency"] = false,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["target"] = {
						["debuffs"] = {
							["sizeOverride"] = 24,
							["yOffset"] = 1,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Blacklist,Personal,CastByNPC",
							["perrow"] = 4,
							["attachTo"] = "FRAME",
						},
						["portrait"] = {
							["overlay"] = true,
							["xOffset"] = 0.8400000000000001,
							["rotation"] = 306,
							["fullOverlay"] = true,
							["camDistanceScale"] = 3.4,
							["overlayAlpha"] = 0.2,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 220,
							["height"] = 20,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -22,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 2,
								["size"] = 14,
							},
						},
						["width"] = 220,
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["offset"] = 3,
							["width"] = "spaced",
							["position"] = "BOTTOMLEFT",
							["height"] = 4,
							["xOffset"] = -7,
							["detachedWidth"] = 72,
						},
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -17,
						},
						["height"] = 26,
						["buffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 18,
							["priority"] = "Blacklist,Personal,Boss,nonPersonal",
							["numrows"] = 2,
							["perrow"] = 5,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:short:translit]",
							["yOffset"] = 8,
						},
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
					},
					["arena"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["maxDuration"] = 0,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["enable"] = false,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["health"] = {
							["xOffset"] = -2,
							["text_format"] = "[health:current] || [perhp]%",
						},
						["power"] = {
							["text_format"] = "",
							["xOffset"] = 2,
							["height"] = 4,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 180,
						["infoPanel"] = {
							["height"] = 16,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort]",
							["yOffset"] = 16,
						},
						["portrait"] = {
							["width"] = 35,
							["camDistanceScale"] = 1,
						},
						["height"] = 36,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -10,
							["anchorPoint"] = "TOPLEFT",
							["maxDuration"] = 0,
							["xOffset"] = 2,
						},
						["castbar"] = {
							["width"] = 180,
							["height"] = 12,
						},
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["anchorPoint"] = "LEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["perrow"] = 2,
							["xOffset"] = -1,
						},
						["disableTargetGlow"] = true,
						["showPlayer"] = false,
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["height"] = 12,
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["verticalSpacing"] = 10,
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["size"] = 12,
							["xOffset"] = -3,
							["yOffset"] = -10,
						},
						["horizontalSpacing"] = 1,
						["rdebuffs"] = {
							["xOffset"] = 28,
							["yOffset"] = 12,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 18,
						},
						["raidRoleIcons"] = {
							["position"] = "TOPRIGHT",
						},
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
							["yOffset"] = -1,
							["xOffset"] = 1,
						},
						["readycheckIcon"] = {
							["size"] = 14,
							["yOffset"] = 4,
						},
						["power"] = {
							["text_format"] = "",
							["yOffset"] = 2,
							["position"] = "BOTTOMRIGHT",
							["height"] = 3,
							["enable"] = false,
						},
						["width"] = 160,
						["health"] = {
							["position"] = "BOTTOM",
							["xOffset"] = 0,
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["sizeOverride"] = 20,
							["enable"] = true,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPRIGHT",
							["perrow"] = 2,
							["xOffset"] = -2,
						},
						["petsGroup"] = {
							["xOffset"] = 0,
						},
						["buffIndicator"] = {
							["size"] = 10,
						},
					},
					["pet"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["enable"] = true,
							["yOffset"] = 10,
							["anchorPoint"] = "LEFT",
							["priority"] = "Blacklist,Personal",
							["perrow"] = 1,
							["xOffset"] = -1,
						},
						["buffIndicator"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["iconSize"] = 32,
							["width"] = 340,
							["height"] = 24,
						},
						["width"] = 100,
						["infoPanel"] = {
							["height"] = 14,
						},
						["name"] = {
							["xOffset"] = 2,
							["text_format"] = "[name:short:translit]",
							["yOffset"] = -4,
						},
						["height"] = 12,
						["buffs"] = {
							["sizeOverride"] = 46,
							["priority"] = "CastByNPC",
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
					},
				},
				["statusbar"] = "Melli",
				["colors"] = {
					["customhealthbackdrop"] = true,
					["auraBarByType"] = false,
					["classResources"] = {
						["comboPoints"] = {
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [1]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [2]
							{
								["b"] = 0,
								["g"] = 1,
								["r"] = 1,
							}, -- [3]
						},
					},
					["healPrediction"] = {
						["absorbs"] = {
							["a"] = 0.4000000357627869,
						},
						["overabsorbs"] = {
							["a"] = 0.4000000357627869,
						},
					},
					["tapped"] = {
						["b"] = 0.611764705882353,
						["g"] = 0.568627450980392,
						["r"] = 0.549019607843137,
					},
					["customcastbarbackdrop"] = true,
					["power_backdrop"] = {
						["b"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["r"] = 0.1019607843137255,
					},
					["auraBarBuff"] = {
						["b"] = 0.94,
						["g"] = 0.8,
						["r"] = 0.41,
					},
					["colorhealthbyvalue"] = false,
					["custompowerbackdrop"] = true,
					["health_backdrop"] = {
						["b"] = 0.7176470588235294,
						["g"] = 0.7176470588235294,
						["r"] = 0.7176470588235294,
					},
					["power"] = {
						["MANA"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["INSANITY"] = {
							["b"] = 0.690196078431373,
							["g"] = 0.141176470588235,
							["r"] = 0.549019607843137,
						},
						["ALT_POWER"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["MAELSTROM"] = {
							["g"] = 0.6392156862745098,
						},
					},
					["castColor"] = {
						["b"] = 1,
						["g"] = 0.63921568627451,
						["r"] = 0,
					},
					["transparentHealth"] = true,
					["frameGlow"] = {
						["mouseoverGlow"] = {
							["enable"] = false,
						},
					},
					["health"] = {
						["b"] = 0.05098039215686274,
						["g"] = 0.05098039215686274,
						["r"] = 0.05098039215686274,
					},
					["castbar_backdrop"] = {
						["a"] = 0.6000000238418579,
						["b"] = 0.1490196078431373,
						["g"] = 0.1490196078431373,
						["r"] = 0.1490196078431373,
					},
				},
				["fontOutline"] = "OUTLINE",
				["smoothbars"] = true,
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
					},
				},
			},
			["datatexts"] = {
				["fontSize"] = 14,
				["font"] = "Naowh",
				["fontOutline"] = "OUTLINE",
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["RightMiniPanel"] = "ElvUI Config",
					["RightChatDataPanel"] = {
						["enable"] = false,
					},
					["MinimapPanel"] = {
						"Time", -- [1]
						"Time", -- [2]
						["numPoints"] = 1,
						["panelTransparency"] = true,
						["border"] = false,
						["backdrop"] = false,
					},
					["LeftChatDataPanel"] = {
						["enable"] = false,
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonsize"] = 28,
				},
				["fontOutline"] = "OUTLINE",
				["bar1"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["backdropSpacing"] = 1,
					["buttonsize"] = 28,
				},
				["font"] = "Naowh",
				["hotkeyTextXOffset"] = 1,
				["useDrawSwipeOnCharges"] = true,
				["barPet"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["bar6"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
				},
				["globalFadeAlpha"] = 1,
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["buttons"] = 11,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdropSpacing"] = 4,
					["buttons"] = 12,
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["hotkeyTextYOffset"] = -2,
				["macrotext"] = true,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
						["fontSize"] = 14,
					},
				},
				["bar4"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
					["backdrop"] = false,
				},
			},
			["nameplates"] = {
				["plateSize"] = {
					["enemyHeight"] = 26,
				},
				["lowHealthThreshold"] = 0.01,
				["smoothbars"] = true,
				["filters"] = {
					["Caster mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Spawn of G'huun"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Enemy NPCs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Special mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_NonTarget"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Mark of the Crane"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Thing"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Void-Touched Emissary"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Emissary of the Tides"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_Target"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Shaman totems"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
				},
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 18,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -6,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 14,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["xOffset"] = 22,
						},
					},
					["TARGET"] = {
						["glowStyle"] = "style7",
					},
					["FRIENDLY_NPC"] = {
						["castbar"] = {
							["font"] = "Naowh",
						},
						["questIcon"] = {
							["enable"] = false,
						},
					},
					["ENEMY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 22,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
							["xOffset"] = -2,
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 16,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["enable"] = false,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
							["maxDuration"] = 0,
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -8,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
					},
					["FRIENDLY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -2,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 24,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -13,
							["iconSize"] = 27,
							["iconOffsetY"] = -1,
							["width"] = 160,
							["font"] = "Naowh",
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
						["power"] = {
							["displayAltPower"] = true,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -2,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 24,
							["countFont"] = "Naowh",
						},
						["health"] = {
							["height"] = 18,
							["text"] = {
								["fontSize"] = 14,
								["font"] = "Naowh",
								["format"] = "[perhp]%",
								["xOffset"] = 1,
							},
						},
						["name"] = {
							["fontSize"] = 14,
							["yOffset"] = 16,
							["font"] = "Naowh",
							["position"] = "CENTER",
							["format"] = "[name:medium]",
						},
					},
				},
				["colors"] = {
					["threat"] = {
						["goodTransition"] = {
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						},
						["goodColor"] = {
							["b"] = 0.231372549019608,
							["g"] = 0.874509803921569,
							["r"] = 0.380392156862745,
						},
						["badColor"] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["selection"] = {
						nil, -- [1]
						{
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						}, -- [2]
						{
							["b"] = 0.254901960784314,
							["g"] = 0.741176470588235,
							["r"] = 0.325490196078431,
						}, -- [3]
						[0] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["castbarDesaturate"] = false,
				},
				["statusbar"] = "Melli",
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
						["fontSize"] = 22,
					},
				},
				["visibility"] = {
					["enemy"] = {
						["guardians"] = true,
						["totems"] = true,
					},
				},
			},
			["v11NamePlateReset"] = true,
			["cooldown"] = {
				["secondsColor"] = {
					["b"] = 1,
				},
				["checkSeconds"] = true,
				["threshold"] = -1,
				["fonts"] = {
					["enable"] = true,
					["font"] = "Naowh",
				},
			},
			["auras"] = {
				["font"] = "GothamNarrowUltra",
				["buffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
				["fontOutline"] = "OUTLINE",
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
				},
				["countYOffset"] = 25,
				["timeYOffset"] = 8,
				["debuffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
			},
}

NUI.ElvUI.Tank = {
			["databars"] = {
				["threat"] = {
					["enable"] = false,
				},
				["honor"] = {
					["enable"] = false,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
				},
				["reputation"] = {
					["fontSize"] = 16,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
				},
				["statusbar"] = "Melli",
				["experience"] = {
					["hideAtMaxLevel"] = false,
					["fontOutline"] = "OUTLINE",
					["textFormat"] = "PERCENT",
					["width"] = 340,
					["hideInVehicle"] = false,
					["font"] = "Naowh",
					["height"] = 5,
				},
				["azerite"] = {
					["textFormat"] = "PERCENT",
					["enable"] = false,
					["width"] = 340,
					["font"] = "Naowh",
					["fontOutline"] = "OUTLINE",
					["height"] = 5,
					["fontSize"] = 16,
				},
				["colors"] = {
					["experience"] = {
						["a"] = 1,
					},
				},
			},
			["general"] = {
				["totems"] = {
					["spacing"] = 2,
					["enable"] = false,
					["growthDirection"] = "HORIZONTAL",
				},
				["backdropfadecolor"] = {
					["a"] = 0.800000011920929,
					["b"] = 0.05882352941176471,
					["g"] = 0.05882352941176471,
					["r"] = 0.05882352941176471,
				},
				["valuecolor"] = {
					["r"] = 0.639214277267456,
					["g"] = 0.188234880566597,
					["b"] = 0.7882335782051086,
				},
				["loginmessage"] = false,
				["autoRoll"] = true,
				["altPowerBar"] = {
					["fontSize"] = 14,
					["font"] = "Naowh",
				},
				["autoAcceptInvite"] = true,
				["minimap"] = {
					["locationFont"] = "Naowh",
				},
				["objectiveFrameHeight"] = 450,
				["bottomPanel"] = false,
				["font"] = "Naowh",
			},
			["bags"] = {
				["itemLevelFont"] = "vixar",
				["bagSize"] = 33,
				["itemLevelFontOutline"] = "OUTLINE",
				["countFontSize"] = 12,
				["itemLevelFontSize"] = 12,
				["countFont"] = "Naowh",
				["vendorGrays"] = {
					["enable"] = true,
				},
				["countFontOutline"] = "OUTLINE",
				["cooldown"] = {
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
					},
				},
				["moneyFormat"] = "BLIZZARD",
			},
			["auras"] = {
				["font"] = "GothamNarrowUltra",
				["buffs"] = {
					["countFontSize"] = 14,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["horizontalSpacing"] = 3,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontSize"] = 14,
					["durationFontSize"] = 12,
					["timeFontOutline"] = "OUTLINE",
				},
				["fontOutline"] = "OUTLINE",
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
				},
				["countYOffset"] = 25,
				["timeYOffset"] = 8,
				["debuffs"] = {
					["horizontalSpacing"] = 3,
					["countYOffset"] = 24,
					["timeYOffset"] = 8,
					["countXOffset"] = -8,
					["countFontSize"] = 14,
					["countFont"] = "Naowh",
					["timeFont"] = "Naowh",
					["countFontOutline"] = "OUTLINE",
					["timeFontOutline"] = "OUTLINE",
					["durationFontSize"] = 12,
					["timeFontSize"] = 14,
				},
			},
			["dbConverted"] = 12.13,
			["movers"] = {
				["ElvUF_FocusCastbarMover"] = "TOP,ElvUIParent,TOP,0,-323",
				["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,226",
				["ElvUF_RaidMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,356",
				["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,4",
				["BuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-5",
				["TargetPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,311,315",
				["BossButton"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["LootFrameMover"] = "TOP,ElvUIParent,TOP,-192,-448",
				["ZoneAbility"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-471,36",
				["ElvUF_RaidpetMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,0,764",
				["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,69,1014",
				["ElvUF_FocusMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,463,321",
				["DebuffsMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-193,-148",
				["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-55",
				["ClassBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,381",
				["MicrobarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-316,4",
				["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,141,-4",
				["VehicleSeatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,527,29",
				["RightChatMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,0,53",
				["ExperienceBarMover"] = "TOP,ElvUIParent,TOP,0,-21",
				["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-464,321",
				["ElvUF_TargetMover"] = "BOTTOM,ElvUIParent,BOTTOM,284,321",
				["ElvUF_BodyGuardMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,478,251",
				["LossControlMover"] = "TOP,ElvUIParent,TOP,0,-491",
				["ElvUF_Raid40Mover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,0,356",
				["ElvAB_4"] = "BOTTOM,ElvUIParent,BOTTOM,261,3",
				["AltPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,84",
				["ElvAB_1"] = "BOTTOM,ElvUIParent,BOTTOM,0,17",
				["ElvAB_2"] = "BOTTOM,ElvUIParent,BOTTOM,0,61",
				["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-366,-346",
				["ReputationBarMover"] = "TOP,ElvUIParent,TOP,0,-35",
				["TalkingHeadFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,53",
				["ElvUF_TargetCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,267,283",
				["AzeriteBarMover"] = "TOP,ElvUIParent,TOP,0,-7",
				["ElvAB_3"] = "BOTTOM,ElvUIParent,BOTTOM,0,90",
				["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,0,119",
				["VehicleLeaveButton"] = "BOTTOM,ElvUIParent,BOTTOM,0,212",
				["ArenaHeaderMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-457,-373",
				["PlayerPowerBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,370",
				["ObjectiveFrameMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-59,-240",
				["PetAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,178",
				["ShiftAB"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,768",
				["TotemBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,236,433",
				["ArtifactBarMover"] = "TOP,ElvUIParent,TOP,0,-4",
				["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-261,3",
				["TooltipMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4",
				["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,BOTTOMLEFT,4,1076",
				["BossHeaderMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-390,393",
				["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-284,321",
				["ElvUF_PetMover"] = "BOTTOM,ElvUIParent,BOTTOM,-224,291",
				["ElvUF_PartyMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,403,393",
				["AlertFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,49,-35",
				["ComboBarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,325",
				["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-5,-5",
			},
			["tooltip"] = {
				["fontOutline"] = "OUTLINE",
				["healthBar"] = {
					["statusPosition"] = "TOP",
					["font"] = "vixar",
				},
				["font"] = "Naowh",
			},
			["unitframe"] = {
				["targetOnMouseDown"] = true,
				["fontSize"] = 14,
				["font"] = "Naowh",
				["units"] = {
					["tank"] = {
						["enable"] = false,
					},
					["player"] = {
						["debuffs"] = {
							["enable"] = false,
							["yOffset"] = 3,
							["perrow"] = 6,
						},
						["portrait"] = {
							["overlay"] = true,
						},
						["classbar"] = {
							["detachFromFrame"] = true,
							["enable"] = false,
							["height"] = 15,
						},
						["threatStyle"] = "NONE",
						["customTexts"] = {
							["Absorb"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[absorbs]",
								["yOffset"] = -1,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = -1,
								["size"] = 14,
							},
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["xOffset"] = 2,
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 26,
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["height"] = 12,
							["hideonnpc"] = true,
							["enable"] = false,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["RestIcon"] = {
							["enable"] = false,
						},
						["castbar"] = {
							["enable"] = false,
							["icon"] = false,
							["iconAttached"] = false,
							["width"] = 276,
							["height"] = 24,
						},
						["width"] = 220,
						["health"] = {
							["position"] = "BOTTOMRIGHT",
							["xOffset"] = 0,
							["text_format"] = "[perhp]% || [health:current]",
							["yOffset"] = -17,
						},
					},
					["targettarget"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["target"] = {
						["debuffs"] = {
							["sizeOverride"] = 24,
							["yOffset"] = 1,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Blacklist,Personal,CastByNPC",
							["perrow"] = 4,
							["attachTo"] = "FRAME",
						},
						["portrait"] = {
							["overlay"] = true,
						},
						["aurabar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["power"] = {
							["detachFromFrame"] = true,
							["text_format"] = "",
							["offset"] = 3,
							["width"] = "spaced",
							["position"] = "BOTTOMLEFT",
							["detachedWidth"] = 72,
							["xOffset"] = -7,
							["height"] = 4,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -22,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 2,
								["size"] = 14,
							},
						},
						["width"] = 220,
						["castbar"] = {
							["enable"] = false,
							["width"] = 220,
							["height"] = 20,
						},
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["xOffset"] = 2,
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -17,
						},
						["height"] = 26,
						["buffs"] = {
							["sizeOverride"] = 25,
							["yOffset"] = 18,
							["priority"] = "Blacklist,Personal,Boss,nonPersonal",
							["numrows"] = 2,
							["perrow"] = 5,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:short:translit]",
							["yOffset"] = 8,
						},
						["raidicon"] = {
							["attachTo"] = "CENTER",
							["enable"] = false,
							["yOffset"] = 2,
						},
					},
					["arena"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["maxDuration"] = 0,
							["xOffset"] = 1,
						},
						["portrait"] = {
							["width"] = 35,
							["camDistanceScale"] = 1,
						},
						["enable"] = false,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["health"] = {
							["xOffset"] = -2,
							["text_format"] = "[health:current] || [perhp]%",
						},
						["power"] = {
							["text_format"] = "",
							["xOffset"] = 2,
							["height"] = 4,
						},
						["disableMouseoverGlow"] = true,
						["width"] = 180,
						["infoPanel"] = {
							["height"] = 16,
						},
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort]",
							["yOffset"] = 16,
						},
						["disableTargetGlow"] = true,
						["height"] = 36,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -10,
							["anchorPoint"] = "TOPLEFT",
							["maxDuration"] = 0,
							["xOffset"] = 2,
						},
						["castbar"] = {
							["width"] = 180,
							["height"] = 12,
						},
					},
					["boss"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["yOffset"] = 0,
							["anchorPoint"] = "RIGHT",
							["perrow"] = 2,
							["xOffset"] = 1,
						},
						["disableTargetGlow"] = true,
						["growthDirection"] = "UP",
						["spacing"] = 17,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["castbar"] = {
							["width"] = 160,
							["height"] = 12,
						},
						["customTexts"] = {
							["Power text"] = {
								["attachTextTo"] = "Health",
								["enable"] = true,
								["text_format"] = "[powercolor][power:percent]",
								["yOffset"] = -14,
								["font"] = "Naowh",
								["justifyH"] = "RIGHT",
								["fontOutline"] = "OUTLINE",
								["xOffset"] = 1,
								["size"] = 14,
							},
						},
						["disableMouseoverGlow"] = true,
						["width"] = 160,
						["health"] = {
							["position"] = "BOTTOMLEFT",
							["text_format"] = "[health:current] || [perhp]%",
							["yOffset"] = -8,
						},
						["height"] = 28,
						["buffs"] = {
							["sizeOverride"] = 20,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPLEFT",
							["priority"] = "Boss,Blacklist",
							["xOffset"] = 2,
						},
						["power"] = {
							["enable"] = false,
							["text_format"] = "[powercolor][power:percent]",
							["position"] = "LEFT",
							["height"] = 4,
							["xOffset"] = 2,
						},
					},
					["raid40"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 16,
							["xOffset"] = 1,
							["yOffset"] = -17,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["enable"] = true,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["xOffset"] = 69,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 17,
						},
						["growthDirection"] = "RIGHT_UP",
						["roleIcon"] = {
							["xOffset"] = 1,
							["yOffset"] = -1,
						},
						["width"] = 90,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["verticalSpacing"] = -1,
					},
					["focus"] = {
						["debuffs"] = {
							["enable"] = false,
							["anchorPoint"] = "BOTTOMRIGHT",
						},
						["disableTargetGlow"] = true,
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["width"] = 340,
							["height"] = 28,
							["latency"] = false,
						},
						["width"] = 100,
						["height"] = 16,
						["name"] = {
							["position"] = "TOPRIGHT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 15,
						},
						["raidicon"] = {
							["enable"] = false,
						},
					},
					["assist"] = {
						["enable"] = false,
					},
					["raid"] = {
						["debuffs"] = {
							["countFontSize"] = 11,
							["sizeOverride"] = 20,
							["xOffset"] = 1,
							["yOffset"] = -20,
							["anchorPoint"] = "TOPLEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["enable"] = true,
						},
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["name"] = {
							["text_format"] = "[name:veryshort:translit]",
						},
						["height"] = 46,
						["verticalSpacing"] = -1,
						["raidicon"] = {
							["attachTo"] = "TOPRIGHT",
							["enable"] = false,
							["yOffset"] = 0,
						},
						["horizontalSpacing"] = -1,
						["rdebuffs"] = {
							["enable"] = false,
							["yOffset"] = 2,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["xOffset"] = 69,
							["size"] = 17,
						},
						["numGroups"] = 8,
						["growthDirection"] = "RIGHT_UP",
						["groupBy"] = "ROLE",
						["roleIcon"] = {
							["enable"] = false,
						},
						["power"] = {
							["enable"] = false,
						},
						["width"] = 90,
						["health"] = {
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["disableTargetGlow"] = true,
						["buffs"] = {
							["anchorPoint"] = "TOPRIGHT",
						},
					},
					["party"] = {
						["debuffs"] = {
							["sizeOverride"] = 28,
							["anchorPoint"] = "LEFT",
							["clickThrough"] = true,
							["priority"] = "Blacklist,Personal,nonPersonal",
							["perrow"] = 2,
							["xOffset"] = -1,
						},
						["disableTargetGlow"] = true,
						["showPlayer"] = false,
						["classbar"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["healPrediction"] = {
							["enable"] = true,
						},
						["disableMouseoverGlow"] = true,
						["infoPanel"] = {
							["height"] = 12,
						},
						["name"] = {
							["position"] = "TOPLEFT",
							["text_format"] = "[name:veryshort:translit]",
							["yOffset"] = 8,
						},
						["height"] = 28,
						["verticalSpacing"] = 10,
						["raidicon"] = {
							["attachTo"] = "RIGHT",
							["size"] = 12,
							["xOffset"] = -3,
							["yOffset"] = -10,
						},
						["horizontalSpacing"] = 1,
						["rdebuffs"] = {
							["xOffset"] = 28,
							["yOffset"] = 12,
							["font"] = "vixar",
							["fontOutline"] = "OUTLINE",
							["stack"] = {
								["xOffset"] = 4,
								["position"] = "RIGHT",
								["yOffset"] = -5,
							},
							["size"] = 18,
						},
						["raidRoleIcons"] = {
							["position"] = "TOPRIGHT",
						},
						["buffIndicator"] = {
							["size"] = 10,
						},
						["roleIcon"] = {
							["enable"] = false,
							["yOffset"] = -1,
							["xOffset"] = 1,
						},
						["readycheckIcon"] = {
							["size"] = 14,
							["yOffset"] = 4,
						},
						["power"] = {
							["text_format"] = "",
							["yOffset"] = 2,
							["position"] = "BOTTOMRIGHT",
							["height"] = 3,
							["enable"] = false,
						},
						["width"] = 160,
						["health"] = {
							["position"] = "BOTTOM",
							["xOffset"] = 0,
							["text_format"] = "",
							["yOffset"] = 4,
						},
						["orientation"] = "MIDDLE",
						["buffs"] = {
							["sizeOverride"] = 20,
							["xOffset"] = -2,
							["yOffset"] = -15,
							["anchorPoint"] = "TOPRIGHT",
							["perrow"] = 2,
							["enable"] = true,
						},
						["petsGroup"] = {
							["xOffset"] = 0,
						},
						["groupBy"] = "ROLE",
					},
					["pet"] = {
						["debuffs"] = {
							["sizeOverride"] = 36,
							["enable"] = true,
							["yOffset"] = 10,
							["anchorPoint"] = "LEFT",
							["priority"] = "Blacklist,Personal",
							["perrow"] = 1,
							["xOffset"] = -1,
						},
						["buffIndicator"] = {
							["enable"] = false,
						},
						["threatStyle"] = "NONE",
						["castbar"] = {
							["enable"] = false,
							["iconSize"] = 32,
							["width"] = 340,
							["height"] = 24,
						},
						["width"] = 100,
						["infoPanel"] = {
							["height"] = 14,
						},
						["name"] = {
							["xOffset"] = 2,
							["text_format"] = "[name:short:translit]",
							["yOffset"] = -4,
						},
						["height"] = 12,
						["buffs"] = {
							["sizeOverride"] = 46,
							["priority"] = "CastByNPC",
						},
						["power"] = {
							["enable"] = false,
							["height"] = 5,
						},
					},
				},
				["statusbar"] = "Melli",
				["colors"] = {
					["healthclass"] = true,
					["customhealthbackdrop"] = true,
					["classResources"] = {
						["comboPoints"] = {
							{
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							}, -- [1]
							{
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							}, -- [2]
							{
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							}, -- [3]
						},
					},
					["castbar_backdrop"] = {
						["a"] = 0.6000000238418579,
						["b"] = 0.1490196078431373,
						["g"] = 0.1490196078431373,
						["r"] = 0.1490196078431373,
					},
					["tapped"] = {
						["r"] = 0.549019607843137,
						["g"] = 0.568627450980392,
						["b"] = 0.611764705882353,
					},
					["customcastbarbackdrop"] = true,
					["power_backdrop"] = {
						["b"] = 0.1019607843137255,
						["g"] = 0.1019607843137255,
						["r"] = 0.1019607843137255,
					},
					["auraBarBuff"] = {
						["r"] = 0.41,
						["g"] = 0.8,
						["b"] = 0.94,
					},
					["colorhealthbyvalue"] = false,
					["custompowerbackdrop"] = true,
					["health_backdrop"] = {
						["r"] = 0.0705882352941177,
						["g"] = 0.0705882352941177,
						["b"] = 0.0705882352941177,
					},
					["power"] = {
						["MANA"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["INSANITY"] = {
							["r"] = 0.549019607843137,
							["g"] = 0.141176470588235,
							["b"] = 0.690196078431373,
						},
						["ALT_POWER"] = {
							["b"] = 1,
							["g"] = 0.6392156862745098,
							["r"] = 0,
						},
						["MAELSTROM"] = {
							["g"] = 0.6392156862745098,
						},
					},
					["castColor"] = {
						["r"] = 0,
						["g"] = 0.63921568627451,
						["b"] = 1,
					},
					["frameGlow"] = {
						["mouseoverGlow"] = {
							["enable"] = false,
						},
					},
					["health"] = {
						["r"] = 0.0627450980392157,
						["g"] = 0.0705882352941177,
						["b"] = 0.0705882352941177,
					},
					["healPrediction"] = {
						["absorbs"] = {
							["a"] = 0.4000000357627869,
						},
						["overabsorbs"] = {
							["a"] = 0.4000000357627869,
						},
					},
					["auraBarByType"] = false,
				},
				["fontOutline"] = "OUTLINE",
				["smoothbars"] = true,
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
					},
				},
			},
			["datatexts"] = {
				["fontSize"] = 14,
				["font"] = "Naowh",
				["fontOutline"] = "OUTLINE",
				["panels"] = {
					["LeftMiniPanel"] = "Time",
					["RightMiniPanel"] = "ElvUI Config",
					["RightChatDataPanel"] = {
						["enable"] = false,
					},
					["MinimapPanel"] = {
						"Time", -- [1]
						"Time", -- [2]
						["numPoints"] = 1,
						["panelTransparency"] = true,
						["backdrop"] = false,
						["border"] = false,
					},
					["LeftChatDataPanel"] = {
						["enable"] = false,
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonspacing"] = 1,
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["buttons"] = 12,
					["buttonsize"] = 28,
				},
				["fontOutline"] = "OUTLINE",
				["bar1"] = {
					["buttonspacing"] = 1,
					["mouseover"] = true,
					["backdropSpacing"] = 1,
					["buttonsize"] = 28,
				},
				["font"] = "Naowh",
				["hotkeyTextXOffset"] = 1,
				["useDrawSwipeOnCharges"] = true,
				["barPet"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 10,
					["buttonsize"] = 28,
				},
				["fontSize"] = 12,
				["bar6"] = {
					["buttonspacing"] = 1,
					["enabled"] = true,
					["mouseover"] = true,
					["buttonsPerRow"] = 6,
					["buttonsize"] = 28,
				},
				["globalFadeAlpha"] = 1,
				["microbar"] = {
					["enabled"] = true,
					["mouseover"] = true,
					["buttons"] = 11,
				},
				["bar2"] = {
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["bar5"] = {
					["enabled"] = false,
					["buttonsPerRow"] = 12,
					["backdropSpacing"] = 4,
					["buttons"] = 12,
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
				},
				["hotkeyTextYOffset"] = -2,
				["macrotext"] = true,
				["stanceBar"] = {
					["enabled"] = false,
				},
				["cooldown"] = {
					["checkSeconds"] = true,
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "GothamNarrowUltra",
						["fontSize"] = 14,
					},
				},
				["bar4"] = {
					["backdrop"] = false,
					["buttonsPerRow"] = 6,
					["buttonspacing"] = 1,
					["buttonsize"] = 28,
					["mouseover"] = true,
				},
			},
			["nameplates"] = {
				["plateSize"] = {
					["enemyHeight"] = 26,
				},
				["lowHealthThreshold"] = 0.01,
				["statusbar"] = "Melli",
				["filters"] = {
					["Caster mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Spawn of G'huun"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Enemy NPCs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Special mobs"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_NonTarget"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Mark of the Crane"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Thing"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Void-Touched Emissary"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["Emissary of the Tides"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
					["ElvUI_Target"] = {
						["triggers"] = {
							["enable"] = false,
						},
					},
					["Shaman totems"] = {
						["triggers"] = {
							["enable"] = true,
						},
					},
				},
				["units"] = {
					["ENEMY_NPC"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 18,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -6,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 14,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["xOffset"] = 22,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
						},
					},
					["TARGET"] = {
						["glowStyle"] = "style7",
					},
					["FRIENDLY_NPC"] = {
						["castbar"] = {
							["font"] = "Naowh",
						},
						["questIcon"] = {
							["enable"] = false,
						},
					},
					["ENEMY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -4,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 22,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
							["xOffset"] = -2,
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["name"] = {
							["fontSize"] = 12,
							["yOffset"] = -8,
							["font"] = "Naowh",
							["format"] = "[name:medium]",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -18,
							["iconSize"] = 37,
							["textPosition"] = "ONBAR",
							["iconOffsetY"] = -1,
							["font"] = "Naowh",
							["height"] = 20,
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["enable"] = false,
							["yOffset"] = -6,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,CastByNPC,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 28,
							["countFont"] = "Naowh",
							["maxDuration"] = 0,
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
						["health"] = {
							["height"] = 14,
							["text"] = {
								["fontSize"] = 14,
								["yOffset"] = 16,
								["font"] = "Naowh",
								["position"] = "BOTTOMRIGHT",
								["format"] = "[perhp]%",
							},
						},
					},
					["FRIENDLY_PLAYER"] = {
						["debuffs"] = {
							["countFontSize"] = 14,
							["fontSize"] = 12,
							["yOffset"] = -2,
							["priority"] = "Blacklist,Personal,CastByNPC",
							["size"] = 24,
							["font"] = "GothamNarrowUltra",
							["countFont"] = "Naowh",
						},
						["level"] = {
							["fontSize"] = 12,
							["enable"] = false,
							["yOffset"] = -15,
							["font"] = "Naowh",
							["format"] = "[difficultycolor][level][shortclassification]",
							["xOffset"] = 22,
						},
						["power"] = {
							["displayAltPower"] = true,
						},
						["name"] = {
							["fontSize"] = 14,
							["yOffset"] = 16,
							["font"] = "Naowh",
							["position"] = "CENTER",
							["format"] = "[name:medium]",
						},
						["castbar"] = {
							["fontSize"] = 12,
							["sourceInterrupt"] = false,
							["yOffset"] = -13,
							["iconSize"] = 27,
							["iconOffsetY"] = -1,
							["width"] = 160,
							["font"] = "Naowh",
						},
						["buffs"] = {
							["countFontSize"] = 14,
							["yOffset"] = -2,
							["priority"] = "Blacklist,RaidBuffsElvUI,Dispellable,blockNoDuration,PlayerBuffs,TurtleBuffs,CastByUnit",
							["size"] = 24,
							["countFont"] = "Naowh",
						},
						["health"] = {
							["height"] = 18,
							["text"] = {
								["fontSize"] = 14,
								["font"] = "Naowh",
								["format"] = "[perhp]%",
								["xOffset"] = 1,
							},
						},
						["title"] = {
							["format"] = "[npctitle]",
						},
					},
				},
				["colors"] = {
					["threat"] = {
						["goodTransition"] = {
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						},
						["goodColor"] = {
							["r"] = 0.380392156862745,
							["g"] = 0.874509803921569,
							["b"] = 0.231372549019608,
						},
						["badColor"] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["selection"] = {
						nil, -- [1]
						{
							["g"] = 0.933333333333333,
							["b"] = 0.431372549019608,
						}, -- [2]
						{
							["r"] = 0.325490196078431,
							["g"] = 0.741176470588235,
							["b"] = 0.254901960784314,
						}, -- [3]
						[0] = {
							["g"] = 0.298039215686275,
							["b"] = 0.309803921568627,
						},
					},
					["castbarDesaturate"] = false,
				},
				["smoothbars"] = true,
				["visibility"] = {
					["enemy"] = {
						["guardians"] = true,
						["totems"] = true,
					},
				},
				["cooldown"] = {
					["threshold"] = -1,
					["fonts"] = {
						["enable"] = true,
						["font"] = "Naowh",
						["fontSize"] = 22,
					},
				},
			},
			["v11NamePlateReset"] = true,
			["cooldown"] = {
				["secondsColor"] = {
					["b"] = 1,
				},
				["checkSeconds"] = true,
				["threshold"] = -1,
				["fonts"] = {
					["enable"] = true,
					["font"] = "Naowh",
				},
			},
			["chat"] = {
				["tabFontOutline"] = "OUTLINE",
				["lfgIcons"] = false,
				["chatHistory"] = false,
				["tabFont"] = "Naowh",
				["separateSizes"] = true,
				["panelHeightRight"] = 266,
				["font"] = "Naowh",
				["panelWidth"] = 450,
				["fontSize"] = 12,
				["emotionIcons"] = false,
				["tabFontSize"] = 11,
				["editBoxPosition"] = "ABOVE_CHAT",
				["panelHeight"] = 210,
				["panelWidthRight"] = 230,
				["panelBackdrop"] = "HIDEBOTH",
			},
}
