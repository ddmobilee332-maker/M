#!/usr/bin/env lua
-- ====================================================================
--  PROJECT: NEXUS_INFRA v2.0 // TERMINAL CORE AUTOMATION
--  THEME: AMBER CYAN / INDUSTRIAL CYBER (BLUE & ORANGE & BLACK)
--  PLATFORM: TERMUX / LINUX CONSOLE EXPERT
-- ====================================================================

-- บังคับโครงสร้างการจำลอง 'source ./' ด้วยการล็อก Path ไปยังไดเรกทอรีปัจจุบันของสคริปต์
local current_dir = "./"
package.path = current_dir .. "?.lua;" .. package.path

-- ทำการดึงโมดูลต่างๆ เข้ามาประกอบร่าง (เสมือนการทำ source ./ ของ Shell Script)
local Config  = require("infra_config")
local Memory  = require("infra_memory")
local Visual  = require("infra_visual")
local Command = require("infra_commands")
local c = Config.Interface

local function Main()
    local running = true
    Visual.RenderBanner()
    
    while running do
        -- Terminal Prompt ระดับพรีเมียม สไตล์ผู้ดูแลระบบเน็ตเวิร์กสายดาร์ก
        io.write("\n" .. c.Cyan .. "operator" .. c.Dim .. "@" .. c.Amber .. "nexus_infra" .. c.Dim .. ":" .. c.Cyan .. "~$" .. c.Reset .. " ")
        local input = io.read()
        
        if input == "oopp" then
            Command.ExecuteAuth()
        elseif input == "oopp2" then
            Command.ExecuteScanner()
        elseif input == "oopp3" then
            Command.ExecuteAutomation()
        elseif input == "exit" then
            print(c.Dim .. "\n[-] Terminating Core Infra System... Shutdown complete." .. c.Reset)
            running = false
        else
            print(c.Amber .. "[!] INVALID_CMD: พิมพ์คำสั่ง oopp, oopp2, oopp3 หรือ exit" .. c.Reset)
        end
    end
end

Main()
