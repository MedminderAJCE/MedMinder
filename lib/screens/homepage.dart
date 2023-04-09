// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login/screens/account.dart';
import 'package:login/screens/firstpage.dart';
import 'package:login/screens/home.dart';
import 'package:login/screens/secondpage.dart';
import 'package:login/screens/logout.dart';
import 'package:login/screens/addmedicine.dart';




// import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key:key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext  context){
    return Scaffold(
     
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text("Hello User" ,style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Color(0xFF6096B4),
      //    leading :IconButton(
      //   onPressed: () {},
      //   icon: IconButton(
      //   icon: const Icon(Icons.menu),
      //   color: Colors.black,
      // onPressed: () {},
      // ),
      // ),
      ),
     drawer: Drawer(
      backgroundColor: Color(0xFF6096B4),
      child:Container(
        
        // color: Colors.black,
        child:ListView(
          
          children:  [
            DrawerHeader(
              
            child: Center(
              child:Text('More',
              style:TextStyle(fontSize: 25),
              )
            ),
          ),
          ListTile(
            leading: Icon(Icons.attribution), //build circle
            title: Text(
              'Caretaker',
              style: TextStyle(fontSize:15),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Caretaker())
                );
              },
              ),
              ListTile(
            leading: Icon(IconData(0xe813, fontFamily: 'MaterialIcons')), 
            title: Text(
              'Settings',
              style: TextStyle(fontSize:15),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Settings())
                );
              },
              ),
            ListTile(
              leading: Icon(IconData(0xe3b3, fontFamily: 'MaterialIcons')),
              title: Text(
                'Logout',
                style: TextStyle(fontSize:15),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Logout())
                );
              },
            ),


            
          ],),
     ),

     ),
      // body: Container(
      //   child: Center(
      //     child: Text("Home Page"), //just for a middle filling
      //   ),
      // ),
       
    bottomNavigationBar:GNav(
      backgroundColor: Color(0xFF6096B4),
      gap: 8,
      tabs: [
        GButton(icon: Icons.home,
        text:'Home',
        onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Home())
                );
              },
        ),
        GButton(
          icon: IconData(0xf52d, fontFamily: 'MaterialIcons',),
        text:'Add Medicine',
        onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddMedicine ())
                );
              },
        
        ),
        
        GButton(icon:IconData(0xe043, fontFamily: 'MaterialIcons'),
        text:'Account',
        onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Account())
                );
              },
              ),
      ],
    ),
    );
  }
}