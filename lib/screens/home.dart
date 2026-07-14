import 'package:flutter/material.dart';

import '../modules/user_model.dart';
import '../services/api_service.dart';
import '../users/users_details.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<List<UserModel>> users;

  @override
  void initState() {
    super.initState();

    users = ApiService().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("User Management App"),
        centerTitle: true,
      ),

      body: FutureBuilder<List<UserModel>>(

        future: users,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const LoadingWidget();
          }

          if (snapshot.hasError) {

            return CustomErrorWidget(
              message: "Failed to load users.\nPlease try again.",
              onRetry: () {
                setState(() {
                  users = ApiService().fetchUsers();
                });
              },
            );
          }

          final userList = snapshot.data!;

          return  RefreshIndicator(
            onRefresh: () async {
              setState(() {
                users = ApiService().fetchUsers();
              });

              await users;
            },
            child: ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                final user = userList[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      //child: Icon(Icons.person),
                      backgroundImage: NetworkImage(
                        "https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}",
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailsScreen(user: user),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );

        },

      ),

    );

  }

}