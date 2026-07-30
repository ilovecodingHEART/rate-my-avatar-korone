-- uses countryregion to even get a price (i fucking hate myself for coding this shit was pain)

local Players = game:GetService("Players")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer
local button = script.Parent

local country = "US"

pcall(function()
	country = LocalizationService:GetCountryRegionForPlayerAsync(player)
end)

local prices = {
	USD = "$2.99",
	EUR = "€2.79",
	GBP = "£2.49",
	SEK = "29kr",
	NOK = "29kr",
	DKK = "21 kr",
	JPY = "¥400",
	KRW = "₩3900",
	CNY = "¥19",
	INR = "₹249",
	BRL = "R$14.99",
	CAD = "C$3.99",
	AUD = "A$4.49",
	NZD = "NZ$4.49",
	MXN = "$49 MXN",
	TRY = "₺79",
	ZAR = "R49",
	RUB = "₽199",
	PLN = "12zł",
	HKD = "HK$23",
	TWD = "NT$90",
	THB = "฿95",
	IDR = "Rp45000",
	MYR = "RM12.99",
	PHP = "₱149"
}

local cn = {

	US="USD", CA="CAD", MX="MXN",

	BR="BRL", AR="USD", CL="USD", CO="USD", PE="USD",
	UY="USD", PY="USD", BO="USD", VE="USD", EC="USD", GY="USD", SR="USD",

	SE="SEK", NO="NOK", DK="DKK", FI="EUR",
	DE="EUR", FR="EUR", ES="EUR", IT="EUR", PT="EUR",
	NL="EUR", BE="EUR", LU="EUR", IE="EUR",
	AT="EUR", GR="EUR", CY="EUR", MT="EUR",
	EE="EUR", LV="EUR", LT="EUR", SK="EUR", SI="EUR",
	PL="PLN", CZ="EUR", HU="EUR", RO="EUR", BG="EUR",
	HR="EUR",

	GB="GBP", IE="EUR",

	CH="EUR", LI="EUR",

	UA="USD", BY="USD", MD="USD",

	RU="RUB",

	JP="JPY", KR="KRW", CN="CNY", HK="HKD", TW="TWD",

	IN="INR", PK="INR", BD="INR", LK="INR", NP="INR",

	TH="THB", VN="USD", KH="USD", LA="USD",
	MY="MYR", SG="USD", ID="IDR", PH="PHP", BN="USD",

	AE="USD", SA="USD", QA="USD", KW="USD",
	OM="USD", BH="USD", IL="USD", JO="USD",
	LB="USD", IQ="USD", IR="USD", YE="USD",

	TR="TRY",

	ZA="ZAR", NG="USD", EG="USD", MA="USD",
	DZ="USD", TN="USD", KE="USD", ET="USD",
	GH="USD", TZ="USD", UG="USD", SD="USD",
	ZW="USD", BW="USD", NA="USD", MZ="USD",
	MG="USD", CM="USD", CI="USD", SN="USD",

	AU="AUD", NZ="NZD", FJ="AUD", PG="AUD",
	SB="AUD", VU="AUD", WS="AUD", TO="AUD"
}

local currency = cn[country] or "USD"
button.Text = prices[currency] or prices["USD"]