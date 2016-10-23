; Lines that start with a; semicolon, such as this one, are comments.  They are not executed.
; This script has a special filename and path because it is automatically launched when you run the program directly.
; Also, any text file whose name ends in .ahk is associated with the program, which means that it can be launched simply by double-clicking it.
; You can have as many .ahk files as you want, located in any folder. You can also run more than one ahk file simultaneously and each will get its own tray icon.

; Note: From now on whenever you run AutoHotkey directly, this script will be loaded.  So feel free to customize it to suit your needs.

;================hotkeys.
;"return" serves to finish the hotkey. However, if a hotkey needs to execute only a single line, that line can be listed to the right of the double-colon. In other words, the return is implicit
;To use more than one modifier with a hotkey, list them consecutively (the order does not matter).

;================hotstrings.
;Although hotstrings are mainly used to expand abbreviations as you type them (auto-replace), they can also be used to launch any scripted action. In this respect, they are similar to hotkeys except that they are typically composed of more than one character (that is, a string).
;Note that the commands must appear beneath the hotstring.

;================keylist.
;	#. Windows logo key.
;	!. Alt.
;	^. Control.
;	+. Shift.

;================window.
;WinActivate  ; Automatically uses the window found above.

;#IfWinActive / #IfWinExist: Creates context-sensitive hotkeys and hotstrings. Such hotkeys perform a different action (or none at all) depending on the type of window that is active or exists.
;The #IfWin directives are positional: they affect all hotkeys and hotstrings physically beneath them in the script. They are also mutually exclusive; that is, only the most recent one will be in effect.
;To turn off context sensitivity, specify any #IfWin directive but omit all of its parameters.

;//////////////////////////////////////////////////////////system global hotkeys.

^!0::
	IfWinExist ahk_class NaiConsoleMainWindow
	{
		WinActivate
		Send, {F4}
	}
	else
	{
		MsgBox VirusScan window is not exist
	}
return


#`::
	WinExist("ahk_class Shell_TrayWnd")

	t := !t

	If (t = "1") {
		WinHide, ahk_class Shell_TrayWnd
		WinHide, Start ahk_class Button
	} Else {
		WinShow, ahk_class Shell_TrayWnd
		WinShow, Start ahk_class Button
	}
return


#IfWinActive ahk_class ConsoleWindowClass
::javaa::java edu.princeton.cs.algs4.
#IfWinActive
;show this script to edit.
#h::
	ifWinExist ahk_class SciTEWindow
		WinActivate
	else
	;	Run C:\Program Files\AutoHotkey\SciTE\SciTE.exe
		Run "D:\myProg\AutoHotkey\SciTE\SciTE.exe"
	return

;color get.
#p::
MouseGetPos, mouseX, mouseY
PixelGetColor, color, %mouseX%, %mouseY%, RGB
StringRight color,color,6
clipboard = %color%
tooltip, Pixel color %color% sent to clipboard.
sleep 2000
tooltip,
return

;input method change hotstring
!y::send,!{Shift}

;===================================cursor move.
;h←,j↓,k↑,l→
!h::send,{Left}
!j::send,{Down}
!k::send,{Up}
!l::send,{Right}

!g::send,{Home}
!;::send,{End}

!i::Send,{PgUp}
!u::Send,{PgDn} 

!o:: Send,^{Home}
;!p:: Send,^{End}

;====================================function key.
!q::send,{Delete}

;====================================word wrap.
;选择文字
;!n::Send ^+{Left}
;!m::Send ^+{Right}
;!,:: Send,+{Home} ;选择当前位置到行首的文字
;!.:: Send,+{End} ;选择当前位置到行末的文字 
;复制一行; deleted: confilict with eclipse "content assist key"
;!/::
;Send {Home}
;Send +{End}
;Send,^c
;return 
;删除一行 ;>> select this line
!\::
Send {Home}
Send +{End}
;send,^x{Delete 1}
return 

;system volume control.
#!Down::Send {Volume_Down 1}
#!Up::Send {Volume_Up 1}
#!Left::Send {Volume_Mute}

;//////////////////////////////////////////////////////////system global hotstrings.
;::tc::total commander
;::et::everything

;//////////////////////////////////////////////////////////program,window specified.
;==================================eclipse
;scanner
#IfWinActive ahk_class SWT_Window0
{
	::Scan::Scanner in = new Scanner(System.in);
}
#IfWinActive


;==================================wiznote
;not-work###GroupAdd Wiz, ahk_class WizNoteMainFrame
;not-work###GroupAdd Wiz, ahk_class WizNoteEditFrame
;not-work####IfWinActive ("ahk_group Wiz")
#IfWinActive ahk_class WizNoteMainFrame
{
;title modify located after Ctrl+N.
^n::
	send,^n
	Sleep,1000
	send,!d
	Sleep,500
	send,{Tab 3}
	send,+{Home}
	return 


;one phase work done
!Enter::
	send,{Enter}
	Send,{Left}
	send,{ENter 2}
	send,{~}
	send,^{;}
	send,^{l}
	send,{right}
	return

;i hate this Esc key
;Esc::F11	;sogou inputmethod influenced.

;underline
::us::
	send,<u>
	return
::ue::
	send,</u>
	return
::ua::
	send,<u></u>{Left 4}
	return

::bs::
	send,**
	return
;::ba::
;	send,****{Left 2}
;	return


;empty line
::kh::
	send,<br />
	return

;;;;;;;;;;Markdown.

;quote set hotstring
::yy::
	send,{>}{Space 2}{Enter}
	return

;code set hotstring
::dm::
	send,{`` 3}
	send,{enter 2}
	send,{`` 3}
	send,{up 1}
	return
;catalogue set hotstring
::span::
	send,<span id=""></span>
	send,{left 9}
	return
::sid::
	send,*{space}[]({#}){Left 4}
	return
	
;title input hotstring
::11j::
	send,^{Home}
	send,{Enter 2}
	send,{up 2}
	send,{# 1}{space 1}o{space 1}
	return
/* 	send,{- 3}{enter}
	send,^l{enter}
	send,{# 1}{space 1}
	return
 */
 /* ::1j::
	send,{# 1}{space 1}[]{enter}
	send,{- 3}^l{left 7}
	return
 */
::1j::
	send,{# 1}{space 1}o{space 1}
	return
::3j::
	send,{# 3}{space 1}-{space 1}
	return
::4j::
	send,{# 4}{space 1}
	return
::5j::
	send,{# 5}{space 1}
	return
::6j::
	send,{# 6}{space 1}
	return

;list input hotstring
::1l::
	send,{*}{Space}
	return
::2l::
	send,{Tab}{-}{Space}
	return
::3l::
	send,{Tab 2}{+}{Space}
	return

::1lb::
	send,{*}{Space}{* 4}{Left 2}
	return
::2lb::
	send,{Tab}{-}{Space}{* 4}{Left 2}
	return
::3lb::
	send,{Tab 2}{+}{Space}{* 4}{Left 2}
	return


!0::Send,===================={Left 10}
!1::Send,{Space 2}{#}
!2::Send,{Space 4}-

;(). NOTE: chinese version works too. hotkey is faster than hotstring.
;hotstring method. ::(::send,(  )...send,{Left 2} return.
(::send,(){Left 1}
;<::send,<>{Left 1}
[::send,[]{Left 1}
;{::send,{{}{Space 2}{}}{Left 2}
'::send,''{Left}
"::send,""{Left}

;always paste pure test
/*^v::
	Send, ^+v
	return
*/
}
#IfWinActive

;~ ;==================================evernote
;~ ;(),<>,...
;~ #IfWinActive ahk_class commented150827;ENMainFrame
;~ {
;~ !0::Send,===================={Left 10}
;~ !1::Send,{Space 2}{#}
;~ !2::Send,{Space 4}-

;~ ;Color
;~ !b::
	;~ send,^d
	;~ sleep, 200
	;~ send, {Tab 5}{Down 12}{Enter}
	;~ sleep, 200
	;~ send,{Right}
	;~ return

;~ !r::
	;~ send,^d
	;~ sleep, 200
	;~ send, {Tab 5}{Down 9}{Enter}
	;~ sleep, 200
	;~ send,{Right}
	;~ return

;~ ;title search	
;~ F6::send,{F6}intitle:

;~ ;(). NOTE: chinese version works too. hotkey is faster than hotstring.
;~ ;hotstring method. ::(::send,(  )...send,{Left 2} return.
;~ (::send,(  ){Left 2}
;~ <::send,<  >{Left 2}
;~ [::send,[  ]{Left 2}
;~ {::send,{{}{Space 2}{}}{Left 2}
;~ '::send,''{Left}
;~ "::send,""{Left}

;~ ;after Ctrl+N new note created, move cursor to title.
;~ ^n::
	;~ send,^n
	;~ sleep,500
	;~ send,{Esc}
	;~ send,{Tab}
	;~ sleep,100
	;~ send,{Tab}
	;~ return
;~ ;always paste pure test in evernote.
;~ ^v::
	;~ Send, ^+v
	;~ return
;~ #ifWinActive

;~ ;copy and paste selected content into the now-active note in evernote.
;~ ^!c::
	;~ send,^c
	;~ sleep,1000
	;~ IfWinExist ahk_class ENMainFrame
	;~ {
		;~ WinActivate
		;~ ;sleep,2000
		;~ send,{enter}
		;~ send,o{space}
		;~ send,^+v
		;~ sleep,500
		;~ send,!{tab}
	;~ }
	;~ else
	;~ {
		;~ MsgBox,Evernote is not exist.
	;~ }
	;~ return
;~ }

;命令行cmd里可以ctrl v
#IfWinActive ahk_class ConsoleWindowClass
^v::
MouseClick, Right, %A_CaretX%, %A_CaretY%,,0
send p
return 
#IfWinActive
;EOF