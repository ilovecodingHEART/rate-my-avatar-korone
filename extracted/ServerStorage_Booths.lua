local Booths = {}

Booths.Booths = {
	AquariumBooth = {
		price = 10000,
		name = 'AquariumBooth',
		icon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(530, 506),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(771, 265),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DevilBooth = {
		price = 50,
		name = 'DevilBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FortuneBooth = {
		price = 80,
		name = 'FortuneBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CraneBooth = {
		name = 'CraneBooth',
		price = -0,
		icon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BasicBooth = {
		name = "BasicBooth",
		id = "BasicBooth",
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	DiamondBooth = {
		name = "DiamondBooth",
		id = "DiamondBooth",
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GoldBooth = {
		name = "GoldBooth",
		id = "GoldBooth",
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(241,241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	VoidBooth = {
		name = "VoidBooth",
		id = "VoidBooth",
		icon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(241,723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	["10KBooth"] = {
		name = "10KBooth",
		id = "10KBooth",
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	["100KBooth"] = {
		name = "100KBooth",
		id = "100KBooth",
		icon = {
			Image = 'rbxassetid://133540444145848',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://138997885490833',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0,0)
		},
	},
	['2024Booth'] = {
		name = '2024Booth',
		price = 500,
		icon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CookieBooth = {
		name = 'CookieBooth',
		price = 500,
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GhostBooth = {
		price = 125,
		name = 'GhostBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GraveyardBooth = {
		price = 150,
		name = 'GraveyardBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HalloweenCandyBooth = {
		price = 150,
		name = 'HalloweenCandyBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HauntedHouseBooth = {
		price = 260,
		name = 'HauntedHouseBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PumpkinBooth = {
		price = 300,
		name = 'PumpkinBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},			
	WitchBooth = {
		price = 250,
		name = 'WitchBooth',
		icon = {
			Image = 'rbxassetid://11299486372',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486372',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ArcadeBooth = {
		price = 450,
		name = 'ArcadeBooth',
		icon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(771, 506),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(265, 771),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CafeBooth = {
		price = 150,
		name = 'CafeBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CandyBooth = {
		price = 100,
		name = 'CandyBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FlowerBooth = {
		name = 'FlowerBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FrogBooth = {
		price = 90,
		name = 'FrogBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FruitBooth = {
		name = 'FruitBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HoneyBooth = {
		price = 80,
		name = 'HoneyBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HotBalloonBooth = {
		price = 80,
		name = 'HotBalloonBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HotdogBooth = {
		price = 250,
		name = 'HotdogBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	IceCreamBooth = {
		price = 250,
		name = 'IceCreamBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JungleBooth = {
		price = 200,
		name = 'JungleBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	OrientalBooth = {
		price = 200,
		name = 'OrientalBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SlimeBooth = {
		price = 120,
		name = 'SlimeBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SpeechBooth = {
		price = 125,
		name = 'SpeechBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	StageBooth = {
		price = 200,
		name = 'StageBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	StarryBooth = {
		price = 240,
		name = 'StarryBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TropicalBooth = {
		price = 50,
		name = 'TropicalBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BurgerYumBooth = {
		price = 150,
		name = 'BurgerYumBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CatBooth = {
		name = 'CatBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CloudyBooth = {

		price = 175,
		name = 'CloudyBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ConvenienceBooth = {
		price = 200,
		name = 'ConvenienceBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DogBooth = {
		price = 500,
		name = 'DogBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DonutBooth = {
		price = 350,
		name = 'DonutBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	EgyptianBooth = {
		price = 200,
		name = 'EgyptianBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FireBooth = {
		price = 200,
		name = 'FireBooth',
		icon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485293',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GlitchBooth = {
		price = 700,
		name = 'GlitchBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	IcyBooth = {
		price = 200,
		name = 'IcyBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JellyBooth = {
		price = 100,
		name = 'JellyBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LectureBooth = {

		price = 120,
		name = 'LectureBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LemonadeBooth = {
		price = 210,
		name = 'LemonadeBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LindonFunnyBooth = {
		price = 120,
		name = 'LindonFunnyBooth',
		icon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(530, 15),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(0, 280),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	MakeAWishBooth = {
		price = 200,
		name = 'MakeAWishBooth',
		icon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(10, 530),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(275, 265),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	MedievalBooth = {
		price = 100,
		name = 'MedievalBooth',
		icon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485609',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	MilitaryBooth = {
		price = 200,
		name = 'MilitaryBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	MusicBooth = {
		price = 150,
		name = 'MusicBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PixelBooth = {
		price = 350,
		name = 'PixelBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PetSimXBooth = {
		price = 90,
		name = 'PetSimXBooth',
		icon = {
			Image = 'rbxassetid://11673969087',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11673969087',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RacingCarBooth = {
		price = 175,
		name = 'RacingCarBooth',
		icon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485133',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RockBooth = {
		price = 200,
		name = 'RockBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RubyBooth = {
		price = 150,
		name = 'RubyBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ShipSeaBooth = {
		price = 150,
		name = 'ShipSeaBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SoupBooth = {
		price = 145,
		name = 'SoupBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SpaceInterfaceBooth = {
		price = 200,
		name = 'SpaceInterfaceBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SpraryPaintBooth = {
		price = 300,
		name = 'SpraryPaintBooth',
		icon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486082',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	StandGrillBooth = {
		price = 200,
		name = 'StandGrillBooth',
		icon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485477',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SunMoonBooth = {
		price = 500,
		name = 'SunMoonBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SushiBooth = {
		price = 450,
		name = 'SushiBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ToyBooth = {
		price = 150,
		name = 'ToyBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	UnoCardBooth = {
		price = 245,
		name = 'UnoCardBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	VendingMachineBooth = {
		price = 200,
		name = 'VendingMachineBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	WishingWellBooth = {
		price = 200,
		name = 'WishingWellBooth',
		icon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486287',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	YippeeBooth = {
		price = 170,
		name = 'YippeeBooth',
		icon = {
			Image = 'rbxassetid://11299486372',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299486372',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	YummyPizzaBooth = {
		price = 200,
		name = 'YummyPizzaBooth',
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FireplaceBooth = {
		price = 135,
		name = 'FireplaceBooth',
		icon = {
			Image = 'rbxassetid://11896316335',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11896316335',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ThroneBooth = {
		price = 600,
		name = 'ThroneBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FarmBooth = {
		price = 200,
		name = 'FarmBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BiplaneBooth = {
		price = 150,
		name = 'BiplaneBooth',
		icon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ClassroomBooth = {
		price = 1,
		name = 'ClassroomBooth',
		icon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GlassBooth = {
		price = 10000,
		name = 'GlassBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	InvisibleBooth = {
		price = 99999,
		name = 'InvisibleBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	OlixBooth = {
		price = 1500,
		name = 'OlixBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BlackHoleBooth = {
		price = 3000,
		name = 'BlackHoleBooth',
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CatalogAvatarCreatorBooth = {
		price = 150,
		name = 'CatalogAvatarCreatorBooth',
		icon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DoorsBooth = {
		price = 100,
		name = 'DoorsBooth',
		icon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	IdioticInvestingBooth = {
		price = 200,
		name = 'IdioticInvestingBooth',
		icon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(265, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299484928',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DreamingBooth = {price = 120,
		name = 'DreamingBooth',
		icon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597369',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	AnniversaryBooth = {
		price = 150,
		name = 'AnniversaryBooth',
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LazarBeamBooth = {
		price = 90,
		name = 'LazarBeamBooth',
		icon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(482, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://12306597733',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ValentinesBooth = {
		price = 110,
		name = 'ValentinesBooth',
		icon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(482, 481),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(723, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PieBooth = {
		price = 150,
		name = 'PieBooth',
		icon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	StepBooth = {
		price = 170,
		name = 'StepBooth',
		icon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(483, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(724, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	UnicornAcademyBooth = {
		price = 270,
		name = 'UnicornAcademyBooth',
		icon = {
			Image = 'rbxassetid://14695248633',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14695248633',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RecordingStudioBooth = {
		price = 200,
		name = 'RecordingStudioBooth',
		icon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750433',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CampfireBooth = {
		price = 160,
		name = 'CampfireBooth',
		icon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TypeRaceBooth = {
		price = 200,
		name = 'TypeRaceBooth',
		icon = {
			Image = 'rbxassetid://13759798017',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759798017',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TacoBooth = {
		price = 170,
		name = 'TacoBooth',
		icon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(724, 483),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(242, 724),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LegacyBooth = {
		price = 9999,
		name = 'LegacyBooth',
		icon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TeaBooth = {
		price = 140,
		name = 'TeaBooth',
		icon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DonationMadnessBooth = {
		price = 1000,
		name = 'DonationMadnessBooth',
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	MagicianBooth = {
		price = 200,
		name = 'MagicianBooth',
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	PixelPlaygroundBooth = {
		price = 250,
		name = 'PixelPlaygroundBooth',
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(724, 723),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(483, 723),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	ConstructionBooth = {
		price = 210,
		name = 'ConstructionBooth',
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	FishingBooth = {
		price = 150,
		name = 'FishingBooth',
		icon = {
			Image = 'rbxassetid://0',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0,0)
		},
		hoverIcon = {
			Image = 'rbxassetid://0',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0,0)
		},
	},
	SurfBooth = {
		price = 150,
		name = 'SurfBooth',
		icon = {
			Image = 'rbxassetid://0',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0,0)
		},
		hoverIcon = {
			Image = 'rbxassetid://0',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0,0)
		},
	},
	PraefectusStand = {
		price = 150,
		name = 'PraefectusStand',
		icon = {
			Image = 'rbxassetid://13759798017',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759798017',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	BeachBooth = {
		price = 300,
		name = 'BeachBooth',
		icon = {
			Image = 'rbxassetid://11896316093',
			ImageRectOffset = Vector2.new(771, 747),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11896316093',
			ImageRectOffset = Vector2.new(530, 747),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	CavemanBooth = {
		price = 150,
		name = 'CavemanBooth',
		icon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240,240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759749907',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240,240)
		},
	},
	MovieBooth = {
		name = 'MovieBooth',
		price = 200,
		icon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11299485837',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TVBooth = {
		id = 'TVBooth',
		price = 500,
		icon = {
			Image = 'rbxassetid://17718014379',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014379',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SkyscraperBooth = {
		name = 'SkyscraperBooth',
		price = 5000,
		icon = {
			Image = 'rbxassetid://17718014379',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014379',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RitualBooth = {
		price = 150,
		name = 'RitualBooth',
		icon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(265, 530),
			ImageRectSize = Vector2.new(264, 264)
		},
		hoverIcon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(530, 265),
			ImageRectSize = Vector2.new(264, 264)
		},
	},
	["CarouselBooth"] = {
		price = 500000,
		name = 'CarouselBooth',
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ScienceLabBooth = {
		name = 'ScienceLabBooth',
		price = 400,
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BreadBooth = {
		name = 'BreadBooth',
		price = 300,
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	RocketBooth = {
		name = 'RocketBooth',
		price = -0,
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(723, 480),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(241, 721),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BillboardBooth = {
		name = 'BillboardBooth',
		icon = {
			Image = 'rbxassetid://114156141112145',
			ImageRectOffset = Vector2.new(0,0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://114156141112145',
			ImageRectOffset = Vector2.new(0,0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JackInTheBoxBooth = {
		name = 'JackInTheBoxBooth',
		icon = {
			Image = "rbxassetid://91952219189640",
			ImageRectOffset = Vector2.new(0,0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://91952219189640",
			ImageRectOffset = Vector2.new(0,0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	["FerrisWheelBooth"] = {
		price = 350000,
		name = 'FerrisWheelBooth',
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LaundryBooth = {
		name = 'LaundryBooth',
		price = 200,
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CastleBooth = {
		name = 'CastleBooth',
		price = 150,
		icon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://17718014247',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CottonCandyBooth = {
		name = 'CottonCandyBooth',
		price = 200,
		icon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	UFOBooth = {
		name = 'UFOBooth',
		price = 500,
		icon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LLSBooth = {
		name = 'LLSBooth',
		price = 500,
		icon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://14158980628',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	["TrainBooth"] = {
		price = 250,
		name = 'TrainBooth',
		icon = {
			Image = "rbxassetid://15524352931",
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15524352931",
			ImageRectOffset = Vector2.new(241, 241), --241, 241
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	["RainbowBooth"] = {
		price = 99999,
		name = 'RainbowBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	VideoGameBooth = {
		price = 300,
		name = 'VideoGameBooth',
		icon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	NukeBooth = {
		price = 20000000,
		name = 'NukeBooth',
		icon = {
			Image = "rbxassetid://139414484667224",
			ImageRectOffset = Vector2.new(397, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = "rbxassetid://139414484667224",
			ImageRectOffset = Vector2.new(0, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	CrystalBooth = {
		price = 200,
		name = "CrystalBooth",
		icon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	KSIBooth = {
		price = 0,
		name = "KSIBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	TwitchBooth = {
		price = 480,
		name = "TwitchBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	DaysBooth = {
		price = 100,
		name = "100DaysBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	DayBooth = {
		price = 100,
		name = "30DaysBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	EvadeBooth = {
		price = 480,
		name = "EvadeBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	BarberBooth = {
		price = 1000,
		name = "BarberBooth",
		icon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	WildWestBooth = {
		price = 750,
		name = 'WildWestBooth',
		icon = {
			Image = "rbxassetid://14158980759",
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://14158980759",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CouchBooth = {
		price = 180,
		name = 'CouchBooth',
		icon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352132',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ZenBooth = {
		price = 250,
		name = 'ZenBooth',
		icon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(241, 723)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352931',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GasPumpBooth = {
		price = 500,
		name = 'GasPumpBooth',
		icon = {
			Image = 'rbxassetid://131592402593115',
			ImageRectOffset = Vector2.new(397, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = 'rbxassetid://131592402593115',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	GymBooth = {
		price = 100,
		name = 'GymBooth',
		icon = {
			Image = 'rbxassetid://116893425894122',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://116893425894122',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	OfficeDeskBooth = {
		price = 125,
		name = 'OfficeDeskBooth',
		icon = {
			Image = 'rbxassetid://138223231927546',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://138223231927546',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	RefrigeratorBooth = {
		price = 325,
		name = 'RefrigeratorBooth',
		icon = {
			Image = 'rbxassetid://110776550776765',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://110776550776765',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	SandCastleBooth = {
		price = 480,
		name = 'SandCastleBooth',
		icon = {
			Image = 'rbxassetid://90396211529708',
			ImageRectOffset = Vector2.new(397, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = 'rbxassetid://90396211529708',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	WitchPotionsBooth = {
		price = 750,
		name = 'WitchPotionsBooth',
		icon = {
			Image = 'rbxassetid://137401734188231',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://137401734188231',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	UNOfficialBooth = {
		price = 1000,
		name = 'UNOfficialBooth',
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	CircusBooth = {
		price = 100,
		name = 'CircusBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	PoolBooth = {
		price = 200,
		name = 'PoolBooth',
		icon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JuiceBoxBooth = {
		price = 750,
		name = 'JuiceBoxBooth',
		icon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(0, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(241, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BubbleGumBooth = {
		price = 200,
		name = 'BubbleGumBooth',
		icon = {
			Image = "rbxassetid://15524352132",
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15524352132",
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	XmasDinnerBooth = {
		price = 300,
		name = 'XmasDinnerBooth',
		icon = {
			Image = "rbxassetid://15720083965",
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15720083965",
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PianoBooth = {
		price = 750,
		name = 'PianoBooth',
		icon = {
			Image = "rbxassetid://15524352541",
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15524352541",
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	IceRinkBooth = {
		price = 750,
		name = 'IceRinkBooth',
		icon = {
			Image = "rbxassetid://15720083965",
			ImageRectOffset = Vector2.new(482, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15720083965",
			ImageRectOffset = Vector2.new(0, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	CowBooth = {
		price = 250,
		name = 'CowBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	SpaceBooth = {
		price = 500,
		name = 'SpaceBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	BellBooth = {
		price = 250,
		name = 'BellBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	ArtStudioBooth = {
		price = 250,
		name = 'ArtStudioBooth',
		icon = {
			Image = "rbxassetid://15524352132",
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = "rbxassetid://15524352132",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	TDSBooth = {
		price = 0,
		name = 'TDSBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	RDC25Booth = {
		price = 999999999,
		name = 'RDC25Booth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	LockerBooth = {
		price = 700,
		name = 'LockerBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
-- halloween booths
	BlackCatBooth = {
		price = 500,
		name = 'BlackCatBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	FrankensteinBooth = {
		price = 250,
		name = 'FrankensteinBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	HalloweenPartyBooth = {
		price = 750,
		name = 'HalloweenPartyBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	PumpkinBalloonBooth = {
		price = 10000,
		name = 'PumpkinBalloonBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	ScaryMovieBooth = {
		price = 800,
		name = 'ScaryMovieBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	SpookySkeletonBooth = {
		price = 500,
		name = 'SpookySkeletonBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	SeanceBooth = {
		price = 1000,
		name = 'SeanceBooth',
		icon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = "rbxassetid://15842040263",
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	GardenerBooth = {
		price = 400,
		name = 'GardenerBooth',
		icon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	DJBooth = {
		price = 300,
		name = 'DJBooth',
		icon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15524352541',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	HammockBooth = {
		price = 750,
		name = 'HammockBooth',
		icon = {
			Image = 'rbxassetid://87171690712703',
			ImageRectOffset = Vector2.new(397, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = 'rbxassetid://87171690712703',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	GlassAnimalsBooth = {
		price = 0,
		name = 'GlassAnimalsBooth',
		icon = {
			Image = 'rbxassetid://131592402593115',
			ImageRectOffset = Vector2.new(397, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = 'rbxassetid://131592402593115',
			ImageRectOffset = Vector2.new(0, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	TombstoneBooth = {
		price = 250,
		name = 'TombstoneBooth',
		icon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(481, 481),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(722, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	VampireBooth = {
		name = 'VampireBooth',
		price = 250,
		icon = {
			Image = 'rbxassetid://80710353823991',
			ImageRectOffset = Vector2.new(722, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://80710353823991',
			ImageRectOffset = Vector2.new(240, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	BoogeymanBooth = {
		price = 200,
		name = 'BoogeymanBooth',
		icon = {
			Image = 'rbxassetid://80710353823991',
			ImageRectOffset = Vector2.new(241, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://80710353823991',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ScarecrowBooth = {
		price = 500,
		name = 'ScarecrowBooth',
		icon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(483, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(724, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JackOLanternBooth = {
		price = 150,
		name = 'JackOLanternBooth',
		icon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(0, 481),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(241, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	WItchCauldronBooth = {
		price = 150,
		name = 'WItchCauldronBooth',
		icon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	FreakyBooth = {
		price = 69,
		name = 'FreakyBooth',
		icon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(482, -1),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://137340417774382',
			ImageRectOffset = Vector2.new(0, 240),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	ToasterBooth = {
		price = -0,
		name = 'ToasterBooth',
		icon = {
			Image = 'rbxassetid://70940816075543',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://123435291424112',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	MushroomBooth = {
		price = -0,
		name = 'MushroomBooth',
		icon = {
			Image = 'rbxassetid://110133449253837',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://122011846844884',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	CakeBooth = {
		price = -0,
		name = 'CakeBooth',
		icon = {
			Image = 'rbxassetid://140670017577276',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://101171316955827',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	["TankBooth"] = {
		name = 'TankBooth',
		icon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://16749173256',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},


	["ValentinesChocolateBooth"] = {
		name = 'ValentinesChocolateBooth',
		icon = {
			Image = 'rbxassetid://98400146922644',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://95046050840886',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	["ValentinesGateBooth"] = {
		name = 'ValentinesGateBooth',
		icon = {
			Image = 'rbxassetid://107614624154782',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://118153315596787',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	["LoveLettersBooth"] = {
		name = 'LoveLettersBooth',
		icon = {
			Image = 'rbxassetid://110497222050225',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://124244915846005',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},

	["Valentines2025Booth"] = {
		name = 'Valentines2025Booth',
		icon = {
			Image = 'rbxassetid://103333912208425',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://103884011295808',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	PicnicBooth = {
		name = 'PicnicBooth',
		price = 750,
		icon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://13759750182',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	JuiceBooth = {
		name = 'JuiceBooth',
		price = 250,
		icon = {
			Image = 'rbxassetid://87171690712703',
			ImageRectOffset = Vector2.new(397, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
		hoverIcon = {
			Image = 'rbxassetid://87171690712703',
			ImageRectOffset = Vector2.new(0, 397),
			ImageRectSize = Vector2.new(396, 396)
		},
	},
	July4thBooth = {
		price = 4444,
		name = "4thOfJulyBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	XmasLightsBooth = {
		price = 5000,
		name = "XmasLightsBooth",
		icon = {
			Image = 'rbxassetid://91861423833551',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://91861423833551',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	BatBooth = {
		price = 200,
		name = "BatBooth",
		icon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(265, 0),
			ImageRectSize = Vector2.new(264, 264)
		},
		hoverIcon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(264, 264)
		},
	},
	CandyCaneBooth = {
		price = 350,
		name = "CandyCaneBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	ChristmasWreathBooth = {
		price = 350,
		name = "ChristmasWreathBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	CoffinBooth = {
		price = 250,
		name = "CoffinBooth",
		icon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(530, 0),
			ImageRectSize = Vector2.new(264, 264)
		},
		hoverIcon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(0, 265),
			ImageRectSize = Vector2.new(264, 264)
		},
	},
	DoodleBooth = {
		price = 1000,
		name = "DoodleBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	PollBooth = {
		price = 0,
		name = "PollBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	AdidasBooth = {
		price = 1000,
		name = "AdidasBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	GiftWorkshopBooth = {
		price = 100,
		name = "GiftWorkshopBooth",
		icon = {
			Image = 'rbxassetid://11896316555',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11896316555',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	GingerbreadBooth = {
		price = 100,
		name = "GingerbreadBooth",
		icon = {
			Image = 'rbxassetid://11896316555',
			ImageRectOffset = Vector2.new(482, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11896316555',
			ImageRectOffset = Vector2.new(723, 0),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	LogCakeBooth = {
		price = 250,
		name = "LogCakeBooth",
		icon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(0, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(241, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	PolarBearBooth = {
		price = 350,
		name = "PolarBearBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	PumpkinCarriageBooth = {
		price = 150,
		name = "PumpkinCarriageBooth",
		icon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(0, 530),
			ImageRectSize = Vector2.new(264, 264)
		},
		hoverIcon = {
			Image = 'rbxassetid://14958014004',
			ImageRectOffset = Vector2.new(265, 265),
			ImageRectSize = Vector2.new(264, 264)
		},
	},
	SantasSeatBooth = {
		price = 750,
		name = "SantasSeatBooth",
		icon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(482, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(723, 241),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	SledBooth = {
		price = 250,
		name = "SledBooth",
		icon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(723, 482),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://15720083965',
			ImageRectOffset = Vector2.new(241, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	WinterBooth = {
		price = 250,
		name = "WinterBooth",
		icon = {
			Image = 'rbxassetid://11896317264',
			ImageRectOffset = Vector2.new(723, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
		hoverIcon = {
			Image = 'rbxassetid://11896317264',
			ImageRectOffset = Vector2.new(482, 723),
			ImageRectSize = Vector2.new(240, 240)
		},
	},
	WinterCampfireBooth = {
		price = 400,
		name = "WinterCampfireBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
	ElfBooth = {
		price = 350,
		name = "ElfBooth",
		icon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
		hoverIcon = {
			Image = 'rbxassetid://15842040263',
			ImageRectOffset = Vector2.new(0, 0),
			ImageRectSize = Vector2.new(0, 0)
		},
	},
}

return Booths
