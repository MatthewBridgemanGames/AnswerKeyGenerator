::Copyright Matthew Bridgeman 2020
::This code is completely open-source meaning that it is completely free and anybody may modify their version as they see fit.
::However, selling this code or any lightly modified version of it is illegal.

@echo off
setlocal EnableDelayedExpansion
color 7
title Random Answer Key Generator

:start
echo Copyright Matthew Bridgeman 2020
echo What is the name of the assignment?
echo.
set /p assignmentname=">> "
set /a currentquestion=1
set answers=Answer sheet:
cls

:numberofquestionsfunction
title %assignmentname% Answer Key Generator
echo How many questions are on the assignment?
echo.
set /p numberofquestions=">> "
set /a numberremaining=%numberofquestions%
cls
goto availableanswersfunction

:availableanswersfunction
echo What are the available answers?
echo.
echo 1 - A, B
echo 2 - A, B, C
echo 3 - A, B, C, D
echo 4 - A, B, C, D, E
echo.
set /p availableanswers=">> "
cls
if %availableanswers%==1 goto ab 
if %availableanswers%==2 goto abc 
if %availableanswers%==3 goto abcd 
if %availableanswers%==4 goto abcde
cls
echo That's not a valid number. Try again.
goto availableanswersfunction

:ab
set /a rand=%random% %%2
if %rand%==0 (set newanswer=A) else if %rand%==1 (set newanswer=B) else (set newanswer=ERROR)
set answers=%answers% %currentquestion%-%newanswer%
if %numberremaining% == 1 goto maketxt
set /a numberremaining-=1
set /a currentquestion+=1
goto ab

:abc
set /a rand=%random% %%3
if %rand%==0 (set newanswer=A) else if %rand%==1 (set newanswer=B) else if %rand%==2 (set newanswer=C) else (set newanswer=ERROR)
set answers=%answers% %currentquestion%-%newanswer%
if %numberremaining% == 1 goto maketxt
set /a numberremaining-=1
set /a currentquestion+=1
goto abc

:abcd
set /a rand=%random% %%4
if %rand%==0 (set newanswer=A) else if %rand%==1 (set newanswer=B) else if %rand%==2 (set newanswer=C) else if %rand%==3 (set newanswer=D) else (set newanswer=ERROR)
set answers=%answers% %currentquestion%-%newanswer%
if %numberremaining% == 1 goto maketxt
set /a numberremaining-=1
set /a currentquestion+=1
goto abcd

:abcde
set /a rand=%random% %%5
if %rand%==0 (set newanswer=A) else if %rand%==1 (set newanswer=B) else if %rand%==2 (set newanswer=C) else if %rand%==3 (set newanswer=D) else if %rand%==4 (set newanswer=E) else (set newanswer=ERROR)
set answers=%answers% %currentquestion%-%newanswer%
if %numberremaining% == 1 goto maketxt
set /a numberremaining-=1
set /a currentquestion+=1
goto abcde

:maketxt
set filename="%assignmentname% Answer Key.txt"
echo %answers% > %filename% %localhost%
echo The answer key %filename% has been created.
pause
