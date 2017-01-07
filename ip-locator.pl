#!/usr/bin/perl
# Ip Geolocation 
#By : Z-hacker


use Socket;
use Term::ANSIColor;
use WWW::Mechanize;
use JSON;
  
 
print color 'bold bright_green';
 
print q{

      _____          _                _             
     |__  /         | |__   __ _  ___| | _____ _ __ 
       / /   _____  | '_ \ / _` |/ __| |/ / _ \ '__|
      / /_  |_____| | | | | (_| | (__|   <  __/ |   
     /____|         |_| |_|\__,_|\___|_|\_\___|_|   
                                               
             ___ ____            _                 _             
            |_ _|  _ \          | | ___   ___ __ _| |_ ___  _ __ 
             | || |_) |  _____  | |/ _ \ / __/ _` | __/ _ \| '__|
             | ||  __/  |_____| | | (_) | (_| (_| | || (_) | |   
            |___|_|             |_|\___/ \___\__,_|\__\___/|_|   
                                                            

                  Ip Geolocation Tool  
                  By : Z-hacker                                           

       ------------------------------------   
             [FOLLOW US ON YOUTUBE]          :. https://goo.gl/83QFyp .:
       ------------------------------------   
};


 
print color 'bold bright_green';
@iphost=$ARGV[0] || die "Usage : ./ip-locator.pl  [Targets IP] \n        ./ip-locator.pl  [domain] \n        ./ip-locator.pl  [host] \n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "city": "CITY",
#    "zip": "ZIP CODE",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print color 'bold bright_white';
print "     [!] IP: ", $info->{'query'}, "\n";
print color 'bold bright_red';
print "-----------------------------------------\n"; 
print color 'bold bright_green';
print "     [+] ORG: ", $info->{'as'}, "\n";
print "     [+] ISP: ", $info->{'isp'}, "\n";
print "     [+] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "     [+] Region: ", $info->{'regionName'}, " - " , $info->{'region'}, "\n";
print "     [+] City: ", $info->{'city'}, "\n";
print color 'red';
print q{     [!] Location: Might not be accurate 
}; "\n";
print color 'bold bright_blue';
print "     [+] Geo: ", "Latitude: " , $info->{'lat'}, " - Longitude: ", $info->{'lon'}, "\n";
print "     [+] Geolocation: ", "Lat: " , $info->{'lat'}, " - Lat: ", $info->{'lat'}, "\n";
print color 'bold bright_green';
print "     [+] Timezone: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "     [+] As number/name: ", "as: " , $info->{'as'}, " - Long: ", $info->{'as'}, "\n";
print "     [+] ORG name: ", $info->{'as'}, "\n";
print "     [+] Country code: ", $info->{'countryCode'}, "\n";
print color 'bold bright_red';
print "     [+] Status: ", $info->{'status'}, "\n"; 
print "\n";
# EOF
