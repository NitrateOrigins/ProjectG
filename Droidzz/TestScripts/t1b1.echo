use player.*
use echo.cmd.*
 
alph servname = “Test Server”
 
upon.boot {
	sys.out $system.bootleg
}
 
if ($player.any.get(upon.join)) {
	out color(gold).“Welcome back to ”.color(red).$servname.color(gold).“, ”.color(green).$[player.any.get(upon.join)].color(gold).“!”
	exe(*) “/database users add $[player.all] Karma 3”
}
 
if ($player.any.get(upon.terminate)) {
	out color(aqua).“TODO”
}
 
if ($entity.ai.get(location) == [ [ $[this.get(location.x)] +- 50 ] || $[this.get(location.z)] +- 50 ] ]) {
	exe(*).$this.get(location) “/terminate $[ $entity.ai.get(location) == [ [ $[this.get(location.x)] +- 50 ] || $[this.get(location.z)] +- 50 ] ] ]”
	run Malware.echo
}
 
if ($[ $[memory.used] - 100 ] == $memory.total) {
  ...->[]
	sys.out $system.crash
	sys.quit
}
