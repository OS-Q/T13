@if "%ECHOON%" == "" (@echo off) else (@echo %ECHOON%)&:: set ECHOON=on if you want to debug this script
@::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@::  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  ::
@::  Read the zproject/README.md for information about making permanent changes. ::
@::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Usage:     build.bat [Clean]
@setlocal

:: make sure our directory is correct for building
@pushd %~dp0%

:: supports passing in Clean as third argument if "make clean" behavior is desired
SET action=Building
SET target=%1
if NOT "%target%" == "" set target=/t:%target%&set action=Cleaning

SET solution=czmq.sln
SET version=15
SET log=build.log
SET tools=Microsoft Visual Studio %version%.0\VC\vcvarsall.bat
if "%version%" == "15" SET tools=Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat
SET environment="%programfiles(x86)%\%tools%"
IF NOT EXIST %environment% SET environment="%programfiles%\%tools%"
IF NOT EXIST %environment% GOTO no_tools

SET packages=
IF EXIST "..\..\..\..\libzmq\builds/msvc/vs2017\libzmq.import.props" (
    COPY /Y "..\..\..\..\libzmq\builds/msvc/vs2017\libzmq.import.props" . > %log%
    IF errorlevel 1 GOTO error
) ELSE (
    ECHO Did not find libzmq, aborting.
    ECHO Please clone from https://github.com/zeromq/libzmq.git, and then build.
    GOTO error
)
IF EXIST "..\..\..\..\uuid\builds/msvc/vs2017\uuid.import.props" (
    COPY /Y "..\..\..\..\uuid\builds/msvc/vs2017\uuid.import.props" . > %log%
    IF errorlevel 1 GOTO error
    SET packages=%packages% /p:HAVE_UUID=1
    ECHO Building with uuid
) ELSE (
    ECHO Building without uuid
)
IF EXIST "..\..\..\..\systemd\builds/msvc/vs2017\systemd.import.props" (
    COPY /Y "..\..\..\..\systemd\builds/msvc/vs2017\systemd.import.props" . > %log%
    IF errorlevel 1 GOTO error
    SET packages=%packages% /p:HAVE_SYSTEMD=1
    ECHO Building with systemd
) ELSE (
    ECHO Building without systemd
)
IF EXIST "..\..\..\..\lz4\builds/msvc/vs2017\lz4.import.props" (
    COPY /Y "..\..\..\..\lz4\builds/msvc/vs2017\lz4.import.props" . > %log%
    IF errorlevel 1 GOTO error
    SET packages=%packages% /p:HAVE_LZ4=1
    ECHO Building with lz4
) ELSE (
    ECHO Building without lz4
)
IF EXIST "..\..\..\..\libcurl\builds/msvc/vs2017\libcurl.import.props" (
    COPY /Y "..\..\..\..\libcurl\builds/msvc/vs2017\libcurl.import.props" . > %log%
    IF errorlevel 1 GOTO error
    SET packages=%packages% /p:HAVE_LIBCURL=1
    ECHO Building with libcurl
) ELSE (
    ECHO Building without libcurl
)

ECHO %action% CZMQ... (%packages%)

:: save original path
@set oldpath=%PATH%

:: set correct environment for build target
CALL %environment% x86 >> %log%
@if "%ECHOON%" == "" (@echo off) else (@echo %ECHOON%)&:: set ECHOON=on if you want to debug this script
ECHO Platform=x86

ECHO Configuration=DynDebug
msbuild /m /v:n /p:Configuration=DynDebug /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=DynRelease
msbuild /m /v:n /p:Configuration=DynRelease /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=LtcgDebug
msbuild /m /v:n /p:Configuration=LtcgDebug /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=LtcgRelease
msbuild /m /v:n /p:Configuration=LtcgRelease /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=StaticDebug
msbuild /m /v:n /p:Configuration=StaticDebug /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=StaticRelease
msbuild /m /v:n /p:Configuration=StaticRelease /p:Platform=Win32 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error

:: restore original path
@set PATH=%oldpath%

:: set correct environment for build target
CALL %environment% x86_amd64 >> %log%
@if "%ECHOON%" == "" (@echo off) else (@echo %ECHOON%)&:: set ECHOON=on if you want to debug this script
ECHO Platform=x64

ECHO Configuration=DynDebug
msbuild /m /v:n /p:Configuration=DynDebug /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=DynRelease
msbuild /m /v:n /p:Configuration=DynRelease /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=LtcgDebug
msbuild /m /v:n /p:Configuration=LtcgDebug /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=LtcgRelease
msbuild /m /v:n /p:Configuration=LtcgRelease /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=StaticDebug
msbuild /m /v:n /p:Configuration=StaticDebug /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error
ECHO Configuration=StaticRelease
msbuild /m /v:n /p:Configuration=StaticRelease /p:Platform=x64 %packages% %solution% %target% >> %log%
IF errorlevel 1 GOTO error

ECHO %action% complete: %packages% %solution%
GOTO end

:error
ECHO *** ERROR, build terminated early: see %log%
GOTO end

:no_tools
ECHO *** ERROR, build tools not found: %tools%

:end
:: restore original path
if NOT "%oldpath%" == "" @set PATH=%oldpath%
popd
@endlocal
