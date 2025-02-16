local Linien = {'S1 Kirschberg', 'S1 Hundeinsel'}
 
function showLinien()
    for i = 1, #Linien do
        print(Linien[i])
    end
end
 
function makeScrollingText(mon, text, textScale, yPos, textColor, bgColor)
    local w, h = mon.getSize()
    local x = w
    mon.setTextScale(textScale)
 
    local textColorString = string.rep(textColor, #text)
    local bgColorString = string.rep(bgColor, #text)
    local blankString = string.rep(" ", #text)
    local blackBgString = string.rep("0", #text) -- Immer schwarzer Hintergrund zum LÃÂ¶schen
 
    while true do
        -- 1. Aktuelle Position lÃÂ¶schen (mit schwarzem Hintergrund)
        mon.setCursorPos(x, yPos)
        mon.blit(blankString, blackBgString, blackBgString)
 
        -- 2. Neue Position berechnen
        x = x - 1
        if x < -#text then
            x = w
        end
 
        -- 3. Text an neuer Position zeichnen
        mon.setCursorPos(x, yPos)
        mon.blit(text, textColorString, bgColorString)
 
        sleep(0.1)
    end
end
 
-- Hauptteil (Main)
do
    local monitor = peripheral.wrap("right")
    monitor.clear()
 
    -- Hintergrund fÃÂ¼r die oberen Zeilen
    for i = 1, 4, 1 do
        monitor.setCursorPos(1, i)
        monitor.setBackgroundColor(colors.blue)
        for j = 1, monitor.getSize() do
            monitor.write(" ")
        end
    end
 
    monitor.setCursorPos(1, 1)
    monitor.setTextColor(colors.white)
    monitor.write("S1 Kirschberg  4 min")
    monitor.setCursorPos(1, 2)
    monitor.write("S1 Kirschberg  6 min")
 
    makeScrollingText(monitor, "S1 nach Hundeinsel heute circa 10 Minuten spaeter - Grund dafuer sind Schafe auf der Strecke", 1, 5, "f", "0")  -- Gelb: 6, WeiÃÂ: f
end
