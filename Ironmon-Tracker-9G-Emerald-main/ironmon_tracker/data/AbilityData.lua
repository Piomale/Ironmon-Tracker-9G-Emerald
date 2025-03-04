AbilityData = {}

AbilityData.Values = {
	LevitateId = 26,
	TraceId = 36,
	HugePowerId = 37,
	ThickFatId = 47,
	TruantId = 54,
	HustleId = 55,
	PurePowerId = 74,
	CacophonyId = 76,
}

function AbilityData.initialize()
	AbilityData.buildData()
end

function AbilityData.updateResources()
	for i, val in ipairs(AbilityData.Abilities) do
		if Resources.Game.AbilityNames[i] then
			val.name = Resources.Game.AbilityNames[i]
		end

		local descTable = Resources.Game.AbilityDescriptions[i] or {}
		if descTable.Description then
			val.description = descTable.Description
		end
		if descTable.DescriptionEmerald then
			val.descriptionEmerald = descTable.DescriptionEmerald
		end
	end
end

---Currently unused; builds the AbilityData from game memory.
---@param forced boolean? Optional, forces the data to be read in from the game
function AbilityData.buildData(forced)
	-- if not forced or someNonExistentCondition then -- Currently Unused/unneeded
	-- 	return
	-- end

	-- Not currently necessary, as this data doesn't really change.
end

---Returns true if the abilityId is a valid, existing id of an ability in AbilityData.Abilities
---@param abilityId number
---@return boolean
function AbilityData.isValid(abilityId)
	return abilityId ~= nil and abilityId >= 1 and abilityId <= #AbilityData.Abilities
end

function AbilityData.populateAbilityDropdown(abilityList)
	for _, ability in ipairs(AbilityData.Abilities) do
		if ability.id ~= AbilityData.Values.CacophonyId then
			table.insert(abilityList, ability.name)
		end
	end
	return abilityList
end

AbilityData.DefaultAbility = {
	id = 0,
	name = "Ability Info",
	description = "Click the magnifying glass to look up an ability!",
}

-- This list and each name are now populated by its respective language Resource file (e.g. English.lua)
AbilityData.Abilities = {
	{
		id = 1,
		name = "Stench",
	},
	{
		id = 2,
		name = "Drizzle",
	},
	{
		id = 3,
		name = "Speed Boost",
	},
	{
		id = 4,
		name = "Battle Armor",
	},
	{
		id = 5,
		name = "Sturdy",
	},
	{
		id = 6,
		name = "Damp",
	},
	{
		id = 7,
		name = "Limber",
	},
	{
		id = 8,
		name = "Sand Veil",
	},
	{
		id = 9,
		name = "Static",
	},
	{
		id = 10,
		name = "Volt Absorb",
	},
	{
		id = 11,
		name = "Water Absorb",
	},
	{
		id = 12,
		name = "Oblivious",
	},
	{
		id = 13,
		name = "Cloud Nine",
	},
	{
		id = 14,
		name = "Compound Eyes",
	},
	{
		id = 15,
		name = "Insomnia",
	},
	{
		id = 16,
		name = "Color Change",
	},
	{
		id = 17,
		name = "Immunity",
	},
	{
		id = 18,
		name = "Flash Fire",
	},
	{
		id = 19,
		name = "Shield Dust",
	},
	{
		id = 20,
		name = "Own Tempo",
	},
	{
		id = 21,
		name = "Suction Cups",
	},
	{
		id = 22,
		name = "Intimidate",
	},
	{
		id = 23,
		name = "Shadow Tag",
	},
	{
		id = 24,
		name = "Rough Skin",
	},
	{
		id = 25,
		name = "Wonder Guard",
	},
	{
		id = 26,
		name = "Levitate",
	},
	{
		id = 27,
		name = "Effect Spore",
	},
	{
		id = 28,
		name = "Synchronize",
	},
	{
		id = 29,
		name = "Clear Body",
	},
	{
		id = 30,
		name = "Natural Cure",
	},
	{
		id = 31,
		name = "Lightning Rod",
	},
	{
		id = 32,
		name = "Serene Grace",
	},
	{
		id = 33,
		name = "Swift Swim",
	},
	{
		id = 34,
		name = "Chlorophyll",
	},
	{
		id = 35,
		name = "Illuminate",
	},
	{
		id = 36,
		name = "Trace",
	},
	{
		id = 37,
		name = "Huge Power",
	},
	{
		id = 38,
		name = "Poison Point",
	},
	{
		id = 39,
		name = "Inner Focus",
	},
	{
		id = 40,
		name = "Magma Armor",
	},
	{
		id = 41,
		name = "Water Veil",
	},
	{
		id = 42,
		name = "Magnet Pull",
	},
	{
		id = 43,
		name = "Soundproof",
	},
	{
		id = 44,
		name = "Rain Dish",
	},
	{
		id = 45,
		name = "Sand Stream",
	},
	{
		id = 46,
		name = "Pressure",
	},
	{
		id = 47,
		name = "Thick Fat",
	},
	{
		id = 48,
		name = "Early Bird",
	},
	{
		id = 49,
		name = "Flame Body",
	},
	{
		id = 50,
		name = "Run Away",
	},
	{
		id = 51,
		name = "Keen Eye",
	},
	{
		id = 52,
		name = "Hyper Cutter",
	},
	{
		id = 53,
		name = "Pickup",
	},
	{
		id = 54,
		name = "Truant",
	},
	{
		id = 55,
		name = "Hustle",
	},
	{
		id = 56,
		name = "Cute Charm",
	},
	{
		id = 57,
		name = "Plus",
	},
	{
		id = 58,
		name = "Minus",
	},
	{
		id = 59,
		name = "Forecast",
	},
	{
		id = 60,
		name = "Sticky Hold",
	},
	{
		id = 61,
		name = "Shed Skin",
	},
	{
		id = 62,
		name = "Guts",
	},
	{
		id = 63,
		name = "Marvel Scale",
	},
	{
		id = 64,
		name = "Liquid Ooze",
	},
	{
		id = 65,
		name = "Overgrow",
	},
	{
		id = 66,
		name = "Blaze",
	},
	{
		id = 67,
		name = "Torrent",
	},
	{
		id = 68,
		name = "Swarm",
	},
	{
		id = 69,
		name = "Rock Head",
	},
	{
		id = 70,
		name = "Drought",
	},
	{
		id = 71,
		name = "Arena Trap",
	},
	{
		id = 72,
		name = "Vital Spirit",
	},
	{
		id = 73,
		name = "White Smoke",
	},
	{
		id = 74,
		name = "Pure Power",
	},
	{
		id = 75,
		name = "Shell Armor",
	},
	{
		id = 76,
		name = "Air Lock",
	},
	{
		id = 77,
		name = "Tangled Feet",
	},
	{
		id = 78,
		name = "Motor Drive",
	},
	{
		id = 79,
		name = "Rivalry",
	},
	{
		id = 80,
		name = "Steadfast",
	},
	{
		id = 81,
		name = "Snow Cloak",
	},
	{
		id = 82,
		name = "Gluttony",
	},
	{
		id = 83,
		name = "Anger Point",
	},
	{
		id = 84,
		name = "Unburden",
	},
	{
		id = 85,
		name = "Heatproof",
	},
	{
		id = 86,
		name = "Simple",
	},
	{
		id = 87,
		name = "Dry Skin",
	},
	{
		id = 88,
		name = "Download",
	},
	{
		id = 89,
		name = "Iron Fist",
	},
	{
		id = 90,
		name = "Poison Heal",
	},
	{
		id = 91,
		name = "Adaptability",
	},
	{
		id = 92,
		name = "Skill Link",
	},
	{
		id = 93,
		name = "Hydration",
	},
	{
		id = 94,
		name = "Solar Power",
	},
	{
		id = 95,
		name = "Quick Feet",
	},
	{
		id = 96,
		name = "Normalize",
	},
	{
		id = 97,
		name = "Sniper",
	},
	{
		id = 98,
		name = "Magic Guard",
	},
	{
		id = 99,
		name = "No Guard",
	},
	{
		id = 100,
		name = "Stall",
	},
	{
		id = 101,
		name = "Technician",
	},
	{
		id = 102,
		name = "Leaf Guard",
	},
	{
		id = 103,
		name = "Klutz",
	},
	{
		id = 104,
		name = "Mold Breaker",
	},
	{
		id = 105,
		name = "Super Luck",
	},
	{
		id = 106,
		name = "Aftermath",
	},
	{
		id = 107,
		name = "Anticipation",
	},
	{
		id = 108,
		name = "Forewarn",
	},
	{
		id = 109,
		name = "Unaware",
	},
	{
		id = 110,
		name = "Tinted Lens",
	},
	{
		id = 111,
		name = "Filter",
	},
	{
		id = 112,
		name = "Slow Start",
	},
	{
		id = 113,
		name = "Scrappy",
	},
	{
		id = 114,
		name = "Storm Drain",
	},
	{
		id = 115,
		name = "Ice Body",
	},
	{
		id = 116,
		name = "Solid Rock",
	},
	{
		id = 117,
		name = "Snow Warning",
	},
	{
		id = 118,
		name = "Honey Gather",
	},
	{
		id = 119,
		name = "Frisk",
	},
	{
		id = 120,
		name = "Reckless",
	},
	{
		id = 121,
		name = "Multitype",
	},
	{
		id = 122,
		name = "Flower Gift",
	},
	{
		id = 123,
		name = "Bad Dreams",
	},
	{
		id = 124,
		name = "Pickpocket",
	},
	{
		id = 125,
		name = "Sheer Force",
	},
	{
		id = 126,
		name = "Contrary",
	},
	{
		id = 127,
		name = "Unnerve",
	},
	{
		id = 128,
		name = "Defiant",
	},
	{
		id = 129,
		name = "Defeatist",
	},
	{
		id = 130,
		name = "Cursed Body",
	},
	{
		id = 131,
		name = "Healer",
	},
	{
		id = 132,
		name = "Friend Guard",
	},
	{
		id = 133,
		name = "Weak Armor",
	},
	{
		id = 134,
		name = "Heavy Metal",
	},
	{
		id = 135,
		name = "Light Metal",
	},
	{
		id = 136,
		name = "Multiscale",
	},
	{
		id = 137,
		name = "Toxic Boost",
	},
	{
		id = 138,
		name = "Flare Boost",
	},
	{
		id = 139,
		name = "Harvest",
	},
	{
		id = 140,
		name = "Telepathy",
	},
	{
		id = 141,
		name = "Moody",
	},
	{
		id = 142,
		name = "Overcoat",
	},
	{
		id = 143,
		name = "Poison Touch",
	},
	{
		id = 144,
		name = "Regenerator",
	},
	{
		id = 145,
		name = "Big Pecks",
	},
	{
		id = 146,
		name = "Sand Rush",
	},
	{
		id = 147,
		name = "Wonder Skin",
	},
	{
		id = 148,
		name = "Analytic",
	},
	{
		id = 149,
		name = "Illusion",
	},
	{
		id = 150,
		name = "Imposter",
	},
	{
		id = 151,
		name = "Infiltrator",
	},
	{
		id = 152,
		name = "Mummy",
	},
	{
		id = 153,
		name = "Moxie",
	},
	{
		id = 154,
		name = "Justified",
	},
	{
		id = 155,
		name = "Rattled",
	},
	{
		id = 156,
		name = "Magic Bounce",
	},
	{
		id = 157,
		name = "Sap Sipper",
	},
	{
		id = 158,
		name = "Prankster",
	},
	{
		id = 159,
		name = "Sand Force",
	},
	{
		id = 160,
		name = "Iron Barbs",
	},
	{
		id = 161,
		name = "Zen Mode",
	},
	{
		id = 162,
		name = "Victory Star",
	},
	{
		id = 163,
		name = "Turboblaze",
	},
	{
		id = 164,
		name = "Teravolt",
	},
	{
		id = 165,
		name = "Aroma Veil",
	},
	{
		id = 166,
		name = "Flower Veil",
	},
	{
		id = 167,
		name = "Cheek Pouch",
	},
	{
		id = 168,
		name = "Protean",
	},
	{
		id = 169,
		name = "Fur Coat",
	},
	{
		id = 170,
		name = "Magician",
	},
	{
		id = 171,
		name = "Bulletproof",
	},
	{
		id = 172,
		name = "Competitive",
	},
	{
		id = 173,
		name = "Strong Jaw",
	},
	{
		id = 174,
		name = "Refrigerate",
	},
	{
		id = 175,
		name = "Sweet Veil",
	},
	{
		id = 176,
		name = "Stance Change",
	},
	{
		id = 177,
		name = "Gale Wings",
	},
	{
		id = 178,
		name = "Mega Launcher",
	},
	{
		id = 179,
		name = "Grass Pelt",
	},
	{
		id = 180,
		name = "Symbiosis",
	},
	{
		id = 181,
		name = "Tough Claws",
	},
	{
		id = 182,
		name = "Pixilate",
	},
	{
		id = 183,
		name = "Gooey",
	},
	{
		id = 184,
		name = "Aerilate",
	},
	{
		id = 185,
		name = "Parental Bond",
	},
	{
		id = 186,
		name = "Dark Aura",
	},
	{
		id = 187,
		name = "Fairy Aura",
	},
	{
		id = 188,
		name = "Aura Break",
	},
	{
		id = 189,
		name = "Primordial Sea",
	},
	{
		id = 190,
		name = "Desolate Land",
	},
	{
		id = 191,
		name = "Delta Stream",
	},
	{
		id = 192,
		name = "Stamina",
	},
	{
		id = 193,
		name = "Wimp Out",
	},
	{
		id = 194,
		name = "Emergency Exit",
	},
	{
		id = 195,
		name = "Water Compaction",
	},
	{
		id = 196,
		name = "Merciless",
	},
	{
		id = 197,
		name = "Shields Down",
	},
	{
		id = 198,
		name = "Stakeout",
	},
	{
		id = 199,
		name = "Water Bubble",
	},
	{
		id = 200,
		name = "Steelworker",
	},
	{
		id = 201,
		name = "Berserk",
	},
	{
		id = 202,
		name = "Slush Rush",
	},
	{
		id = 203,
		name = "Long Reach",
	},
	{
		id = 204,
		name = "Liquid Voice",
	},
	{
		id = 205,
		name = "Triage",
	},
	{
		id = 206,
		name = "Galvanize",
	},
	{
		id = 207,
		name = "Surge Surfer",
	},
	{
		id = 208,
		name = "Schooling",
	},
	{
		id = 209,
		name = "Disguise",
	},
	{
		id = 210,
		name = "Battle Bond",
	},
	{
		id = 211,
		name = "Power Construct",
	},
	{
		id = 212,
		name = "Corrosion",
	},
	{
		id = 213,
		name = "Comatose",
	},
	{
		id = 214,
		name = "Queenly Majesty",
	},
	{
		id = 215,
		name = "Innards Out",
	},
	{
		id = 216,
		name = "Dancer",
	},
	{
		id = 217,
		name = "Battery",
	},
	{
		id = 218,
		name = "Fluffy",
	},
	{
		id = 219,
		name = "Dazzling",
	},
	{
		id = 220,
		name = "Soul Heart",
	},
	{
		id = 221,
		name = "Tangling Hair",
	},
	{
		id = 222,
		name = "Receiver",
	},
	{
		id = 223,
		name = "Power Of Alchemy",
	},
	{
		id = 224,
		name = "Beast Boost",
	},
	{
		id = 225,
		name = "Rks System",
	},
	{
		id = 226,
		name = "Electric Surge",
	},
	{
		id = 227,
		name = "Psychic Surge",
	},
	{
		id = 228,
		name = "Misty Surge",
	},
	{
		id = 229,
		name = "Grassy Surge",
	},
	{
		id = 230,
		name = "Full Metal Body",
	},
	{
		id = 231,
		name = "Shadow Shield",
	},
	{
		id = 232,
		name = "Prism Armor",
	},
	{
		id = 233,
		name = "Neuroforce",
	},
	{
		id = 234,
		name = "Intrepid Sword",
	},
	{
		id = 235,
		name = "Dauntless Shield",
	},
	{
		id = 236,
		name = "Libero",
	},
	{
		id = 237,
		name = "Ball Fetch",
	},
	{
		id = 238,
		name = "Cotton Down",
	},
	{
		id = 239,
		name = "Propeller Tail",
	},
	{
		id = 240,
		name = "Mirror Armor",
	},
	{
		id = 241,
		name = "Gulp Missile",
	},
	{
		id = 242,
		name = "Stalwart",
	},
	{
		id = 243,
		name = "Steam Engine",
	},
	{
		id = 244,
		name = "Punk Rock",
	},
	{
		id = 245,
		name = "Sand Spit",
	},
	{
		id = 246,
		name = "Ice Scales",
	},
	{
		id = 247,
		name = "Ripen",
	},
	{
		id = 248,
		name = "Ice Face",
	},
	{
		id = 249,
		name = "Power Spot",
	},
	{
		id = 250,
		name = "Mimicry",
	},
	{
		id = 251,
		name = "Screen Cleaner",
	},
	{
		id = 252,
		name = "Steely Spirit",
	},
	{
		id = 253,
		name = "Perish Body",
	},
	{
		id = 254,
		name = "Wandering Spirit",
	},
	{
		id = 255,
		name = "Gorilla Tactics",
	},
	{
		id = 256,
		name = "Neutralizing Gas",
	},
	{
		id = 257,
		name = "Pastel Veil",
	},
	{
		id = 258,
		name = "Hunger Switch",
	},
	{
		id = 259,
		name = "Quick Draw",
	},
	{
		id = 260,
		name = "Unseen Fist",
	},
	{
		id = 261,
		name = "Curious Medicine",
	},
	{
		id = 262,
		name = "Transistor",
	},
	{
		id = 263,
		name = "Dragons Maw",
	},
	{
		id = 264,
		name = "Chilling Neigh",
	},
	{
		id = 265,
		name = "Grim Neigh",
	},
	{
		id = 266,
		name = "As One Ice Rider",
	},
	{
		id = 267,
		name = "As One Shadow Rider",
	},
	{
		id = 268,
		name = "Lingering Aroma",
	},
	{
		id = 269,
		name = "Seed Sower",
	},
	{
		id = 270,
		name = "Thermal Exchange",
	},
	{
		id = 271,
		name = "Anger Shell",
	},
	{
		id = 272,
		name = "Purifying Salt",
	},
	{
		id = 273,
		name = "Well Baked Body",
	},
	{
		id = 274,
		name = "Wind Rider",
	},
	{
		id = 275,
		name = "Guard Dog",
	},
	{
		id = 276,
		name = "Rocky Payload",
	},
	{
		id = 277,
		name = "Wind Power",
	},
	{
		id = 278,
		name = "Zero To Hero",
	},
	{
		id = 279,
		name = "Commander",
	},
	{
		id = 280,
		name = "Electromorphosis",
	},
	{
		id = 281,
		name = "Protosynthesis",
	},
	{
		id = 282,
		name = "Quark Drive",
	},
	{
		id = 283,
		name = "Good As Gold",
	},
	{
		id = 284,
		name = "Vessel Of Ruin",
	},
	{
		id = 285,
		name = "Sword Of Ruin",
	},
	{
		id = 286,
		name = "Tablets Of Ruin",
	},
	{
		id = 287,
		name = "Beads Of Ruin",
	},
	{
		id = 288,
		name = "Orichalcum Pulse",
	},
	{
		id = 289,
		name = "Hadron Engine",
	},
	{
		id = 290,
		name = "Opportunist",
	},
	{
		id = 291,
		name = "Cud Chew",
	},
	{
		id = 292,
		name = "Sharpness",
	},
	{
		id = 293,
		name = "Supreme Overlord",
	},
	{
		id = 294,
		name = "Costar",
	},
	{
		id = 295,
		name = "Toxic Debris",
	},
	{
		id = 296,
		name = "Armor Tail",
	},
	{
		id = 297,
		name = "Earth Eater",
	},
	{
		id = 298,
		name = "Mycelium Might",
	},
	{
		id = 299,
		name = "Hospitality",
	},
	{
		id = 300,
		name = "Minds Eye",
	},
	{
		id = 301,
		name = "Embody Aspect Teal Mask",
	},
	{
		id = 302,
		name = "Embody Aspect Hearthflame Mask",
	},
	{
		id = 303,
		name = "Embody Aspect Wellspring Mask",
	},
	{
		id = 304,
		name = "Embody Aspect Cornerstone Mask",
	},
	{
		id = 305,
		name = "Toxic Chain",
	},
	{
		id = 306,
		name = "Supersweet Syrup",
	},
	{
		id = 307,
		name = "Tera Shift",
	},
	{
		id = 308,
		name = "Tera Shell",
	},
	{
		id = 309,
		name = "Teraform Zero",
	},
	{
		id = 310,
		name = "Poison Puppeteer",
	},
}