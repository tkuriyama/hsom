import Euterpea
import HSoM
import Bach924
-- PMap

defPMap :: PMap Note1
myPMap "Fancy" = fancyPlayer
myPMap "Default" = defPlayer
defPMap "MyPlayer" = myPlayer

myCon :: Context Note1
myCon = Context { cTime = 0
                 , cPlayer = myPlayer
                 , cInst = AcousticGrandPiano
                 , cDur = metro 120 qn
                 , cPch = 0
                 , cKey = (C, Major)
                 , cVol = 127 }

myPlayer :: Player (Pitch, [NoteAttribute])
myPlayer = defPlayer
  { pName ="MyPlayer",
    playNote = defPlayNote defNasHandler,
    interpPhrase = defInterpPhrase defPasHandler }

m = line $ [c 4 qn, g 4 qn, e 4 wn]

test = playA myPMap myCon $ Bach924.piece
