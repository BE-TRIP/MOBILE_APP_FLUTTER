import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:mobile_app_flutter/drivers/UI/driver_home.dart';
import 'package:mobile_app_flutter/drivers/UI/driver_profile_edit.dart';
import 'package:mobile_app_flutter/travelers/UI/TravelerCreateNewTravelView.dart';
import 'package:mobile_app_flutter/travelers/UI/Traveler_Profile_Edit.dart';
import 'package:mobile_app_flutter/travelers/models/UserProfile.dart';




class Profile_Driver extends StatefulWidget {
  const Profile_Driver({Key? key}) : super(key: key);

  @override
  State<Profile_Driver> createState() => _Profile_DriverState();
}

class _Profile_DriverState extends State<Profile_Driver> {
  final String _baseUrl = 'be-trip-back322.herokuapp.com';
  final List<UserProfile> profiles = [];
  late UserProfile profileSelected;

  Future<String> makeRequest() async {
    final url = Uri.https(_baseUrl,'/api/v1/drivers');
    final resp =await http.get(url);
    final Map<String,dynamic> UserProfileMap = json.decode(resp.body);
    List<dynamic> data = UserProfileMap["content"];

    setState(() {
      for(var data in data){
        final temp = UserProfile.fromMap(data);
        profiles.add(temp);
      }
    });

    print(UserProfileMap);
    print("nombre: " + profiles[0].name.toString());
    print("apellido: "+profiles[0].email.toString());
    print("apellido: "+profiles[0].pfp.toString());

    return resp.body;
  }

  @override
  void initState(){
    super.initState();
    makeRequest();
  }

  bool isObscuredPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        leading: IconButton(
          
          icon: const Icon(
              Icons.home,
              color:Colors.white
          ),
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DriverHome()));
          },
        ),
        actions: [
          IconButton(
              icon:const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: (){}
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white60),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            )
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profiles[0].pfp.toString())
                          )
                      ),
                    ),
                     Container(
                      margin: EdgeInsets.only(top: 135.0, left:40.0),
                      child:  Text(profiles[0].name.toString(),style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 24.0,

                      )),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 165.0, right:110.0),
                      child: Text(profiles[0].email.toString(),style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20.0,
                      )),
                    ),

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: (){
                      

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context)=> const Traveler_newTravel()));

                    },
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text("New Travel", 
                    style:  TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.black
                    )),
                  ),
                  ElevatedButton(
                    
                    onPressed: (){
                      
                      Navigator.push(
                        
                          context,
                          MaterialPageRoute(
                         
                              builder: (BuildContext context)=> const ProfileD_Options()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                    ),
                    child:  const Text("Options",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  Widget buildTextFild(String labelText, String placeHolder, bool isPasswordTextField){
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscuredPassword: false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              icon: const Icon(Icons.remove_red_eye, color: Colors.grey,),
              onPressed: (){},
            ): null,
            contentPadding: const EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeHolder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color:Colors.grey
            )
        ),
      ),
    );
  }

}