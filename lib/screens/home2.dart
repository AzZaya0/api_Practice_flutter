import 'package:api_practice/models/UserModel2.dart';
import 'package:api_practice/services/controller.dart';
import 'package:flutter/material.dart';

class UserDataDisplay extends StatefulWidget {
  @override
  State<UserDataDisplay> createState() => _UserDataDisplayState();
}

class _UserDataDisplayState extends State<UserDataDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            UserController().sendData('10',
                'this data i send through Dio package  ', 'hello guiz its me ');
                
            
          }),
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
          } else if (!snapshot.hasData || snapshot.data?.message == null) {
            return Center(child: Text('No data available.'));
          } else {
            final userData = snapshot.data!;
            return ListView.builder(
              itemCount: userData.message!.length,
              itemBuilder: (context, index) {
                final data = userData.message![index];
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
