:top

	:start

	:load

		:load_check
			if not exist "save.txt" goto :load_fail
			if not exist "world.txt" goto :load_fail

			goto :load_save

		:load_fail
			cls
			echo [3;2HThere was an error loading your world.
			echo [5;2HPlease start a new world.
			echo [7;2HPress any key to continue.

			pause > nul
				if exist "save.txt" del "save.txt"
				if exist "world.txt" del "world.txt"
				cd ..
				start BATSIM.bat
				exit

		:load_save
			cls
			echo [3;2HLoading world...

			< "save.txt" (
				set /p x=
				set /p y=
				set /p money=
				set /p flower=
				set /p wood=
				set /p stone=
				set /p marker_house=
				set /p ITM_TOL_WOD_HOE=
				set /p ITM_TOL_WOD_PIK=
				set /p ITM_TOL_WOD_AXE=
				set /p ITM_TOL_STN_HOE=
				set /p ITM_TOL_STN_PIK=
				set /p ITM_TOL_STN_AXE=
			)

		:load_world
			set temp=0
			for /f "tokens=*" %%a in (world.txt) do (
				set line_!temp!=%%a
				set /a temp=!temp! + 1
			)

			exit /b