:top

	:start
		set temp=0
		for /f "tokens=*" %%a in (blocks.txt) do (
			set block_!temp!=%%a
			set /a temp=!temp! + 1
		)

		set temp=0
		for /f "tokens=*" %%a in (items.txt) do (
			set item_!temp!=%%a
			set /a temp=!temp! + 1
		)

		for /l %%a in (0,1,106) do (
			set screen_border=!screen_border!#
		)

		goto :loop

	:loop
		cls

		:refresh
			set /a z=!x! + 1

			for /l %%a in (0,1,26) do (
				set line_disp_%%a=!line_%%a!
			)

			set line_disp_!y!=!line_%y%:~0,%x%!!line_%y%:~%z%!

		:screen
			echo [3;2H!screen_border!

			set temp=4
			for /l %%a in (1,1,25) do (
				echo [!temp!;2H# !line_disp_%%a:~1,75! #                           #
				set /a temp=!temp! + 1
			)

			echo [29;2H!screen_border!

			echo [4;82HMoney [!money!]
			echo [25;82H[I] Inventory
			echo [26;82H[M] Save
			echo [27;81H###########################
			echo [28;82H(!x!,!y!) [!line_%y%:~%x%,1!]

			choice /c wasdimx /t 1 /d x /n
				if !errorlevel! leq 4 goto :move
				if !errorlevel! equ 5 call inventory.bat
				if !errorlevel! equ 6 call save.bat
				if !errorlevel! equ 7 goto :refresh

			goto :loop

		:move
			if !errorlevel! equ 1 set /a y=!y! - 1
			if !errorlevel! equ 2 set /a x=!x! - 1
			if !errorlevel! equ 3 set /a y=!y! + 1
			if !errorlevel! equ 4 set /a x=!x! + 1

			if "!line_%y%:~%x%,1!" neq " " call collide.bat

			goto :refresh