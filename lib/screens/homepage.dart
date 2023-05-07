// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/account.dart';
import 'package:login/screens/addmedicine.dart';
import 'package:login/screens/firstpage.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/secondpage.dart';
import 'package:login/screens/signin_screen.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myindex=0;
  List<Widget>widgetList=const[
    Home(),
    AddMedicine(),
    Account(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(child: widgetList[myindex],),
      appBar: AppBar(
        
        // iconTheme: IconThemeData(color: Colors.black),
        // title: Text("Hello User", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Color(0xFF00E5FF),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFF00E5FF),
        child: Container(
          // color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                    child: Text(
                  'More',
                  style: TextStyle(fontSize: 25 ,color: Colors.white,),
                  

                )),
              ),
              ListTile(
                leading: Icon(Icons.attribution, color: Colors.white,),  //build circle
                title: Text(
                  'Caretaker',
                  style: TextStyle(fontSize: 15 ,color: Colors.white,),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Caretaker()));
                },
              ),
              ListTile(
                leading: Icon(IconData(0xe813, fontFamily: 'MaterialIcons'), color: Colors.white,),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 15 ,color: Colors.white,),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              ListTile(
                leading: Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons'), color: Colors.white,),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 15, color: Colors.white,),
                ),
                onTap: () {
                  User? user = FirebaseAuth.instance.currentUser;
                  FirebaseAuth.instance.signOut();
                  setState(() {
                    if (user == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignScreen()));
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    
     bottomNavigationBar: BottomNavigationBar(
      onTap: (index) {
        setState(() {
            myindex=index;
        });
      
      },
      currentIndex: myindex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF00E5FF),
      iconSize: 37,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items:const [
        BottomNavigationBarItem(
          icon:Icon(Icons.home,
          
          color: Colors.white,),
          label: 'home',
          
         ),
         

        BottomNavigationBarItem(
          label: 'add medicine',
          
          icon:Icon(Icons.add_circle_outlined ,
          color: Colors.white,),
          ),

          BottomNavigationBarItem(
            label: 'account',
          icon:Icon(Icons.account_circle_rounded,
          color: Colors.white,),
         ),

      ]),
    

    //  Need to change the gnav no need 
      // bottomNavigationBar: GNav(
      //   color: Colors.white,
      //   backgroundColor: Color(0xFF00E5FF),
        
      //   gap: 8,
      //   iconSize: 30,
      //   tabs: [
      //     GButton(
      //       icon: Icons.home,
      //       onPressed: () {
      //         Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (context) => Home()));
      //       },
      //     ),
      //     GButton(
           
      //       icon: IconData(
      //         0xf52d,
      //         fontFamily: 'MaterialIcons',
    
      //       ),
            
      //       onPressed: () {
      //         Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (context) => AddMedicine()));
      //       },
      //     ),
      //     GButton(
      //       icon: IconData(0xe043, fontFamily: 'MaterialIcons'),
        
      //       onPressed: () {
      //         Navigator.of(context)
      //             .push(MaterialPageRoute(builder: (context) => Account()));
      //       },
      //     ),
      //   ],
      //),
    );
  }
}
