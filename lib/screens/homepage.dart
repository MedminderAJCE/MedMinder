// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/Aboutus.dart';
import 'package:login/screens/HelpandSupport.dart';
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
      appBar:PreferredSize( //wrap with PreferredSize
                preferredSize: Size.fromHeight(50), //height of appbar
                child: AppBar(
                  centerTitle: true, //appbar title
                  backgroundColor: Color(0xFF00E5FF),//appbar background color
                    
              // iconTheme: IconThemeData(color: Colors.black),
              // title: Text("Hello User", style: TextStyle(color: Colors.black)),
                )
          ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff5ac7cf),
                Color(0xFF51B9CD),
                Color(0xFF00E5FF),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                leading: Icon(Icons.info_outline, color: Colors.white,),  //build circle
                title: Text(
                  'About Us',
                  style: TextStyle(fontSize: 15 ,color: Colors.white,),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AboutUsPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.help,color: Colors.white,),
                title: Text(
                  'Help & Support',
                  style: TextStyle(fontSize: 15,color: Colors.white,),
                ),
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:(context) => FAQPage())
                  );
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
    
     bottomNavigationBar: SizedBox(
        height: 50,
       child: BottomNavigationBar(
        onTap: (index) {
          setState(() {
              myindex=index;
          });
        
        },
        currentIndex: myindex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF00E5FF),
        iconSize: 20,
        selectedFontSize: 14,
        unselectedFontSize: 14,
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
     ),
    

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
