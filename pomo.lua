-- title:  pomo
-- author: eli_oat
-- about:  a very tiny pomodoro timer

local pomo = {
    _version = "2022.03"
}

local defaults = {
    pomoTime = 1500,    -- time for a pomodoro in seconds
    restTime = 600,     -- time for a short rest in seconds
    longRestTime = 900, -- time for a long rest in sseconds
    pomoCount = 0       -- used to count pomodoros before a long rest
}

local pomoTime = defaults.pomoTime
local restTime = defaults.restTime
local longRestTime = defaults.longRestTime
local pomoCount = defaults.pomoCount

local function sleep (a)
    local sec = tonumber(os.clock() + a)
    while (os.clock() < sec) do
    end
end

local function prettyTime (timeInSeconds)
    local minutes = math.floor(timeInSeconds / 60)
    local seconds = timeInSeconds % 60
    local timeDisplay = string.format('%02d:%02d', minutes, seconds)
    return timeDisplay
end

function pomo ()
    os.execute('clear')
    repeat
        io.write('🍅 ' .. prettyTime(pomoTime) .. '\n')
        pomoTime = pomoTime - 1
        sleep(1)
        os.execute('clear')
    until pomoTime == 0

    while pomoTime == 0 and pomoCount < 4 do
        io.write('😴 ' .. prettyTime(restTime) .. '\n')
        restTime = restTime - 1
        sleep(1)
        os.execute('clear')
        while restTime == 0 do
            restTime = defaults.restTime
            pomoTime = defaults.pomoTime
            pomoCount = pomoCount + 1
            pomo()
        end
    end

    while pomoCount == 4 do
        io.write('🍹 LONG REST! ' .. prettyTime(longRestTime) .. '\n')
        longRestTime = longRestTime - 1
        sleep(1)
        os.execute('clear')
        while longRestTime == 0 do
            restTime = defaults.restTime
            pomoTime = defaults.pomoTime
            longRestTime = defaults.longRestTime
            pomoCount = defaults.pomoCount
            pomo()
        end
    end
end

return pomo