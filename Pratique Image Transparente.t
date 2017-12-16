setscreen ("graphics:max;max")
setscreen ("offscreenonly")

var Image_Test, Image_Test1, Image_Test2, yn, font1 : int

Draw.Fill (100, 100, yellow, yellow)

font1 := Font.New ("Cambria:18:bold")
Image_Test := Pic.FileNew ("Image_Test.jpg")
Image_Test1 := Pic.FileNew ("Image_Test1.jpg")
Image_Test2 := Pic.FileNew ("Image_Test2.jpg")

procedure DrawCharacter (x, y : int)
	Pic.SetTransparentColor (Image_Test, white)
	Pic.Draw (Image_Test, x, y, picMerge)
end DrawCharacter

process ShowInteractDebug

end ShowInteractDebug

process Interact
    var interCheck : boolean
    interCheck := false
    loop
	if parallelget = 248 and interCheck = true then
	    Font.Draw ("Interagis", 10, maxy - 50, font1, yellow)
	    interCheck := false
	    delay (500)
	    View.Update
	elsif parallelget = 248 then
	    Font.Draw ("Interagis", 10, maxy - 50, font1, black)
	    interCheck := true
	    delay (500)
	    View.Update
	end if
    end loop
end Interact

process MoveCharacter
    var movx, movy : int
    movx := 10
    movy := 10
    loop
	    Draw.FillBox (0, 0, maxx, maxy, yellow)
	    if parallelget = 56 then
		movx := movx - 10
	    elsif parallelget = 112 then
		movx := movx + 10
	    elsif parallelget = 88 then
		movy := movy + 10
	    elsif parallelget = 104 then
		movy := movy - 10
	    end if
	DrawCharacter (movx, movy)
	View.Update
    end loop
end MoveCharacter

fork MoveCharacter
fork Interact
