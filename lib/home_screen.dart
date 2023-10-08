import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   File? _image;
  final picker =ImagePicker();
  Future getImage()async{
    final pickerImage= await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if(pickerImage!=null){
        _image=File(pickerImage.path);
      }else{
        print('No image selected');
      }
    });
  }
   Future getImageG()async{
     final pickerImage= await picker.pickImage(source: ImageSource.gallery);

     setState(() {
       if(pickerImage!=null){
         _image=File(pickerImage.path);
       }else{
         print('No image selected');
       }
     });
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text("Image Picker",style: TextStyle(color: Colors.white),),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         _image!=null?Image.file(_image!)
          :Container(
           height: 200,
           width: 200,
           decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.teal)
               )
           ),

          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 40.0,vertical: 15),
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                onPressed: ()async{
                  await getImage();
                }, child: const ListTile(
              title: Text("Picked Image",style: TextStyle(color: Colors.white,fontSize: 18),),
              leading: Icon(Icons.camera_alt,color: Colors.white,size: 30,),
            )),
          ),
          Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 40.0,vertical: 15),
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.teal)),
                onPressed: ()async{await getImageG();}, child: const ListTile(
              title: Text("Picked Image",style: TextStyle(color: Colors.white,fontSize: 18),),
              leading: Icon(Icons.image,color: Colors.white,size: 30,),
            )),
          )
        ],
      ),),
    );
  }
}
