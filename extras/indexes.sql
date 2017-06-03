
CREATE INDEX idx_poly_buildings0 ON planet_osm_polygon USING gist (way)
WHERE (building NOT IN ('', '0', 'false', 'no'));

CREATE INDEX idx_poly_natural0 ON planet_osm_polygon USING gist (way)
WHERE ("natural" IN ('water', 'pond'));

CREATE INDEX idx_poly_waterway0 ON planet_osm_polygon USING gist (way)
WHERE (waterway IN ('basin', 'canal', 'mill_pond', 'pond', 'riverbank', 'stream'));

CREATE INDEX idx_poly_water_gen10 ON planet_osm_polygon USING gist (way)
WHERE (
  (way_area > '10000'::double precision) AND 
  (
    ("natural" = ANY ('{water,pond}'::text[])) OR 
    (waterway = ANY ('{basin,canal,mill_pond,pond,riverbank,stream}'::text[]))
  )
);

CREATE INDEX idx_poly_water_gen00 ON planet_osm_polygon USING gist (way)
WHERE (
  (way_area > '200000'::double precision) AND 
  (
    ("natural" = ANY ('{water,pond}'::text[])) OR 
    (waterway = ANY ('{basin,canal,mill_pond,pond,riverbank,stream}'::text[]))
  )
);

CREATE INDEX idx_poly_landuse_gen00 ON planet_osm_polygon USING gist (way)
WHERE (
  (way_area > '10000000'::double precision) AND 
  (landuse = 'forest'::text)
);

CREATE INDEX idx_poly_landuse_gen10 ON planet_osm_polygon USING gist (way)
WHERE (
  (way_area > '2500000'::double precision) AND 
  (landuse = ANY ('{forest,park,wood}'::text[]))
);

CREATE INDEX idx_poly_landuse0 ON planet_osm_polygon USING gist (way);


CREATE INDEX idx_road_roads_med0 ON planet_osm_roads USING gist (way)
WHERE (highway = ANY ('{motorway,trunk,primary,secondary,motorway_link,trunk_link}'::text[]));

CREATE INDEX idx_road_roads_low0 ON planet_osm_roads USING gist (way)
WHERE (highway = ANY ('{motorway,trunk}'::text[]));


CREATE INDEX idx_line_aeroway0 ON planet_osm_line USING gist (way)
WHERE (aeroway = ANY ('{apron,runway,taxiway}'::text[]));

CREATE INDEX idx_line_tunnel0 ON planet_osm_line USING gist (way) 
WHERE (tunnel IS NOT NULL);

CREATE INDEX idx_line_bridge0 ON planet_osm_line USING gist (way) 
WHERE (bridge IS NOT NULL);

CREATE INDEX idx_line_highway0 ON planet_osm_line USING gist (way) 
WHERE (highway IS NOT NULL);

CREATE INDEX idx_line_railway0 ON planet_osm_line USING gist (way) 
WHERE (railway IS NOT NULL);


CREATE INDEX idx_point_places0 ON planet_osm_point USING gist (way) 
WHERE (
  place = ANY ('{country,state,city,town,village,hamlet,suburb,neighbourhood,locality}'::text[])
);

CREATE INDEX idx_point_pois0 ON planet_osm_point USING gist (way) 
WHERE (
  amenity = ANY ('{university,hospital,school,library,police,hospital}'::text[])
);


