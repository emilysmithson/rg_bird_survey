import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'package:rg_bird_survey/models/bird_box.dart';

import 'package:user_location/user_location.dart';
import 'package:rg_bird_survey/providers/birdboxes_provider.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

import 'bird_box_information.dart';

class MapPage extends StatefulWidget {
  MapPage();

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;

  String initText = 'coordinates: ';
  bool treeInfoOpen = false;
  proj4.Point point = proj4.Point(x: 65.05166470332148, y: -19.171744826394896);

  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {

    userLocationOptions = UserLocationOptions(
        context: context,
        mapController: mapController,
        markers: BirdBoxes.birdBoxesList,
        defaultZoom: 17,
        zoomToCurrentLocationOnLoad: false,
        updateMapLocationOnPositionChange: false);

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          plugins: [
            UserLocationPlugin(),
            PopupMarkerPlugin(),
          ],
          center: LatLng(51.4735, -2.607506),
          zoom: 16.65,
          maxZoom: 19,
          onTap: (_) => _popupLayerController
              .hidePopup(),
          ),

        mapController: mapController,
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            tileProvider: NonCachingNetworkTileProvider(),
          ),
          MarkerLayerOptions(markers: BirdBoxes.birdBoxesList),
          PopupMarkerLayerOptions(
            markers: BirdBoxes.birdBoxesList,
            popupSnap: PopupSnap.top,
            popupController: _popupLayerController,
            popupBuilder: (BuildContext _, Marker marker) => PopUp(marker),
          ),
        //  userLocationOptions,
        ],
      ),
    );
  }
}

class PopUp extends StatefulWidget {
  final Marker marker;
  PopUp(this.marker, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PopUpState(this.marker);
}

class _PopUpState extends State<PopUp> {
  final BirdBox _marker;
  _PopUpState(this._marker);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    _marker.boxType.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(mainAxisSize: MainAxisSize.min,mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  constraints: BoxConstraints(
                      minWidth: 100,
                      maxWidth: MediaQuery.of(context).size.width - 96 - 100),
                  child: Text('Bird Box '+
                    _marker.id.toString(),
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Text(
                    _marker.locationDescription,
               overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),)
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Icon(Icons.info, color: Colors.blue)),
          ],
        ),
        onTap: () => setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BirdBoxInformation(_marker.id-1)),);
        }),
      ),
    );
  }
}
