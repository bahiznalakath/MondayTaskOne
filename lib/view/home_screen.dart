import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view/user_details_page.dart';

import '../view_model/users_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UsersProvider>(context, listen: false);
    provider.getData();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<UsersProvider>(
          builder: (context, userData, child) {
            if (userData.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: userData.usersList.length,
                itemBuilder: (context, index) {
                  final user = userData.usersList[index];

                  return Card(
                    elevation: 2,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      leading: CircleAvatar(
                          child: Text(
                        '${user.id}',
                        style: const TextStyle(fontSize: 30),
                      )),
                      title: Text(
                        "${user.name}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text("Email: ${user.email}"),
                          Text("Phone: ${user.phone}"),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserDetailsPage(user: user),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

