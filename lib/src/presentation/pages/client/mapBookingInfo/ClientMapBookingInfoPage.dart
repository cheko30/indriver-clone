import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/ClientMapBookingInfoContent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/client/mapBookingInfo/bloc/ClientMapBookingInfoState.dart';

class ClientMapBookingInfoPage extends StatefulWidget {
  const ClientMapBookingInfoPage({super.key});

  @override
  State<ClientMapBookingInfoPage> createState() =>
      _ClientMapBookingInfoPageState();
}

class _ClientMapBookingInfoPageState extends State<ClientMapBookingInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      context
          .read<ClientMapBookingInfoBloc>()
          .add(ClientMapBookingInfoInitEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    LatLng pickUpLatLng = arguments['pickUpLatLng'];
    LatLng destinationLatLng = arguments['detinationLatLng'];
    String pickUpDescription = arguments['pickUpDescription'];
    String destinationDescription = arguments['destinationDescription'];

    return Scaffold(
      body: BlocBuilder<ClientMapBookingInfoBloc, ClientMapBookingInfoState>(
        builder: (context, state) {
          return ClientMapBookingInfoContent(state);
        },
      ),
    );
  }
}
