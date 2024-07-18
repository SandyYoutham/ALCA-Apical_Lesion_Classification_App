import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gp_app/editingScreen.dart';
import 'package:image_picker/image_picker.dart';
import 'medicalReportScreen.dart';
import 'package:http/http.dart' as http;

class resultScreen extends StatefulWidget {
  XFile? imageFile;
  int? pred;
  String? user;

  resultScreen({super.key,required this.imageFile, required this.pred, required this.user});

  @override
  State<resultScreen> createState() => _resultScreen();
}

class _resultScreen extends State<resultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading:false,
            backgroundColor: Color(0xff2699A1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage('assets/tooth logo.png'), color: Colors.white,),
                SizedBox(width: 5,),
                Text("A L C A", style: TextStyle(fontWeight: FontWeight.bold,
                    fontFamily: 'SegoeUI',
                    color: Colors.white),)
              ],
            )
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Image.asset("assets/back.png")),
                  SizedBox(width: 120,),
                  Text("Result", style: TextStyle(fontWeight: FontWeight.bold,
                      fontFamily: 'SegoeUI',
                      fontSize: 25,
                      color: Colors.black87),),
                ],),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 350,
                    width: 340,
                    // Optional: to add padding inside the border
                    decoration: BoxDecoration(// Plac
                      image: DecorationImage(
                        image:FileImage(File(widget.imageFile!.path))
                      ),// eholder image if _pickedImage is null
                      border: Border.all(
                        color: Color(0xff2699A1), // Border color
                        width: 3, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                          10), // Border radius (optional)
                    ),
                )
              ),
              Stack(
                alignment: Alignment.center,
                children: [

                  Image.asset("assets/Group 83.png", fit: BoxFit.cover,),
                  Text(widget.pred==0?"Apical":"Normal", style: TextStyle(color: widget.pred==0?Colors.deepOrangeAccent:Colors.blueAccent,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SegoeUI',
                      letterSpacing: 2),),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    print('Widget prediction value: ${widget.pred}'); // Add this line

                    Navigator.push(context, MaterialPageRoute(builder: (context)=> editingScreen(imageFile: widget.imageFile,pred: widget.pred,user: widget.user,)));
                  },
                  child: Text('Edit', style: TextStyle(color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'SegoeUI',
                      fontWeight: FontWeight.bold),),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5), // Adjust the corner radius here
                    ),
                    backgroundColor: Color(
                        0xfffaa746), // Background color of the button
                  ),),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 40,),
                  Container(
                    height: 40,
                    width: 230,
                    child: SizedBox()
                  ),
                  SizedBox(width: 35,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => medicalReportScreen(imageFile: widget.imageFile,user:widget.user)));
                    },
                    child: Row(
                      children: [
                        Text("Next", style: TextStyle(color: Color(0xff2699A1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'SegoeUI'),),
                        SizedBox(width: 15,),
                        Column(
                          children: [
                            SizedBox(height: 5,),
                            Image.asset("assets/11.png", width: 17, height: 17,),
                          ],
                        ),
                        SizedBox(height: 20,)
                      ],),
                  ),
                ],
              ),
              SizedBox(height: 20,)
            ],
          ),
        )
    );
  }
}
