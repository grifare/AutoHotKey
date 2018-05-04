# An AutoHotKey Script

Converts month names into month numbers and vice versa.<br />
 Converts month numbers into month names handling various formats. 01.07.2018, 01 /07/ 2018, 01/07/2018, 01 07 2018, and 01-07-2018, become 15-JUL-2018.<br />
 Converts month names into month numbers handling various formats. 01.JUL.2018, 01 /JUL/ 2018, 01/JUL/2018, 01 JUL 2018, and 01-JUL-2018 become 15-07-2018.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. Given that you are a GitHub user, I am not covering basics of installation issues. 

### Prerequisites

In order to develop an AutoHotKey script, you need
* A text editor, such as Notepad++
* AutoHotKey compiler. It is free and can be downloaded from the official [website](https://www.autohotkey.com)

### Installing

* Once you open autohotkey website, a download link appears. Download the zipped folder and extract the files.
* Open Notepad++, create a new file, and save it as test.ahk
* Copy the code below, paste it in test.ahk, and save it
```
; This entire line is a comment.
; the code below defines control+1 as a hotkey
; it means the script will work when the user does ctrl+1
^1::
MsgBox, This is an autohotkey file
```
* Find the file in the compiler folder that will compile test.ahk file to an exe file, which is currently named as Ahk2Exe.exe. Browse and select test.ahk as source and create a test.exe at the destination. The compiler has a simple GUI and option labels are self-explanatory.
* Run the test.exe file. An icon will be inserted in your taskbar, indicating that autohotkey has been activated.
* When you do ctrl+1, a pop-up that reads "This is an autohotkey file" will appear.

## Author

* **Armagan Tekdoner** - *Initial work* - [grifare](https://github.com/grifare)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
