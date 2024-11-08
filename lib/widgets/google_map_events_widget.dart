import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stem/src/constants.dart' as globals;
import 'package:stem/widgets/custom_card_with_shadow.dart';

class GoogleMapEventsWidget extends StatefulWidget {
  const GoogleMapEventsWidget({
    super.key,
  });

  @override
  State<GoogleMapEventsWidget> createState() => _GoogleMapStationsCardState();
}

class _GoogleMapStationsCardState extends State<GoogleMapEventsWidget> {
  //late GoogleMapController mapController;

  //final LatLng _kMapCenter = const LatLng(62.79215, 6.91606);

  // final Map<String, Marker> _markers = {};
  // Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // void _onMapCreated(GoogleMapController controller) async {
  //   mapController = controller;
  //   final googleStation = await locations.getGoogleStation();

  //   setState(() {
  //     _markers.clear();
  //     for (final station in googleStation.station) {
  //       final marker = Marker(
  //           markerId: MarkerId(station.id),
  //           position: LatLng(station.lat, station.lng),
  //           infoWindow:
  //               (
  //                 InfoWindow(
  //                   title: station.name, 
  //                   snippet: station.address,
  //                   onTap: () {
  //                      launchUrl(Uri.https('sortere.no', '/kart/kommune/Aukra'));
  //                   },
  //                   )));
  //       _markers[station.id] = marker;
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(FontAwesomeIcons.mapPin, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: Text('Events near you:',
                        style: globals.h1DarkVioletText),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomCardWithShadow(
              width: MediaQuery.of(context).size.width,
              widget: const Column(
                children: [
                  SizedBox(height: 10),
                  Image(
                    height: 250,
                    image: AssetImage('assets/images/map.jpeg')),
                  // SizedBox(
                  //   height: Get.size.width - 100,
                  //   child: Stack(
                  //     children: [
                  //       GoogleMap(
                  //       onMapCreated: _onMapCreated,
                  //       initialCameraPosition:
                  //           CameraPosition(target: _kMapCenter, zoom: 11.0),
                  //           myLocationButtonEnabled: false,
                  //           mapType: MapType.hybrid,
                  //           zoomControlsEnabled: true,
                  //           zoomGesturesEnabled: true,
                  //       markers: _markers.values.toSet(),
                  //     ),
                  //     ]
                  //   ),
                  // ),
                  SizedBox(height: 10),
                ],
              ),
            )
        ),
      ],
    );
  }
}