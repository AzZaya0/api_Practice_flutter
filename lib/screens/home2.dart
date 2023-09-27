import 'package:api_practice/models/UserModel2.dart';
import 'package:api_practice/services/controller.dart';
import 'package:flutter/material.dart';

class UserDataDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: FutureBuilder<UserModel2>(
        // Replace with your data fetching logic
        future: UserController().fetchUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data?.data == null) {
            return Center(child: Text('No data available.'));
          } else {
            final userData = snapshot.data!;
            return ListView.builder(
              itemCount: userData.data!.length,
              itemBuilder: (context, index) {
                final data = userData.data![index];
                return ListTile(
                  title: Text(data.title ?? ''),
                  subtitle: Text(data.body ?? ''),
                  // Add more widgets to display other data fields
                );
              },
            );
          }
        },
      ),
    );
  }
}
