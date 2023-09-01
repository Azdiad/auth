import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:granregister/controller/imagepickerprovider.dart';
import 'package:granregister/view/homepage/home.dart';
import 'package:image_picker/image_picker.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  // Uint8List? image;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future uploadFile() async {
    final Path = 'Files/${pickedFile?.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(Path);
    ref.putFile(file);
    final snapshot = await uploadTask?.whenComplete(() {});
    final UrlDownload = await snapshot?.ref.getDownloadURL();
    print('Download Link $UrlDownload');
  }

  Future<void> selecImage() async {
    final result = await FilePicker.platform.pickFiles();
    // Uint8List? img = await pickimage(ImageSource.gallery);
    // setState(() {
    //   pickedFile = img;
    // });
    setState(() {
      pickedFile = result?.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pickedFile != null
                ? GestureDetector(
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.amber,
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o='),
                  ),
            Positioned(
              child: IconButton(
                onPressed: selecImage,
                icon: Icon(Icons.add_circle_outline),
              ),
              bottom: -5,
              left: 70,
            ),
            TextButton.icon(
                onPressed: uploadFile,
                icon: Icon(Icons.upload),
                label: Text('Upload Profile')),
            TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
                },
                icon: Icon(Icons.arrow_back_sharp),
                label: Text(' Go Back')),
          ],
        ),
      ),
    );
  }
}
