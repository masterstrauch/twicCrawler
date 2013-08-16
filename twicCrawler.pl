#!/usr/bin/perl

use strict;
use warnings;

use LWP::Simple;

## TODO also include http://www.nowinchess.com/games.php
## TODO start with http://www.looiseschaak.be/downloads/scid/TWIC.zip
## TODO include the pgn's into the existing TWIC-Database!

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
my $matchTwic = '(http:\/\/www.theweekinchess.com\/zips\/twic\d\d\dg.zip)';

 
## Functions
############


# String String -> File
# get a url and filename, writes the content to file

sub urlToFile{
	my($url,$fileName) = @_;
	getstore($url,$fileName) or die 'unable to get page';
}

# String -> Array
# consumes a filename (with twic-website content) and returns an array of download-links

sub findTwicLinks{
	my($fileName,$match) = @_;
	open (IN,"<$fileName");
	my @datei= <IN>;
	close IN;
	my @array;
	foreach(@datei){
 		if($_ =~ /$match/){
    		push @array, $&;
  		} 
	}
	return @array;              
}

# Array  -> PgnFile
# consumes array of downloadLinks, download, unzip and put them together

sub blabla{
	my(@url)=@_;
	@url = keepOnlyNewLinks(@url);
}
#deded
# Array -> Array
# keeps only Links which are not downloaded yet

sub keepOnlyNewLinks{
	my(@url)=@_;
	my @alreadyDownloaded = alreadyDownloadedFiles();
	my @difference;
	my %count;
	foreach my $element (@url,@alreadyDownloaded){$count{$element}++}
	foreach my $element (keys %count){
		if($count{$element} >1){
			push @difference,$element;
		}
	}
	return @difference;
}

#  -> Array
# returns array with already downloaded files, information comes from File $downloadedFiles

sub alreadyDownloadedFiles{
	
}

#my @arr = findTwicLinks($localTwicFile,$matchTwic);
#foreach (@arr){
#	print $_."\n";
#}

use Test::More tests => 1;
my @arr = findTwicLinks($localTwicFile,$matchTwic);
is(\@arr , \@arr,"test1");
