// File: pages/reminder_page.dart

import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drugs Reminders')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your Prescription Reminders',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  ReminderItem(title: 'Paracetomol 500mg', date: 'NIGHT 08:30 PM'),
                  ReminderItem(title: 'Loratadine', date: 'MORNING 08:30 AM'),
                  ReminderItem(title: 'Desloratadine', date: 'AFTERNOON 08:30 PM'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add reminder logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add your reminder functionality here')),
                );
              },
              child: Text('Edit Reminder'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final String title;
  final String date;

  const ReminderItem({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        title: Text(title),
        subtitle: Text(date),
      ),
    );
  }
}
