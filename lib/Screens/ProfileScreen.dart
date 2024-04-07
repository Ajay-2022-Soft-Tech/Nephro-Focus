import 'package:flutter/material.dart';

void main() {
  runApp(ProfileSettingsApp());
}

class ProfileSettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Settings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileSettingsScreen(),
    );
  }
}

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  String _name = "John Doe";
  String _email = "johndoe@example.com";
  String _address = "123 Main St, City, Country";
  bool _notificationEnabled = true;

  void _toggleNotification(bool value) {
    setState(() {
      _notificationEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Name'),
              subtitle: Text(_name),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit name functionality
                },
              ),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(_email),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit email functionality
                },
              ),
            ),
            ListTile(
              title: Text('Address'),
              subtitle: Text(_address),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  // TODO: Implement edit address functionality
                },
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'Notification Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            SwitchListTile(
              title: Text('Notifications'),
              subtitle: Text('Receive notifications'),
              value: _notificationEnabled,
              onChanged: _toggleNotification,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Changes saved'),
                  ),
                );
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}