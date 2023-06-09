set s [atomselect top "segname PPRO"]

set nf [molinfo top get numframes]

$s frame 0
set old [$s get {x y z}]
set new [list]

for {set f 1} {$f < $nf} {incr f} {
  $s frame $f
  foreach o $old r  [$s get {x y z}] {
    lappend new [vecadd $o $r]
  }
  set old $new
  set new [list]
}

set av [list]
foreach r $old {
  lappend av [vecscale [expr 1.0/$nf] $r]
}

$s frame 0
$s set {x y z} $av
