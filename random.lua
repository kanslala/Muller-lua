function OnEvent(event, arg)
    --该行的6代表启动按键，可根据自己鼠标侧键编号酌情更换，6为DPI切换键
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 6) then
        while true do
            gj()
            --该行代表检测大写键处于熄灭状态时停止脚本
            if not IsKeyLockOn("capslock") then
                break
            end
        end
    end
end

---这里不要动！！！！！！！！！！！
--翻转本地时间作为随机数种子
math.randomseed(GetDate("%H%M%S"):reverse())

--穆勒变换使得随机数趋于正态分布符合人的操作直觉
boxMuller = function(mean,stddev)
    
	local u1 = math.random()
	local u2 = math.random()
	local z0 = math.sqrt(-2.0*math.log(u1))*math.cos(2.0*math.pi*u2)
	return math.floor(mean + z0 * stddev + 0.5)
end

random = function(m,n)
	local mean = (m + n) / 2
	local sigma = (n - m) / (2 * 1.645)
	local suijishu = boxMuller(mean,sigma)
	while suijishu < m do
		suijishu = math.random(m,n)
	end
	return suijishu
end 


---这里往下可以动！！！！！！！！！！！
--主要挂机函数 根据你的宏自己改
function gj()
    
    PressAndReleaseKey("q")
    --按键并松开 括号里是要按的键
    Sleep(random(50,120))
    --等待时间，ms为单位。random括号里是随机区间
    PressAndReleaseKey("q")
    Sleep(random(2950,3200))

end