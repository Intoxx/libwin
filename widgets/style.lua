local _, libwin = ...;
libwin.style = libwin.style or {};
libwin.style.__index = libwin.style;

--[[
	Defining a DARK style
--]]
libwin.style.DARK = {
	["window"] = {
		["NORMAL"] = {
			["BACKGROUND"] = {
				0.08,
				0.08,
				0.08,
				0.8
			},
			["BORDERS"] = {
				["LEFT"] = {
					color = {
						0.0,
						0.0,
						0.0,
						0.8
					},
					thickness = 2
				},
				["RIGHT"] = {
					color = {
						0.0,
						0.0,
						0.0,
						0.8
					},
					thickness = 2
				},
				["TOP"] = {
					color = {
						0.0,
						0.0,
						0.0,
						0.8
					},
					thickness = 2
				},
				["BOTTOM"] = {
					color = {
						0.0,
						0.0,
						0.0,
						0.8
					},
					thickness = 2
				}
			},
			["TITLE"] = {
				height = 32,
				["BACKGROUND"] = {
					0.05,
					0.05,
					0.05
				}
			}
		},
		["HOVER"] = {
			["BACKGROUND"] = {
				0.05,
				0.05,
				0.05,
				0.8
			},
			["BORDERS"] = {
				["LEFT"] = {
					color = {
						0.0,
						0.0,
						0.0,
						1.0
					},
					thickness = 2
				},
				["RIGHT"] = {
					color = {
						0.0,
						0.0,
						0.0,
						1.0
					},
					thickness = 2
				},
				["TOP"] = {
					color = {
						0.0,
						0.0,
						0.0,
						1.0
					},
					thickness = 2
				},
				["BOTTOM"] = {
					color = {
						0.0,
						0.0,
						0.0,
						1.0
					},
					thickness = 2
				}
			}
		},
		["ACTIVE"] = {
			["BACKGROUND"] = {
				0.0,
				0.0,
				0.0
			}
		}
	},
	["button"] = {
		["NORMAL"] = {
			["BACKGROUND"] = {
				0.0,
				1.0,
				0.0,
				0.6
			}
		},
		["HOVER"] = {
			["BACKGROUND"] = {
				0.0,
				1.0,
				0.0,
				1.0
			}
		}
	}
};

--[[
	Set the default theme
--]]
libwin.style.DEFAULT = libwin.style.DARK;
