import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:login/screens/setalarm.dart';

class AddMedicine extends StatefulWidget {
  const AddMedicine({super.key});

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(2022, 11, 5), end: DateTime(2022, 12, 24));
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;

    return Scaffold(
      body: Center(
          child: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Medicine Name",
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
              ),
            ),
            Container(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Enter Medicine Dosage",
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xFF00E5FF),
                    )),
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
                    child:Text('${start.year}/${start.month}/${start.day}'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: pickDateRange,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E5FF),
                    ),
                    child: Text('${start.year}/${start.month}/${start.day}'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Course Duration :${difference.inDays} days',
              style: const TextStyle(fontSize: 20),
            ),
            Container(height: 18),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320.0, 50.0),
                backgroundColor: const Color(0xFF00E5FF),
              ),
              child: const Text('Quantity Left',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
            ),
            Container(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(320.0, 50.0),
                backgroundColor: const Color(0xFF00E5FF),
              ),
              child: const Text('Set Alarm',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white)),
            ),
          ],
        ),
      )),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (newDateRange == null) return; // Pressed X
    setState(() {
      dateRange = newDateRange;
    });
  }
    
  }

