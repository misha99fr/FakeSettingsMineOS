local GUI = require("GUI")
local system = require("System")
local fs = require("filesystem")

local workspace, window = system.addWindow(GUI.filledWindow(1, 1, 40, 14, 0xE1E1E1))

-- Заголовок окна
window:addChild(GUI.label(1, 1, window.width, 1, 0x2D2D2D, "Настройки")):setAlignment(GUI.ALIGNMENT_HORIZONTAL_CENTER, GUI.ALIGNMENT_VERTICAL_TOP)

-- Переключатель для "Enable rootful"
local rootfulSwitch = window:addChild(GUI.switch(2, 3, 10, 0x66DB80, 0x1D1D1D, 0xEEEEEE))
window:addChild(GUI.label(14, 3, 20, 1, 0x2D2D2D, "Enable rootful"))

-- Переключатель для "WIndozn enable"
local windoznSwitch = window:addChild(GUI.switch(2, 5, 10, 0x66DB80, 0x1D1D1D, 0xEEEEEE))
window:addChild(GUI.label(14, 5, 20, 1, 0x2D2D2D, "WIndozn enable"))

-- Обработчик события переключателя "Enable rootful"
rootfulSwitch.onStateChanged = function()
    if rootfulSwitch.state then
        -- Проверяем, существует ли папка "root/Applications"
        local path = "/root/Applications"
        if fs.exists(path) then
            -- Удаляем папку
            fs.remove(path)
            GUI.alert("Папка 'root/Applications' удалена успешно.")
        else
            GUI.alert("Папка 'root/Applications' не найдена.")
        end
    end
end

-- Пустой обработчик события для переключателя "WIndozn enable"
windoznSwitch.onStateChanged = function()
end

workspace:draw()
