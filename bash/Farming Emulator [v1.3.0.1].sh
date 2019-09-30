#!/usr/bin/env bash

#@echo off
ver=1.3.0.1
title="Farming Simulation [v"$ver"]"
#title $title$
#color c
#   1   .   3   .    0    .   1   || versions
# major | minor | bug fix | build || versions

function startup() {
    player_name="Error 404"
    clear
    echo Welcome to $title"!"
    echo ""
    echo ""
    echo What is your preferred username?
    echo Or enter your current username.
    echo You cannot have any spaces in your name!
    read player_name -p "Username: " 
    echo ""
    echo ""
    if [ -f $player_name".sav" ]; then
        source $player_name".sav"
        wb
    else
        echo "" >> $player_name".sav"
        money=1200
        lvl=1
        xp=0
        tim=0
        land=1
        wac=0
        whp=0
        rip=0
        wbale=0
        rbale=0
        ropes=0
        rice=0
        wheat=0
        plants=0
        pig=0
        horse=0
        cow=0
        chicken=0
        carrot=0
        done
    fi
    save
}
#####

function wb() {
    let "$money += 0"
    let "$lvl += 0"
    let "$xp += 0"
    let "$tim += 0"
    let "$land += 0"
    let "$wac += 0"
    let "$whp += 0"
    let "$rip += 0"
    let "$wbale += 0"
    let "$rbale += 0"
    let "$ropes += 0"
    let "$rice += 0"
    let "$wheat += 0"
    let "$plants += 0"
    let "$pig += 0"
    let "$horse += 0"
    let "$cow += 0"
    let "$chicken += 0"
    let "$carrots += 0"

    clear
    echo Welcome back to $title", "$player_name"!"
    echo ""
    echo ""
    echo --Your current status--
    echo "Money: $"$money
    echo Level: $lvl
    echo Exp: $xp
    echo ""
    echo ""
    echo I hope you are enjoying the game!
    echo "Press \'enter\' to continue playing."
    read q
    menu
}

function done() {
    clear
    echo You are now a player!
    echo ""
    echo ""
    echo I hope you will enjoy the game!
    echo "Press 'enter' to start playing."
    read q
    menu
}
    
function menu() {
    clear

    (rm $player_name.sav)
    (echo --Current Load For $player_name--)>>$player_name.sav
    (echo User Name=$player_name)>> $player_name.sav
    (echo wheat=$wheat)>> $player_name.sav
    (echo rice=$rice)>> $player_name.sav
    (echo money=$money)>> $player_name.sav
    (echo lvl=$lvl)>> $player_name.sav
    (echo ropes=$ropes)>> $player_name.sav
    (echo land=$land)>> $player_name.sav
    (echo xp=$xp)>> $player_name.sav
    (echo tim=$tim)>> $player_name.sav
    (echo wac=$wac)>> $player_name.sav
    (echo wbale=$wbale)>> $player_name.sav
    (echo rbale=$rbale)>> $player_name.sav
    (echo whp=$whp)>> $player_name.sav
    (echo rip=$rip)>> $player_name.sav
    (echo carp=$carp)>> $player_name.sav
    (echo chicken=$chicken)>> $player_name.sav
    (echo cow=$cow)>> $player_name.sav
    (echo horse=$horse)>> $player_name.sav
    (echo pig=$pig)>> $player_name.sav
    (echo ppen=$ppen)>> $player_name.sav
    (echo cpen=$cpen)>> $player_name.sav
    (echo hpen=$hpen)>> $player_name.sav
    (echo chpen=$chpen)>> $player_name.sav
    (echo carrot=$carrot)>> $player_name.sav
    (echo pfat=$pfat)>> $player_name.sav
    (echo cfat=$cfat)>> $player_name.sav
    (echo hfat=$hfat)>> $player_name.sav
    (echo chfat=$chfat)>> $player_name.sav

    clear

    if [ $xp == 100 ]; then
        clear
        echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
        echo ""
        echo ""
        echo You leveled up!
        xp=0
        lvl=$lvl+1
        echo ""
        echo ""
        echo You are now level $lvl$!
        read q
        $topic$
    fi

    topic=menu
    menu=0

    clear
    echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
    echo ""
    echo ""
    echo Enter a number:
    echo 1) Save and quit!
    echo 2) Inventory!
    echo 3) Sell!
    echo 4) Market!
    echo 5) Your farm!
    echo ""
    echo ""
    read menu -p "Choice: "
    echo ""
    echo ""
    if [ $menu == 1 ]; then save fi
    if [ $menu == 2 ]; then inv fi
    if [ $menu == 3 ]; then sell fi
    if [ $menu == 4 ]; then store fi
    if [ $menu == 5 ]; then farm fi
    echo ""
    echo ""
    echo You must enter 1, 2, 3, 4 or 5!
    read q
    menu
}

function store() {
    topic=store
    clear

    if [ $xp == 100 ]; then menu fi
    if [ $money -lt 0 ]; then
        money=0
        fail
    fi
    if [ $money -lt 5 ]; then fail fi
    ppen=$ppen+0
    cpen=$cpen+0
    hpen=$hpen+0
    chpen=$chpen+0

    clear
    ropes=$ropes+0
    land=$land+0
    echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
    echo ""
    echo ""
    echo ==================== What to buy ====================:=== Your stash ===
    echo Buy wheat seeds: \$5 for 5 seeds       [Type \'wheat\'] \; Wheat seeds: $wheat
    echo Buy rice seeds: \$10 for 5 seeds        [Type \'rice\'] \; Rice seeds: $rice
    echo Buy more land: \$100 for 1 acre squared [Type \'land\'] \; Land owned: $land
    echo Buy more rope: \$10 for 5 ropes        [Type \'ropes\'] \; Ropes owned: $ropes
    echo Buy watering can: \$50 for 1 can         [Type \'can\'] \; Watering cans: $wac
    echo Buy pig: \$20 for 1 pig                  [Type \'pig\'] \; Pigs owned: $pig
    echo Buy cow: \$50 for 1 cow                  [Type \'cow\'] \; Cows owned: $cow
    echo Buy horse: \$1000 for 1 horse          [Type \'horse\'] \; Horses owned: $horse
    echo Buy chicken: \$10 for 2 chickens     [Type \'chicken\'] \; Chickens: $chicken
    echo Buy carrots: \$5 for 5 carrots        [Type \'carrot\'] \; Carrots: $carrot
    echo ""
    echo Type \'back\' to go back to the menu.
    echo ""
    read store -p "I want to to buy: "
    if [ $store == back ]; then
        echo ""
        echo Press \'enter\' to go back to the menu.
        read q
        menu
    fi
    if [ $store == pig ]; then bpig fi

    if [ $store == cow ]; then bcow fi

    if [ $store == horse ]; then bhorse fi

    if [ $store == chicken ]; then bchicken fi

    if [ $store == wheat ]; then bwheat fi

    if [ $store == rice ]; then brice fi

    if [ $store == land ]; then bland fi

    if [ $store == can ]; then bwac fi

    if [ $store == ropes ]; then bropes fi

    if [ $store == carrot ]; then bcarr fi

    echo ""
    echo Invalid entry!
    echo ""
    echo ""
    echo Press \'enter\'.
    read q
    store
    read q
    menu
}

function bpig() {
    topic=store
    if [ $money -gt 20 ]; then
    if [ $ppen -lt 20 ]; then
    pig=$pig+1
    ppen=$ppen+1
    money=$money$-20
    xp=$xp+20
    if [ $xp -gt 100 ]; then
    lvl=$lvl+1
    xp=$xp$-100
    )
    if [ $xp -gt 100 ]; then
    lvl=$lvl+1
    xp=$xp$-100
    )
    if [ $xp ==100 menu
    echo ""
    echo Successfully bought a pig!
    read q
    store
    ) else (
    echo ""
    echo Hey! Your pig pen is full!
    read q
    store
    )
    )
    fail
}

:bcow
topic=store
if [ $money -gt 49 (
if [ $cpen -lt 20 ]; then
cow=$cow+1
cpen=$cpen+1
money=$money$-50
xp=$xp+50
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought a cow!
read q
store
) else (
echo ""
echo Hey! Your cow pen is full!
read q
store
)
)
fail


:bhorse
topic=store
if [ $money -gt 999 (
if [ $hpen -lt 10 ]; then
horse=$horse+1
hpen=$hpen+1
money=$money$-1000
lvl=$lvl+2
echo ""
echo Successfully bought a horse!
read q
store
) else (
echo ""
echo Hey! Your horse pen is full!
read q
store
)
)
fail

:bchicken
topic=store
if [ $money -gt 9 (
if [ $chpen -lt 50 ]; then
chicken=$chicken+2
chpen=$chpen+1
money=$money$-10
xp=$xp+10
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
echo ""
echo Successfully bought two chickens!
read q
store
) else (
echo ""
echo Hey! Your chicken pen is full!
read q
store
)
)
fail

:bwheat
topic=store
if [ $money -gt 4 (
wheat=$wheat+5
money=$money$-5
xp=$xp+3
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought five wheat seeds!
read q
store
)
fail

:brice
topic=store
if [ $money -gt 9 (
rice=$rice+5
money=$money$-10
xp=$xp+5
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought five rice seeds!
read q
store
)
fail

:bland
topic=store
if [ $money -gt 99 (
if [ $lvl -lt 4 (
if [ $land ==4 (
echo ""
echo You have reached the maximum farmland limit for your level!
echo ""
echo Reach level 4 to have up to 16 plots!
read q
store
)
)
if [ $lvl -lt 10 ]; then
if [ $land ==16 (
echo ""
echo You have reached the maximum farmland limit for your level!
echo ""
echo Reach level 10 to have up to 36 plots!
read q
store
)
)
if [ $lvl -lt 50 ]; then
if [ $land ==36 (
echo ""
echo You have reached the maximum farmland limit for your level!
echo ""
echo Reach level 100 to have up to 100 plots!
read q
store
)
)
if [ $lvl -lt 100 ]; then
if [ $land ==100 ]; then
echo ""
echo You have reached the maximum amount of acres of farmland!
read q
store
)
) 
land=$land+1
money=$money$-100
xp=$xp+70
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought an acre of land!
read q
store
)
fail

:bwac
topic=store
if [ $money -gt 49 (
wac=$wac+1
money=$money$-50
xp=$xp+30
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought a watering can!
read q
store
)
fail

:bropes
topic=store
if [ $money -gt 9 (
ropes=$ropes+5
money=$money$-10
xp=$xp+3
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp -gt 100 ]; then
lvl=$lvl+1
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought five ropes!
read q
store
)
fail

:bcarr
topic=store
if [ $money -gt 9 (
carrot=$carrot+5
money=$money$-5
xp=$xp+3
if [ $xp -gt 100 ]; then
lvl=$lvl+10
xp=$xp$-100
)
if [ $xp ==100 menu
echo ""
echo Successfully bought five carrots!
read q
store
)
fail

:fail
topic=store

if [ $xp ==100 menu

echo ""
echo Put that down!
echo You don't have enough money to buy that!
read q
menu

:inv
topic=inv
clear
if [ $xp ==100 menu
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo ======================= You inventory =======================
echo Wheat seeds: $wheat          ; Chickens: $chicken$
echo Rice seeds: $rice            ; Horses: $horse$
echo Wheat bales: $wbale          ; Pigs: $pig$
echo Rice bales: $rbale           ; Cows: $cow$
echo Ropes owned: $ropes          ; Land owned: $land (in acres squared)
echo Watering cans: $wac          ;
echo ""
echo Press 'enter' to return to the menu.
read q
menu

:sell
topic=sell
if [ $xp ==100 menu
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo =========== What to sell ===========:========= Inventory ===========
echo 1) Sell rops (Qty: 1)               ; Ropes owned: $ropes$
echo 2) Sell wheat bale (Qty: 1)         ; Wheat bales: $wbale$
echo 3) Sell rice bale (Qty: 1)          ; Rice bales: $rbale$
echo 4) Sell wheat seed (Qty: 1)         ; Wheat seeds: $wheat$
echo 5) Sell rice seed (Qty: 1)          ; Rice seeds: $rice$
echo 6) Sell land (Qty: 1 acre squared)  ; Land owned: $land (IN ACRES)
echo 7) Sell pig (Qty: 1)                ; Pigs owned: $pig$
echo 8) Sell cow (Qty: 1)                ; Cows owned: $cow$
echo 9) Sell horse (Qty: 1)              ; Horses owned: $horse$
echo 10) Sell chicken (Qty: 2)           ; Chickens: $chicken$
echo 11) Sell carrot (Qty: 5)            ; Carrots: $carrot$
echo ""
echo Type 'back' to return to menu.
echo ""
read sell=I want to sell: 
if [ $sell ==1 srope
if [ $sell ==2 swbale
if [ $sell ==3 srbale
if [ $sell ==4 swheat
if [ $sell ==5 srice
if [ $sell ==6 sland
if [ $sell ==7 spig
if [ $sell ==8 scow
if [ $sell ==9 shorse
if [ $sell ==10 schicken
if [ $sell ==11 scarr
if [ $sell ==back menu
echo ""
echo Invalid entry!
echo ""
echo Please input a number 1 through 11.
read q
sell

:swheat
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $wheat ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Wheat seed sold successfully!
wheat=$wheat$-1
xp=$xp+2
money=$money+2
read q
sell
)
read q
sell

:srice
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $rice ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Rice seed sold successfully!
rice=$rice$-1
xp=$xp+2
money=$money+2
read q
sell
)
read q
sell

:swbale
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $wbale ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Wheat bale sold successfully!
wbale=$wbale$-1
xp=$xp+2
money=$money+6
read q
sell
)
read q
sell

:srbale
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $rbale ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Rice bale sold successfully!
rbale=$rbale$-1
xp=$xp+2
money=$money+12
read q
sell
)
read q
sell

:sland
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $land ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo 1 acre of land sold successfully!
land=$land$-1
xp=$xp+2
money=$money+10
read q
sell
)
read q
sell

:srope
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $ropes ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Rope sold successfully!
ropes=$ropes$-1
xp=$xp+2
money=$money+5
read q
sell
)
read q
sell

:scow
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $cow ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Cow sold successfully!
cow=$cow$-1
cpen=$cpen$-1
co=0
xp=$xp+5
if [ $xp -gt 100 ]; then
xp=$xp$-100
lvl=$lvl+1
)
money=$money+$cnet$
if [ $cpen ==0 cfat=0
read q
sell
)
read q
sell

:spig
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $pig ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Pig sold successfully!
pig=$pig$-1
ppen=$ppen$-1
pi=0
xp=$xp+50
if [ $xp -gt 100 ]; then
xp=$xp$-100
lvl=$lvl+1
)
money=$money+$pnet$
if [ $ppen ==0 pfat=0
read q
sell
)
read q
sell

:shorse
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $horse ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Horse sold successfully!
horse=$horse$-1
hpen=$hpen$-1
ho=0
lvl=$lvl+1
money=$money+$hnet$
if [ $hpen ==0 hfat=0
read q
sell
)
read q
sell

:schicken
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $chicken ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Chicken sold successfully!
chicken=$chicken$-1
chpen=$chpen$-1
ch=0
xp=$xp+2
money=$money+$chnet$
if [ $chpen ==0 chfat=0
read q
sell
)
read q
sell

:scarr
topic=sell
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
if [ $carrot ==0 ]; then
echo You don't have that! Come back later!
read q
sell
) else (
echo Carrot sold successfully!
carrot=$carrot$-1
xp=$xp+3
money=$money+1
)
read q
sell

:farm
topic=farm
if [ $xp ==100 menu
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo What do you want to do?
echo 1) Plant crops!
echo 2) Harvest crops!
echo 3) Water crops!
echo 4) Check out the map of your farm!
echo 5) Go to the stable!
echo 6) Go to the menu!
echo ""
echo ""
read farm=Choice: 
if [ $farm ==1 pc
if [ $farm ==2 hc
if [ $farm ==3 wc
if [ $farm ==4 map
if [ $farm ==5 stable
if [ $farm ==6 menu
echo ""
echo Error! Try again!
read q
farm

:pc
topic=pc
clear
if [ $xp ==100 menu
clear

rip=$rip+0
whp=$whp+0
plants=$whp+$rip$
space=$land$-$plants$

clear

if [ [$p$] == [] p=rice

if [ $space ==0 ]; then
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo Not enough space to plant crops! Come back once harvested!
read q
farm
)
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo Space left to plant crops: $space$
echo ""
echo -- Usable items in inventory --
echo Wheat seeds: $wheat$
echo Rice seeds: $rice$
echo Carrots: $carrot$
echo Watering cans: $wac$
echo ""
echo Pick one to do.
echo ""
echo Plant (1) wheat seed [Type 'wheat']
echo Plant (1) rice seed [Type 'rice']
echo Plant (1) carrot [Type 'carrot']
echo Exit to Farm menu [Type 'back']
echo ""
echo ""
read p=I want to plant: 
if [ $p ==wheat (
if [ $wheat ==0 ]; then
echo ""
echo Not enough seeds!
read q
pc
)
whp=$whp+1
xp=$xp+2
wheat=$wheat$-1
echo ""
echo Wheat successfully planted!
echo ""
echo ""
echo Press 'enter' to continue.
read q
pc
)
if [ $p ==rice (
if [ $rice ==0 ]; then
echo ""
echo Not enough rice!
read q
pc
)
rip=$rip+1
xp=$xp+2
rice=$rice$-1
echo ""
echo Rice successfully planted!
echo ""
echo ""
echo Press 'enter' to continue.
read q
pc
)
if [ $p ==carrot (
if [ $carrot ==0 ]; then
echo ""
echo Not enough carrots!
read q
pc
)
carp=$carp+1
xp=$xp+2
carp=$carp$-1
echo ""
echo Carrot successfully planted!
echo ""
echo ""
echo Press 'enter' to continue.
read q
pc
)
if [ $p ==back (
farm
) else (
echo Invalid entry!
echo ""
echo Please input one of the options!
read q
pc
)
echo ""
echo Error! Try again!
read q
farm

:hc
topic=hc
if [ $xp ==100 menu
clear

hc=harvest

tim=$tim+0
echo ""
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo $tim out of 3 waterings complete!
echo ""
echo -- Crops planted --
echo Wheat: $whp$
echo Rice: $rip$
echo Carrots: $carp$
echo ""
echo Ropes left: $ropes$
echo ""
echo Type 'harvest' to harvest all crops.
echo Type 'back' to go back to the Farm menu.
echo ""
read hc=I want to: 
if [ $hc ==harvest (
if [ $tim ==3 (
if [ $ropes GEQ $whp+$rip (
wbale=$wbale+$whp$
whp=0
rbale=$rbale+$rip$
rip=0
carrot=$carrot+$carp$*2
carp=0
tim=0
ropes=$ropes$-$whp$
ropes=$ropes$-$rip$
echo ""
echo Harvest complete!
read q
farm
) else (
echo ""
echo You don't have enough ropes!
)
)
echo Harvest not ready!
read q
farm
echo ""
)
if [ $hc ==back farm
echo ""
echo ""
echo Error! Try again!
read q
hc

:wc
topic=wc
if [ $xp ==100 
wac=$wac+0 
if [ $tim ==3 (
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo Your harvest is ready!
echo ""
echo Press 'enter' to go harvest!
read q
hc
)

$wc =404

clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo $tim out of 3 waterings complete!
echo ""
echo -- Watering overview --
echo Watering cans: $wac$
echo Waterings done: $tim$
echo ""
echo ""
echo Type 'water' to water all the crops.
echo Type 'back' to go to the Farm menu.
echo ""
read wc=I want to: 
if [ $wc ==water (
echo ""
if [ $wac ==0 ]; then
echo You don't have any watering cans!
read q
farm
) else (
tim=$tim+1
wac=$wac$-1
echo ""
echo You just watered all your crops!
read q
wc
)
)
if [ $wc ==exit farm
echo ""
echo ""
echo Error! Try again!
read q
farm

:map
topic=farm
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo Hmm... You don't have a map yet, eh...?
read q
farm

:stable
topic=stable
if [ $xp ==100 menu
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo To which pin do you wish to visit?
echo 1) Pig!
echo 2) Horse!
echo 3) Cow!
echo 4) Chicken!
echo 5) Back to Farm menu!
echo ""
read pen=Choice: 
if [ $pen ==1 pig
if [ $pen ==2 horse
if [ $pen ==3 cow
if [ $pen ==4 chick
if [ $pen ==5 farm
if [ $pen ==6 (
echo ""
echo Invalid entry!
echo Please try again!
read q
stable
) else (
echo ""
echo Invalid entry!
echo Please try again!
read q
stable
)
save

:pig
po=404

topic=pig
pig=$pig+0
pnet=$pnet+0
pfat=$pfat+0
pv=$pv+0
if [ $pv -lt 10 ]; then
pv=$pv+1
)
pnet=$pv+$pfat$
if [ pnet LEQ 20 pnet=20
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo =====================
echo Pigs: $pig$
echo Carrots: $carrot$
echo Current value: $$pnet (For one pig.)
echo ""
echo Type 'feed' to feed all pigs two carrots.
echo Type 'back' to return to stable.
read po=I want to: 
if [ $po ==feed (
pigfeed=2*$pig$
if [ $carrot GEQ $pigfeed (
pfat=$pfat+5
carrot=$carrot$-2*$pig$
echo ""
echo Just fed all pigs!
pause>nul
pig
) else (
echo You don't have enough carrots!
pause>nul
pig
)
echo Error!
pause>nul
pig
)
if [ $po ==back stable
echo Invalid entry!
echo ""
echo Please choose one of the options available.
read q
pig

:horse
ho=404

topic=horse
horse=$horse+0
hnet=$hnet+0
hfat=$hfat+0
hv=$hv+0
if [ $hv -lt 20 ]; then
hv=$hv+1
)
hnet=$hv+$hfat$
if [ hnet LEQ 1000 hnet=1000
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo =====================
echo Horses: $horse$
echo Wheat bales: $wbale$
echo Current value: $$hnet (For one horse.)
echo ""
echo Type 'feed' to feed all horses one wheat bale.
echo Type 'back' to return to stable.
read ho=I want to: 
if [ $ho ==feed (
if [ $wbale GEQ $horse (
hfat=$hfat+2
wbale=$wbale$-$horse$
echo ""
echo Just fed all horses!
pause>nul
horse
) else (
echo You don't have enough wheat bales!
pause>nul
horse
)
echo Error!
pause>nul
horse
)
if [ $ho ==back stable
echo Invalid entry!
echo ""
echo Please choose one of the options available.
read q
horse

:cow
co=404

topic=cow
cow=$cow+0
cnet=$cnet+0
cfat=$cfat+0
cv=$cv+0
if [ $cv -lt 10 ]; then
cv=$cv+1
)
cnet=$cv+$cfat$
if [ cnet LEQ 50 cnet=50
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo =====================
echo Cows: $cow$
echo Wheat bales: $wbale$
echo Current value: $$cnet (For one cow.)
echo ""
echo Type 'feed' to feed all cows one wheat bale.
echo Type 'back' to return to stable.
read co=I want to: 
if [ $co ==feed (
if [ $wbale GEQ $cow (
cfat=$cfat+3
wbale=$wbale$-$cow$
echo ""
echo Just fed all cows!
pause>nul
cow
) else (
echo You don't have enough wheat bales!
pause>nul
cow
)
echo Error!
pause>nul
cow
)
if [ $co ==back stable
echo Invalid entry!
echo ""
echo Please choose one of the options available.
read q
cow

:chick
cho=404

topic=chick
chicken=$chicken+0
chnet=$chnet+0
chfat=$chfat+0
chv=$chv+0
if [ $chv -lt 10 ]; then
cv=$chv+1
)
chnet=$chv+$chfat$
if [ chnet LEQ 5 chnet=5
clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo =====================
echo Chickens: $chicken$
echo Seeds: $wheat$
echo Current value: $$chnet (For one chicken.)
echo ""
echo Type 'feed' to feed all chickens one wheat seed.
echo Type 'back' to return to stable.
read cho=I want to: 
if [ $cho ==feed (
if [ $wheat GEQ $chicken (
chfat=$chfat+3
wheat=$wheat$-$chicken$
echo ""
echo Just fed all chickens!
pause>nul
chick
) else (
echo You don't have enough wheat seeds!
pause>nul
chick
)
echo Error!
pause>nul
chick
)
if [ $cho ==back stable
echo Invalid entry!
echo ""
echo Please choose one of the options available.
read q
chick

:save
clear

(del $player_name$.sav)
(echo --Current Load For "$player_name$"--)>> $player_name$.sav
(echo User Name=$player_name$)>> $player_name$.sav
(echo wheat=$wheat$)>> $player_name$.sav
(echo rice=$rice$)>> $player_name$.sav
(echo money=$money$)>> $player_name$.sav
(echo lvl=$lvl$)>> $player_name$.sav
(echo ropes=$ropes$)>> $player_name$.sav
(echo land=$land$)>> $player_name$.sav
(echo xp=$xp$)>> $player_name$.sav
(echo tim=$tim$)>> $player_name$.sav
(echo wac=$wac$)>> $player_name$.sav
(echo wbale=$wbale$)>> $player_name$.sav
(echo rbale=$rbale$)>> $player_name$.sav
(echo whp=$whp$)>> $player_name$.sav
(echo rip=$rip$)>> $player_name$.sav
(echo carp=$carp$)>> $player_name$.sav
(echo chicken=$chicken$)>> $player_name$.sav
(echo cow=$cow$)>> $player_name$.sav
(echo horse=$horse$)>> $player_name$.sav
(echo pig=$pig$)>> $player_name$.sav
(echo ppen=$ppen$)>> $player_name$.sav
(echo cpen=$cpen$)>> $player_name$.sav
(echo hpen=$hpen$)>> $player_name$.sav
(echo chpen=$chpen$)>> $player_name$.sav
(echo carrot=$carrot$)>> $player_name$.sav
(echo pfat=$pfat$)>> $player_name$.sav
(echo cfat=$cfat$)>> $player_name$.sav
(echo hfat=$hfat$)>> $player_name$.sav
(echo chfat=$chfat$)>> $player_name$.sav

clear
echo "	Money: \$"$money"    Name: "$player_name"    Level: "$lvl"    Exp: "$xp
echo ""
echo ""
echo Progress saved!
echo ""
echo Press 'enter' to close.
read q
exit
