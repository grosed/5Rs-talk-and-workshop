# Reproduction Project
## Matthew Darlington, Matthew Davison, Jordan Hood, Ben Lowery, Hamish Thorburn

***

# First Working Paper
Paper title: Active Change-Point Detection
Paper Authors: Shogo Hayashi, Yoshinobu Kawahara, Hisashi Kashima

## Progress timeline

* Have read the paper to see if the paper is feasible.
* Have found what appears to be the data.
* Have found what appears to be the lead authors code repository.

## Code/programming progress

### Data

* In the paper, the authors link to a website where the data used in the paper is available for download.
* Area 0450-09 on https://www.geospatial.jp/ckan/dataset/1976
* We have successfully downloaded the data which can be found in the repository.

### Successes

* Have found a Python file (acpd.py) with functions that seem to do what the paper does.
* We seem to understand what the code is trying to achieve, therefore have an idea on how to replace missing dependencies.

### Current challenges

* There is a package imported in acpd.py that imports a package we can't find (change_point_detection.cpd or change_point_detection). Neither exist under pip.
* The package "bayesianoptimisation" doesn't share a name or the required functions "plot_gp" with common bayesian optimisation packages which are typically imported as the same reference "bo", so it is probable this is also a custom package.
* Utility package is found on pip, but does not share the same import handle of "Utility", and the common python_utils package does not have the required called function.
* The class "ActiveChangePointDetection0" referenced a method that is not predefined in the class of bo. This should be shared from the "bayesianoptimisation" package previously called, but is unprovided by the author.
* The class "ActiveChangePointDetection0" doesn't perform any of the methods outlined in the orginal paper.
* The class "ActiveChangePointDetection" required the unprovided packages, and requires a specific data structure that does not follow the provided data. We hypothesise some data preprocessing occured not outline in the code or paper (Specific col names requred).
* They reference a change point detection method by Kou et al. 2006.
* Kou has a GitHub with R code that uses the average difference method ("avgDIFF") as referenced in the original paper.
* We tried to use the rpy2 package to wrap an established R package for changepoint detection (cpop) into a class that we could pass to the acpd work 
* We had problems getting this up and running (version issues and general use of the rpy2 package)

## Reaching out to authors

### Lead author
The lead author has left the university however has email on the repository (https://github.com/empor10alnho/acpd). Have tried to contact him by this method.

**Initial Email**

> Dear Shogo Hayashi, I'm a researcher at Lancaster University and a team of us has been looking at your paper: Active Change-Point Detection
We would like to replicate the results seen in this paper using the code from the repository: https://github.com/empor10alnho/acpd However, the Py file in this repository requires a package called "change_point_detection" that the file depends on. Can you point us toward where we can get this package to help further our work. Many thanks, Matthew Davison

***Awaiting response***

### (Ex-)Supervisor of the lead author
The supervisor of the lead author still works at Kyoto Univeristy so we have emailed them to ask if they can help (kashima@i.kyoto-u.ac.jp).

**Initial Email**

> Dear Hisashi Kashima, I'm a researcher at Lancaster University and a team of us has been looking at the paper: Active Change-Point Detection. I am contacting you as I have not been able to contact the lead author for this paper. We have been trying to replicate the results seen in this paper and have found parts of the python code used to get results however we are missing some of the elements required for this code to run. Do you think you could help us with this? Many thanks, Matthew

**Follow-up**

> Dear Matthew, Thanks for your interest in our work. I myself do not maintain the codes, so I will forward your message to the first author. But I am not sure his availability because he already graduated from the university and is currently in industry... Best, Hisashi

***Communication completed***

