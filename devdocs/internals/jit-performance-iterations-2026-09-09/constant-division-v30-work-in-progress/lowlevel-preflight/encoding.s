.text
smulh x11,x9,x10
asr x11,x9,#63
lsr x11,x11,#58
asr x11,x11,#6
add x11,x11,x11,lsr #63
