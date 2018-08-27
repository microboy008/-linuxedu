#!/usr/bin/expect



for {set i 13} {$i < 14} {incr i} {
   for {set j 1} {$j < 255} {incr j} {
   spawn ping -c2 -i0.3 -w1 176.204.$i.$j 
    if { $? == 0 } {
     spawn ssh -l root 176.204.$i.$j hostname
        expect "*yes/no*"
        send "no\r"
                }
     }
}:q
