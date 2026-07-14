import 'package:flutter/material.dart';
import '../modules/user_model.dart';

class UserDetailsScreen extends StatelessWidget {
  final UserModel user;

  const UserDetailsScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

             CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                "https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}",

              ),
            ),

            const SizedBox(height: 20),

            buildInfo("Name", user.name),

            buildInfo("Email", user.email),

            buildInfo("Phone", user.phone),

            buildInfo("Website", user.website),

            buildInfo("Company", user.company),

            buildInfo("Address", user.address),
          ],
        ),
      ),
    );
  }

  Widget buildInfo(String title, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }
}