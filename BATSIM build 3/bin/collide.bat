:top

	:start
		set /a v=!x! + 1

		for /l %%a in (0,1,11) do (
			if "!line_%y%:~%x%,1!" equ "!block_%%a:~0,1!" goto :block_!block_%%a:~2!
		)

		exit /b

	:block

		:block_clear
			if !errorlevel! equ 1 set line_!y!=!line_%y%:~0,%x%!!space:~5,1!!line_%y%:~%z%!
			if !errorlevel! equ 2 set line_!y!=!line_%y%:~0,%x%!!space:~5,1!!line_%y%:~%v%!
			if !errorlevel! equ 3 set line_!y!=!line_%y%:~0,%x%!!space:~5,1!!line_%y%:~%z%!
			if !errorlevel! equ 4 set line_!y!=!line_%y%:~0,%x%!!space:~5,1!!line_%y%:~%v%!

			exit /b

		:block_back
			if !errorlevel! equ 1 set /a y=!y! + 1
			if !errorlevel! equ 2 set /a x=!x! + 1
			if !errorlevel! equ 3 set /a y=!y! - 1
			if !errorlevel! equ 4 set /a x=!x! - 1

			exit /b

		:block_barrier
			goto :block_back

		:block_townhall
			call townhall.bat

			goto :block_back

		:block_itemshop
			call itemshop.bat

			goto :block_back

		:block_house
			call house.bat

			goto :block_back

		:block_money
			set /a money=!money! + 1

			goto :block_clear

		:block_water
			goto :block_back

		:block_soil
			goto :block_back

		:block_sprout
			goto :block_back

		:block_plant
			goto :block_back

		:block_flower
			set /a flower=!flower! + 1

			goto :block_clear

		:block_tree
			set /a wood=!wood! + 1

			goto :block_clear

		:block_rock
			set /a stone=!stone! + 1

			goto :block_clear