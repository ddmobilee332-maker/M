-- NEXUS_INFRA v2.0 - Configuration Module
local Config = {}

-- การออกแบบโทนสีสไตล์ Industrial Cyber (ฟ้า Cyan ตัด ส้ม Amber และ ดำ Gray) เท่ ล้ำยุค ไม่ซ้ำใคร
Config.Interface = {
    Cyan    = "\27[36m",
    Amber   = "\27[33m",
    Dim     = "\27[90m",
    Green   = "\27[32m",
    Reset   = "\27[0m",
    Bold    = "\27[1m"
}

Config.Meta = {
    Title = "NEXUS INTERFACE ENGINE",
    Version = "v2.0.4-BUILD",
    Security = "SECURE_TUNNEL_ACTIVE"
}

return Config
