import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/material.dart';

import 'box_type.dart';

class BirdBox extends Marker{
  int id;
  LatLng location;
  String locationDescription;
  BoxType boxType;
  BirdBox(this.id, this.location, this.boxType, this.locationDescription): super(
    anchorPos: AnchorPos.align(AnchorAlign.top),
    height: 40,
    width: 40,
    point: location,
    builder: (BuildContext ctx) => Stack(
      children: [
        Icon(
          Icons.location_pin,
          color: Colors.green[900],
          size: 40,
        ),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Container(width: 10, height: 10, color: Colors.green[900]),
            )),
        Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(id.toString(), style: TextStyle(color: Colors.white, fontSize: 16)),
            ))
      ],
    ),
  );
}