setscreen ("graphics:max;max")
setscreen ("offscreenonly")
setscreen ("nobuttonbar")

var x, y, PPGS, PPG1, PPG2, PPG3, PPDS, PPD1, PPD2, PPD3, PPBS, PPB1, PPB2, PPB3, PPB4, BackGround, font1, DPMenu, PPFa : int
var SideCheck, aCheck, dCheck, bCheck, hCheck, PPHS, PPH1, PPH2, PPH3, PPH4, MenuF1, MenuF2 : int
var ExitCheck, MinoriteVisibleCheck, LoyalisteCheck, FemmeCheck, CanadienFrancaisCheck, ClasseOuvriereCheck, EndGameCheck : boolean
var EndBackground, EBF2, EBF3, EBF4, EBF5, D1_F1, D1_F2, D2_F1, SkipB : int
var EndMenuCheck, EndDCheck, AnimateCheck, EndDebate : boolean
var Classe1 : string
% For EndPhase Animation
var epf : array 1 .. 14 of int
for i : 1 .. 14
    epf (i) := Pic.FileNew ("EndAnimationF" + intstr (i) + ".bmp")
end for
var FTB : array 1 .. 5 of int
for i : 1 .. 5
    FTB (i) := Pic.FileNew ("Arrière Plan AnBlF" + intstr (i) + ".bmp")
end for
var Loyaliste : array 1 .. 4 of int
var CO : array 1 .. 4 of int
var FemmeF : array 1 .. 4 of int
for i : 1 .. 4
    CO (i) := Pic.FileNew ("ClasseOF" + intstr (i) + ".jpg")
    Loyaliste (i) := Pic.FileNew ("Loyaliste P" + intstr (i) + ".jpg")
    FemmeF (i) := Pic.FileNew ("FemmeF" + intstr (i) + ".jpg")
end for
var GuerreTime : array 1 .. 3 of int
for i : 1 .. 3
    GuerreTime (i) := Pic.FileNew ("Guerre" + intstr (i) + ".jpg")
end for

D2_F1 := Pic.FileNew ("DébatMVvsF1.bmp")
D1_F1 := Pic.FileNew ("DébatFCvsLF1.bmp")
D1_F2 := Pic.FileNew ("DébatFCvsLF2.bmp")
DPMenu := Pic.FileNew ("BackgroundPic.jpg")
MenuF1 := Pic.FileNew ("MenuScreenF1.bmp")
MenuF2 := Pic.FileNew ("MenuScreenF2.bmp")
font1 := Font.New ("mono:24:bold")
PPGS := Pic.FileNew ("PP Statique.bmp")
PPG1 := Pic.FileNew ("PP AnMaF1.bmp")
PPG2 := Pic.FileNew ("PP AnMaF2.bmp")
PPG3 := Pic.FileNew ("PP AnMaF3.bmp")
PPDS := Pic.FileNew ("PP Statique D.bmp")
PPD1 := Pic.FileNew ("PP AnMaDF1.bmp")
PPD2 := Pic.FileNew ("PP AnMaDF2.bmp")
PPD3 := Pic.FileNew ("PP AnMaDF3.bmp")
BackGround := Pic.FileNew ("Arrière Plan.bmp")
PPBS := Pic.FileNew ("PP Statique B.bmp")
PPB1 := Pic.FileNew ("PP AnMaBF1.bmp")
PPB2 := Pic.FileNew ("PP AnMaBF2.bmp")
PPB3 := Pic.FileNew ("PP AnMaBF3.bmp")
PPB4 := Pic.FileNew ("PP AnMaBF4.bmp")
PPHS := Pic.FileNew ("PP Statique H.bmp")
PPH1 := Pic.FileNew ("PP AnMaHF1.bmp")
PPH2 := Pic.FileNew ("PP AnMaHF2.bmp")
PPH3 := Pic.FileNew ("PP AnMaHF3.bmp")
PPH4 := Pic.FileNew ("PP AnMaHF4.bmp")
PPFa := Pic.FileNew ("PP Fant.bmp")
EndBackground := Pic.FileNew ("Arrière Plan End.bmp")
EBF2 := Pic.FileNew ("Arrière Plan End2.bmp")
EBF3 := Pic.FileNew ("Arrière Plan End3.bmp")
EBF4 := Pic.FileNew ("Arrière Plan End4.bmp")
EBF5 := Pic.FileNew ("Arrière Plan End5.bmp")
SkipB := Pic.FileNew ("Skip Button.bmp")

EndDCheck := false

procedure ResetGameVars
    MinoriteVisibleCheck := false
    LoyalisteCheck := false
    FemmeCheck := false
    CanadienFrancaisCheck := false
    ClasseOuvriereCheck := false
    EndGameCheck := false
    EndMenuCheck := false
end ResetGameVars

procedure SetEndCheck (value : boolean)
    EndDCheck := value
end SetEndCheck

procedure ResetVars
    x := maxx div 2
    y := maxy div 2
    aCheck := 0
    dCheck := 0
    bCheck := 0
    hCheck := 0
    SideCheck := 1 %SIDECHECK VALUES: UP = 3; DOWN = 4; LEFT = 1; RIGHT = 2;
    ExitCheck := false
    Classe1 := ""
    AnimateCheck := false
    EndDebate := false
    SetEndCheck (false)
end ResetVars

var ch : string (1)
var newChar : boolean := false
var running : boolean := true
var idle : boolean := false
var moveCount : int := 0

procedure DrawBackground
    Pic.Draw (BackGround, -150, -50, 0)
end DrawBackground

procedure DrawMCL (x, y : int)
    Pic.Draw (PPGS, x, y, picMerge)
    Pic.SetTransparentColour (PPGS, white)
end DrawMCL

procedure DrawMCD (x, y : int)
    Pic.Draw (PPDS, x, y, picMerge)
    Pic.SetTransparentColour (PPDS, white)
end DrawMCD

procedure DrawMCB (x, y : int)
    Pic.Draw (PPBS, x, y, picMerge)
    Pic.SetTransparentColour (PPBS, white)
end DrawMCB

procedure DrawMCH (x, y : int)
    Pic.Draw (PPHS, x, y, picMerge)
    Pic.SetTransparentColour (PPHS, white)
end DrawMCH

procedure DrawMCDA % DROITE
    if dCheck = 1 then
	Pic.Draw (PPD1, x, y, picMerge)
	Pic.SetTransparentColour (PPD1, white)
	delay (150)
    elsif dCheck = 2 then
	Pic.Draw (PPD2, x, y, picMerge)
	Pic.SetTransparentColour (PPD2, white)
	delay (150)
    elsif dCheck = 3 then
	Pic.Draw (PPD3, x, y, picMerge)
	Pic.SetTransparentColour (PPD3, white)
	delay (150)
	dCheck := 0
    end if
end DrawMCDA

procedure DrawMCLA % GAUCHE
    if aCheck = 1 then
	Pic.Draw (PPG1, x, y, picMerge)
	Pic.SetTransparentColour (PPG1, white)
	delay (150)
    elsif aCheck = 2 then
	Pic.Draw (PPG2, x, y, picMerge)
	Pic.SetTransparentColour (PPG2, white)
	delay (150)
    elsif aCheck = 3 then
	Pic.Draw (PPG3, x, y, picMerge)
	Pic.SetTransparentColour (PPG3, white)
	delay (150)
	aCheck := 0
    end if
end DrawMCLA

procedure DrawMCBA % SUD
    if bCheck = 1 then
	Pic.Draw (PPB1, x, y, picMerge)
	Pic.SetTransparentColour (PPB1, white)
	delay (150)
    elsif bCheck = 2 then
	Pic.Draw (PPB2, x, y, picMerge)
	Pic.SetTransparentColour (PPB2, white)
	delay (150)
    elsif bCheck = 3 then
	Pic.Draw (PPB3, x, y, picMerge)
	Pic.SetTransparentColour (PPB3, white)
	delay (150)
    elsif bCheck = 4 then
	Pic.Draw (PPB4, x, y, picMerge)
	Pic.SetTransparentColour (PPB4, white)
	delay (150)
	bCheck := 0
    end if
end DrawMCBA

procedure DrawMCHA % NORD
    if hCheck = 1 then
	Pic.Draw (PPH1, x, y, picMerge)
	Pic.SetTransparentColour (PPH1, white)
	delay (150)
    elsif hCheck = 2 then
	Pic.Draw (PPH2, x, y, picMerge)
	Pic.SetTransparentColour (PPH2, white)
	delay (150)
    elsif hCheck = 3 then
	Pic.Draw (PPH3, x, y, picMerge)
	Pic.SetTransparentColour (PPH3, white)
	delay (150)
    elsif hCheck = 4 then
	Pic.Draw (PPH4, x, y, picMerge)
	Pic.SetTransparentColour (PPH4, white)
	delay (150)
	hCheck := 0
    end if
end DrawMCHA

process KeyHandler %EMPTIES GETCH BUFFER
    loop
	exit when running = false
	if parallelget not= 120 then
	    newChar := true
	end if
    end loop
end KeyHandler

process MoveCharacter
    loop
	if parallelget not= 120 then
	    if moveCount > 2 then
		idle := false
	    end if
	    newChar := false
	    DrawBackground
	    if parallelget = 104 then
		SideCheck := 1
		dCheck := 0
		bCheck := 0
		hCheck := 0
		x := x - 7
		aCheck := aCheck + 1
		DrawMCLA
		moveCount := moveCount + 1
	    elsif parallelget = 56 then
		SideCheck := 2
		aCheck := 0
		bCheck := 0
		hCheck := 0
		x := x + 7
		dCheck := dCheck + 1
		DrawMCDA
		moveCount := moveCount + 1
	    elsif parallelget = 88 then
		SideCheck := 3
		aCheck := 0
		dCheck := 0
		bCheck := 0
		y := y + 7
		hCheck := hCheck + 1
		DrawMCHA
		moveCount := moveCount + 1
	    elsif parallelget = 112 then
		SideCheck := 4
		aCheck := 0
		dCheck := 0
		hCheck := 0
		y := y - 7
		bCheck := bCheck + 1
		DrawMCBA
		moveCount := moveCount + 1
	    elsif SideCheck = 1 then
		idle := true
		SideCheck := 4
		aCheck := 0
		dCheck := 0
		hCheck := 0
		bCheck := 0
		DrawBackground
		DrawMCL (x, y)
		loop
		    if parallelget = 104 or parallelget = 56 or parallelget = 88 or parallelget = 112 or parallelget = 248 then
			exit
		    end if
		end loop
	    elsif SideCheck = 2 then
		idle := true
		SideCheck := 4
		aCheck := 0
		dCheck := 0
		hCheck := 0
		bCheck := 0
		DrawBackground
		DrawMCD (x, y)
		loop
		    if parallelget = 104 or parallelget = 56 or parallelget = 88 or parallelget = 112 or parallelget = 248 then
			exit
		    end if
		end loop
	    elsif SideCheck = 3 then
		idle := true
		SideCheck := 4
		aCheck := 0
		dCheck := 0
		hCheck := 0
		bCheck := 0
		DrawBackground
		DrawMCH (x, y)
		loop
		    if parallelget = 104 or parallelget = 56 or parallelget = 88 or parallelget = 112 or parallelget = 248 then
			exit
		    end if
		end loop
	    elsif SideCheck = 4 then
		idle := true
		SideCheck := 4
		aCheck := 0
		dCheck := 0
		hCheck := 0
		bCheck := 0
		DrawBackground
		DrawMCB (x, y)
		loop
		    if parallelget = 104 or parallelget = 56 or parallelget = 88 or parallelget = 112 or parallelget = 248 then
			exit
		    end if
		end loop
	    end if
	elsif SideCheck = 1 and idle = false then
	    idle := true
	    moveCount := 0
	    aCheck := 0
	    dCheck := 0
	    hCheck := 0
	    bCheck := 0
	    DrawBackground
	    DrawMCL (x, y)
	elsif SideCheck = 2 and idle = false then
	    idle := true
	    moveCount := 0
	    aCheck := 0
	    dCheck := 0
	    hCheck := 0
	    bCheck := 0
	    DrawBackground
	    DrawMCD (x, y)
	elsif SideCheck = 4 and idle = false then
	    idle := true
	    moveCount := 0
	    aCheck := 0
	    dCheck := 0
	    hCheck := 0
	    bCheck := 0
	    DrawBackground
	    DrawMCB (x, y)
	elsif SideCheck = 3 and idle = false then
	    idle := true
	    moveCount := 0
	    aCheck := 0
	    dCheck := 0
	    hCheck := 0
	    bCheck := 0
	    DrawBackground
	    DrawMCH (x, y)
	else
	    if moveCount > 2 then
		idle := false
	    end if
	    moveCount := moveCount + 1
	    delay (60)
	end if
	View.Update
	exit when EndGameCheck = true
    end loop
end MoveCharacter

procedure Fall
    for i : 1 .. 400
	y := y - 2
	delay (3)
    end for
    delay (1000)
    x := maxx div 2
    y := maxy div 2
end Fall

process KeepSpace
    loop
	if x < 115 then
	    Fall
	elsif x > 740 then
	    Fall
	elsif y > maxy - 50 then
	    y := maxy - 100
	elsif y < 100 then
	    Fall
	end if
	exit when EndGameCheck = true
	delay (100)
    end loop
end KeepSpace

procedure CheckClasse
    loop
	%MINORITE VISIBLE
	if x > 115 and x < 250 and y < maxy div 2 + 50 and y > maxy div 2 - 50 and parallelget = 248 then
	    Classe1 := "Minorite visible"
	    ExitCheck := true
	    %LOYALISTE
	elsif x > 255 and x < 450 and y < maxy - 50 and y > maxy - 200 and parallelget = 248 then
	    Classe1 := "Loyaliste"
	    ExitCheck := true
	    %FEMME
	elsif x > 640 and x < 740 and y < maxy - 100 and y > maxy - 200 and parallelget = 248 then
	    Classe1 := "Femme"
	    ExitCheck := true
	    %CANADIEN FRANCAIS
	elsif x > 250 and x < 450 and y < 200 and y > 100 and parallelget = 248 then
	    Classe1 := "Canadien francais"
	    ExitCheck := true
	    %CLASSE OUVRIERE
	elsif x > 575 and x < 675 and y < 200 and y > 100 and parallelget = 248 then
	    Classe1 := "Classe ouvriere"
	    ExitCheck := true
	end if
	delay (150)
	exit when ExitCheck = true
    end loop
end CheckClasse

procedure FadeToBlack
    for i : 1 .. 5
	Pic.Draw (FTB (i), -150, -50, 0)
	View.Update
	delay (100)
    end for
end FadeToBlack

process CheckDSkip
    loop
	if parallelget = 112 then
	    SetEndCheck (true)
	    return
	end if
	delay (100)
    end loop
end CheckDSkip

process DButtonAnimation
    loop
	delay (500)
	Draw.Fill (1, 1, black, black)
	Pic.Draw (D2_F1, 75, 75, 0) % ppl
	View.Update
	delay (500)
	Pic.Draw (SkipB, 10, 10, picMerge) %Button
	Pic.SetTransparentColour (SkipB, white) % Button white background = transparent
	View.Update
	if EndDCheck = true then
	    SetEndCheck (false)
	    EndDebate := true
	    return
	end if
    end loop
end DButtonAnimation

process DButtonAnimation1
    loop
	delay (500)
	Draw.Fill (1, 1, black, black)
	Pic.Draw (D1_F2, 75, 75, 0) % ppl
	View.Update
	delay (500)
	Pic.Draw (SkipB, 10, 10, picMerge) %Button
	Pic.SetTransparentColour (SkipB, white) % Button white background = transparent
	View.Update
	if EndDCheck = true then
	    SetEndCheck (false)
	    EndDebate := true
	    return
	end if
    end loop
end DButtonAnimation1

procedure MinoriteVisibleScreen
    MinoriteVisibleCheck := true
    fork CheckDSkip
    fork DButtonAnimation % NOT ANIMATION1
    %for i : 1 .. 25
    loop
	delay (100)
	exit when EndDebate = true
	%end for
    end loop
    SetEndCheck (true)
end MinoriteVisibleScreen

procedure LoyalisteScreen
    LoyalisteCheck := true
    for i : 1 .. 4
	if i > 1 then
	    Draw.Fill (1, 1, black, black)
	    Pic.Draw (GuerreTime (i - 1), 50, 50, 0)
	    View.Update
	    cls
	    delay (2500)
	end if
	Pic.Draw (Loyaliste (i), 0, 0, 0)
	Pic.Draw (SkipB, -40, maxy - 200, picMerge)
	Pic.SetTransparentColour (SkipB, white)
	View.Update
	delay (1000)
	loop
	    if parallelget = 112 then
		exit
	    end if
	end loop
    end for
end LoyalisteScreen

procedure FemmeScreen
    FemmeCheck := true
    for i : 1 .. 4
	if i > 1 then
	    Draw.Fill (1, 1, black, black)
	    Pic.Draw (GuerreTime (i - 1), 50, 50, 0)
	    View.Update
	    cls
	    delay (2500)
	end if
	Pic.Draw (FemmeF (i), 0, 0, 0)
	Pic.Draw (SkipB, -40, maxy - 200, picMerge)
	Pic.SetTransparentColour (SkipB, white)
	View.Update
	delay (1000)
	loop
	    if parallelget = 112 then
		exit
	    end if
	end loop
    end for
end FemmeScreen

procedure CanadienFrancaisScreen
    CanadienFrancaisCheck := true
    Draw.Fill (1, 1, black, black)
    Pic.Draw (D1_F1, 75, 75, 0)     % ppl
    View.Update
    delay (1500)
    fork CheckDSkip
    fork DButtonAnimation1
    for i : 1 .. 50
	delay (100)
	exit when EndDebate = true
    end for
    SetEndCheck (true)
end CanadienFrancaisScreen

procedure ClasseOuvriereScreen
    ClasseOuvriereCheck := true
    for i : 1 .. 4
	if i > 1 then
	    Draw.Fill (1, 1, black, black)
	    Pic.Draw (GuerreTime (i - 1), 50, 50, 0)
	    View.Update
	    cls
	    delay (2500)
	end if
	Pic.Draw (CO (i), 0, 0, 0)
	Pic.Draw (SkipB, -40, maxy - 200, picMerge)
	Pic.SetTransparentColour (SkipB, white)
	View.Update
	delay (1000)
	loop
	    if parallelget = 112 then
		exit
	    end if
	end loop
    end for
end ClasseOuvriereScreen

procedure SortClasse
    if Classe1 = 'Minorite visible' then
	cls
	MinoriteVisibleScreen
	cls
    elsif Classe1 = 'Loyaliste' then
	cls
	LoyalisteScreen
	cls
    elsif Classe1 = 'Femme' then
	cls
	FemmeScreen
	cls
    elsif Classe1 = 'Canadien francais' then
	cls
	CanadienFrancaisScreen
	cls
    elsif Classe1 = 'Classe ouvriere' then
	cls
	ClasseOuvriereScreen
	cls
    else
	FemmeScreen
    end if
end SortClasse

procedure EndPhase
    for i : 1 .. 14
	Draw.Fill (1, 1, black, black)
	Pic.Draw (epf (i), 75, 75, 0)
	View.Update
	delay (100)
	if i < 8 and i > 0 then
	    if i < 5 and i > 0 then
		delay (750)
	    else
		delay (400)
	    end if
	end if
    end for
    Draw.FillBox (-10, -10, maxx + 10, maxy + 10, black)
    View.Update
    Music.PlayFile ("Explosion de fin de jeu.wav")
    % GHOST FLOATING IN SKY ANIMATION - TOO CHOPPY AND UNRELATED TO ANIMATION
    % for i : 1 .. 75
    %     Draw.FillBox (-10, -10, maxx + 10, maxy + 10, black)
    %     Pic.Draw (PPFa, maxx div 2 - 50, (i * 10), picMerge)
    %     Pic.SetTransparentColour (PPFa, white)
    %     View.Update
    %     delay (50)
    % end for
    var Savei : int := 0
    for i : 1 .. 400
	Pic.Draw (EndBackground, 50, - (i), 0)
	View.Update
	delay (1)
	Savei := i
    end for
    Pic.Draw (EBF2, 50, - (Savei), 0)
    View.Update
    delay (400)
    Pic.Draw (EBF3, 50, - (Savei), 0)
    View.Update
    delay (500)
    Pic.Draw (EBF4, 50, - (Savei), 0)
    View.Update
    delay (200)
    var EndXVariable : int := 65
    for i : 1 .. 600
	Pic.Draw (EBF5, 50, -Savei - (i), 0) % CLOUDS
	if ceil (i / 20) * 20 = i then % CHECK FOR MULTIPLES OF 20
	    hCheck := hCheck + 1
	    if hCheck = 1 then
		Pic.Draw (PPH1, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH1, white)
	    elsif hCheck = 2 then
		Pic.Draw (PPH2, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH2, white)
	    elsif hCheck = 3 then
		Pic.Draw (PPH3, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH3, white)
	    elsif hCheck = 4 then
		Pic.Draw (PPH4, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH4, white)
		hCheck := 0
	    end if
	else
	    if hCheck = 1 then
		Pic.Draw (PPH1, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH1, white)
	    elsif hCheck = 2 then
		Pic.Draw (PPH2, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH2, white)
	    elsif hCheck = 3 then
		Pic.Draw (PPH3, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH3, white)
	    else
		Pic.Draw (PPH4, maxx div 2 - EndXVariable, 180, picMerge) % SOLDIER
		Pic.SetTransparentColour (PPH4, white)
	    end if
	end if
	View.Update
	delay (1)
    end for
    EndGameCheck := true
end EndPhase

procedure CheckEndPhase
    if MinoriteVisibleCheck = true and LoyalisteCheck = true and FemmeCheck = true and CanadienFrancaisCheck = true and ClasseOuvriereCheck = true then
	EndPhase
    end if
end CheckEndPhase

process MenuScreenAnimation
    loop
	Pic.Draw (DPMenu, 0, 0, 0)
	Pic.Draw (MenuF1, 0, 100, picMerge)
	Pic.SetTransparentColour (MenuF1, white)
	View.Update
	cls
	delay (500)
	Pic.Draw (DPMenu, 0, 0, 0)
	Pic.Draw (MenuF2, 0, 100, picMerge)
	Pic.SetTransparentColour (MenuF2, white)
	View.Update
	cls
	delay (500)
	exit when EndMenuCheck = true
    end loop
end MenuScreenAnimation

procedure MenuCheck
    loop
	if parallelget = 248 then
		EndMenuCheck := true
	end if
	delay (60)
	exit when EndMenuCheck = true
    end loop
end MenuCheck

loop     % MAIN EVENTS
    ResetGameVars
    fork MenuScreenAnimation     % FLASHING OF YELLOW BUTTON + COPYRIGHT
    % ***DO NOT NEED ANYMORE; USING PARALLELGET*** fork KeyHandler     % GETCHES KEYS
    MenuCheck     % CHECKS FOR I
    delay (1000) % WAIT FOR MENUSCREENANIMATION TO TERMINATE
    loop
	ResetVars     % RESETS UNIMPORTANT VALUES (EX: POSITIONS, etc...)
	fork KeepSpace     % MAKES SOLDIER FALL OFF CLOUD
	fork MoveCharacter     % MOVES THE SOLDIER
	CheckClasse     % CHECKS FOR CLASSES WHEN 'i' PRESSED
	FadeToBlack
	SortClasse     % ACTIVATES ANIMATIONS FOR EACH INDIVIDUAL CLASSE
	CheckEndPhase     % CHECKS TO SEE IF ALL CLASSES HAVE BEEN ACTIVATED BEFORE
	exit when EndGameCheck = true
    end loop
    delay (200) % Wait for KeepSpace and MoveChacrter to terminate
end loop
