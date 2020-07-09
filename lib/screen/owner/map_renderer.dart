import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:user_location/user_location.dart';

class MapBoxScreen extends StatefulWidget {
  @override
  _MapBoxScreenState createState() => _MapBoxScreenState();
}

class _MapBoxScreenState extends State<MapBoxScreen> {
  MapController mapController = MapController();
  UserLocationOptions userLocationOptions;
  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userLocationOptions = UserLocationOptions(
        showMoveToCurrentLocationFloatingActionButton: false,
        updateMapLocationOnPositionChange: false,
        context: context,
        zoomToCurrentLocationOnLoad: true,
        mapController: mapController,
        markers: markers,
        verbose: true);
    return new FlutterMap(
      options: new MapOptions(minZoom: 5.0, maxZoom: 15.0, plugins: [UserLocationPlugin()]),
      layers: [
        new TileLayerOptions(
          urlTemplate: MapStyles.currentTheme,
          additionalOptions: {
            'accessToken': 'sk.eyJ1IjoiY2xvdWRtYXgiLCJhIjoiY2s3YzJzdnN5MGlxMzNxbXJkZXJ0N3RvYyJ9.CwnAoKlXU6qiva_nqqT1mA',
            'id': 'mapbox.mapbox-streets-v7'
          },
        ),
        MarkerLayerOptions(markers: markers),
        userLocationOptions
      ],
      mapController: mapController,
    );
  }
}

class MapStyles {
  static const String lightTheme =
      "https://api.mapbox.com/styles/v1/cloudmax/ck7gad8b306w61iqyejgl3502/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2xvdWRtYXgiLCJhIjoiY2pxbWE4OXlmMHhrbTQzbGY0ZDB6OTBrdyJ9.4TILrjtq1v5eCmMwsbbotQ";
  static const String darkTheme =
      "https://api.mapbox.com/styles/v1/cloudmax/ck7c2vd9t03j31iqura6hp5p4/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiY2xvdWRtYXgiLCJhIjoiY2pxbWE4OXlmMHhrbTQzbGY0ZDB6OTBrdyJ9.4TILrjtq1v5eCmMwsbbotQ";

  static const String currentTheme = darkTheme;
}