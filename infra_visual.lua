-- NEXUS_INFRA v2.0 - Graphics & Processing Output Engine
local Config = require("infra_config")
local c = Config.Interface

local Visual = {}

-- ฟังก์ชันอนิเมชั่นหลอดโหลดสไตล์ Core Processor
function Visual.DataLoadStream(headline, duration)
    local segments = 20
    io.write(c.Cyan .. "[STREAMS] " .. headline .. "\n" .. c.Dim .. "[")
    for i = 1, segments do
        -- การหน่วงเวลาที่เข้ากันได้กับโครงสร้างระบบปฏิบัติการ Linux บน Termux 100%
        os.execute("sleep " .. tostring(duration / segments))
        io.write(c.Cyan .. "■")
        io.flush()
    end
    print(c.Dim .. "] " .. c.Green .. "ONLINE" .. c.Reset .. "\n")
end

-- ดีไซน์หน้าจอเปิดตัวสุดล้ำ ASCII ART โปรไฟล์ระดับโปร
function Visual.RenderBanner()
    os.execute("clear")
    print(c.Cyan .. [[
  _   _ ______   _    _  _____   _____ _   _ ______ _____          
 | \ | |  ____| \ \  / /|  __ \ / ____| \ | |  ____|  __ \   /\     
 |  \| | |__     \ \/ / | |  | | (___ |  \| | |__  | |__) | /  \    
 | . ` |  __|     ]  [  | |  | |\___ \| . ` |  __| |  _  / / /\ \   
 | |\  | |____   / /\ \ | |__| |____) | |\  | |    | | \ \/ ____ \  
 |_| \_|______| /_/  \_\_____/|_____/|_| \_|_|    |_|  \_\_/    \_\ ]])
    print(c.Dim .. " =======================================================================")
    print(c.Cyan .. "   CORE: " .. Config.Meta.Title .. " [" .. Config.Meta.Version .. "]")
    print(c.Amber .. "   STATUS: " .. Config.Meta.Security .. c.Dim .. " | ARCHITECTURE: 6 MULTI-FILES")
    print(c.Dim .. " =======================================================================" .. c.Reset)
    print(c.Dim .. "  [OPERATIONAL COMMANDS]:")
    print(c.Cyan .. "   » oopp  " .. c.Reset .. " - ยืนยันสิทธิ์และติดตั้ง Proxy บัญชีระบบ")
    print(c.Cyan .. "   » oopp2 " .. c.Reset .. " - ดึงพิกัดโครงข่ายและวิเคราะห์ Place Link เป้าหมาย")
    print(c.Cyan .. "   » oopp3 " .. c.Reset .. " - ส่งสัญญาณลูปคำสั่งควบคุมการทำงานแบบ Automation")
    print(c.Dim .. " =======================================================================\n" .. c.Reset)
end

return Visual
