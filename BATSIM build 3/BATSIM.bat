:top

	:start
		echo off
		setlocal enabledelayedexpansion

		set build=3
		set space=space space

		cd "%~dp0"\bin
		title BATSIM build !build!
		color 0f
		mode 109,31

		goto :menu

	:debug
		cls
		echo [3;2HBATSIM build !build! - Debug

		set /p debug=Debug: 
			!debug!

		goto :debug

	:menu
		cls
		echo [3;2HBATSIM build !build!
		echo [5;2H1. Continue
		echo [6;2H2. New
		echo [7;2H3. Information
		echo [9;2H5. Exit

		choice /c 123468 /n
			if !errorlevel! equ 1 (
				set nls=load
				goto :game
			)
			if !errorlevel! equ 2 (
				set nls=new
				goto :game
			)
			if !errorlevel! equ 3 goto :info
			if !errorlevel! equ 4 exit

	:info
		cls
		echo [3;2HBATSIM build !build! - Information
		echo [5;2HCreated by @ripbarns on all major social media platforms.
		echo [7;2HPress any key to continue.

		pause > nul
			goto :menu

	:game
		call !nls!.bat
		call engine.bat