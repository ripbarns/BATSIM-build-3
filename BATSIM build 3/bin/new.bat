:top

	:start

	:new

		:new_check
			if exist "save.txt" goto :new_overwrite
			if exist "world.txt" goto :new_overwrite

			goto :new_save

		:new_overwrite
			cls
			echo [3;2HThere is existing save data.
			echo [5;2HBy starting a new world you will overwrite all existing data.
			echo [7;2HWould you like to start a new world?
			echo [9;2H1. Yes
			echo [10;2H2. No

			choice /c 12 /n
				if !errorlevel! equ 1 (
					if exist "save.txt" del "save.txt"
					if exist "world.txt" del "world.txt"
					goto :new_save
				)
				if !errorlevel! equ 2 (
					cd..
					start BATSIM.bat
					exit
				)

		:new_save
			cls
			echo [3;2HCreating world...

			set x=38
			set y=13

			set money=0

			set flower=0
			set wood=0
			set stone=0

			set marker_house=0

			set ITM_TOL_WOD_HOE=0
			set ITM_TOL_WOD_PIK=0
			set ITM_TOL_WOD_AXE=0

			set ITM_TOL_STN_HOE=0
			set ITM_TOL_STN_PIK=0
			set ITM_TOL_STN_AXE=0

		:new_world
			call generator.bat

			exit /b