' new
Declare Function Setup (ByRef SetupNew1 As T1, ByRef SetupNew2 As T2, ByRef SetupNew3 As T3)
' Some FB rayib headers.
type Vector2
	x as single
	y as single
	declare constructor()
	declare constructor(x as single, y as single)
end type

constructor Vector2(x as single, y as single)
	this.x = x
	this.y = y
end constructor

constructor Vector2()
end constructor
End
