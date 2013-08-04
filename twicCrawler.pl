#!/usr/bin/perl

use strict;
use warnings;

use LWP::Simple;

## Constants
############
my $twicUrl = 'http://www.theweekinchess.com/twic';
my $localTwicFile = 'twic.html';
my $localLoadedUrlsFile = 'loaded.txt';
my $twicDatabase = 'twic.pgn';

## DataDefinition
#################

# array of Strings
# contains all urls with zipped pgn-files
my @url;

# string
# matchstring for zipped pgns at $twicUrl
my $match = 'http://www.theweekinchess.com/zips/twic\d\d\dg.zip';

 
## Functions
############


# String String -> File
# get a url and filename, writes the content to file

function urlToFile($url,$fileName){
  getstore($twicUrl,$localTwicFile) or die 'unable to get page';
}

# String -> Array
# consumes a filename and reads it content into an array

function readFile($fileName
A
A
A
open (IN,"<twic.html");
my @datei= <IN>;
close IN;
my @array;
foreach(@datei){
 #push @array, $_=~ /(<a.*?<\/a>)/gis; 
  if ($_=~ / href\=([\"\']*)(.*?)\1[\s\/>]/is) {
    push @array, $2;
  } 
}

print $array[0];
