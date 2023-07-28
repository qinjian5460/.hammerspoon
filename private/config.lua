----------------------------------------------------------------------------------------------------

-- author: zuorn
-- mail: zuorn@qq.com
-- github: https://github.com/zuorn/hammerspoon_config

----------------------------------------------------------------------------------------------------

----------------------------------------- 配 置 文 件 -----------------------------------------------

----------------------------------------------------------------------------------------------------

--指定要启用的模块
hspoon_list = {
    "AClock",
    "MouseFollowsFocus",
    "ClipShow",
    "CountDown",
    "KSheet",
    "WinWin",
    "VolumeScroll",
    "FnMate",
    "PopupTranslateSelection",
    -- "DeepLTranslate"
    -- "HSaria2"
    -- "HSearch"
    --"SpeedMenu",
    -- "MountedVolumes",
    -- "HeadphoneAutoPause",
}

----------------------------------------------------------------------------------------------------
----------------------------------------- 快速启动配置  ----------------------------------------------

-- 绑定 启动 app 快捷键

hsapp_list = {
    {key = 'a', name = 'Iterm'},
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'f', name = 'Finde'},
    {key = 'o', name = 'Obsidian'},
    {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'b', id = 'vsCode.app'},
    {key = 'w', name = 'WeChat'},
    {key = 'y', id = 'com.apple.systempreferences'},
}


----------------------------------------------------------------------------------------------------
---------------------------------------- 模式快捷键绑定  ----------------------------------------------

-- 窗口提示键绑定，快速切换到你想要的窗口上
hswhints_keys = {"ctrl", "f"}

-- 快速启动面板快捷键绑定
hsappM_keys = {"alt", "w"}

-- 系统剪切板快捷键绑定
hsclipsM_keys = {"alt", "C"}


-- 在默认浏览器中打开 Hammerspoon 和 Spoons API 手册
--hsman_keys = {"alt", "H"}

-- 倒计时快捷键绑定
hscountdM_keys = {"alt", "I"}

-- 锁定电脑快捷键绑定
--hslock_keys = {"alt", "L"}

-- 窗口自定义大小及位置快捷键绑定
hsresizeM_keys = {"ctrl", "e"}

-- 定义应用程序快捷键面板快捷键
hscheats_keys = {"alt", "S"}

-- 显示时钟快捷键绑定
hsaclock_keys = {"alt", "f"}

-- 粘贴 chrome 或 safari 打开最前置的网址
hstype_keys = {"alt", "V"}

-- 显示 Hammerspoon 控制台
hsconsole_keys = {"alt", "Z"}

-- 显示 MountedVolumes
hstype_keys = {"alt", "M"}

-- 显示搜索
hsearch_keys = {"alt", "G"}

----------------------------------------------------------------------------------------------------
--------------------------------- hammerspoon 快捷键绑定配置  -----------------------------------------

-- 临时禁用所有快捷键(注意：只能手动接禁。)
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- 重新加载配置文件
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- 显示各种模式绑定快捷键
hshelp_keys = {{"alt", "shift"}, "/"}


----------------------------------------------------------------------------------------------------
---------------------------------------------- end  ------------------------------------------------
----------------------------------------------------------------------------------------------------
local hotkey = require 'hs.hotkey'
local window = require 'hs.window'
local geometry = require 'hs.geometry'
local drawing = require 'hs.drawing'
local mouse = require 'hs.mouse'
local keycodes = require 'hs.mouse'
local hyperMouse = {'ctrl'}
local mouseBinds = {
    hotkey.bind(hyperMouse, ']', function() moveMouseOneScreen('next') end),
    hotkey.bind(hyperMouse, '[', function() moveMouseOneScreen('previous') end)
}
window.animationDuration = 0
local mouseState = {}
function moveMouseOneScreen(type)
    local screen = mouse.getCurrentScreen()

    local toScreen = nil
    if type == 'next' then
        toScreen = screen:next()
    elseif type == 'previous' then
        toScreen = screen:previous()
    else
        return
    end
    local rect = screen:fullFrame()
    local toRect = toScreen:fullFrame()
    local pos = mouse.getRelativePosition()
    local toPos = nil
    local toScreenId = toScreen:id()
    if mouseState[toScreenId] then
        toPos = mouseState[toScreenId]
    else
        local x = pos.x / rect.w * toRect.w
        local y = pos.y / rect.h * toRect.h
        toPos = geometry.point(x, y)
    end
    mouse.setRelativePosition(toPos, toScreen)
    mouseState[screen:id()] = pos
    -- hs.eventtap.leftClick(toPos)
    -- mouseHighlight()
end




