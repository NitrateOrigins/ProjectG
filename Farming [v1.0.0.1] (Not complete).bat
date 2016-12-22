@echo off
title FARMING SIMULATION [1.0.0 b1]
color c
::  1   .   0   .    0    .   0    || versions
::major | minor | bug fix | build  || versions

:startup
cls
echo WELCOME TO FARMING SIMULATION [v1.0.0 b1]!
echo.
echo.
echo WHAT IS YOUR PREFERRED USER NAME?
echo OR USER NAME IF YOU ALREADY HAVE ONE.
set /p player_name=USER NAME: 
echo.
echo.
if exist %player_name%.sav (
for /f %%a in (%player_name%.sav) do set %%a
goto startc
) else (
( echo ) >> %player_name%.sav
set /a money=1200
set /a lvl=1
set /a xp=0
set /a tim=0
set /a land=1
set /a wac=0
set /a whp=0
set /a rip=0
set /a wbale=0
set /a rbale=0
set /a ropes=0
set /a rice=0
set /a wheat=0
set /a plants=0
set /a pig=0
set /a horse=0
set /a cow=0
set /a chicken=0
goto done
)
goto save
::####

:startc
cls
echo WELCOME BACK, %player_name%!
echo.
echo.
echo YOUR CURRENT STATUS:
echo MONEY: $%money%
echo LEVEL: %lvl%
echo EXP: %xp%
echo.
echo.
echo I HOPE YOU ARE ENJOYING THE GAME!
echo PRESS 'ENTER' TO START PLAYING.
pause >nul
goto menu

:done
cls
echo YOU ARE NOW A PLAYER!
echo.
echo.
echo I HOPE YOU WILL ENJOY THE GAME!
echo PRESS 'ENTER' TO START PLAYING.
pause >nul
goto menu

:menu
cls

(del %player_name%.sav)
(echo --Current Load For "%player_name%"--)>>%player_name%.sav
(echo User Name=%player_name%)>> %player_name%.sav
(echo wheat=%wheat%)>> %player_name%.sav
(echo rice=%rice%)>> %player_name%.sav
(echo money=%money%)>> %player_name%.sav
(echo lvl=%lvl%)>> %player_name%.sav
(echo ropes=%ropes%)>> %player_name%.sav
(echo land=%land%)>> %player_name%.sav
(echo xp=%xp%)>> %player_name%.sav
(echo tim=%tim%)>> %player_name%.sav
(echo wac=%wac%)>> %player_name%.sav
(echo wbale=%wbale%)>> %player_name%.sav
(echo rbale=%rbale%)>> %player_name%.sav
(echo whp=%whp%)>> %player_name%.sav
(echo rip=%rip%)>> %player_name%.sav
(echo chicken=%chicken%)>> %player_name%.sav
(echo cow=%cow%)>> %player_name%.sav
(echo horse=%horse%)>> %player_name%.sav
(echo pig=%pig%)>> %player_name%.sav
(echo ppen=%ppen%)>> %player_name%.sav
(echo cpen=%cpen%)>> %player_name%.sav
(echo hpen=%hpen%)>> %player_name%.sav
(echo chpen=%chpen%)>> %player_name%.sav

cls

if %xp%==100 (
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo YOU LEVELED UP!
set /a xp=0
set /a lvl=%lvl%+1
echo.
echo.
echo YOU ARE NOW LEVEL %lvl%!
pause >nul
goto menu
)

cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo ENTER A NUMBER:
echo 1) SAVE AND QUIT!
echo 2) INVENTORY!
echo 3) SELL!
echo 4) MARKET!
echo 5) YOUR FARM!
echo.
echo.
set /p menu=CHOICE: 
echo.
echo.
if %menu%==1 goto save
if %menu%==2 goto inv
if %menu%==3 goto sell
if %menu%==4 goto store
if %menu%==5 goto farm
echo.
echo.
echo YOU MUST ENTER 1, 2, 3, 4 OR 5!
pause >nul
goto menu


:store
cls

if %xp%==100 goto menu
if %money% LSS 0 (
set /a money=0
goto fail
)
if %money% LSS 5 goto fail
set /a ppen=%ppen%+0
set /a cpen=%cpen%+0
set /a hpen=%hpen%+0
set /a chpen=%chpen%+0

cls
set /a ropes=%ropes%+0
set /a land=%land%+0
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo ==================== WHAT TO BUY ====================:=== YOUR STASH ===
echo BUY WHEAT SEEDS: $5 FOR 5 SEEDS [TYPE 'wheat']       ; WHEAT SEEDS: %wheat%
echo BUY RICE SEEDS: $10 FOR 5 SEEDS [TYPE 'rice']        ; RICE SEEDS: %rice%
echo BUY MORE LAND: $100 FOR 1 ACRE SQUARED [TYPE 'land'] ; LAND OWNED: %land%
echo BUY BALE ROPE: $10 FOR 5 ROPES [TYPE 'ropes']        ; ROPES OWNED: %ropes%
echo BUY WATERING CAN: $50 FOR 1 CAN [TYPE 'can']         ; WATERING CANS: %wac%
echo BUY PIG: $20 FOR 1 PIG [TYPE 'pig']                  ; PIGS OWNED: %pig%
echo BUY COW: $50 FOR 1 COW [TYPE 'cow']                  ; COWS OWNED: %cow%
echo BUY HORSE: $1000 FOR 1 HORSE [TYPE 'horse']          ; HORSES OWNED: %horse%
echo BUY CHICKEN: $10 FOR 2 CHICKENS [TYPE 'chicken']     ; CHICKENS: %chicken%
echo.
echo TYPE 'back' TO GO BACK TO THE MENU.
echo.
set /p store=I WANT TO BUY: 
if %store%==back (
echo.
echo PRESS 'ENTER' TO GO TO THE MENU.
pause >nul
goto menu
)
if %store%==pig goto bpig

if %store%==cow goto bcow

if %store%==horse goto bhorse

if %store%==chicken goto bchicken

if %store%==wheat goto bwheat

if %store%==rice goto brice

if %store%==land goto bland

if %store%==can goto bwac

if %store%==ropes goto bropes

echo.
echo INVALID ENTERY!
echo.
echo.
echo PRESS 'ENTER'.
pause >nul
goto store
pause >nul
goto menu

:bpig
if %money% GTR 20 (
if %ppen% LSS 20 (
set /a pig=%pig%+1
set /a ppen=%ppen%+1
set /a money=%money%-20
set /a xp=%xp%+20
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
) else (
echo.
echo HEY! YOUR PIG PEN IS FULL!
pause >nul
goto store
)
)
goto fail

:bcow
if %money% GTR 49 (
if %cpen% LSS 20 (
set /a cow=%cow%+1
set /a cpen=%cpen%+1
set /a money=%money%-50
set /a xp=%xp%+50
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
) else (
echo.
echo HEY! YOUR COW PEN IS FULL!
pause >nul
goto store
)
)
goto fail


:bhorse
if %money% GTR 999 (
if %hpen% LSS 10 (
set /a horse=%horse%+1
set /a hpen=%hpen%+1
set /a money=%money%-1000
set /a lvl=%lvl%+2
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
) else (
echo.
echo HEY! YOUR HORSE PEN IS FULL!
pause >nul
goto store
)
)
goto fail

:bchicken
if %money% GTR 9 (
if %chpen% LSS 50 (
set /a chicken=%chicken%+2
set /a chpen=%chpen%+1
set /a money=%money%-10
set /a xp=%xp%+10
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
) else (
echo.
echo HEY! YOUR CHICKEN PEN IS FULL!
pause >nul
goto store
)
)
goto fail

:bwheat
if %money% GTR 4 (
set /a wheat=%wheat%+5
set /a money=%money%-5
set /a xp=%xp%+3
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
)
goto fail

:brice
if %money% GTR 9 (
set /a rice=%rice%+5
set /a money=%money%-10
set /a xp=%xp%+5
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
)
goto fail

:bland
if %money% GTR 99 (
if %lvl%= LSS 4 (
if %land%==4 (
echo.
echo REACH LEVEL 4 TO GET UP TO 16 PLOTS!
pause >nul
goto store
)
)
if %lvl% LSS 10 (
if %land%==16 (
echo.
echo YOU HAVE REACHED YOUR MAXIMUM FARMLAND LIMIT FOR YOUR LEVEL!
echo.
echo REACH LEVEL 10 TO HAVE UP TO 36 PLOTS!
pause >nul
goto store
)
)
if %lvl% LSS 50 (
if %land%==36 (
echo.
echo YOU HAVE REACHED YOUR MAXIMUM FARMLAND LIMIT FOR YOUR LEVEL!
echo.
echo REACH LEVEL 100 TO HAVE UP TO 100 PLOTS!
pause >nul
goto store
)
)
if %lvl% LSS 100 (
if %land%==100 (
echo.
echo YOU HAVE REACHED THE MAXIMUM LIMIT FOR PLOTS!
pause >nul
goto store
)
) 
set /a land=%land%+1
set /a money=%money%-100
set /a xp=%xp%+70
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
)
goto fail

:bwac
if %money% GTR 49 (
set /a wac=%wac%+1
set /a money=%money%-50
set /a xp=%xp%+30
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
)
goto fail

:bropes
if %money% GTR 9 (
set /a ropes=%ropes%+5
set /a money=%money%-10
set /a xp=%xp%+1
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo SUCESSFULLY BOUGHT!
pause >nul
goto store
)
goto fail

:fail
cls
if %xp%==100 goto menu
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo PUT THAT DOWN!
echo YOU DON'T HAVE ENOUGH MONEY TO BUY THAT!
pause >nul
goto menu

:inv
cls
if %xp%==100 goto menu
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo ======================= YOUR INVENTORY =======================
echo WHEAT SEEDS: %wheat%          ; CHICKENS: %chicken%
echo RICE SEEDS: %rice%            ; HORSES: %horse%
echo WHEAT BALES: %wbale%          ; PIGS: %pig%
echo RICE BALES: %rbale%           ; COWS: %cow%
echo ROPES OWNED: %ropes%          ; LAND OWNED: %land% (IN ACRES)
echo WATERING CANS: %wac%          ;
echo.
echo PRESS 'ENTER' TO RETURN TO THE MENU.
pause >nul
goto menu

:sell
if %xp%==100 goto menu
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo =========== WHAT TO SELL ===========:========= INVENTORY ===========
echo 1) SELL ROPE (QTY 1)                ; ROPES OWNED: %ropes%
echo 2) SELL WHEAT BALE (QTY 1)          ; WHEAT BALES: %wbale%
echo 3) SELL RICE BALE (QTY 1)           ; RICE BALES: %rbale%
echo 4) SELL WHEAT SEED (QTY 1)          ; WHEAT SEEDS: %wheat%
echo 5) SELL RICE SEED (QTY 1)           ; RICE SEEDS: %rice%
echo 6) SELL LAND (QTY 1 ACRE SQUARED)   ; LAND OWNED: %land% (IN ACRES)
echo 7) SELL PIG (QTY 1)                 ; PIGS OWNED: %pig%
echo 8) SELL COW (QTY 1)                 ; COWS OWNED: %cow%
echo 9) SELL HORSE (QTY 1)               ; HORSES OWNED: %horse%
echo 10) SELL CHICKEN (QYT 2)            ; CHICKENS: %chicken%
echo.
echo TYPE 'exit' TO RETURN TO MENU.
echo.
set /p sell=I WANT TO SELL: 
if %sell%==1 goto srope
if %sell%==2 goto swbale
if %sell%==3 goto srbale
if %sell%==4 goto swheat
if %sell%==5 goto srice
if %sell%==6 goto sland
if %sell%==7 goto spig
if %sell%==8 goto scow
if %sell%==9 goto shorse
if %sell%==10 goto schicken
if %sell%==exit goto menu
echo.
echo ERROR! TRY AGAIN!
pause >nul
goto sell

:swheat
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %wheat%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo WHEAT SEED SOLD SUCESSFULLY!
set /a wheat=%wheat%-1
set /a xp=%xp%+2
set /a money=%money%+2
pause >nul
goto sell
)
pause >nul
goto sell

:srice
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %rice%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo RICE SEED SOLD SUCESSFULLY!
set /a rice=%rice%-1
set /a xp=%xp%+2
set /a money=%money%+2
pause >nul
goto sell
)
pause >nul
goto sell

:swbale
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %wbale%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo WHEAT BALE SOLD SUCESSFULLY!
set /a wbale=%wbale%-1
set /a xp=%xp%+2
set /a money=%money%+6
pause >nul
goto sell
)
pause >nul
goto sell

:srbale
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %rbale%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo RICE BALE SOLD SUCESSFULLY!
set /a rbale=%rbale%-1
set /a xp=%xp%+2
set /a money=%money%+12
pause >nul
goto sell
)
pause >nul
goto sell

:sland
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %land%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo 1 ACRE OF LAND SOLD SUCESSFULLY!
set /a land=%land%-1
set /a xp=%xp%+2
set /a money=%money%+10
pause >nul
goto sell
)
pause >nul
goto sell

:srope
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %ropes%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo ROPE SOLD SUCESSFULLY!
set /a ropes=%ropes%-1
set /a xp=%xp%+2
set /a money=%money%+5
pause >nul
goto sell
)
pause >nul
goto sell

:scow
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %cow%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo COW SOLD SUCESSFULLY!
set /a cow=%cow%-1
set /a co=0
set /a lvl=%lvl%+1
set /a money=%money%+%cnet%
pause >nul
goto sell
)
pause >nul
goto sell

:spig
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %pig%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo PIG SOLD SUCESSFULLY!
set /a pig=%pig%-1
set /a pi=0
set /a xp=%xp%+50
if %xp% GTR 100 (
set /a xp=%xp%-100
set /a lvl=%lvl%+1
)
set /a money=%money%+%pnet%
pause >nul
goto sell
)
pause >nul
goto sell

:shorse
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %horse%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo HORSE SOLD SUCESSFULLY!
set /a horse=%horse%-1
set /a ho=0
set /a lvl=%lvl%+2
set /a money=%money%+%hnet%
pause >nul
goto sell
)
pause >nul
goto sell

:schicken
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
if %chicken%==0 (
echo YOU DON'T HAVE THAT! COME BACK LATER!
pause >nul
goto sell
) else (
echo CHICKEN SOLD SUCESSFULLY!
set /a chicken=%chicken%-1
set /a ch=0
set /a xp=%xp%+2
set /a money=%money%+%chnet%
pause >nul
goto sell
)
pause >nul
goto sell

:farm
if %xp%==100 goto menu
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo WHAT DO YOU WANT TO DO?
echo 1) PLANT CROPS!
echo 2) HARVEST CROPS!
echo 3) WATER CROPS!
echo 4) CHECK OUT THE MAP OF YOUR FARM!
echo 5) GOTO THE STABLE!
echo 6) MENU!
echo.
echo.
set /p farm=CHOICE: 
if %farm%==1 goto pc
if %farm%==2 goto hc
if %farm%==3 goto wc
if %farm%==4 goto map
if %farm%==5 goto stable
if %farm%==6 goto menu
echo.
echo ERROR! TRY AGAIN!
pause >nul
goto farm

:pc
cls
if %xp%==100 goto menu
cls
set /a rip=%rip%+0
echo.
set /a whp=%whp%+0
echo.
set /a plants=%whp%+%rip%
echo.
set /a space=%land%
echo.
set /a crops=%space%-%plants%
echo.
cls
if %crops%==0 (
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo NOT ENOUGH LAND! COME BACK ONCE HARVESTED!
pause >nul
goto farm
)
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo FARM LAND LEFT: %crops%
echo.
echo --USABLE ITEMS IN INVENTORY--
echo WHEAT SEEDS: %wheat%
echo RICE SEEDS: %rice%
echo WATERING CANS: %wac%
echo.
echo PICK ONE TO DO.
echo.
echo PLANT (1) WHEAT SEED [TYPE 'wheat']
echo PLANT (1) RICE SEED [TYPE 'rice']
echo.
echo EXIT TO FARM PAGE [TYPE 'exit']
ECHO.
echo.
set /p p=I WANT TO: 
if %p%==wheat (
if %wheat%==0 (
echo.
echo NOT ENOUGH SEEDS!
pause >nul
goto pc
)
set /a whp=%whp%+1
set /a xp=%xp%+2
set /a wheat=%wheat%-1
echo.
echo WHEAT PLANTED!
echo.
echo.
echo PRESS 'ENTER' TO CONTINUE.
pause >nul
goto pc
)
if %p%==rice (
if %rice%==0 (
echo.
echo NOT ENOUGH RICE!
pause >nul
goto pc
)
set /a rip=%rip%+1
set /a xp=%xp%+2
set /a rice=%rice%-1
echo.
echo RICE PLANTED!
echo.
echo.
echo PRESS 'ENTER' TO CONTINUE.
pause >nul
goto pc
)
if %p%==exit (
goto farm
)
if not defined %p% (
echo ERROR! TRY AGAIN!
pause >nul
goto pc
) else (
echo INVALID ENTERY! TRY AGAIN!
pause >nul
goto pc
)
echo.
echo ERROR! TRY AGAIN!
pause >nul
goto farm

:hc
if %xp%==100 goto menu
cls
set /a tim=%tim%+0
echo.
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo WATERINGS DONE: %tim% OUT OF 3 WATERINGS COMPLETE!
echo.
echo --PLANTS PLANTED--
echo WHEAT PLANTED: %whp%
echo RICE PLANTED: %rip%
echo.
echo ROPES LEFT: %ropes%
echo.
echo TYPE 'harvest' TO HARVEST CROPS.
echo TYPE 'exit' TO GO TO FARM PAGE.
echo.
set /p hc=I want to: 
if %hc%==harvest (
if %tim%==3 (
set /a wbale=%whp%
set /a whp=0
set /a rbale=%rip%
set /a rip=0
set /a tim=0
set /a ropes=%ropes%-%whp%
set /a ropes=%ropes%-%rip%
echo.
echo HARVEST COMPLETE!
pause >nul
goto farm
)
echo HARVEST NOT READY!
pause >nul
goto farm
echo.
)
if %hc%==exit goto farm
echo.
echo.
echo ERROR! TRY AGAIN!
pause >nul
goto hc

:wc
if %xp%==100 goto 
set /a wac=%wac%+0 
if %tim%==3 (
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo YOUR HARVEST IS READY!
echo.
echo PRESS 'ENTER' TO GO HARVEST!
pause >nul
goto hc
)
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo WATERINGS DONE: %tim% OUT OF 3 WATERINGS COMPLETE!
echo.
echo --WATERING OVERVIEW--
echo WATERING CANS: %wac%
echo WATERINGS DONE: %tim%
echo.
echo.
echo TYPE 'water' TO WATER CROPS.
echo TYPE 'exit' TO GO TO FARM PAGE.
echo.
set /p wc=I want to: 
if %wc%==water (
echo.
if %wac%==0 (
echo YOU DON'T HAVE ANY WATERING CANS!!!
pause >nul
goto farm
) else (
set /a tim=%tim%+1
set /a wac=%wac%-1
echo.
echo YOU JUST WATERED ALL YOUR CROPS!
pause >nul
goto wc
)
)
if %wc%==exit goto farm
echo.
echo.
echo ERROR! TRY AGAIN!
pause >nul
goto farm

:map
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo HMM...YOU DON'T HAVE A MAP YET, EH...?
pause >nul
goto farm

:stable
if %xp%==100 goto menu
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo TO WHICH PEN DO YOU WISH TO VISIT?
echo 1) PIG
echo 2) HORSE
echo 3) COW
echo 4) CHICKEN
echo 5) EXIT
echo.
set /p pen=CHOICE: 
if %pen%==1 goto pig
if %pen%==2 goto horse
if %pen%==3 goto cow
if %pen%==4 goto chick
if %pen%==5 goto farm
if %pen%==6 (
echo.
echo INVALID INPUT!
echo PLEASE TRY AGAIN!
pause >nul
goto stable
) else (
echo.
echo INVALID IMPUT!
echo PLEASE TRY AGAIN!
pause >nul
goto stable
)
goto save

:pig
set /a pig=%pig%+0
set /a pi=%pi%+0
if %pi% LSS 20 (
set /a pi=%pi%+5
)
set /a pnet=%pi%*%pig%
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo =====================
echo PIGS: %pig%
echo CURRENT VALUE: $%pnet% (FOR TOTAL OF PIGS)
echo.
echo PRESS ENTER TO RETURN TO STABLE.
pause >nul
goto stable

:horse
set /a horse=%horse%+0
set /a ho=%ho%+0
if %ho% LSS 100 (
set /a ho=%ho%+20
)
set /a hnet=%ho%*%horse%
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo =====================
echo HORSES: %horse%
echo CURRENT VALUE: $%hnet% (FOR TOTAL OF HORSES)
echo.
echo PRESS ENTER TO RETURN TO STABLE.
pause >nul
goto stable

:cow
set /a cow=%cow%+0
set /a co=%co%+0
if %co% LSS 50 (
set /a co=%co%+10
)
set /a cnet=%co%*%cow%
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo =====================
echo COWS: %cow%
echo CURRENT VALUE: $%cnet% (FOR TOTAL OF COWS)
echo.
echo PRESS ENTER TO RETURN TO STABLE.
pause >nul
goto stable

:chick
set /a chicken=%chicken%+0
set /a ch=%ch%+0
if %ch% LSS 10 (
set /a ch=%ch%+1
)
set /a chnet=%ch%*%chicken%
cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo ======================
echo CHICKENS: %chicken%
echo CURRENT VALUE: $%chnet% (FOR TOTAL OF CHICKENS)
echo.
echo PRESS ENTER TO RETURN TO STABLE.
pause >nul
goto stable

:save
cls

(del %player_name%.sav)
(echo --Current Load For "%player_name%"--)>> %player_name%.sav
(echo User Name=%player_name%)>> %player_name%.sav
(echo wheat=%wheat%)>> %player_name%.sav
(echo rice=%rice%)>> %player_name%.sav
(echo money=%money%)>> %player_name%.sav
(echo lvl=%lvl%)>> %player_name%.sav
(echo ropes=%ropes%)>> %player_name%.sav
(echo land=%land%)>> %player_name%.sav
(echo xp=%xp%)>> %player_name%.sav
(echo tim=%tim%)>> %player_name%.sav
(echo wac=%wac%)>> %player_name%.sav
(echo wbale=%wbale%)>> %player_name%.sav
(echo rbale=%rbale%)>> %player_name%.sav
(echo whp=%whp%)>> %player_name%.sav
(echo rip=%rip%)>> %player_name%.sav
(echo chicken=%chicken%)>> %player_name%.sav
(echo cow=%cow%)>> %player_name%.sav
(echo horse=%horse%)>> %player_name%.sav
(echo pig=%pig%)>> %player_name%.sav
(echo ppen=%ppen%)>> %player_name%.sav
(echo cpen=%cpen%)>> %player_name%.sav
(echo hpen=%hpen%)>> %player_name%.sav
(echo chpen=%chpen%)>> %player_name%.sav

cls
echo	MONEY: $%money%    NAME: %player_name%    LEVEL: %lvl%    EXP: %xp%
echo.
echo.
echo PROGRESS SAVED!
echo.
echo PRESS 'ENTER' TO CLOSE.
pause >nul
exit
