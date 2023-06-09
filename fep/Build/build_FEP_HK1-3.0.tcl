package require solvate
package require autoionize

# Set global variables
set psfName my
set pdbName my

# start loop
foreach sys [list "complex" "ligand"] seltxt [list "segname V1 V2 L1 L2" "segname L2"] {
    # Measure Current waterbox size
    mol new $psfName.psf
    mol addfile $pdbName.pdb
    set ogID [molinfo top]
    set selall [atomselect $ogID all]
    set myMinMax [measure minmax $selall]
    set myCenter [measure center $selall]

    # Write out complex/ligand only pdbs
    set sel [atomselect $ogID $seltxt]
    
    # If ligand move to center
    if {$sys == "ligand"} {
	set currentCOM [measure center $sel]
	set myVec [list ]
	for { set i 0 } { $i < 3 } { incr i } {
	    # lappend myVec [expr { [lindex $currentCOM $i] - [lindex $myCenter $i] }]
	    lappend myVec [expr { [lindex $myCenter $i] - [lindex $currentCOM $i] }]	    
	}
	set tansMatrix "{ 1.0 0.0 0.0 [lindex $myVec 0]} \
	{0.0 1.0 0.0 [lindex $myVec 1]} \
	{0.0 0.0 1.0 [lindex $myVec 2]} \
	{0.0 0.0 0.0 1.0}"
	$sel move $tansMatrix
	
	# Write out new psf and pdb
	$sel writepsf $sys.psf
	$sel writepdb $sys.pdb    

	# Solvate
	solvate ${sys}.psf ${sys}.pdb -minmax $myMinMax -o ${sys}_solv
	# Ionize
	autoionize -psf ${sys}_solv.psf -pdb ${sys}_solv.pdb -neutralize -o ./${sys}_solv-ion
    } else {
	file copy -force $psfName.psf ${sys}_solv-ion.psf
	file copy -force $psfName.pdb ${sys}_solv-ion.pdb	
    }
    mol delete all
    mol new ${sys}_solv-ion.psf
    mol addfile ${sys}_solv-ion.pdb
    
    # Create FEP flagging file
    set selall [atomselect top "all"]
    $selall set beta 0
    set selFEP [atomselect top "segname L2"]
    $selFEP set beta -1.00
    $selall writepdb ${sys}.fep
    
    #Calculate PBC size and write file w/ values
    puts "======================="
    puts "bout to calc PBC"
    set sel [atomselect top water]
    set var_minmax [measure minmax $sel]
    set var_cen [measure center $sel]
    set var_size [vecsub [lindex $var_minmax 1] [lindex $var_minmax 0]]
    set outfile [open "$sys-PBC_Values.str" w]
    puts $outfile $var_size
    puts $outfile $var_cen
    close $outfile

    # Finish message
    puts "Done with $sys"
    mol delete all
}

# Exit message
puts "All Done :-)"

exit
