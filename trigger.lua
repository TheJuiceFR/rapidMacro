--usage: lua trigger.lua <u/d (up/down)> [button#]

tArgs={...}
print(tArgs[1],tArgs[2])
os.execute("echo "..tostring(tArgs[1]).." "..tostring(tArgs[2]).." >> pipe")