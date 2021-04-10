import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discover_kenya/help.dart';
import 'package:discover_kenya/profile.dart';
import 'package:discover_kenya/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

var user = FirebaseAuth.instance.currentUser;

class UploadImage extends StatefulWidget {
  final String uid;
  UploadImage({Key key, this.uid}) : super(key: key);

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: FutureBuilder(
            future: FirebaseDatabase.instance
                .reference()
                .child("Users")
                .child(widget.uid)
                .once(),
            builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.value['name'] + "'s Image Upload",
                    style: GoogleFonts.raleway(
                        fontSize: 16.0, color: Colors.black));
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (content) => [
                PopupMenuItem(
                  value: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                    child: Text(
                      "Settings",
                      style: GoogleFonts.raleway(
                          fontSize: 13.0,
                          letterSpacing: .03,
                          color: Colors.black),
                    ),
                  ),
                ),
                PopupMenuItem(
                    value: 2,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Help()),
                        );
                      },
                      child: Text(
                        "Help",
                        style: GoogleFonts.raleway(
                            fontSize: 13.0,
                            letterSpacing: .03,
                            color: Colors.black),
                      ),
                    )),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                _imageFile == null
                    ? Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * .32,
                        color: Colors.grey,
                        child: Center(
                          child: TextButton(
                            child: Text(
                              "Upload Image",
                              style: GoogleFonts.raleway(
                                  color: Colors.white, letterSpacing: .4),
                            ),
                            onPressed: () {
                              _showOptions(context);
                            },
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _showOptions(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * .32,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: FileImage(_imageFile),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "IMAGE NAME",
                    labelStyle: GoogleFonts.raleway(
                      color: Colors.black,
                      letterSpacing: .2,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                TextFormField(
                  controller: locationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "LOCATION",
                    labelStyle: GoogleFonts.raleway(
                      color: Colors.black,
                      letterSpacing: .2,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .08,
                ),
                _loading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          _validate();
                        },
                        child: Text(
                          "Complete",
                          style: GoogleFonts.raleway(
                            fontSize: 16.0,
                            letterSpacing: .03,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  ImagePicker imagePicker = ImagePicker();
  File _imageFile;

  bool _loading = false;

  Future<void> _fromCamera() async {
    PickedFile pickedFile = await imagePicker.getImage(
        source: ImageSource.camera, imageQuality: 100);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  Future<void> _fromGallery() async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  void _validate() {
    if (_imageFile == null &&
        descriptionController.text.isEmpty &&
        locationController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please upload your image, add a description, and its location");
    } else if (_imageFile == null) {
      Fluttertoast.showToast(msg: "Please upload your image.");
    } else if (descriptionController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please put an image description.");
    } else if (locationController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please put a location for your image.");
    } else {
      setState(() {
        _loading = true;
      });
      _uploadImage();
    }
  }

  void _uploadImage() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('Images').child(imageFileName);

    final UploadTask uploadTask = storageReference.putFile(_imageFile);
    uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref
          .getDownloadURL()
          .then((imageUrl) => {_saveData(imageUrl)});
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  void _saveData(String imageUrl) {
    // var dateFormat = DateFormat('MMM d, yyyy');
    // var timeFormat = DateFormat('EEEE, hh:mm a');

    // String date = dateFormat.format(DateTime.now()).toString();
    // String time = timeFormat.format(DateTime.now()).toString();

    FirebaseFirestore.instance.collection('posts').add({
      'imageUrl': imageUrl,
      'description': descriptionController.text,
      'location': locationController.text,
      // 'date': date,
      // 'time': time,
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: 'Image Uploaded Successfully');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return Profile(
          uid: widget.uid,
        );
      }));
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  void _showOptions(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return SafeArea(
              child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text(
                    "Gallery",
                    style:
                        GoogleFonts.raleway(fontSize: 16.0, letterSpacing: .03),
                  ),
                  onTap: () {
                    _fromGallery();
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text(
                    "Camera",
                    style:
                        GoogleFonts.raleway(fontSize: 16.0, letterSpacing: .03),
                  ),
                  onTap: () {
                    _fromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
        });
  }

  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    locationController.dispose();
  }
}
