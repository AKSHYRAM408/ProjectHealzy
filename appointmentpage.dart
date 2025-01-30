// File: pages/appointment_page.dart

import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointment')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Available Hospitals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // Hospital 1
            HospitalCard(
              name: 'Global Hospitals',
              queue: 'QUEUE: 4',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking appointment at Global Hospitals')),
                );
              },
            ),
            SizedBox(height: 16),

            // Hospital 2
            HospitalCard(
              name: 'GM Hospitals',
              queue: 'QUEUE: 5',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking appointment at GM Hospitals')),
                );
              },
            ),
            SizedBox(height: 16),

            // Hospital 3
            HospitalCard(
              name: 'Agness Hospitals',
              queue: 'QUEUE: 9',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking appointment at Agness Hospitals')),
                );
              },
            ),
            SizedBox(height: 16),

            // Hospital 4
            HospitalCard(
              name: 'Harini Hospitals',
              queue: 'QUEUE: 22',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking appointment at Harini Hospitals')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final String name;
  final String queue;
  final VoidCallback onPressed;

  const HospitalCard({
    required this.name,
    required this.queue,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(name),
        trailing: ElevatedButton(
          onPressed: onPressed,
          child: Text(queue),
        ),
      ),
    );
  }
}
