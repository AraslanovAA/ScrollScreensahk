i := 0
global x:=0
global y:=0
global z:=0
global xs ="0"
global ys ="0"
global zs ="0"
global adress = "https://prnt.sc/m1o"
capslock::
i:= Mod(i+1,2)
`::
While i = 1
{
sleep 5000
Send ^{vk4C} ;ctrl+L
;Send {right}
;Send {backspace 3}
INCZ()
concat = %adress%%xs%%ys%%zs%
Clipboard = %concat%
Send ^{vk56} ;ctrl+V
sleep 500
Send {enter}
sleep 500
;send %concat%{enter}
;MsgBox  Значение в переменной с именем Var равно %concat%.
}
return
INCZ()
{
z:=z+1
if z > 35
	INCY()
Recognize_(z,zs)
}
INCY()
{
z:=0
y:=y+1
if y > 35
	INCX()
Recognize_(y,ys)
}
INCX()
{
y:=0
x:=x+1
Recognize_(x,xs)
}







Recognize_(ByRef u,ByRef us)
{
if u = 0
	us:="0"
if u = 1
	us:="1"
if u = 2
	us:="2"
if u = 3
	us:="3"
if u = 4
	us:="4"
if u = 5
	us:="5"
if u = 6
	us:="6"
if u = 7
	us:="7"
if u = 8
	us:="8"
if u = 9
	us:="9"
if u = 10
	us:="a"
if u = 11
	us:="b"
if u = 12
	us:="c"
if u = 13
	us:="d"
if u = 14
	us:="e"
if u = 15
	us:="f"
if u = 16
	us:="g"
if u = 17
	us:="h"
if u = 18
	us:="i"
if u = 19
	us:="j"
if u = 20
	us:="k"
if u = 21
	us:="l"
if u = 22
	us:="m"
if u = 23
	us:="n"
if u = 24
	us:="o"
if u = 25
	us:="p"
if u = 26
	us:="q"
if u = 27
	us:="r"
if u = 28
	us:="s"
if u = 29
	us:="t"
if u = 30
	us:="u"
if u = 31
	us:="v"
if u = 32
	us:="w"
if u = 33
	us:="x"
if u = 34
	us:="y"
if u = 35
	us:="z"
}
