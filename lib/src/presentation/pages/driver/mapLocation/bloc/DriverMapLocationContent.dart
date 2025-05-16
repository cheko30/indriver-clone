import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationState.dart';
import 'package:indrive_clone_flutter/src/presentation/widgets/DefaultButton.dart';

class DriverMapLocationContent extends StatelessWidget {
  DriverMapLocationState state;
  DriverMapLocationContent(this.state, {super.key});

  TextEditingController pickUpcontroller = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _googleMaps(context),
        Container(
          alignment: Alignment.bottomCenter,
          child: Defaultbutton(
            onPressed: () {
              context.read<DriverMapLocationBloc>().add(StopLocation());
            },
            text: 'DETENER LOCALIZACIÓN',
            margin: EdgeInsets.only(left: 50, right: 50, bottom: 50),
          ),
        ),
      ],
    );
  }

  Widget _googleMaps(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: state.cameraPosition,
      markers: Set<Marker>.of(state.markers!.values),
      onMapCreated: (GoogleMapController controller) {
        controller.setMapStyle(
            '[ { "elementType": "geometry", "stylers": [ { "color": "#212121" } ] }, { "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#212121" } ] }, { "featureType": "administrative", "elementType": "geometry", "stylers": [ { "color": "#757575" } ] }, { "featureType": "administrative.country", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] }, { "featureType": "administrative.land_parcel", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.locality", "elementType": "labels.text.fill", "stylers": [ { "color": "#bdbdbd" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "color": "#181818" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "poi.park", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1b1b1b" } ] }, { "featureType": "road", "elementType": "geometry.fill", "stylers": [ { "color": "#2c2c2c" } ] }, { "featureType": "road", "elementType": "labels.text.fill", "stylers": [ { "color": "#8a8a8a" } ] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [ { "color": "#373737" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#3c3c3c" } ] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry", "stylers": [ { "color": "#4e4e4e" } ] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "transit", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#000000" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#3d3d3d" } ] } ]');
        if (!state.controller!.isCompleted) {
          state.controller?.complete(controller);
        }
      },
    );
  }
}
