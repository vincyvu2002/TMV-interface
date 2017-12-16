setscreen ("graphics:max;max")

var font1, font2, MCLoc, MCLocOld : int
var MC : string (1)

MCLoc := 1
MCLocOld := 0
font1 := Font.New ("Georgia:32:bold")
font2 := Font.New ("Georgia:20:bold")

var y2 : int := maxy - 50

procedure DessineMenu
    Font.Draw ("Commencer", 10, maxy - 50, font1, black)
    Font.Draw ("Comment jouer", 10, maxy - 80, font2, black)
    Font.Draw ("Sources", 10, maxy - 110, font2, black)
    Font.Draw ("Quitter", 10, maxy - 140, font2, black)
end DessineMenu

procedure DrawBox (loc, colorb : int)
    if loc not= 0 then
	var xindex : int := loc - 1
	var delta := (xindex * 30)
	Draw.ThickLine (350, y2 - delta, 300, y2 - delta, 5, colorb)
    end if
end DrawBox

procedure Choix
    loop
	if hasch then
	    getch (MC)
	    if MC = 'w' then
		DrawBox (MCLocOld, white) % Erase
		DrawBox (MCLoc, black) % Draw
		MCLocOld := MCLoc
		if MCLoc = 1 then
		    MCLoc := 4
		elsif MCLoc = 2 then
		    MCLoc := 1
		elsif MCLoc = 3 then
		    MCLoc := 2
		elsif MCLoc = 4 then
		    MCLoc := 3
		end if
	    elsif MC = 's' then
		DrawBox (MCLocOld, white)
		DrawBox (MCLoc, black)
		MCLocOld := MCLoc
		if MCLoc = 1 then
		    MCLoc := 2
		elsif MCLoc = 2 then
		    MCLoc := 3
		elsif MCLoc = 3 then
		    MCLoc := 4
		elsif MCLoc = 4 then
		    MCLoc := 1
		end if
	    end if
	end if
	exit when parallelget = 104
    end loop
end Choix

procedure Jeu
    cls
    Font.Draw ("Jeu", maxx div 2, maxy div 2, font1, black)
end Jeu

procedure Instructions
    cls
    Font.Draw ("Instructions", maxx div 2, maxy div 2, font1, black)
end Instructions

procedure Sources
    cls
    Font.Draw ("Sources", maxx div 2, maxy div 2, font1 ,black)
end Sources

procedure RecChoix
    if MCLoc = 4 then
	Jeu
    elsif MCLoc = 1 then
	Instructions
    elsif MCLoc = 2 then
	Sources
    elsif MCLoc = 3 then
	quit
    end if
end RecChoix

DessineMenu
Choix
RecChoix
