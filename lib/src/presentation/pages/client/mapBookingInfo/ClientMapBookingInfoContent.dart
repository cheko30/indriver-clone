import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoState.dart';
import 'package:indrive_clone_flutter/src/presentation/widgets/DefaultIconBack.dart';
import 'package:indrive_clone_flutter/src/presentation/widgets/DefaultTextField.dart';

class ClientMapBookingInfoContent extends StatelessWidget {
  ClientMapBookingInfoState state;
  ClientMapBookingInfoContent(this.state);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _googleMaps(context),
        Align(
            alignment: Alignment.bottomCenter,
            child: _cardBookingInfo(context)),
        Container(
          margin: EdgeInsets.only(top: 50, left: 50),
          child: DefaultIconBack(),
        ),
      ],
    );
  }

  Widget _cardBookingInfo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Recoger en',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              'Domicilio Conocido 123',
              style: TextStyle(fontSize: 13),
            ),
            leading: Icon(Icons.location_on_outlined),
          ),
          ListTile(
            title: Text(
              'Dejar en',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              'Domicilio Conocido 123',
              style: TextStyle(fontSize: 13),
            ),
            leading: Icon(Icons.my_location_outlined),
          ),
          ListTile(
            title: Text(
              'Tiempo y distancia aproximados',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              '0Km 0Min',
              style: TextStyle(fontSize: 13),
            ),
            leading: Icon(Icons.timer_outlined),
          ),
          ListTile(
            title: Text(
              'Precio aproximado del viaje',
              style: TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              '0\$',
              style: TextStyle(fontSize: 13),
            ),
            leading: Icon(Icons.attach_money_outlined),
          ),
          DefaultTextField(
            margin: EdgeInsets.only(left: 10, right: 10),
            text: 'OFRECE TU TARIFA',
            icon: Icons.attach_money_outlined,
            onChanged: (text) {},
          ),
          _actionProfile('BUSCAR CONDUCTOR', Icons.search_outlined, () {}),
        ],
      ),
    );
  }

  Widget _actionProfile(String option, IconData icon, Function() function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.only(left: 0, right: 0, top: 15),
        child: ListTile(
          title: Text(
            option,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: const [
                        Color.fromARGB(255, 14, 29, 106),
                        Color.fromARGB(255, 30, 112, 227)
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Icon(
                icon,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

  Widget _googleMaps(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.53,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: state.cameraPosition,
        markers: Set<Marker>.of(state.markers.values),
        polylines: Set<Polyline>.of(state.polylines.values),
        style:
            '[ { "elementType": "geometry", "stylers": [ { "color": "#212121" } ] }, { "elementType": "labels.icon", "stylers": [ { "visibility": "off" } ] }, { "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "elementType": "labels.text.stroke", "stylers": [ { "color": "#212121" } ] }, { "featureType": "administrative", "elementType": "geometry", "stylers": [ { "color": "#757575" } ] }, { "featureType": "administrative.country", "elementType": "labels.text.fill", "stylers": [ { "color": "#9e9e9e" } ] }, { "featureType": "administrative.land_parcel", "stylers": [ { "visibility": "off" } ] }, { "featureType": "administrative.locality", "elementType": "labels.text.fill", "stylers": [ { "color": "#bdbdbd" } ] }, { "featureType": "poi", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "poi.park", "elementType": "geometry", "stylers": [ { "color": "#181818" } ] }, { "featureType": "poi.park", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "poi.park", "elementType": "labels.text.stroke", "stylers": [ { "color": "#1b1b1b" } ] }, { "featureType": "road", "elementType": "geometry.fill", "stylers": [ { "color": "#2c2c2c" } ] }, { "featureType": "road", "elementType": "labels.text.fill", "stylers": [ { "color": "#8a8a8a" } ] }, { "featureType": "road.arterial", "elementType": "geometry", "stylers": [ { "color": "#373737" } ] }, { "featureType": "road.highway", "elementType": "geometry", "stylers": [ { "color": "#3c3c3c" } ] }, { "featureType": "road.highway.controlled_access", "elementType": "geometry", "stylers": [ { "color": "#4e4e4e" } ] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [ { "color": "#616161" } ] }, { "featureType": "transit", "elementType": "labels.text.fill", "stylers": [ { "color": "#757575" } ] }, { "featureType": "water", "elementType": "geometry", "stylers": [ { "color": "#000000" } ] }, { "featureType": "water", "elementType": "labels.text.fill", "stylers": [ { "color": "#3d3d3d" } ] } ]',
        onMapCreated: (GoogleMapController controller) {
          if (!state.controller!.isCompleted) {
            state.controller?.complete(controller);
          }
        },
      ),
    );
  }
}
