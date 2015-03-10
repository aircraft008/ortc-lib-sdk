@echo off
echo.
echo Preparing ortc-lib-sdk...
echo.

set failure=0

if NOT EXIST libs\webrtc\prepare-links.bat call:failure -1 "Did not find WebRTC preparation script!"
if "%failure%" neq "0" goto:eof

pushd libs\webrtc
call prepare-links.bat
if %errorlevel% neq 0 call:failure %errorlevel% "WebRTC preparation failed."
popd
if "%failure%" neq "0" goto:eof


goto:done


:failure
echo.
echo ERROR: %~2
echo.
echo FAILURE: Could not prepare ortc-lib-sdk.

set failure=%~1

goto:eof

:done
echo.
echo Success: completed preparation of ortc-lib SDK.
echo.
