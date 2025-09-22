extends Node

const FULLARTS = {
	"Berenica":            preload("uid://b8px1o74c3l7k"),
	"Daphne":              preload("uid://bd7akamqqub4r"),
	"Fina":                preload("uid://do5qplav42ctt"),
	"Fushu":               preload("uid://cofiw0kjqxmju"),
	"Hellfire":            preload("uid://bjblnoi3q2s2i"),
	"Lady Nifle":          preload("uid://q0wnesq04rvq"),
	"Luca":                preload("uid://du6u3dyodmhde"),
	"Lynn":                preload("uid://bvfij357kx35n"),
	"Margie":              preload("uid://do6fkh1s2lvso"),
	"Outsider":            preload("uid://d3txseodpo1uv"),
	"Phantasio":           preload("uid://djswf3nbs73m4"),
	"Pysche":              preload("uid://c52drji4hijir"),
	"Randy":               preload("uid://blcnvh5cd570k"),
	"Rebecca":             preload("uid://dwiw4c082yv82"),
	"Rhythm":              preload("uid://boyiulvcqsuse"),
	"Sybelle":             preload("uid://dvwnh3n7ve66c"),
	"Tabethe":             preload("uid://01juha3gj6lv"),
	"Truffle and Filbert": preload("uid://bbkmyl7cewxpd"),
	"Yale and Oliver":     preload("uid://ywtg2pieg6qe"),
}

const AVATAR_ICONS = {
	"Berenica":            preload("uid://cj6qm7bqvdyr8"),
	"Daphne":              preload("uid://cb40uo3poiyh3"),
	"Fina":                preload("uid://226ln28sri8t"),
	"Fushu":               preload("uid://cbadcd6ipnm63"),
	"Hellfire":            preload("uid://41078tr3f4u2"),
	"Lady Nifle":          preload("uid://d28sgtsii522e"),
	#"Luca": 
	"Lynn":                preload("uid://j557rpwtkyue"),
	"Margie":              preload("uid://das7qn2utxaif"),
	"Outsider":            preload("uid://40r6k646ehw0"),
	"Phantasio":           preload("uid://cxfk2hq6ajonx"),
	"Pysche":              preload("uid://mp5hkfkxhbfk"),
	"Randy":               preload("uid://dv2yib2e0qlnr"),
	"Rebecca":             preload("uid://cgy18wfijprux"),
	"Rhythm":              preload("uid://boomk0xvasvb1"),
	"Sybelle":             preload("uid://boxbinteo8nk7"),
	"Tabethe":             preload("uid://dor5iguaeu3jm"),
	"Truffle and Filbert": preload("uid://c0h2r0xjtvr4"),
	"Yale and Oliver":     preload("uid://bklf4bjevrnqw"),
}

const TITLE={
	"Berenica":            preload("uid://g1sh4o4et84h"),
	"Daphne":              preload("uid://b7rj6y58olq42"),
	"Fina":                preload("uid://ceessuoq7fc7m"),
	"Fushu":               preload("uid://cjemyo0isl01t"),
	"Hellfire":            preload("uid://bjirr3mu6rfss"),
	"Lady Nifle":          preload("uid://gq5alt5kgupv"),
	#"Luca" :
	"Lynn":                preload("uid://bfwjvjus7hqia"),
	"Margie":              preload("uid://bqlvqpk6jp64l"),
	"Outsider":            preload("uid://4o7ihka4qr27"),
	"Phantasio":           preload("uid://bpweodqmf7mns"),
	"Pysche":              preload("uid://cip2esddo0gcn"),
	"Randy":               preload("uid://cdpjv44f4hkqk"),
	"Rebecca":             preload("uid://cbhtp4wdmtul"),
	"Rhythm":              preload("uid://cimbo6d5e3rdn"),
	"Sybelle":             preload("uid://dkdpew0qixixo"),
	"Tabethe":             preload("uid://8cdg1ttr1k7k"),
	"Truffle and Filbert": preload("uid://vjuin5aqp1bi"),
	"Yale and Oliver":     preload("uid://blo51gpeos1ev"),
}

static func get_fullart(name: String) -> Texture2D:
	if name in FULLARTS:
		return FULLARTS[name]
	push_warning("No fullart found for: %s" % name)
	return null


static func get_avatar_icon(name: String) -> Texture2D:
	if name in AVATAR_ICONS:
		return AVATAR_ICONS[name]
	push_warning("No avatar icon found for: %s" % name)
	return null


static func get_title_text(name: String) -> Texture2D:
	if name in TITLE:
		return TITLE[name]
	push_warning("No title text found for: %s" % name)
	return null
