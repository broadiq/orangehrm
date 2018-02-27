![](https://www.orangehrm.com/images/MainLogo.png)



# OrangeHRM Open Source Application

OrangeHRM is a comprehensive Human Resource Management (HRM) System that captures all the essential functionalities required for any enterprise. Copyright (C) 2006 OrangeHRM Inc., http://www.orangehrm.com/

OrangeHRM is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the License, or (at your option) any later version.

OrangeHRM is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## Getting started



## Issues

# An internal error occurred

After the application is running and there are messages with "An internal error occurred" being shown on the screen (especially when you click on PIM or Projects), you might have an database issue.  The following command will remove ONLY_FULL_GROUP_BY from mysql so that OrangeHRM can make the correct query. 


```
mysql > SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
```
