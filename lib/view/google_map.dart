import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/model/users_model.dart';

class MapLocation extends StatelessWidget {
  final Users user;

  const MapLocation({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            double.parse(user.address?.geo?.lat ?? '0.0'),
            double.parse(user.address?.geo?.lng ?? '0.0'),
          ),
          zoom: 14.0,
        ),
        markers: <Marker>[
          Marker(
            markerId: MarkerId('user_location'),
            position: LatLng(
              double.parse(user.address?.geo?.lat ?? '0.0'),
              double.parse(user.address?.geo?.lng ?? '0.0'),
            ),
            infoWindow: InfoWindow(
              title: user.name ?? 'User Name',
            ),
          ),
        ].toSet(),
      ),
    );
  }
}
