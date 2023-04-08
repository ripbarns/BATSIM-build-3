:top

	:start

	:save

		:save_save
			cls
			echo [3;2HSaving world...

			(
				echo !x!
				echo !y!
				echo !money!
				echo !flower!
				echo !wood!
				echo !stone!
				echo !marker_house!
				echo !ITM_TOL_WOD_HOE!
				echo !ITM_TOL_WOD_PIK!
				echo !ITM_TOL_WOD_AXE!
				echo !ITM_TOL_STN_HOE!
				echo !ITM_TOL_STN_PIK!
				echo !ITM_TOL_STN_AXE!
			) > save.txt

		:save_world
			if exist "world.txt" del "world.txt"

			for /l %%a in (0,1,26) do (
				echo !line_%%a!>>world.txt
			)

			exit /b