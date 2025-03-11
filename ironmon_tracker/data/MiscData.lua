MiscData = {}
-- List of items: https://bulbapedia.bulbagarden.net/wiki/List_of_items_by_index_number_(Generation_III)

MiscData.TableData = {
	growth = { 1, 1, 1, 1, 1, 1, 2, 2, 3, 4, 3, 4, 2, 2, 3, 4, 3, 4, 2, 2, 3, 4, 3, 4 },
	attack = { 2, 2, 3, 4, 3, 4, 1, 1, 1, 1, 1, 1, 3, 4, 2, 2, 4, 3, 3, 4, 2, 2, 4, 3 },
	effort = { 3, 4, 2, 2, 4, 3, 3, 4, 2, 2, 4, 3, 1, 1, 1, 1, 1, 1, 4, 3, 4, 3, 2, 2 },
	misc   = { 4, 3, 4, 3, 2, 2, 4, 3, 4, 3, 2, 2, 4, 3, 4, 3, 2, 2, 1, 1, 1, 1, 1, 1 },
}

MiscData.Gender = {
	MALE = 0,
	FEMALE = 254,
	UNKNOWN = 255,
}

MiscData.BagPocket = {
	PC = 0,
	Items = 1,
	KeyItems = 2,
	Pokeballs = 3,
	TMHM = 4,
	Berries = 5,
}

MiscData.HealingType = {
	Constant = "Constant",
	Percentage = "Percentage",
}

MiscData.StatusType = {
	None = 0,
	Sleep = 1,
	Poison = 2,
	Burn = 3,
	Freeze = 4,
	Paralyze = 5,
	Toxic = 6,
	Confusion = 30,
	Faint = 50,
	All = 100,
}

MiscData.StatusCodeMap = {
	[MiscData.StatusType.None] = "",
	[MiscData.StatusType.Burn] = "BRN",
	[MiscData.StatusType.Freeze] = "FRZ",
	[MiscData.StatusType.Paralyze] = "PAR",
	[MiscData.StatusType.Poison] = "PSN",
	[MiscData.StatusType.Toxic] = "PSN",
	[MiscData.StatusType.Sleep] = "SLP",
	[MiscData.StatusType.Faint] = "FNT",
}

function MiscData.updateResources()
	if Resources.Game.NatureNames and #Resources.Game.NatureNames > 0 then
		MiscData.Natures = Resources.Game.NatureNames
	end
	if Resources.Game.ItemNames and #Resources.Game.ItemNames > 0 then
		MiscData.Items = Resources.Game.ItemNames
	end
	for itemId, item in pairs(MiscData.HealingItems) do
		if Resources.Game.ItemNames[itemId] then
			item.name = Resources.Game.ItemNames[itemId]
		end
	end
	for itemId, item in pairs(MiscData.StatusItems) do
		if Resources.Game.ItemNames[itemId] then
			item.name = Resources.Game.ItemNames[itemId]
		end
	end
	for itemId, item in pairs(MiscData.PPItems) do
		if Resources.Game.ItemNames[itemId] then
			item.name = Resources.Game.ItemNames[itemId]
		end
	end
	for itemId, item in pairs(MiscData.EvolutionStones) do
		if Resources.Game.ItemNames[itemId] then
			item.name = Resources.Game.ItemNames[itemId]
		end
	end
end

-- Returns an absolute filepath to the icon image for the item, or nil if not available
--- @param itemId number
--- @return string? filepath
function MiscData.getItemIcon(itemId)
	itemId = itemId or 0
	local item = MiscData.HealingItems[itemId]
		or MiscData.StatusItems[itemId]
		or MiscData.PPItems[itemId]
		or MiscData.EvolutionStones[itemId]
		or MiscData.BattleItems[itemId]
		or MiscData.OtherItems[itemId] or {}
	if item.icon then
		return FileManager.buildImagePath(FileManager.Folders.Icons, item.icon, ".png")
	else
		return nil
	end
end

---Returns the Gender of a Pokemon based on its personality value.
---@param pokemonID number
---@param personality number
---@return number gender MiscData.Gender
function MiscData.getMonGender(pokemonID, personality)
	if not PokemonData.isValid(pokemonID) then
		return MiscData.Gender.UNKNOWN
	end

	local threshold = Memory.readbyte(GameSettings.gBaseStats + (pokemonID * Program.Addresses.sizeofBaseStatsPokemon) + PokemonData.Addresses.offsetGenderRatio)
	if threshold == MiscData.Gender.MALE then
		return MiscData.Gender.MALE
	elseif threshold == MiscData.Gender.FEMALE then
		return MiscData.Gender.FEMALE
	elseif threshold == MiscData.Gender.UNKNOWN then
		return MiscData.Gender.UNKNOWN
	else
		if personality % 256 >= threshold then
			return MiscData.Gender.MALE
		else
			return MiscData.Gender.FEMALE
		end
	end
end

-- Ordered lists that are populated from Resources
MiscData.Natures = {}
MiscData.Items = {}

MiscData.PokeBalls = {}
MiscData.TMs = {}
MiscData.HMs = {}
for i=1, 27, 1 do
	MiscData.PokeBalls[i] = true
end
for i=582, 681, 1 do
	MiscData.TMs[i] = {
		icon = "tiny-tm",
		pocket = MiscData.BagPocket.TMHM,
	}
end
for i=682, 689, 1 do
	MiscData.HMs[i] = {
		icon = "tiny-tm",
		pocket = MiscData.BagPocket.TMHM,
	}
end

MiscData.HealingItems = {
	[28] = {
		id = 28,
		name = "Potion",
		icon = "potion",
		amount = 20,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[29] = {
		id = 29,
		name = "Super Potion",
		icon = "super-potion",
		amount = 50,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[30] = {
		id = 30,
		name = "Hyper Potion",
		icon = "hyper-potion",
		amount = 200,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[31] = {
		id = 31,
		name = "Max Potion",
		icon = "max-potion",
		amount = 100,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Items,
	},
	[32] = {
		id = 32,
		name = "Full Restore",
		icon = "full-restore",
		amount = 100,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Items,
	},
	[35] = {
		id = 35,
		name = "Fresh Water",
		icon = "fresh-water",
		amount = 50,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[36] = {
		id = 36,
		name = "Soda Pop",
		icon = "soda-pop",
		amount = 60,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[37] = {
		id = 37,
		name = "Lemonade",
		icon = "lemonade",
		amount = 80,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[38] = {
		id = 38,
		name = "Moomoo Milk",
		icon = "moomoo-milk",
		amount = 100,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[39] = {
		id = 39,
		name = "EnergyPowder",
		icon = "energy-powder",
		amount = 50,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[40] = {
		id = 40,
		name = "Energy Root",
		icon = "energy-root",
		amount = 200,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[53] = {
		id = 53,
		name = "Berry Juice",
		icon = "berry-juice",
		amount = 20,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[520] = {
		id = 520,
		name = "Oran Berry",
		icon = "oran-berry",
		amount = 10,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Berries,
	},
	[523] = {
		id = 523,
		name = "Sitrus Berry",
		icon = "sitrus-berry",
		amount = 30,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Berries,
	},
	[524] = {
		id = 524,
		name = "Figy Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
	[525] = {
		id = 525,
		name = "Wiki Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
	[526] = {
		id = 526,
		name = "Mago Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
	[527] = {
		id = 527,
		name = "Aguav Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
	[528] = {
		id = 528,
		name = "Iapapa Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
	[574] = {
		id = 574,
		name = "Enigma Berry",
		icon = "oran-berry",
		amount = 12.5,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Berries,
	},
}

MiscData.StatusItems = {
	[43] = {
		id = 43,
		name = "Antidote",
		icon = "full-heal",
		type = MiscData.StatusType.Poison,
		pocket = MiscData.BagPocket.Items,
	},
	[45] = {
		id = 45,
		name = "Burn Heal",
		icon = "full-heal",
		type = MiscData.StatusType.Burn,
		pocket = MiscData.BagPocket.Items,
	},
	[46] = {
		id = 46,
		name = "Ice Heal",
		icon = "full-heal",
		type = MiscData.StatusType.Freeze,
		pocket = MiscData.BagPocket.Items,
	},
	[47] = {
		id = 47,
		name = "Awakening",
		icon = "full-heal",
		type = MiscData.StatusType.Sleep,
		pocket = MiscData.BagPocket.Items,
	},
	[44] = {
		id = 44,
		name = "Parlyz Heal",
		icon = "full-heal",
		type = MiscData.StatusType.Paralyze,
		pocket = MiscData.BagPocket.Items,
	},
	[32] = {
		id = 32,
		name = "Full Restore",
		icon = "full-restore",
		type = MiscData.StatusType.All,
		pocket = MiscData.BagPocket.Items,
	},
	[48] = {
		id = 48,
		name = "Full Heal",
		icon = "full-heal",
		type = MiscData.StatusType.All,
		pocket = MiscData.BagPocket.Items,
	},
	[41] = {
		id = 41,
		name = "Heal Powder",
		icon = "heal-powder",
		type = MiscData.StatusType.All,
		pocket = MiscData.BagPocket.Items,
	},
	[59] = {
		id = 59,
		name = "Lava Cookie",
		icon = "lava-cookie",
		type = MiscData.StatusType.All,
		pocket = MiscData.BagPocket.Items,
	},
	[514] = {
		id = 514,
		name = "Cheri Berry",
		icon = "cheri-berry",
		type = MiscData.StatusType.Paralyze,
		pocket = MiscData.BagPocket.Berries,
	},
	[515] = {
		id = 515,
		name = "Chesto Berry",
		icon = "chesto-berry",
		type = MiscData.StatusType.Sleep,
		pocket = MiscData.BagPocket.Berries,
	},
	[516] = {
		id = 516,
		name = "Pecha Berry",
		icon = "pecha-berry",
		type = MiscData.StatusType.Poison,
		pocket = MiscData.BagPocket.Berries,
	},
	[517] = {
		id = 517,
		name = "Rawst Berry",
		icon = "rawst-berry",
		type = MiscData.StatusType.Burn,
		pocket = MiscData.BagPocket.Berries,
	},
	[518] = {
		id = 818,
		name = "Aspear Berry",
		icon = "aspear-berry",
		type = MiscData.StatusType.Freeze,
		pocket = MiscData.BagPocket.Berries,
	},
	[521] = {
		id = 521,
		name = "Persim Berry",
		icon = "persim-berry",
		type = MiscData.StatusType.Confusion,
		pocket = MiscData.BagPocket.Berries,
	},
	[522] = {
		id = 522,
		name = "Lum Berry",
		icon = "lum-berry",
		type = MiscData.StatusType.All,
		pocket = MiscData.BagPocket.Berries,
	},
}

MiscData.PPItems = {
	[49] = {
		id = 49,
		name = "Ether",
		icon = "ether",
		amount = 10,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[50] = {
		id = 50,
		name = "Max Ether",
		icon = "ether",
		amount = 100,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Items,
	},
	[51] = {
		id = 51,
		name = "Elixir",
		icon = "elixir",
		amount = 10,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Items,
	},
	[52] = {
		id = 52,
		name = "Max Elixir",
		icon = "elixir",
		amount = 100,
		type = MiscData.HealingType.Percentage,
		pocket = MiscData.BagPocket.Items,
	},
	[519] = {
		id = 519,
		name = "Leppa Berry",
		icon = "leppa-berry",
		amount = 10,
		type = MiscData.HealingType.Constant,
		pocket = MiscData.BagPocket.Berries,
	},
}

MiscData.EvolutionStones = {
	[211] = {
		id = 211,
		name = "Fire Stone",
		icon = "fire-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[212] = {
		id = 212,
		name = "Water Stone",
		icon = "water-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[213] = {
		id = 213,
		name = "Thunder Stone",
		icon = "thunder-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[214] = {
		id = 214,
		name = "Leaf Stone",
		icon = "leaf-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[215] = {
		id = 215,
		name = "Ice Stone",
		icon = "ice-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[216] = {
		id = 216,
		name = "Sun Stone",
		icon = "sun-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[217] = {
		id = 217,
		name = "Moon Stone",
		icon = "moon-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[218] = {
		id = 218,
		name = "Shiny Stone",
		icon = "shiny-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[219] = {
		id = 219,
		name = "Dusk Stone",
		icon = "dusk-stone",
		pocket = MiscData.BagPocket.Items,
	},
	[220] = {
		id = 220,
		name = "Dawn Stone",
		icon = "dawn-stone",
		pocket = MiscData.BagPocket.Items,
	},
}

MiscData.BattleItems = {
	[109] = {
		icon = "blue-flute",
		pocket = MiscData.BagPocket.Items,
	},
	[110] = {
		icon = "yellow-flute",
		pocket = MiscData.BagPocket.Items,
	},
	[111] = {
		icon = "red-flute",
		pocket = MiscData.BagPocket.Items,
	},
}
for i=121, 126, 1 do -- X Items, Dire Hit, Guard Spec.
	MiscData.BattleItems[i] = {
		icon = "x-item",
		pocket = MiscData.BagPocket.Items,
	}
end

MiscData.OtherItems = {}
for i=65, 72, 1 do -- Vitamins and Candies
	MiscData.OtherItems[i] = {
		icon = i == 68 and "candy" or "vitamin",
		pocket = MiscData.BagPocket.Items,
	}
end
for i=102, 108, 1 do -- Vitamins and Candies
	MiscData.OtherItems[i] = {
		icon = i == 68 and "candy" or "vitamin",
		pocket = MiscData.BagPocket.Items,
	}
end
MiscData.OtherItems[115] = { -- Super Repel
	icon = "repel",
	pocket = MiscData.BagPocket.Items,
}
MiscData.OtherItems[116] = { -- Max Repel
	icon = "repel",
	pocket = MiscData.BagPocket.Items,
}
MiscData.OtherItems[114] = { -- Repel
	icon = "repel",
	pocket = MiscData.BagPocket.Items,
}
MiscData.OtherItems[460] = { -- White Herb
	icon = "white-herb",
	pocket = MiscData.BagPocket.Items,
}
MiscData.OtherItems[464] = { -- Mental Herb
	icon = "mental-herb",
	pocket = MiscData.BagPocket.Items,
}