@echo off
set title=Farming Simulation [v1.3.0.1]
title %title%
color c
::   1   .   3   .    0    .   1   || versions
:: major | minor | bug fix | build || versions

:startup
set player_name=Error 404
cls
echo Welcome to %title%!
echo.
echo.
echo What is your preferred username?
echo Or enter your current username.
echo You cannot have any spaces in your name!
set /p player_name=Username: 
echo.
echo.
if exist %player_name%.sav (
for /f %%a in (%player_name%.sav) do set %%a
goto wb
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
set /a carrot=0
goto done
)
goto save
::####

:wb

set /a money=%money%+0
set /a lvl=%lvl%+0
set /a xp=%xp%+0
set /a tim=%tim%+0
set /a land=%land%+1
set /a wac=%wac%+0
set /a whp=%whp%+0
set /a rip=%rip%+0
set /a wbale=%wbale%+0
set /a rbale=%rbale%+0
set /a ropes=%ropes%+0
set /a rice=%rice%+0
set /a wheat=%wheat%+0
set /a plants=%plants%+0
set /a pig=%pig%+0
set /a horse=%horse%+0
set /a cow=%cow%+0
set /a chicken=%chicken%+0
set /a carrot=%carrots%+0

cls
echo Welcome back to %title%, %player_name%!
echo.
echo.
echo --Your current status--
echo Money: $%money%
echo Level: %lvl%
echo Exp: %xp%
echo.
echo.
echo I hope you are enjoying the game!
echo Press 'enter' to continue playing.
pause >nul
goto menu

:done
cls
echo You are now a player!
echo.
echo.
echo I hope you will enjoy the game!
echo Press 'enter' to start playing.
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
(echo carp=%carp%)>> %player_name%.sav
(echo chicken=%chicken%)>> %player_name%.sav
(echo cow=%cow%)>> %player_name%.sav
(echo horse=%horse%)>> %player_name%.sav
(echo pig=%pig%)>> %player_name%.sav
(echo ppen=%ppen%)>> %player_name%.sav
(echo cpen=%cpen%)>> %player_name%.sav
(echo hpen=%hpen%)>> %player_name%.sav
(echo chpen=%chpen%)>> %player_name%.sav
(echo carrot=%carrot%)>> %player_name%.sav
(echo pfat=%pfat%)>> %player_name%.sav
(echo cfat=%cfat%)>> %player_name%.sav
(echo hfat=%hfat%)>> %player_name%.sav
(echo chfat=%chfat%)>> %player_name%.sav

cls

if %xp%==100 (
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo You leveled up!
set /a xp=0
set /a lvl=%lvl%+1
echo.
echo.
echo You are now level %lvl%!
pause >nul
goto %topic%
)

set topic=menu
set menu=0

cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Enter a number:
echo 1) Save and quit!
echo 2) Inventory!
echo 3) Sell!
echo 4) Market!
echo 5) Your farm!
echo.
echo.
set /p menu=Choice: 
echo.
echo.
if %menu%==1 goto save
if %menu%==2 goto inv
if %menu%==3 goto sell
if %menu%==4 goto store
if %menu%==5 goto farm
echo.
echo.
echo You must enter 1, 2, 3, 4 or 5!
pause >nul
goto menu

:store
set topic=store
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
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo ==================== What to buy ====================:=== Your stash ===
echo Buy wheat seeds: $5 for 5 seeds       [Type 'wheat'] ; Wheat seeds: %wheat%
echo Buy rice seeds: $10 for 5 seeds        [Type 'rice'] ; Rice seeds: %rice%
echo Buy more land: $100 for 1 acre squared [Type 'land'] ; Land owned: %land%
echo Buy more rope: $10 for 5 ropes        [Type 'ropes'] ; Ropes owned: %ropes%
echo Buy watering can: $50 for 1 can         [Type 'can'] ; Watering cans: %wac%
echo Buy pig: $20 for 1 pig                  [Type 'pig'] ; Pigs owned: %pig%
echo Buy cow: $50 for 1 cow                  [Type 'cow'] ; Cows owned: %cow%
echo Buy horse: $1000 for 1 horse          [Type 'horse'] ; Horses owned: %horse%
echo Buy chicken: $10 for 2 chickens     [Type 'chicken'] ; Chickens: %chicken%
echo Buy carrots: $5 for 5 carrots        [Type 'carrot'] ; Carrots: %carrot%
echo.
echo Type 'back' to go back to the menu.
echo.
set /p store=I want to to buy: 
if %store%==back (
echo.
echo Press 'enter' to go back to the menu.
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

if %store%==carrot goto bcarr
echo.
echo Invalid entry!
echo.
echo.
echo Press 'enter'.
pause >nul
goto store
pause >nul
goto menu

:bpig
set topic=store
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
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought a pig!
pause >nul
goto store
) else (
echo.
echo Hey! Your pig pen is full!
pause >nul
goto store
)
)
goto fail

:bcow
set topic=store
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
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought a cow!
pause >nul
goto store
) else (
echo.
echo Hey! Your cow pen is full!
pause >nul
goto store
)
)
goto fail


:bhorse
set topic=store
if %money% GTR 999 (
if %hpen% LSS 10 (
set /a horse=%horse%+1
set /a hpen=%hpen%+1
set /a money=%money%-1000
set /a lvl=%lvl%+2
echo.
echo Successfully bought a horse!
pause >nul
goto store
) else (
echo.
echo Hey! Your horse pen is full!
pause >nul
goto store
)
)
goto fail

:bchicken
set topic=store
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
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
echo.
echo Successfully bought two chickens!
pause >nul
goto store
) else (
echo.
echo Hey! Your chicken pen is full!
pause >nul
goto store
)
)
goto fail

:bwheat
set topic=store
if %money% GTR 4 (
set /a wheat=%wheat%+5
set /a money=%money%-5
set /a xp=%xp%+3
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought five wheat seeds!
pause >nul
goto store
)
goto fail

:brice
set topic=store
if %money% GTR 9 (
set /a rice=%rice%+5
set /a money=%money%-10
set /a xp=%xp%+5
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought five rice seeds!
pause >nul
goto store
)
goto fail

:bland
set topic=store
if %money% GTR 99 (
if %lvl% LSS 4 (
if %land%==4 (
echo.
echo You have reached the maximum farmland limit for your level!
echo.
echo Reach level 4 to have up to 16 plots!
pause >nul
goto store
)
)
if %lvl% LSS 10 (
if %land%==16 (
echo.
echo You have reached the maximum farmland limit for your level!
echo.
echo Reach level 10 to have up to 36 plots!
pause >nul
goto store
)
)
if %lvl% LSS 50 (
if %land%==36 (
echo.
echo You have reached the maximum farmland limit for your level!
echo.
echo Reach level 100 to have up to 100 plots!
pause >nul
goto store
)
)
if %lvl% LSS 100 (
if %land%==100 (
echo.
echo You have reached the maximum amount of acres of farmland!
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
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought an acre of land!
pause >nul
goto store
)
goto fail

:bwac
set topic=store
if %money% GTR 49 (
set /a wac=%wac%+1
set /a money=%money%-50
set /a xp=%xp%+30
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought a watering can!
pause >nul
goto store
)
goto fail

:bropes
set topic=store
if %money% GTR 9 (
set /a ropes=%ropes%+5
set /a money=%money%-10
set /a xp=%xp%+3
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp% GTR 100 (
set /a lvl=%lvl%+1
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought five ropes!
pause >nul
goto store
)
goto fail

:bcarr
set topic=store
if %money% GTR 9 (
set /a carrot=%carrot%+5
set /a money=%money%-5
set /a xp=%xp%+3
if %xp% GTR 100 (
set /a lvl=%lvl%+10
set /a xp=%xp%-100
)
if %xp%==100 goto menu
echo.
echo Successfully bought five carrots!
pause >nul
goto store
)
goto fail

:fail
set topic=store

if %xp%==100 goto menu

echo.
echo Put that down!
echo You don't have enough money to buy that!
pause >nul
goto menu

:inv
set topic=inv
cls
if %xp%==100 goto menu
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo ======================= You inventory =======================
echo Wheat seeds: %wheat%          ; Chickens: %chicken%
echo Rice seeds: %rice%            ; Horses: %horse%
echo Wheat bales: %wbale%          ; Pigs: %pig%
echo Rice bales: %rbale%           ; Cows: %cow%
echo Ropes owned: %ropes%          ; Land owned: %land% (in acres squared)
echo Watering cans: %wac%          ;
echo.
echo Press 'enter' to return to the menu.
pause >nul
goto menu

:sell
set topic=sell
if %xp%==100 goto menu
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo =========== What to sell ===========:========= Inventory ===========
echo 1) Sell rops (Qty: 1)               ; Ropes owned: %ropes%
echo 2) Sell wheat bale (Qty: 1)         ; Wheat bales: %wbale%
echo 3) Sell rice bale (Qty: 1)          ; Rice bales: %rbale%
echo 4) Sell wheat seed (Qty: 1)         ; Wheat seeds: %wheat%
echo 5) Sell rice seed (Qty: 1)          ; Rice seeds: %rice%
echo 6) Sell land (Qty: 1 acre squared)  ; Land owned: %land% (IN ACRES)
echo 7) Sell pig (Qty: 1)                ; Pigs owned: %pig%
echo 8) Sell cow (Qty: 1)                ; Cows owned: %cow%
echo 9) Sell horse (Qty: 1)              ; Horses owned: %horse%
echo 10) Sell chicken (Qty: 2)           ; Chickens: %chicken%
echo 11) Sell carrot (Qty: 5)            ; Carrots: %carrot%
echo.
echo Type 'back' to return to menu.
echo.
set /p sell=I want to sell: 
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
if %sell%==11 goto scarr
if %sell%==back goto menu
echo.
echo Invalid entry!
echo.
echo Please input a number 1 through 11.
pause >nul
goto sell

:swheat
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %wheat%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Wheat seed sold successfully!
set /a wheat=%wheat%-1
set /a xp=%xp%+2
set /a money=%money%+2
pause >nul
goto sell
)
pause >nul
goto sell

:srice
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %rice%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Rice seed sold successfully!
set /a rice=%rice%-1
set /a xp=%xp%+2
set /a money=%money%+2
pause >nul
goto sell
)
pause >nul
goto sell

:swbale
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %wbale%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Wheat bale sold successfully!
set /a wbale=%wbale%-1
set /a xp=%xp%+2
set /a money=%money%+6
pause >nul
goto sell
)
pause >nul
goto sell

:srbale
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %rbale%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Rice bale sold successfully!
set /a rbale=%rbale%-1
set /a xp=%xp%+2
set /a money=%money%+12
pause >nul
goto sell
)
pause >nul
goto sell

:sland
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %land%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo 1 acre of land sold successfully!
set /a land=%land%-1
set /a xp=%xp%+2
set /a money=%money%+10
pause >nul
goto sell
)
pause >nul
goto sell

:srope
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %ropes%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Rope sold successfully!
set /a ropes=%ropes%-1
set /a xp=%xp%+2
set /a money=%money%+5
pause >nul
goto sell
)
pause >nul
goto sell

:scow
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %cow%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Cow sold successfully!
set /a cow=%cow%-1
set /a cpen=%cpen%-1
set /a co=0
set /a xp=%xp%+5
if %xp% GTR 100 (
set /a xp=%xp%-100
set /a lvl=%lvl%+1
)
set /a money=%money%+%cnet%
pause >nul
goto sell
)
pause >nul
goto sell

:spig
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %pig%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Pig sold successfully!
set /a pig=%pig%-1
set /a ppen=%ppen%-1
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
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %horse%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Horse sold successfully!
set /a horse=%horse%-1
set /a hpen=%hpen%-1
set /a ho=0
set /a lvl=%lvl%+1
set /a money=%money%+%hnet%
pause >nul
goto sell
)
pause >nul
goto sell

:schicken
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %chicken%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Chicken sold successfully!
set /a chicken=%chicken%-1
set /a chpen=%chpen%-1
set /a ch=0
set /a xp=%xp%+2
set /a money=%money%+%chnet%
pause >nul
goto sell
)
pause >nul
goto sell

:scarr
set topic=sell
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
if %carrot%==0 (
echo You don't have that! Come back later!
pause >nul
goto sell
) else (
echo Carrot sold successfully!
set /a carrot=%carrot%-1
set /a xp=%xp%+3
set /a money=%money%+1
)
pause >nul
goto sell

:farm
set topic=farm
if %xp%==100 goto menu
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo What do you want to do?
echo 1) Plant crops!
echo 2) Harvest crops!
echo 3) Water crops!
echo 4) Check out the map of your farm!
echo 5) Go to the stable!
echo 6) Go to the menu!
echo.
echo.
set /p farm=Choice: 
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
set topic=pc
cls
if %xp%==100 goto menu
cls

set /a rip=%rip%+0
set /a whp=%whp%+0
set /a plants=%whp%+%rip%
set /a space=%land%-%plants%

cls

set p=404

if %space%==0 (
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Not enough space to plant crops! Come back once harvested!
pause >nul
goto farm
)
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Space left to plant crops: %space%
echo.
echo -- Usable items in inventory --
echo Wheat seeds: %wheat%
echo Rice seeds: %rice%
echo Carrots: %carrot%
echo Watering cans: %wac%
echo.
echo Pick one to do.
echo.
echo Plant (1) wheat seed [Type 'wheat']
echo Plant (1) rice seed [Type 'rice']
echo Plant (1) carrot [Type 'carrot']
echo Exit to Farm menu [Type 'back']
echo.
echo.
set /p p=I want to plant: 
if %p%==wheat (
if %wheat%==0 (
echo.
echo Not enough seeds!
pause >nul
goto pc
)
set /a whp=%whp%+1
set /a xp=%xp%+2
set /a wheat=%wheat%-1
echo.
echo Wheat successfully planted!
echo.
echo.
echo Press 'enter' to continue.
pause >nul
goto pc
)
if %p%==rice (
if %rice%==0 (
echo.
echo Not enough rice!
pause >nul
goto pc
)
set /a rip=%rip%+1
set /a xp=%xp%+2
set /a rice=%rice%-1
echo.
echo Rice successfully planted!
echo.
echo.
echo Press 'enter' to continue.
pause >nul
goto pc
)
if %p%==carrot (
if %carrot%==0 (
echo.
echo Not enough carrots!
pause >nul
goto pc
)
set /a carp=%carp%+1
set /a xp=%xp%+2
set /a carp=%carp%-1
echo.
echo Carrot successfully planted!
echo.
echo.
echo Press 'enter' to continue.
pause >nul
goto pc
)
if %p%==back (
goto farm
) else (
echo Invalid entry!
echo.
echo Please input one of the options!
pause >nul
goto pc
)
echo.
echo Error! Try again!
pause >nul
goto farm

:hc
set topic=hc
if %xp%==100 goto menu
cls

set hc=404

set /a tim=%tim%+0
echo.
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo %tim% out of 3 waterings complete!
echo.
echo -- Crops planted --
echo Wheat: %whp%
echo Rice: %rip%
echo Carrots: %carp%
echo.
echo Ropes left: %ropes%
echo.
echo Type 'harvest' to harvest all crops.
echo Type 'back' to go back to the Farm menu.
echo.
set /p hc=I want to: 
if %hc%==harvest (
if %tim%==3 (
if %ropes% GTR %whp%+%rip%-1 (
set /a wbale=%wbale%+%whp%
set /a whp=0
set /a rbale=%rbale%+%rip%
set /a rip=0
set /a carrot=%carrot%+%carp%*2
set /a carp=0
set /a tim=0
set /a ropes=%ropes%-%whp%
set /a ropes=%ropes%-%rip%
echo.
echo Harvest complete!
pause >nul
goto farm
) else (
echo.
echo You don't have enough ropes!
)
)
echo Harvest not ready!
pause >nul
goto farm
echo.
)
if %hc%==back goto farm
echo.
echo.
echo Error! Try again!
pause >nul
goto hc

:wc
set topic=wc
if %xp%==100 goto 
set /a wac=%wac%+0 
if %tim%==3 (
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Your harvest is ready!
echo.
echo Press 'enter' to go harvest!
pause >nul
goto hc
)

set %wc%=404

cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo %tim% out of 3 waterings complete!
echo.
echo -- Watering overview --
echo Watering cans: %wac%
echo Waterings done: %tim%
echo.
echo.
echo Type 'water' to water all the crops.
echo Type 'back' to go to the Farm menu.
echo.
set /p wc=I want to: 
if %wc%==water (
echo.
if %wac%==0 (
echo You don't have any watering cans!
pause >nul
goto farm
) else (
set /a tim=%tim%+1
set /a wac=%wac%-1
echo.
echo You just watered all your crops!
pause >nul
goto wc
)
)
if %wc%==exit goto farm
echo.
echo.
echo Error! Try again!
pause >nul
goto farm

:map
set topic=farm
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Hmm... You don't have a map yet, eh...?
pause >nul
goto farm

:stable
set topic=stable
if %xp%==100 goto menu
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo To which pin do you wish to visit?
echo 1) Pig!
echo 2) Horse!
echo 3) Cow!
echo 4) Chicken!
echo 5) Back to Farm menu!
echo.
set /p pen=Choice: 
if %pen%==1 goto pig
if %pen%==2 goto horse
if %pen%==3 goto cow
if %pen%==4 goto chick
if %pen%==5 goto farm
if %pen%==6 (
echo.
echo Invalid entry!
echo Please try again!
pause >nul
goto stable
) else (
echo.
echo Invalid entry!
echo Please try again!
pause >nul
goto stable
)
goto save

:pig
set po=404

set topic=pig
set /a pig=%pig%+0
set /a pnet=%pnet%+0
set /a pfat=%pfat%+0
set /a pv=%pv%+0
if %pv% LSS 10 (
set /a pv=%pv%+1
)
set /a pnet=%pv%+%pfat%
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo =====================
echo Pigs: %pig%
echo Carrots: %carrot%
echo Current value: $%pnet% (For one pig.)
echo.
echo Type 'feed' to feed all pigs two carrots.
echo Type 'back' to return to stable.
set /p po=I want to: 
if %po%==feed (
if %carrot% GTR 2*%pig%-1 (
set /a pfat=%pfat%+5
set /a carrot=%carrot%-2*%pig%
echo.
echo Just fed all pigs!
pause>nul
goto pig
) else (
echo You don't have enough carrots!
pause>nul
goto pig
)
echo Error!
pause>nul
goto pig
)
if %po%==back goto stable
echo Invalid entry!
echo.
echo Please choose one of the options available.
pause >nul
goto pig

:horse
set ho=404

set topic=horse
set /a horse=%horse%+0
set /a hnet=%hnet%+0
set /a hfat=%hfat%+0
set /a hv=%hv%+0
if %hv% LSS 20 (
set /a hv=%hv%+1
)
set /a hnet=%hv%+%hfat%
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo =====================
echo Horses: %horse%
echo Wheat bales: %wbale%
echo Current value: $%hnet% (For one horse.)
echo.
echo Type 'feed' to feed all horses one wheat bale.
echo Type 'back' to return to stable.
set /p ho=I want to: 
if %ho%==feed (
if %wbale% GTR %horse%-1 (
set /a hfat=%hfat%+2
set /a wbale=%wbale%-%horse%
echo.
echo Just fed all horses!
pause>nul
goto horse
) else (
echo You don't have enough wheat bales!
pause>nul
goto horse
)
echo Error!
pause>nul
goto horse
)
if %ho%==back goto stable
echo Invalid entry!
echo.
echo Please choose one of the options available.
pause >nul
goto horse

:cow
set co=404

set topic=cow
set /a cow=%cow%+0
set /a cnet=%cnet%+0
set /a cfat=%cfat%+0
set /a cv=%cv%+0
if %cv% LSS 10 (
set /a cv=%cv%+1
)
set /a cnet=%cv%+%cfat%
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo =====================
echo Cows: %cow%
echo Wheat bales: %wbale%
echo Current value: $%cnet% (For one cow.)
echo.
echo Type 'feed' to feed all cows one wheat bale.
echo Type 'back' to return to stable.
set /p co=I want to: 
if %co%==feed (
if %wbale% GTR %cow%-1 (
set /a cfat=%cfat%+3
set /a wbale=%wbale%-%cow%
echo.
echo Just fed all cows!
pause>nul
goto cow
) else (
echo You don't have enough wheat bales!
pause>nul
goto cow
)
echo Error!
pause>nul
goto cow
)
if %co%==back goto stable
echo Invalid entry!
echo.
echo Please choose one of the options available.
pause >nul
goto cow

:chick
set cho=404

set topic=chick
set /a chicken=%chicken%+0
set /a chnet=%chnet%+0
set /a chfat=%chfat%+0
set /a chv=%chv%+0
if %chv% LSS 10 (
set /a cv=%chv%+1
)
set /a chnet=%chv%+%chfat%
cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo =====================
echo Chickens: %chicken%
echo Seeds: %wheat%
echo Current value: $%chnet% (For one chicken.)
echo.
echo Type 'feed' to feed all chickens one wheat seed.
echo Type 'back' to return to stable.
set /p cho=I want to: 
if %cho%==feed (
if %wheat% gtr %chicken%-1 (
set /a chfat=%chfat%+3
set /a wheat=%wheat%-%chicken%
echo.
echo Just fed all chickens!
pause>nul
goto chick
) else (
echo You don't have enough wheat seeds!
pause>nul
goto chick
)
echo Error!
pause>nul
goto chick
)
if %cho%==back goto stable
echo Invalid entry!
echo.
echo Please choose one of the options available.
pause >nul
goto chick

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
(echo carp=%carp%)>> %player_name%.sav
(echo chicken=%chicken%)>> %player_name%.sav
(echo cow=%cow%)>> %player_name%.sav
(echo horse=%horse%)>> %player_name%.sav
(echo pig=%pig%)>> %player_name%.sav
(echo ppen=%ppen%)>> %player_name%.sav
(echo cpen=%cpen%)>> %player_name%.sav
(echo hpen=%hpen%)>> %player_name%.sav
(echo chpen=%chpen%)>> %player_name%.sav
(echo carrot=%carrot%)>> %player_name%.sav
(echo pfat=%pfat%)>> %player_name%.sav
(echo cfat=%cfat%)>> %player_name%.sav
(echo hfat=%hfat%)>> %player_name%.sav
(echo chfat=%chfat%)>> %player_name%.sav

cls
echo	Money: $%money%    Name: %player_name%    Level: %lvl%    Exp: %xp%
echo.
echo.
echo Progress saved!
echo.
echo Press 'enter' to close.
pause >nul
exit
