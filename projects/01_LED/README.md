# 01 LED
## Goals
The goal of this project was the following:
* Create a interface between the PS node and the LEDS of the PYNQ-Z2
## Lessons Learned
While the task itself ios easy this also allowed me to learn to setup git with vivado development. Which was arguably the more important lesson. I got a bit of the basics of TCL and the whole project can be generated easily by running 01_LED/vivado/build_project.tcl. 

I learned that vivado itself generates a lot(and really a lot) of not so usefull artifacts. It is therefor better to keep eveythin needed to construct the projects(source files, constrains,..) and a export of the block diagram and then construct the project starting from there.

