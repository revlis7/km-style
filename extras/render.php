<?php

# apt-get install php5-cli

// php render.php 3.120,45.737,17.358,55.078

define('METATILE', 8);
define('N', 2);

$input = array_key_exists( '1', $argv ) ? $argv['1'] : '3.120,45.737,17.358,55.078';

$coords = explode(',', $input);

# min-x & max-y: bottom left
# max-x & min-y: top right

for ($z = 7; $z <= 14; $z++) {
  
  $leftX = $coords[0];
  $bottomY = $coords[1];
  
  $rightX = $coords[2];
  $topY = $coords[3];
  
  $minX = floor((($leftX + 180) / 360) * pow(2, $z));
  $maxX = ceil((($rightX + 180) / 360) * pow(2, $z));
  
  $minY = floor((1 - log(tan(deg2rad($topY)) + 1 / cos(deg2rad($topY))) / pi()) / 2 * pow(2, $z));
  $maxY = ceil((1 - log(tan(deg2rad($bottomY)) + 1 / cos(deg2rad($bottomY))) / pi()) / 2 * pow(2, $z));
  
  $minX -= $minX % METATILE;
  $maxX += (-1 * ($maxX % METATILE)) + (METATILE - 1);
  
  $minY -= $minY % METATILE;
  $maxY += ($maxY % METATILE) - 1;
  
  // render_list -n 2 -m kaufmich -a -f -z 7 -Z 7 --min-x=65 --max-x=70 --min-y=40 --max-y=45
  printf("render_list -n %d -m kaufmich -a -f -z %d -Z %d --min-x=%d --max-x=%d --min-y=%d --max-y=%d\n", 
    N, $z, $z, $minX, $maxX, $minY, $maxY);
  
}
