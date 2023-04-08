:top

	:start

	:world_nature
		for /l %%a in (1,1,25) do (
			for /l %%b in (1,1,75) do (
				set /a block=!random! %% 100

				rem 0-91
				if !block! lss 92 set block= 
				rem 92-96
				if !block! gtr 91 if !block! lss 97 set block=~
				if !block! equ 97 set block=*
				if !block! equ 98 set block=
				if !block! equ 99 set block=

				set line_%%a=!line_%%a!!block!
			)
		)

	:world_structure

		:world_structure_townhall
			set /a structure_0_x=!random! %% 75
			set /a structure_0_y=!random! %% 23 + 1
			set /a structure_0_z=!structure_0_x! + 1
			set line_%structure_0_y%=!line_%structure_0_y%:~0,%structure_0_x%!T!line_%structure_0_y%:~%structure_0_z%!

		:world_structure_itemshop
			set /a structure_1_x=!random! %% 75
			set /a structure_1_y=!random! %% 23 + 1
			if !structure_1_y! equ !structure_0_y! goto :world_structure_itemshop
			set /a structure_1_z=!structure_1_x! + 1
			set line_%structure_1_y%=!line_%structure_1_y%:~0,%structure_1_x%!I!line_%structure_1_y%:~%structure_1_z%!

	:world_border
		for /l %%a in (1,1,25) do (
			set line_%%a=0!line_%%a!0
		)

		for /l %%a in (0,1,76) do (
			set line_0=!line_0!0
			set line_26=!line_26!0
		)

		exit /b