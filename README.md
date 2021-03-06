Network file system performance benchmarking
====================
###Goal###
To accurately be measure the performance of different network file systems under different networks behaviors.

###Approach###
Setup 3 virtualboxes(A,B,C) logically linked A<->B<->C and route traffic from A to C throuh B. On B configure linux netem to simulate various network conditions and from A->C measure the performance of various network protocols. 

###Delimitations###
We aim to investigate each protocol's individual overhead over IP and not the underlying IP + TCP/UDP performance. This menas that we will use a raw UDP and TCP baseline as a comparisson. The goal is not to capture known issues with IP and control protocols but rather figure out how each file-protocol woks on top the other protocols. 
For example: A protocol utizling TCP will have the effects of the 3-way handshake and slow start ignored once, however if the procol makes use of several connections for it's file transfers those effects will be accounted for as they are side effects of the protocol design.  

###Protocols to investigate###
* Raw TCP (reference point) 
* Raw UDP (reference point)
* FTP
* HTTP/HTTPS v1.1
* * GET
* * PUT 
* HTTP v2
* * GET
* * POST
* NFS 
* SMB
* SCP
* Rsync


###Files to use in test###
Multiple small files : 5
* 500 1kb files, 
* 500 2kb files, 
* 500 8kb files, 
* 500 20kb files, 
* 500 100Kb files
Multiple medium sized files : 
* 20 500kb files 
* 20 5000kb files
* 20 50000kb files
Few large files. 
* 10 100Mb files 
* 10 500MB files
* 2 1000MB files

All the files will be generated with both random data (/dev/random) and all zeros (/dev/zero) to also include any compression algorithms in play.


###Network metrics to vary###
* link bandwidth
* delay
* jitter 
* packet loss
* packet reordering 
* packet duplication
* packet corruption


#Expriment log#

###Software used###
Host Operating system : Windows 7, 64 Bit.
Hypervisor : Oracle virtualbox 4.3.6
OS : ubuntu-14.04.1-server-amd64

###Software used - Virtualized Networking Hosts###
iperf - Establishing a baseline for raw TCP / UDP performance giving each network configuration. 
iproute2 / netem - To emulate WAN connection properties

*Installation Steps*
 * apt-get update
 * apt-get install vsftpd openssh-server samba nginx nfs-kernel-server

#### Network setup ####

Host A <-> Host B <-> Host C

## Host A ##
ip 192.168.200.2
network 255.255.255.0
default route : 192.168.200.1

## Host B ##
*Network card 1*
ip 192.168.200.1
network 255.255.255.0

*Network card 2*
ip 192.168.201.1
network 255.255.255.0

## Host C ##
ip 192.168.201.2
network 255.255.255.0
default route : 192.168.201.1

