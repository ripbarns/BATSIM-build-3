:top

	:start

	:itemshop
		cls
		echo [3;2HHello, welcome to the item shop.
		echo [5;2HWould you like to buy or sell?
		echo [7;2HMoney: [!money!]
		echo [9;2H1. Buy
		echo [10;2H2. Sell
		echo [12;2H4. Back

		choice /c 412 /n
			if !errorlevel! equ 2 goto :itemshop_buy
			if !errorlevel! equ 3 goto :itemshop_sell
			if !errorlevel! equ 1 (
				cls
				exit /b
			)

			:itemshop_buy
				cls
				echo [3;2HSure thing, buddy.
				echo [5;2HWhatcha wanna buy today?
				echo [7;2HMoney: [!money!]
				echo [9;2H1. Flower [1]
				echo [10;2H2. Wood [2]
				echo [11;2H3. Stone [3]
				echo [13;2H5. Back

				choice /c 1235 /n
					if !errorlevel! equ 1 goto :itemshop_buy_flower
					if !errorlevel! equ 2 goto :itemshop_buy_wood
					if !errorlevel! equ 3 goto :itemshop_buy_stone
					if !errorlevel! equ 4 goto :itemshop

				:itemshop_buy_fail
					cls
					echo [3;2HOof. Looks like you're a bit short with your money there.
					echo [5;2HI won't be able to sell this to you right now.
					echo [7;2HPress any key to continue.

					pause > nul
						goto :itemshop_buy

				:itemshop_buy_flower
					if !money! lss 1 goto :itemshop_buy_fail

					set /a money=!money! - 1
					set /a flower=!flower! + 1

					goto :itemshop_buy

				:itemshop_buy_wood
					if !money! lss 2 goto :itemshop_buy_fail

					set /a money=!money! - 2
					set /a wood=!wood! + 1

					goto :itemshop_buy

				:itemshop_buy_stone
					if !money! lss 3 goto :itemshop_buy_fail

					set /a money=!money! - 3
					set /a stone=!stone! + 1

					goto :itemshop_buy

			:itemshop_sell
				cls
				echo [3;2HSure thing, buddy.
				echo [5;2HWhatcha wanna sell today?
				echo [7;2HMoney: [!money!]
				echo [9;2H1. Flower [1]
				echo [10;2H2. Wood [2]
				echo [11;2H3. Stone [3]
				echo [13;2H5. Back

				choice /c 1235 /n
					if !errorlevel! equ 1 goto :itemshop_sell_flower
					if !errorlevel! equ 2 goto :itemshop_sell_wood
					if !errorlevel! equ 3 goto :itemshop_sell_stone
					if !errorlevel! equ 4 goto :itemshop

				:itemshop_sell_fail
					cls
					echo [3;2HOof. Looks like you're a bit short with your items there.
					echo [5;2HI won't be able to buy that from you right now.
					echo [7;2HPress any key to continue.

					pause > nul
						goto :itemshop_sell

				:itemshop_sell_flower
					if !flower! lss 1 goto :itemshop_sell_fail

					set /a money=!money! + 1
					set /a flower=!flower! - 1

					goto :itemshop_sell

				:itemshop_sell_wood
					if !wood! lss 1 goto :itemshop_sell_fail

					set /a money=!money! + 2
					set /a wood=!wood! - 1

					goto :itemshop_sell

				:itemshop_sell_stone
					if !stone! lss 1 goto :itemshop_sell_fail

					set /a money=!money! + 3
					set /a stone=!stone! - 1

					goto :itemshop_sell