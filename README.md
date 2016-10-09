# UofT-Wifi
A CLI to find the congestion of access points on campus.

###Current Functionality:

`UofT-Wifi.sh -n [building]`

outputs the name and current number of connections/AP for [building].

`UofT-Wifi.sh -o [building]`

same as -n, except less verbose and contained on only one line.


`UofT-Wifi.sh -a`

*all*: outputs all buildings on campus, with one line per building

*NOTE: -a currently works, but is ugly.*

Where building is a number from 1-18. They each represent a building on the UTSC campus:
 
1.   AA Arts and Administration Building
2.   AC Academic Resource Center
3.   BW Bladen Wing
4.   HW Humanities Wing
5.   MW Social Sciences Building
6.   SL Student Center
7.   SY Science Reseach Building
8.   SW Science Wing
9.   SRC Student Residence Center
10.  IC Instructional Center
11.  CCC Child Care Center
12.  RC Athletics Center
13.  PO Portables
14.  MLH Miller Lash House
15.  SR1 South Residence 1
16.  SR2 South Residence 2
17.  JFH Joan Foley Hall
18.  NR North Residences

[Here is the site where all this data is grabbed from.](http://utsc.utoronto.ca/webapps/wirelessmap/cwn.php)

#####Changing default directory:
The script automatically keeps all scraped files in the "UTWI" folder, in the same folder the repository is kept. To change the name, change the `DIR` variable at the top of the script. *NOTE: This directory MUST stay in the repo directory. If you move it, it will just be created again. If you wish to do this, use a symlink.*

#####Features to Implement:

`UofT-Wifi.sh -f`
*fastest*: returns the connection with the fewest connections per access point

`UofT-Wifi.sh -b [building]`
*by building*: lets you search buildings using the 2-3 symbol codes

`UofT-Wifi.sh -a`
*all*: outputs all buildings on campus, with one line per building

`UofT-Wifi.sh -c [building]`
*compact*: returns just the connections per access point (useful for scripts) 
