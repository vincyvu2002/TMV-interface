setscreen ("graphics:max;max")

var Paysage , font1, midx, midy : int

midx := ceil (maxx/2)
midy := ceil (maxy/2)
font1 := Font.New ("Cambria:18:bold")
Paysage := Pic.FileNew ("Paysage.jpg")

Pic.Draw (Paysage,150,0,0)

Draw.FillBox (0,0,150,maxy,black)
Draw.FillBox (maxx-160,0,maxx,maxy,black)

process PP

end PP
