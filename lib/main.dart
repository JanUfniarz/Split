import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SensorDataScreen(),
    );
  }
}

class SensorDataScreen extends StatefulWidget {
  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Data'),
      ),
      body: Center(
        child: StreamBuilder<AccelerometerEvent>(
          stream: accelerometerEvents,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Wskaźnik ładowania, gdy strumień czeka na dane
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}'); // Wyświetlenie błędu, jeśli wystąpił
            } else if (snapshot.hasData) {
              // Wyświetlenie danych, gdy są dostępne
              final event = snapshot.data!;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Accelerometer Data:',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'X: ${event.x.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Y: ${event.y.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'Z: ${event.z.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              );
            } else {
              return Text('No data'); // Wyświetlenie komunikatu, gdy brak danych
            }
          },
        ),
      ),
    );
  }
}
