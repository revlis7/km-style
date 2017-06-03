/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land-low[zoom<=7],
#land-high[zoom>7] {
  line-color: @land;
  polygon-fill: @land;
  polygon-gamma: 0.75;
}

#landuse_gen0[zoom>6][zoom<=9],
#landuse_gen1[zoom>=9][zoom<=12] {
  [type='forest']        { polygon-fill: @wooded; }
  [type='park']          { polygon-fill: @park; }
  [type='wood']          { polygon-fill: @wooded; }
}

#landuse[zoom>=13] {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='common']        { polygon-fill: @park; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='golf_course']   { polygon-fill: @grass; }
  [type='grass']         { polygon-fill: @grass; }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  /* [type='pedestrian']    { polygon-fill: @pedestrian_fill; } */
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-fill: @wooded; }
}

/* ---- BUILDINGS ---- */
#buildings[zoom>=15] {
  polygon-fill: @building;
  polygon-opacity: 0.9;
  line-color: darken(@building, 5%);
  line-width: 0.2;
  [zoom=16] {
    line-color: darken(@building, 10%);
    line-width: 0.4;
  }
}

// At the highest zoom levels, render buildings in fancy pseudo-3D.
// Ordering polygons by their Y-position is necessary for this effect
// so we use a separate layer that does this for us.

// uncomment for 3d buildings at zoom 16
/* #buildings[zoom>=16][type != 'hedge'] {
  building-fill: @building;
  building-height: 4;
}

#buildings[zoom>=16][type = 'hedge'] {
  building-fill: @wooded;
  building-height: 2;
} */

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>5][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12] {
  polygon-fill: @water;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway_low[zoom>=9][zoom<=12] {
  line-color: @water;
  [zoom=8] { line-width: 0.1; }
  [zoom=9] { line-width: 0.2; }
  [zoom=10]{ line-width: 0.4; }
  [zoom=11]{ line-width: 0.6; }
  [zoom=12]{ line-width: 0.8; }
}

#waterway_med[zoom>=13][zoom<=14] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=13]{ line-width: 1; }
    [zoom=14]{ line-width: 1.5; }
  }
  [type='stream'] {
    [zoom=13]{ line-width: 0.2; }
    [zoom=14]{ line-width: 0.4; }
  }
}
  
#waterway_high[zoom>=15] {
  line-color: @water;
  [type='river'],
  [type='canal'] {
    line-cap: round;
    line-join: round;
    [zoom=15]{ line-width: 2; }
    [zoom=16]{ line-width: 3; }
  }
  [type='stream'] {
    [zoom=15]{ line-width: 0.6; }
    [zoom=16]{ line-width: 0.8; }
  }
  [type='ditch'],
  [type='drain'] {
    [zoom=15]{ line-width: 0.1; }
    [zoom=16]{ line-width: 0.3; }
  }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */

#admin-low[zoom>=3][zoom<=7] {
  [iso_a2='AT'],
  [iso_a2='CH'],
  [iso_a2='DE'],
  [iso_a2='NL'] {
    line-color: @admin_2;
    line-opacity: 0.1;
    line-width: 0.5;
  }
}

#admin-high[zoom>7] {
  [ISO_A2='AT'],
  [ISO_A2='CH'],
  [ISO_A2='DE'],
  [ISO_A2='NL'], {
    line-color: @admin_2;
    line-opacity: 0.1;
    line-width: 1;
  }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */

#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5%);

}
