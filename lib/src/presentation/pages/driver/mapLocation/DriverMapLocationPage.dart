import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationBloc.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationContent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationEvent.dart';
import 'package:indrive_clone_flutter/src/presentation/pages/driver/mapLocation/bloc/DriverMapLocationState.dart';

class DriverMapLocationPage extends StatefulWidget {
  const DriverMapLocationPage({super.key});

  @override
  State<DriverMapLocationPage> createState() => _DriverMapLocationPageState();
}

class _DriverMapLocationPageState extends State<DriverMapLocationPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DriverMapLocationBloc>().add(DriverMapLocationInitEvent());
      context.read<DriverMapLocationBloc>().add(ConnectSocketIO());
      context.read<DriverMapLocationBloc>().add(FindPosition());
    });
  }

  @override
  void dispose() {
    super.dispose();
    SchedulerBinding.instance.addPostFrameCallback((timestamp) {
      if (mounted) {
        context.read<DriverMapLocationBloc>().add(DisconnectSocketIO());
        context.read<DriverMapLocationBloc>().add(StopLocation());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DriverMapLocationBloc, DriverMapLocationState>(
        builder: (context, state) {
          return DriverMapLocationContent(state);
        },
      ),
    );
  }
}
