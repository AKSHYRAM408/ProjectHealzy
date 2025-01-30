import 'package:flutter/material.dart';
import 'login.dart';  // Import the LoginPage for logout navigation

class OrganizationPage extends StatefulWidget {
  @override
  _OrganizationPageState createState() => _OrganizationPageState();
}

class _OrganizationPageState extends State<OrganizationPage> {
  final _queueController = TextEditingController();
  final _prescriptionController = TextEditingController();

  List<String> _queueUpdates = [];
  List<String> _prescriptions = [];

  void _submitQueueUpdate() {
    if (_queueController.text.isNotEmpty) {
      setState(() {
        _queueUpdates.add(_queueController.text);
        _queueController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Queue update added!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _submitPrescriptionUpdate() {
    if (_prescriptionController.text.isNotEmpty) {
      setState(() {
        _prescriptions.add(_prescriptionController.text);
        _prescriptionController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Prescription update added!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _queueController.dispose();
    _prescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Use backgroundColor instead of primary
            foregroundColor: Colors.white, // Use foregroundColor instead of onPrimary
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),  // headline6 replaced by titleLarge
          titleMedium: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),  // subtitle1 replaced by titleMedium
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Organization Dashboard'),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate back to login page for logout functionality
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Organization Dashboard',
                  style: Theme.of(context).textTheme.titleLarge,  // headline6 replaced
                ),
                SizedBox(height: 20),

                // Queue Update Section with Card for better design
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Queue',
                          style: Theme.of(context).textTheme.titleMedium,  // subtitle1 replaced
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _queueController,
                          decoration: InputDecoration(
                            labelText: 'Enter queue update',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _submitQueueUpdate,
                              child: Text('Submit Queue Update'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Display Queue Updates
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Queue Updates:',
                          style: Theme.of(context).textTheme.titleMedium,  // subtitle1 replaced
                        ),
                        SizedBox(height: 10),
                        _queueUpdates.isEmpty
                            ? Text('No queue updates yet.')
                            : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _queueUpdates.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_queueUpdates[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Prescription Update Section with Card
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update Prescription',
                          style: Theme.of(context).textTheme.titleMedium,  // subtitle1 replaced
                        ),
                        SizedBox(height: 10),
                        TextField(
                          controller: _prescriptionController,
                          decoration: InputDecoration(
                            labelText: 'Enter prescription update',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _submitPrescriptionUpdate,
                              child: Text('Submit Prescription Update'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Display Prescription Updates
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Prescription Updates:',
                          style: Theme.of(context).textTheme.titleMedium,  // subtitle1 replaced
                        ),
                        SizedBox(height: 10),
                        _prescriptions.isEmpty
                            ? Text('No prescription updates yet.')
                            : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _prescriptions.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_prescriptions[index]),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
