import 'package:flutter/material.dart';
//import 'package:login/screens/setalarm.dart';
//import 'package:login/screens/setalarm.dart';
import 'package:login/screens/timepicker.dart';
import 'package:login/screens/refillremainder.dart';


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

    // bool isopen=false;
    // String? valuechoose;
    // final List<PopupMenuEntry> listItem = [
      // 'Enter no:',
      // 'Quantity left:',
      // 'Time to refill',
    // ];

    return Scaffold(
      body: Center(
          child: SizedBox(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextField(
                decoration: InputDecoration(
                  hintText: "Enter the name of illness",
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
                decoration: InputDecoration(
                  hintText: "Provide the name of physician",
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
                  hintText: "Specify name of the medication",
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
                  hintText: "Specify Medicine Dosage",
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
                      child: Text('${start.year}/${start.month}/${start.day}'),
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
              Container(height: 28),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const timepicker()));
                },
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
              Container(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const refillremainder()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(320.0, 50.0),
                  backgroundColor: const Color(0xFF00E5FF),
                ),
                child: const Text('Refill Remainder',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
              ),

              //  PopupMenuButton (
              //   itemBuilder: ((context)  => listItem),
              //   // icon:const Icon(Icons.home),
              //   icon: Container(
              //   width: 300,
              //   decoration: const BoxDecoration(
              //   color:Color(0xFF00E5FF),
              //   ),
              //   child: DropdownButton(
              //     underline: Container(),
              //     isExpanded: true,
              //     alignment: Alignment.centerLeft,
              //   hint: const SizedBox(

              //     child: Center(child: Text("Refill Reminder",
              //     style: TextStyle(color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20),))),
              //   dropdownColor: const Color(0xFF00E5FF),
              //   icon: const Icon(Icons.arrow_drop_down),
              //   iconSize: 36,

              //   value: valuechoose,

              //   onChanged: (newValue){
              //     setState(() {
              //       valuechoose=newValue as String? ;
              //     });
              //   },
              //   items:listItem.map((valueItem){
              //     return DropdownMenuItem(
              //       value:valueItem,
              //       child:Text(valueItem as String ,

              //        style: const TextStyle(
              //                 fontSize: 18,
              //                 color: Colors.white,

              //                 // fontStyle: FontStyle.italic,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         );
              //         })
              //     .toList(),
              //     //   ),
              //     //   );
              //     // }).toList(),

              //             ),
              // ),
              //  ),
            ],
          ),
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
