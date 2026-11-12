local Audio=import("audio.nut")
local result=Audio.play(vargv[0]);result.token<-vargv[1]
print(sqgi.json.stringify(result)+"\n")
