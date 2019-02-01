global SleepTime := 5000 ; пауза между сменой загрузкой следующего изображения
global adress = "https://prnt.sc/"
global ArrayOfSymbols := ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"] ;количество элементов 1-36
global AdressItems := Object()

Numpad4::
InputBox, OutputVar , "scroll_timer", "How long should I wait?`n default = 5000(5sec)"
SleepTime:=OutputVar
return
Numpad0:: 
reload
return
Numpad1:: ;сохранить начальный адресс
                   ;msgbox % ArrayOfSymbols[1] " " ArrayOfSymbols[2] " " ArrayOfSymbols[3] " " ArrayOfSymbols[4] " " ArrayOfSymbols[5] " " ArrayOfSymbols[6] " " ArrayOfSymbols[7] " " ArrayOfSymbols[8] " " ArrayOfSymbols[9] " " ArrayOfSymbols[10] " " ArrayOfSymbols[11] " " ArrayOfSymbols[12] " " ArrayOfSymbols[13] " " ArrayOfSymbols[14] " " ArrayOfSymbols[15] " " ArrayOfSymbols[16] " " ArrayOfSymbols[17] " " ArrayOfSymbols[18] " " ArrayOfSymbols[19] " " ArrayOfSymbols[20] " " ArrayOfSymbols[21] " " ArrayOfSymbols[22] " " ArrayOfSymbols[23] " " ArrayOfSymbols[24] " " ArrayOfSymbols[25] " " ArrayOfSymbols[26] " " ArrayOfSymbols[27] " " ArrayOfSymbols[28] " " ArrayOfSymbols[29] " " ArrayOfSymbols[30] " " ArrayOfSymbols[31] " " ArrayOfSymbols[32] " " ArrayOfSymbols[33] " " ArrayOfSymbols[34] " " ArrayOfSymbols[35] " " ArrayOfSymbols[36]
	NumItem := 6 ; количество обрабатываемых символов
	
Send ^{vk4C} ;ctrl+L
sleep 10
	While NumItem > 0 
	{
	if NumItem = 6
		Send {right}
	else
		Send {left}
	sleep 10
	Send +{left} ; shift + left
	sleep 10
	Send ^{vk43} ;Ctrl+C
	AdressItems[NumItem,1] := clipboard
	AdressItems[NumItem--,2]:=0
	sleep 10
	} 
		EveryItemRecognized := False ; распознаем прочитанные символы и записываем их порядковые номера
		NumItem:= 1
		while EveryItemRecognized = False
		{
		
			if NumItem = 7
				EveryItemRecognized := True
			else
			{
				index:=1
				while AdressItems[NumItem,2] = 0
				{
				if ArrayOfSymbols[index] = AdressItems[NumItem,1]
				{
					AdressItems[NumItem,2] := index
				}
				else
					index++
				}
				NumItem++
			}
		}
	return
	
Numpad2:: ;листаем с текущего адреса вперёд
 run := 1
While run = 1
{
Send ^{vk4C} ;ctrl+L
UsingItemNum = 0
IncAdress(6) ; инкрементируем последний символ в соответствии с ArrayOfSymbols
concat_1:= AdressItems[1,1] ;изначально конкатанация выглядела так:
concat_2:= AdressItems[2,1] ;%adress%%AdressItems[1,1]%%AdressItems[2,1]%%AdressItems[3,1]%%AdressItems[4,1]%%AdressItems[5,1]%%AdressItems[6,1]%
concat_3:= AdressItems[3,1] ; почему конкатанация с символами из массивов невозможна непонятна
concat_4:= AdressItems[4,1] ; ошибка illegal character
concat_5:= AdressItems[5,1] ; но если переложить в новую переменную видимо уже легал
concat_6:= AdressItems[6,1] ; если это неявное преобразование типов, то какой тип изначально при записи в массив?
concat = %adress%%concat_1%%concat_2%%concat_3%%concat_4%%concat_5%%concat_6%
Clipboard = %concat%
Send ^{vk56} ;ctrl+V
Send {enter}
sleep SleepTime
}
return

IncAdress(param)
{
if param = 0
	msgbox Кажется это предел
else
{
	if AdressItems[param,2] <> 36
		{
		AdressItems[param,2] := AdressItems[param,2] + 1
		AdressItems[param,1] := ArrayOfSymbols[AdressItems[param,2]]
		}
	else
	{
		AdressItems[param,2]:=1
		AdressItems[param,1]:= ArrayOfSymbols[AdressItems[param,2]]
		IncAdress(param-1)
	}
}
}

Numpad3:: ;листаем с текущего адреса назад
 run := 1
While run = 1
{
Send ^{vk4C} ;ctrl+L
UsingItemNum = 0
DecAdress(6) ; декрементируем последний символ в соответствии с ArrayOfSymbols
concat_1:= AdressItems[1,1] ;изначально конкатанация выглядела так:
concat_2:= AdressItems[2,1] ;%adress%%AdressItems[1,1]%%AdressItems[2,1]%%AdressItems[3,1]%%AdressItems[4,1]%%AdressItems[5,1]%%AdressItems[6,1]%
concat_3:= AdressItems[3,1] ; почему конкатанация с символами из массивов невозможна непонятна
concat_4:= AdressItems[4,1] ; ошибка illegal character
concat_5:= AdressItems[5,1] ; но если переложить в новую переменную видимо уже легал
concat_6:= AdressItems[6,1] ; если это неявное преобразование типов, то какой тип изначально при записи в массив?
concat = %adress%%concat_1%%concat_2%%concat_3%%concat_4%%concat_5%%concat_6%
Clipboard = %concat%
Send ^{vk56} ;ctrl+V
Send {enter}
sleep SleepTime
}
return


DecAdress(param)
{
if param = 0
	msgbox Кажется это предел
else
{
	if AdressItems[param,2] <> 1
		{
		AdressItems[param,2] := AdressItems[param,2] - 1
		AdressItems[param,1] := ArrayOfSymbols[AdressItems[param,2]]
		}
	else
	{
		AdressItems[param,2]:=36
		AdressItems[param,1]:= ArrayOfSymbols[AdressItems[param,2]]
		DecAdress(param-1)
	}
}
}










