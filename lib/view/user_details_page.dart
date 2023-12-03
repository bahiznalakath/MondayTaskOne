import 'package:flutter/material.dart';
import '../model/users_model.dart';
import 'google_map.dart'; // Import your user model

class UserDetailsPage extends StatelessWidget {
  final Users user;

  const UserDetailsPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      floatingActionButton: IconButton(
        onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapLocation(user: user),
          ),
        );},
        icon: const Icon(Icons.map_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Username: ${user.username}'),
            const SizedBox(height: 8),
            Text('Email: ${user.email}'),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}'),
            const SizedBox(height: 8),
            Text('Website: ${user.website}'),
            const SizedBox(height: 16),
            const Text('Address:'),
            Text('Street: ${user.address?.street}'),
            Text('Suite: ${user.address?.suite}'),
            Text('City: ${user.address?.city}'),
            Text('Zipcode: ${user.address?.zipcode}'),
            const SizedBox(height: 16),
            const Text('Company:'),
            Text('Name: ${user.company?.name}'),
            Text('Catch Phrase: ${user.company?.catchPhrase}'),
            Text('BS: ${user.company?.bs}'),
          ],
        ),
      ),
    );
  }
}
