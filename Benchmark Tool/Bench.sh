#!/bin/bash
#####################################################################
# Benchmark Script 2.1 by SavageWS6 from FreeVPS                    #
# Copyright(C) 2015 - SavageWS6                                     #
# License: GNU General Public License 3.0                           #
# Copyright(C) 2015 - 2016 by SavageWS6                             #
# Github: https://github.com/savagews6/bench-sh-2.1                 #
#####################################################################
# Original script by akamaras/camarg                                #
#####################################################################
# Benchmark Script 2 by Hidden Refuge from FreeVPS                  #
# Copyright(C) 2015 - Hidden Refuge                                 #
# License: GNU General Public License 3.0                           #
# Github: https://github.com/hidden-refuge/bench-sh-2               #
#####################################################################
# Original script by akamaras/camarg                                #
# Original: http://www.akamaras.com/linux/linux-server-info-script/ #
# Original Copyright (C) 2011 by akamaras/camarg                    #
#####################################################################
# The speed test was added by dmmcintyre3 from FreeVPS.us as a      #
# modification to the original script.                              #
# Modded Script: https://freevps.us/thread-2252.html                # 
# Copyright (C) 2011 by dmmcintyre3 for the modification            #
#####################################################################
sysinfo () {
	# Removing existing bench.log
	rm -rf $HOME/bench.log
	# Reading out system information...
	# Reading CPU model
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading amount of CPU cores
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	# Reading CPU frequency in MHz
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading total memory in MB
	tram=$( free -m | awk 'NR==2 {print $2}' )
	# Reading Swap in MB
	vram=$( free -m | awk 'NR==4 {print $2}' )
	# Reading system uptime
	up=$( uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading operating system and version (simple, didn't filter the strings at the end...)
	distid=$( lsb_release -i ) #show distributor ID
        releas=$( lsb_release -r ) #show release number
        codename=$( lsb_release -c ) #show codename of distro
	arch=$( uname -m ) # Architecture
	lbit=$( getconf LONG_BIT ) # Architecture in Bit
	hn=$( hostname ) # Hostname
	kern=$( uname -r )
	# Date of benchmark
	bdates=$( date )
	echo "Benchmark started on $bdates" | tee -a $HOME/bench.log
	echo "Full benchmark log: $HOME/bench.log" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Output of results
	echo "System Info" | tee -a $HOME/bench.log
	echo "-----------" | tee -a $HOME/bench.log
	echo "Processor	: $cname" | tee -a $HOME/bench.log
	echo "CPU Cores	: $cores" | tee -a $HOME/bench.log
	echo "Frequency	: $freq MHz" | tee -a $HOME/bench.log
	echo "Memory		: $tram MB" | tee -a $HOME/bench.log
	echo "Swap		: $vram MB" | tee -a $HOME/bench.log
	echo "Uptime		: $up" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "$distid" 		| tee -a $HOME/bench.log
        echo "$releas"  	| tee -a $HOME/bench.log
        echo "$codename" 	| tee -a $HOME/bench.log
	echo "Arch:		$arch ($lbit Bit)" | tee -a $HOME/bench.log
	echo "Kernel:		$kern" | tee -a $HOME/bench.log
	echo "Hostname:       $hn" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest4HEAD () {
	ipiv=$( wget -qO- ipv4.icanhazip.com ) # Getting IPv4
	# Speed test via wget for IPv4 only with 10x 100 MB files. 1 GB bandwidth will be used!
	echo "Speedtest (IPv4 only)" | tee -a $HOME/bench.log
	echo "---------------------" | tee -a $HOME/bench.log
	echo "Your public IPv4 is $ipiv" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Cachefly CDN speed test
	echo "Location		Provider	Speed"	| tee -a $HOME/bench.log
	cachefly=$( wget -4 -O /dev/null http://cachefly.cachefly.net/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "CDN			Cachefly	$cachefly" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest4US () {
	# North Ameriaca speed test
	sldltx=$( wget -4 -O /dev/null http://speedtest.dal05.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Dallas, TX, US		Softlayer	$sldltx " | tee -a $HOME/bench.log
		slwa=$( wget -4 -O /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Seattle, WA, US		Softlayer	$slwa " | tee -a $HOME/bench.log
	slsjc=$( wget -4 -O /dev/null http://speedtest.sjc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "San Jose, CA, US	Softlayer	$slsjc " | tee -a $HOME/bench.log
	slwdc=$( wget -4 -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Washington, DC, US	Softlayer	$slwdc " | tee -a $HOME/bench.log
	lwwdc=$( wget -4 -O /dev/null http://mirror.wdc1.us.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Washington, DC, US	Leaseweb 	$lwwdc " | tee -a $HOME/bench.log
	sfolw=$( wget -4 -O /dev/null http://mirror.sfo12.us.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "San Francisco, CA, US	Leaseweb 	$sfolw " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest4AK () {
	gciak100=$( wget -4 -O /dev/null http://speedtest.gci.com/data/100MB.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Anchorage, AK, US	GCI Communications 100MB	$gciak100 " | tee -a $HOME/bench.log
	gciak1000=$( wget -4 -O /dev/null http://speedtest.gci.com/data/1000MB.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Anchorage, AK, US	GCI Communications 1000MB	$gciak1000 " | tee -a $HOME/bench.log
	gciak10000=$( wget -4 -O /dev/null http://speedtest.gci.com/data/10000MB.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Anchorage, AK, US	GCI Communications 10000MB	$gciak10000 " | tee -a $HOME/bench.log
}
speedtest4AS () {
	# Asia speed test
	linodejp=$( wget -4 -O /dev/null http://speedtest.tokyo.linode.com/100MB-tokyo.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Tokyo, Japan		Linode		$linodejp " | tee -a $HOME/bench.log
	leasewebhk=$( wget -4 -O /dev/null http://mirror.hk.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Hong Kong, China	Leaseweb        $leasewebhk " | tee -a $HOME/bench.log
	leasewebsg=$( wget -4 -O /dev/null http://mirror.sg.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore         	Leaseweb        $leasewebsg " | tee -a $HOME/bench.log
	slsg=$( wget -4 -O /dev/null http://speedtest.sng01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore 		Softlayer	$slsg " | tee -a $HOME/bench.log
	datapacketSG100=$( wget -4 -O /dev/null http://sin.download.datapacket.com/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore		Datapacket 100MB	$datapacketSG100 " | tee -a $HOME/bench.log
	datapacketSG1000=$( wget -4 -O /dev/null http://sin.download.datapacket.com/1000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore		Datapacket 1000MB	$datapacketSG1000 " | tee -a $HOME/bench.log
	datapacketSG10000=$( wget -4 -O /dev/null http://sin.download.datapacket.com/10000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore		Datapacket 10000MB	$datapacketSG10000 " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Australia speed test
	vultraus=$( wget -4 -O /dev/null http://syd-au-ping.vultr.com/vultr.com.100MB.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Sydney, Australia	Vultr		$vultraus " | tee -a $HOME/bench.log
}
speedtest4EU () {
	# Europe speed test
	#	i3d=$( wget -4 -O /dev/null http://mirror.i3d.net/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	#	echo "Rotterdam, Netherlands	id3.net		$i3d" | tee -a $HOME/bench.log
	#	lwger=$( wget -4 -O /dev/null http://mirror.de.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	#	echo "Germany	                Leaseweb	$lwger" | tee -a $HOME/bench.log
	#	lbhar=$( wget -4 -O /dev/null http://mirror.nl.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	#	echo "Haarlem, Netherlands	Leaseweb	$lbhar " | tee -a $HOME/bench.log
	ovhfr=$( wget -4 -O /dev/null http://proof.ovh.net/files/100Mio.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "France			OVH		$ovhfr " | tee -a $HOME/bench.log
	nforceNL100=$( wget -4 -O /dev/null https://mirror.nforce.com/pub/speedtests/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Nforce 100MB	$nforceNL100 " | tee -a $HOME/bench.log
	nforceNL1000=$( wget -4 -O /dev/null https://mirror.nforce.com/pub/speedtests/1000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Nforce 1000MB	$nforceNL1000 " | tee -a $HOME/bench.log
	nforceNL10000=$( wget -4 -O /dev/null https://mirror.nforce.com/pub/speedtests/10000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Nforce 10000MB	$nforceNL10000 " | tee -a $HOME/bench.log
	datapacketNL100=$( wget -4 -O /dev/null http://ams.download.datapacket.com/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Datapacket 100MB	$datapacketNL100 " | tee -a $HOME/bench.log
	datapacketNL1000=$( wget -4 -O /dev/null http://ams.download.datapacket.com/1000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Datapacket 1000MB	$datapacketNL1000 " | tee -a $HOME/bench.log
	datapacketNL10000=$( wget -4 -O /dev/null http://ams.download.datapacket.com/10000mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Netherlands		Datapacket 10000MB	$datapacketNL10000 " | tee -a $HOME/bench.log
	onlnetfr=$( wget -4 -O /dev/null http://ping.online.net/100Mo.dat 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "France			Online.net	$onlnetfr " | tee -a $HOME/bench.log
	hetzger=$( wget -4 -O /dev/null http://speed.hetzner.de/100MB.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Frankfurt, Germany	Hetzner		$hetzger " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest4 () {
	speedtest4HEAD
	speedtest4US
	speedtest4AS
	speedtest4EU
}
speedtest6 () {
	ipvii=$( wget -qO- ipv6.icanhazip.com ) # Getting IPv6
  	# Speed test via wget for IPv6 only with 10x 100 MB files. 1 GB bandwidth will be used! No CDN - Cachefly not IPv6 ready...
  	echo "Speedtest (IPv6 only)" | tee -a $HOME/bench.log
  	echo "---------------------" | tee -a $HOME/bench.log
  	echo "Your public IPv6 is $ipvii" | tee -a $HOME/bench.log
  	echo "" | tee -a $HOME/bench.log
  	echo "Location		Provider	Speed" | tee -a $HOME/bench.log
  	# United States speed test
	v6atl=$( wget -6 -O /dev/null http://speedtest.atlanta.linode.com/100MB-atlanta.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Atlanta, GA, US		Linode		$v6atl" | tee -a $HOME/bench.log
  	v6dal=$( wget -6 -O /dev/null http://speedtest.dallas.linode.com/100MB-dallas.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Dallas, TX, US		Linode		$v6dal" | tee -a $HOME/bench.log
  	v6new=$( wget -6 -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Newark, NJ, US		Linode	 	$v6new" | tee -a $HOME/bench.log
	v6fre=$( wget -6 -O /dev/null http://speedtest.fremont.linode.com/100MB-fremont.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Fremont, CA, US		Linode	 	$v6fre" | tee -a $HOME/bench.log
  	v6chi=$( wget -6 -O /dev/null http://testfile.chi.steadfast.net/data.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Chicago, IL, US		Steadfast	$v6chi" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Asia speed test
  	v6tok=$( wget -6 -O /dev/null http://speedtest.tokyo.linode.com/100MB-tokyo.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Tokyo, Japan		Linode	 	$v6tok" | tee -a $HOME/bench.log
  	v6sin=$( wget -6 -O /dev/null http://speedtest.singapore.linode.com/100MB-singapore.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Singapore		Linode		$v6sin" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Europe speed test
	v6fra=$( wget -6 -O /dev/null http://speedtest.frankfurt.linode.com/100MB-frankfurt.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Frankfurt, Germany	Linode		$v6fra" | tee -a $HOME/bench.log
        v6lon=$( wget -6 -O /dev/null http://speedtest.london.linode.com/100MB-london.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "London, UK		Linode		$v6lon" | tee -a $HOME/bench.log
        v6har=$( wget -6 -O /dev/null http://mirror.nl.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
        echo "Haarlem, Netherlands	Leaseweb	$v6har" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
iotest () {
	echo "Disk Speed" | tee -a $HOME/bench.log
	echo "----------" | tee -a $HOME/bench.log
	# Measuring disk speed with DD
	io=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	io2=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	io3=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Calculating avg I/O (better approach with awk for non int values)
	ioraw=$( echo $io | awk 'NR==1 {print $1}' )
	ioraw2=$( echo $io2 | awk 'NR==1 {print $1}' )
	ioraw3=$( echo $io3 | awk 'NR==1 {print $1}' )
	ioall=$( awk 'BEGIN{print '$ioraw' + '$ioraw2' + '$ioraw3'}' )
	ioavg=$( awk 'BEGIN{print '$ioall'/3}' )
	# Output of DD result
	echo "I/O (1st run)	: $io" | tee -a $HOME/bench.log
	echo "I/O (2nd run)	: $io2" | tee -a $HOME/bench.log
	echo "I/O (3rd run)	: $io3" | tee -a $HOME/bench.log
	echo "Average I/O	: $ioavg MB/s" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
gbench () {
	# Improved version of my code by thirthy_speed https://freevps.us/thread-16943-post-191398.html#pid191398
	echo "" | tee -a $HOME/bench.log
	echo "System Benchmark (Experimental)" | tee -a $HOME/bench.log
	echo "-------------------------------" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "Note: The benchmark might not always work (eg: missing dependencies)." | tee -a $HOME/bench.log
	echo "Failures are highly possible. We're using Geekbench for this test." | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
        gb_page=http://www.primatelabs.com/geekbench/download/linux/
        gb_dl=$(wget -qO - $gb_page | \
                 sed -n 's/.*\(https\?:[^:]*\.tar\.gz\).*/\1/p')
        gb_noext=${gb_dl##*/}
        gb_noext=${gb_noext%.tar.gz} 
        gb_name=${gb_noext//-/ }
	echo "File is located at $gb_dl" | tee -a $HOME/bench.log
	echo "Downloading and extracting $gb_name" | tee -a $HOME/bench.log
        wget -qO - "$gb_dl" | tar xzv 2>&1 >/dev/null
	echo "" | tee -a $HOME/bench.log
	echo "Starting $gb_name" | tee -a $HOME/bench.log
	echo "The system benchmark may take a while." | tee -a $HOME/bench.log
	echo "Don't close your terminal/SSH session!" | tee -a $HOME/bench.log
	echo "All output is redirected into a result file." | tee -a $HOME/bench.log
	echo "" >> $HOME/bench.log
	echo "--- Geekbench Results ---" >> $HOME/bench.log
	sleep 2
	$HOME/dist/$gb_noext/geekbench_x86_32 >> $HOME/bench.log
	echo "--- Geekbench Results End ---" >> $HOME/bench.log
	echo "" >> $HOME/bench.log
	echo "Finished. Removing Geekbench files" | tee -a $HOME/bench.log
	sleep 1
	rm -rf $HOME/dist/
	echo "" | tee -a $HOME/bench.log
        gbl=$(sed -n '/following link/,/following link/ {/following link\|^$/b; p}' $HOME/bench.log | sed 's/^[ \t]*//;s/[ \t]*$//' )
	echo "Benchmark Results: $gbl" | tee -a $HOME/bench.log
	echo "Full report available at $HOME/bench.log" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
hlp () {
	echo ""
	echo "(C) Bench.sh 2 by Hidden Refuge <me at hiddenrefuge got eu dot org>"
	echo ""
	echo "Usage: bench.sh <option>"
	echo ""
	echo "Available options:"
	echo "No option	: System information, IPv4 only speedtest and disk speed & IOPing benchmark will be run."
	echo "-sys		: Displays system information such as CPU, amount CPU cores, RAM and more."
	echo "-io		: Runs a disk speed test and a IOPing benchmark and displays the results."
	echo "-iops		: Runs a extended IOPing test for latency, reading and et cetera."
	echo "-6		: Normal benchmark but with a IPv6 only speedtest (run when you have IPv6)."
	echo "-46		: Normal benchmark with IPv4 and IPv6 speedtest."
	echo "-64		: Same as above."
	echo "-AK		: Normal benchmark but with Alaskan (USA) host added to test."
	echo "-b		: Normal benchmark with IPv4 only speedtest, I/O test and Geekbench system benchmark."
	echo "-b6		: Normal benchmark with IPv6 only speedtest, I/O test and Geekbench system benchmark."
	echo "-b46		: Normal benchmark with IPv4 and IPv6 speedtest, I/O test and Geekbench system benchmark."
	echo "-b64		: Same as above."
	echo "-h		: This help page."
	echo ""
	echo "The Geekbench system benchmark is experimental. So beware of failure!"
	echo ""
}
case $1 in
	'-sys')
		sysinfo;;
	'-io')
		iotest;;
	'-6' )
		sysinfo; speedtest6; iotest;;
	'-46' )
		sysinfo; speedtest4; speedtest6; iotest;;
	'-4eu' )
		sysinfo; speedtest4HEAD; speedtest4EU; iotest;;
	'-64' )
		sysinfo; speedtest4; speedtest6; iotest;;
	'-AK' )
		sysinfo; speedtest4; speedtest4AK; iotest;;
	'-b' )
		sysinfo; speedtest4; iotest; gbench;;
	'-b6' )
		sysinfo; speedtest6; iotest; gbench;;
	'-b46' )
		sysinfo; speedtest4; speedtest6; iotest; gbench;;
	'-b64' )
		sysinfo; speedtest4; speedtest6; iotest; gbench;;
	'-h' )
		hlp;;
	*)
		sysinfo; speedtest4; iotest;;
esac
#################################################################################
# Contributors:									#
# thirthy_speed https://freevps.us/thread-16943-post-191398.html#pid191398 	#
#################################################################################
