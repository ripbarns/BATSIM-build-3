:top

	:start

	:townhall
		cls
		echo [3;2HWelcome to the local town hall.
		echo [5;2HWhat do you need today?
		echo [7;2H1. Build a house
		echo [8;2H2. Find a neighbor
		echo [10;2H4. Back

		choice /c 124 /n
			if !errorlevel! equ 1 goto :townhall_build
			if !errorlevel! equ 2 goto :townhall_neighbor
			if !errorlevel! equ 3 exit /b

		:townhall_build
			if !wood! lss 100 if !stone! lss 50 goto :townhall_build_fail
			cls
			echo [3;2HIt looks like you have the right amount of material.
			echo [5;2HHere's a house marker, go ahead and place it down and the house will be built soon.
			echo [7;2HPress any key to continue.

			pause > nul
				set /a stone=!stone! - 50
				set /a wood=!wood! - 100
				set /a marker_house=!marker_house! + 1
				goto :townhall

			:townhall_build_fail
				cls
				echo [3;2HIt looks like you don't have the right amount of material.
				echo [5;2HYou'll need 100 wood and 50 stone to build a house.
				echo [7;2HPress any key to continue.

				pause > nul
					goto :townhall

		:townhall_neighbor
			if !neighbor_count! gtr 4 goto :townhall_neighbor_fail
			if !house_count! equ !neighbor_count! goto :townhall_neighbor_fail
			cls
			echo [3;2HThis feature has not been added yet.
			echo [5;2HPress any key to continue.

			pause > nul
				goto :townhall

			:townhall_neighbor_fail
				cls
				echo [3;2HIt looks like a neighbor won't be able to move in yet.
				echo [5;2HPress any key to continue.

				pause > nul
					goto :townhall