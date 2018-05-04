/*
 * A find-and-replace autohotkey script
 * converts month numbers into month names and vice versa
 * developed by Armagan Tekdoner
 * from Accessibility, Accommodation and Adaptive Computer Technology (AAACT) of SSC (Shared Services Canada)
 * email: Armagan.Tekdoner@canada.ca
 * website: grifare.net
 * launch date: May 2018
 * Using regex, vulnerabilities and false matches of the previous version have been fixed
 */

; declaration of variables for directives
title := "Converts month numbers into month names and vice versa"
firstSentence := "Holding control key,"
directive1 := "press 1 to convert month numbers into their respective names"
directive2 := "press 2 to convert month names into their respective numbers"

; Initial message box
MsgBox, 1, %title%, %firstSentence%`n`n%directive1%`n%directive2%

; empties the clipboard each time the script is activated
Clipboard =

; Places Unicode text onto the clipboard.
Transform, Clipboard, Unicode, %MyUTF_String%  

; creates an array that defines which month number corresponds to which abbreviation
monthArray := {JAN: "01", FEB: "02", FEV: "02", FÉV: "02", MAR: "03", APR: "04", AVR: "04", MAY: "05", MAI: "05", JUN: "06", JUL: "07", AUG: "08", AOU: "08", AOÛ: "08", SEP: "09", OCT: "10", NOV: "11", DEC: "12", DÉC: "12"}

; ctrl+1 ---------------------------------------------------------------------------
; defines the hotkey
^1::

	MsgBox, 1, ctrl+1 01-07-2018 becomes 01-JUL-2018, Converts month numbers into month names handling various formats:`n`n01.07.2018 or 01 /07/ 2018 or 01/07/2018 or 01 07 2018 or 01-07-2018`nbecomes 15-JUL-2018

	; empties the clipboard
	Clipboard =
	Clipboard := ""
	; emulates select all
	Send ^a
	; copies selected
	Send ^c
	; 2 miliseconds wait to increase performance
	Sleep, 2
	; Loop through the array
		for key, value in monthArray {
			; regex find-and-replace cases defined both for EN and FR (accented or not)
			Clipboard := RegExReplace( Clipboard, "(\d)(?:\s|\/|\s\/|\.|\-)" value "(?:\s|\/|\/\s|\.|\-)(\d)", "$1-" key "-$2" )
		}
		
		Sleep, 2
		; stores French characters	in a variable
		frenchChars := "i)(ù|û|ü|ÿ|«|»|à|â|æ|ç|é|è|ê|ë|ï|î|ô|œ)"

		; counts French characters in the page
		FoundPos := RegExMatch(Clipboard, frenchChars)
		; if there are one or more French characters, page is presumed to be in French
		If (FoundPos > 0){
			Clipboard := StrReplace(Clipboard, "-FEB-", "-FÉV-")
			Clipboard := StrReplace(Clipboard, "-APR-", "-AVR-")		
			Clipboard := StrReplace(Clipboard, "-AOU-", "-AOÛ-")
			Clipboard := StrReplace(Clipboard, "-DEC-", "-DÉC-")
		}  
		Else{
			Clipboard := StrReplace(Clipboard, "-AOU-", "-AUG-")
			Clipboard := StrReplace(Clipboard, "-MAI-", "-MAY-")
		}  
		
	; pastes the changes made in the selected text
	Send ^v
; ends the mission of control+1
Return

; ctrl+2 ---------------------------------------------------------------------------
; defines the hotkey
^2::

	MsgBox, 1, ctrl+2 01-JUL-2018 becomes 01-07-2018, Converts month names into month numbers handling various formats:`n`n01.JUL.2018 or 01 /JUL/ 2018 or 01/JUL/2018 or 01 JUL 2018 or 01-JUL-2018`nbecomes 15-07-2018

	; empties the clipboard
	Clipboard =
	Clipboard := ""
	; emulates select all
	Send ^a
	; copies selected
	Send ^c
	; 2 miliseconds wait to increase performance
	Sleep, 2
	; Loop through the array
		for key, value in monthArray {
			; regex find-and-replace cases defined both for EN and FR (accented or not)
			Clipboard := RegExReplace( Clipboard, "(\d)(?:\s|\/|\s\/|\.|\-)" key "(?:\s|\/|\/\s|\.|\-)(\d)", "$1-" value "-$2" )
		}
	; pastes the changes made in the selected text
	Send ^v
; ends the mission of control+2
Return