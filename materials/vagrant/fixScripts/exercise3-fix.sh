#!/bin/bash
#add fix to exercise3 here
echo '<Location "/">
          Require all granted
		  </Location>' >> /etc/apache2/sites-available/000-default.conf
service  apache2 reload