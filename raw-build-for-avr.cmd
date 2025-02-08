@echo off

@REM set PREFIX=D:\Softwares
set PREFIX=%USERPROFILE%\Downloads

if exist build (
    rmdir /s /q build
)

mkdir build
mkdir build\uartlib

cd .\third-parties\uartlib &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe -D__AVR_ATmega328P__ -I.\include -c .\src\uart_avr.c -o %~dp0build\uartlib\uart_avr.o &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\ar.exe rcs %~dp0build\uartlib\uart_avr.a %~dp0build\uartlib\uart_avr.o &&^
cd %~dp0 &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe -D__AVR_ATmega328P__ -I%~dp0third-parties\uartlib\include -c main.c -o main.o  &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe main.o -L%~dp0build\uartlib -l:uart_avr.a -o helloworld.exe -static &&^
pause

