Network file system performance benchmarking
====================
###Goal###
To accurately be measure the performance of different network file systems under different networks behaviors.

###Approach###
Setup 3 virtualboxes(A,B,C) logically linked A<->B<->C and route traffic from A to C throuh B. On B configure linux netem to simulate various network conditions and from A->C measure the performance of various network protocols. 

###Protocols to investigate###
* Raw TCP (reference point) 
* Raw UDP (reference point)
* FTP
* HTTP/HTTPS
* * GET
* * PUT 
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
