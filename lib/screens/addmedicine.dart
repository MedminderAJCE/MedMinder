import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/screens/refillremainder.dart';
import 'package:login/screens/timepicker.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  _AddMedicineState createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
  );
  TimeOfDay? selectedTime;
  bool isAlarmSet = false;
  final TextEditingController medicationNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController illnessNameController = TextEditingController();
  final TextEditingController physicianNameController = TextEditingController();

  @override
  void dispose() {
    medicationNameController.dispose();
    dosageController.dispose();
    illnessNameController.dispose();
    physicianNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: medicationNameController,
                  decoration: InputDecoration(
                    hintText: "Specify the name of medication",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  controller: illnessNameController,
                  decoration: InputDecoration(
                    hintText: "Specify the name of illness",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  controller: physicianNameController,
                  decoration: InputDecoration(
                    hintText: "Provide the name of physician",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                TextField(
                  controller: dosageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Specify Medicine Dosage",
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: const BorderSide(
                        color: Color(0xFF00E5FF),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00E5FF),
                        ),
                        child: Text(DateFormat('yyyy/MM/dd').format(start)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: pickDateRange,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00E5FF),
                        ),
                        child: Text(DateFormat('yyyy/MM/dd').format(end)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Course Duration: ${difference.inDays} days',
                  style: const TextStyle(fontSize: 20),
                ),
                Container(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TimePicker(
                        onTimeSelected: (time) {
                          setState(() {
                            selectedTime = time;
                            isAlarmSet = true;
                          });
                        },
                      ),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text(
                    'Set Alarm',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (!isAlarmSet) ...[
                  const SizedBox(height: 10),
                  Text(
                    'Alarm not set',
                    style: const TextStyle(fontSize: 20),
                  ),
                ] else ...[
                  const SizedBox(height: 16),
                  Text(
                    'Alarm set at: ${selectedTime?.format(context) ?? ""}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
                Container(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  refillremainder(),
                      // details1: startdate , details2:enddate
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: const Color(0xFF00E5FF),
                  ),
                  child: const Text(
                    'Refill Reminder',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: saveMedicationDetails,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(320.0, 50.0),
                    backgroundColor: Color(0xFF00E5FF),
                  ),
                  child: const Text(
                    'Save Medication Details',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
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

  Future<void> pickDateRange() async {
    final initialDateRange = DateTimeRange(
      start: dateRange.start,
      end: dateRange.end,
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 2),
      initialDateRange: initialDateRange,
    );
    if (newDateRange != null) {
      setState(() {
        dateRange = newDateRange;
      });
    }
  }

  Future<void> saveMedicationDetails() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final medicationDetails = {
        'medicationName': medicationNameController.text,
        'dosage': dosageController.text,
        'illnessName': illnessNameController.text,
        'physicianName': physicianNameController.text,
        'startDate': dateRange.start,
        'endDate': dateRange.end,
        'alarmTime': selectedTime?.format(context), // Convert TimeOfDay to String
      };

      final CollectionReference medicationCollection = FirebaseFirestore.instance
          .collection('Medications')
          .doc(user.email)
          .collection('Medicines');

      await medicationCollection.add(medicationDetails);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Medication details saved to Firebase')),
      );
    }
  }
}
