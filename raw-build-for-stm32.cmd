@echo off

@REM set PREFIX=D:\Softwares
set PREFIX=%USERPROFILE%\Downloads

if exist build (
    rmdir /s /q build
)

mkdir build
mkdir build\uartlib

cd .\third-parties\uartlib &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe -DSTM32 -I.\include -c .\src\uart_stm32.c -o %~dp0build\uartlib\uart_stm32.o &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\ar.exe rcs %~dp0build\uartlib\uart_stm32.a %~dp0build\uartlib\uart_stm32.o &&^
cd %~dp0 &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe -DSTM32 -I%~dp0third-parties\uartlib\include -c main.c -o main.o &&^
%PREFIX%\winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r1\mingw64\bin\gcc.exe main.o -L%~dp0build\uartlib -l:uart_stm32.a -o helloworld.exe -static &&^
pause