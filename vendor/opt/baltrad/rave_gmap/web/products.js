function RadarProduct() {
  this.product = '';
  this.description = '';
  this.lon = 0.0;
  this.lat = 0.0;
  zoom = 5;
  this.nelon = 0.0;
  this.nelat = 0.0;
  this.swlon = 0.0;
  this.swlat = 0.0;
}

var radar_products = {};

var radar_option_list = new Array();

//Product eesur_gmaps 
radar_products['eesur_gmaps'] = new RadarProduct;
radar_products['eesur_gmaps'].description = 'Sürgavere';
radar_products['eesur_gmaps'].lon = 25.5187;
radar_products['eesur_gmaps'].lat = 58.4823; 
radar_products['eesur_gmaps'].zoom = 6;
radar_products['eesur_gmaps'].nelon = 29.831;
radar_products['eesur_gmaps'].nelat = 60.7361;
radar_products['eesur_gmaps'].swlon = 21.2072;
radar_products['eesur_gmaps'].swlat = 56.2306;
radar_option_list[0] = 'eesur_gmaps';

