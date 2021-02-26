clicking={false,false,false,false,false,false,false,false}

pipe=io.open("/dev/shm/rapidMacroPipe",'w')
pipe:close()

while true do
	
	pipe=io.open("pipe",'r')
	assert(pipe~=nil,"missing pipe file")
	
	for l in pipe:lines() do
		local p=string.sub(l,1,1)
		local b=tonumber(string.sub(l,3,3))
		
		if p=="u" then
			if b==0 then
				for n=1,8 do
					clicking[n]=false
				end
			elseif b~=nil and b<=8 then
				clicking[b]=false
			end
		elseif p=="d" then
			if b~=nil and b>0 and b<=8 then
				clicking[b]=true
			end
		elseif p=="s" then
			pipe:close()
			pipe=io.open("pipe",'w')
			pipe:close()
			return os.exit()
		end
	end
	
	pipe:close()
	pipe=io.open("pipe",'w')
	pipe:close()
	
	for n=1,8 do
		if clicking[n] then os.execute("xdotool click --repeat 40 --delay 5 "..tostring(n).." &") end
	end
	
	os.execute("sleep 0.2")
end