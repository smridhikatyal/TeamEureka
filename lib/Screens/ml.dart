import 'package:flutter/material.dart';

import 'function.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url =
      'https://af6c-2401-4900-1c0b-aab-5d11-1047-7f39-5568.ngrok-free.app';

  String sleepDuration = '';

  String sleepDisease = '';

  // Dropdown options for gender
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  // Dropdown options for occupation
  final List<String> occupationOptions = [
    'Doctor',
    'Engineer',
    'Teacher',
    'Student',
    'Other'
  ];

  // Dropdown options for BMI Category
  final List<String> bmiOptions = [
    'Underweight',
    'Normal',
    'Overweight',
    'Obese'
  ];

  // Dropdown options for Sleep Disorder
  final List<String> sleepDisorderOptions = [
    'None',
    'Sleep Apnea',
    'Insomnia',
    'Other'
  ];

  // Default values for form fields
  String name = '';
  String gender = 'Male';
  int age = 0;
  String occupation = 'Doctor';
  String bmiCategory = 'Underweight';
  int upperBloodPressure = 0;
  int lowerBloodPressure = 0;
  int heartRate = 0;
  int dailySteps = 0;
  double stressLevel = 5.0;
  String sleepDisorder = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction Page'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/sliderbg.jpg'), // Replace 'assets/background_image.jpg' with your image path
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 20),
              Text(
                'Gender:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              DropdownButton<String>(
                value: gender,
                style: TextStyle(fontSize: 16, color: Colors.white),
                onChanged: (String? newValue) {
                  setState(() {
                    gender = newValue!;
                  });
                },
                items:
                    genderOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Age:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  age = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Occupation:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              DropdownButton<String>(
                value: occupation,
                onChanged: (String? newValue) {
                  setState(() {
                    occupation = newValue!;
                  });
                },
                items: occupationOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text('Health Indicators:',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              Text(
                'BMI Category:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              DropdownButton<String>(
                value: bmiCategory,
                onChanged: (String? newValue) {
                  setState(() {
                    bmiCategory = newValue!;
                  });
                },
                items: bmiOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text(
                'Blood Pressure (Upper Value):',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  upperBloodPressure = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Blood Pressure (Lower Value):',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  lowerBloodPressure = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Heart Rate:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  heartRate = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Daily Steps:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              TextField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  dailySteps = int.parse(value);
                },
              ),
              SizedBox(height: 20),
              Text(
                'Stress Level (1-10):',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Slider(
                value: stressLevel,
                onChanged: (value) {
                  setState(() {
                    stressLevel = value;
                  });
                },
                min: 1,
                max: 10,
                divisions: 9,
                label: stressLevel.toString(),
              ),
              SizedBox(height: 20),
              Text('Sleep Disorder History:',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              Text(
                'Sleep Disorder:',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              DropdownButton<String>(
                value: sleepDisorder,
                onChanged: (String? newValue) {
                  setState(() {
                    sleepDisorder = newValue!;
                  });
                },
                items: sleepDisorderOptions
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white), // Set text color to white
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Prepare data to send to Flask API
                  Map<String, dynamic> requestData = {
                    'name': name,
                    'gender': gender,
                    'age': age,
                    'occupation': occupation,
                    'bmiCategory': bmiCategory,
                    'upperBloodPressure': upperBloodPressure,
                    'lowerBloodPressure': lowerBloodPressure,
                    'heartRate': heartRate,
                    'dailySteps': dailySteps,
                    'stressLevel': stressLevel,
                    'sleepDisorder': sleepDisorder,
                  };

                  // Send data to Flask API
                  dynamic response = await sendDataToAPI(url, requestData);

                  // Handle API response
                  setState(() {
                    if (response is Map<String, dynamic>) {
                      // Extract sleep duration, sleep quality, and sleep disease
                      sleepDuration = response['sleepDuration'];

                      sleepDisease = response['sleepDisease'];
                    } else {
                      // If response is not in expected format
                      sleepDuration = '8 hours';

                      sleepDisease = 'No Disease';
                    }
                  });
                },
                child: Text(
                  'Predict Sleep & Health',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                'Sleep Duration_Quality: $sleepDuration',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              Text(
                'Sleep Disease: $sleepDisease',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
