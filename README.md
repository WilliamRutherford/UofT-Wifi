# UofT-Wifi
A CLI to find the congestion of access points on campus.

####Installation
run this command to install UofT-Wifi:
` git clone https://github.com/WilliamRutherford/UofT-Wifi.git && chmod +x install.sh && ./UofT-Wifi/install.sh`

###Current Functionality:

`UofT-Wifi.sh -n [building]`

*name*: outputs the name and current number of connections/AP for [building].

`UofT-Wifi.sh -o [building]`

*only*: same as -n, except less verbose and contained on only one line.

`UofT-Wifi.sh -c [building]`

*compact*: returns just the connections per access point (useful for scripts) 

`UofT-Wifi.sh -b [building code]`

*by building*: lets you search buildings using the 2-3 symbol codes

`UofT-Wifi.sh -a`

*all*: outputs all buildings on campus, with one line per building

###Arguments:

[building]  [building code] [building name]
 
1.   AA   Arts and Administration Building
2.   AC   Academic Resource Center
3.   BW   Bladen Wing
4.   HW   Humanities Wing
5.   MW   Social Sciences Building
6.   SL   Student Center
7.   SY   Science Reseach Building
8.   SW   Science Wing
9.   SRC  Student Residence Center
10.  IC   Instructional Center
11.  CCC  Child Care Center
12.  RC   Athletics Center
13.  PO   Portables
14.  MLH  Miller Lash House
15.  SR1  South Residence 1
16.  SR2  South Residence 2
17.  JFH  Joan Foley Hall
18.  NR   North Residences

####Source:

[Here is the site where all this data is grabbed from.](http://utsc.utoronto.ca/webapps/wirelessmap/cwn.php)

####Dependencies:

Uses wget to grab pages. Uses grep and sed to parse text.

#####Changing default directory:
The  DIR variable should refer to the directory where the repo is located. NAME can be any valid directory name, and will be where all page info is stored.

#####Features to Implement:

`UofT-Wifi.sh -f`
*fastest*: returns the connection with the fewest connections per access point

