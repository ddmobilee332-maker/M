-- NEXUS_INFRA v2.0 - Core Commands Implementation Router
local Memory = require("infra_memory")
local Config = require("infra_config")
local Visual = require("infra_visual")
local c = Config.Interface

local Router = {}

-- [oopp] ฟังก์ชันจัดระเบียบบัญชีและสิทธิ์เข้าถึง
function Router.ExecuteAuth()
    print(c.Cyan .. "┌──( SYSTEM // CREDENTIAL INTEGRATION )" .. c.Reset)
    io.write(c.Cyan .. "├──" .. c.Dim .. " ID USERNAME: " .. c.Reset)
    local user = io.read()
    
    if user == "" then
        print(c.Amber .. "└── [!] CONFIG_ERROR: ข้อมูลระบุตัวตนไม่สามารถเป็นค่าว่างได้" .. c.Reset)
        return
    end
    
    io.write(c.Cyan .. "├──" .. c.Dim .. " SECURE PASS : " .. c.Reset)
    local pass = io.read()
    print(c.Cyan .. "└──" .. c.Reset)
    
    print("")
    Visual.DataLoadStream("INITIALIZING KERNEL CRYPTO ROUTINE", 1.2)
    Visual.DataLoadStream("SYNCING CONTROLLER WITH TERMUX INSTANCE", 1.5)
    
    Memory.Username = user
    Memory.Password = pass:gsub(".", "*") -- มาสก์รหัสผ่านเพิ่มความปลอดภัยระดับสูง
    Memory.IsActive = true
    
    print(c.Green .. "[+] SUCCESS: การรวมบัญชี [" .. Memory.Username .. "] เสร็จสิ้น สถานะสแตนด์บาย!" .. c.Reset)
end

-- [oopp2] ฟังก์ชันคัดแยกพิกัดลิงก์และวิเคราะห์ดาต้า
function Router.ExecuteScanner()
    print(c.Cyan .. "┌──( SYSTEM // NETWORK LINK EXTRACTOR )" .. c.Reset)
    io.write(c.Cyan .. "├──" .. c.Dim .. " DEPLOY TARGET URL: " .. c.Reset)
    local link = io.read()
    print(c.Cyan .. "└──" .. c.Reset)
    
    -- คัดแยกชุดตัวเลขจากลิงก์เพื่อประมวลผลอย่างแม่นยำ
    local id_pattern = link:match("games/(%d+)") or link:match("(%d+)")
    if not id_pattern then
        print(c.Amber .. "[!] ANALYZE_ERROR: ไม่พบโครงสร้างหลักของเป้าหมายในลิงก์ที่ระบุ" .. c.Reset)
        return
    end
    
    print("\n" .. c.Cyan .. " ╔═════════════════ NETWORK METRICS DETECTED ═════════════════╗")
    print("   • CAPTURED ID  : " .. c.Reset .. id_pattern)
    print("   • METADATA TYPE: " .. c.Reset .. "INFRASTRUCTURE_TARGET")
    print("   • SECURITY CAP : " .. c.Amber .. "BYPASSED & DECRYPTED" .. c.Cyan)
    print(" ╚════════════════════════════════════════════════════════════╝\n")
    
    if not Memory.IsActive then
        print(c.Amber .. "[!] ACCESS_DENIED: กรุณาปลดล็อกด้วยคำสั่ง oopp ก่อนระบุเป้าหมาย" .. c.Reset)
        return
    end
    
    io.write(c.Amber .. "[?] INJECT ENGINE: ต้องการส่งโมดูลควบคุมไปยังเป้าหมายนี้หรือไม่? (y/n): " .. c.Reset)
    local ans = io.read():lower()
    
    if ans == "y" then
        Memory.TargetID = id_pattern
        Memory.ZoneMap = "TARGET-NODE [" .. id_pattern .. "]"
        print("")
        Visual.DataLoadStream("TUNNELING VIRTUAL DATA SEGMENTS", 1.8)
        print(c.Green .. "[+] SUCCESS: สัญญาณหลักเจาะช่องทางเข้าสู่พื้นที่เป้าหมายเรียบร้อย!" .. c.Reset)
    else
        print(c.Dim .. "[-] ABORTED: คำสั่งถูกระงับโดยผู้ดูแลระบบ" .. c.Reset)
    end
end

-- [oopp3] ฟังก์ชันเริ่มระบบการรันลูปและส่งงานอัตโนมัติ
function Router.ExecuteAutomation()
    print(c.Cyan .. "┌──( SYSTEM // PRE-COMPILE AUTOMATION TASK )" .. c.Reset)
    
    if not Memory.IsActive or not Memory.TargetID then
        print(c.Amber .. "└── [!] ERROR: โครงสร้างไม่สมบูรณ์ ข้ามขั้นตอนสิทธิ์ (oopp) หรือสแกน (oopp2)" .. c.Reset)
        return
    end
    
    print(c.Cyan .. "├──" .. c.Dim .. " CURRENT USER: " .. c.Reset .. Memory.Username)
    print(c.Cyan .. "├──" .. c.Dim .. " TARGET AREA : " .. c.Reset .. Memory.ZoneMap)
    io.write(c.Cyan .. "├──" .. c.Dim .. " DEFINE TASK EXECUTION (กรอกคำสั่งประมวลผล): " .. c.Reset)
    local task = io.read()
    print(c.Cyan .. "└──" .. c.Reset)
    
    print("")
    Visual.DataLoadStream("COMPILING LOOPS & DISTRIBUTING AUTOMATION PACKETS", 2.0)
    
    print(c.Cyan .. " ⚡⚡⚡ NEXUS INFRASTRUCTURE AUTOMATION ACTIVE ⚡⚡⚡")
    print(c.Dim .. "  [!] USER ACCOUNT : " .. c.Reset .. Memory.Username)
    print(c.Dim .. "  [!] DAEMON TASK  : " .. c.Green .. task)
    print(c.Dim .. "  [!] STATE        : " .. c.Green .. "EXECUTING CONTINUOUS BACKGROUND LOOP..." .. c.Reset)
    print(c.Cyan .. " ===================================================================" .. c.Reset)
end

return Router
