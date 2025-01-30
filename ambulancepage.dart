// File: pages/ambulance_page.dart

import 'package:flutter/material.dart';

class AmbulancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ambulance Services')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Available Ambulance Services at your Location',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  AmbulanceItem(name: 'Heart Ambulance Services', contact: '8428110595'),
                  AmbulanceItem(name: '108 Ambulance Services', contact: '9580321894'),
                  AmbulanceItem(name: 'Emergency Ambulance Services', contact: '9786855812'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmbulanceItem extends StatelessWidget {
  final String name;
  final String contact;

  const AmbulanceItem({required this.name, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(name),
        subtitle: Text(contact),
        trailing: ElevatedButton(
          onPressed: () {
            // Call the ambulance service
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Calling $name...')),
            );
          },
          child: Text('Call'),
        ),
      ),
    );
  }
}
