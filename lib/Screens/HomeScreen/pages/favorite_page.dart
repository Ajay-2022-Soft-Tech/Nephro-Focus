import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kidney Disease Data Post Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KidneyDiseaseDataPoster(),
    );
  }
}

class KidneyDiseaseDataPoster extends StatefulWidget {
  @override
  _KidneyDiseaseDataPosterState createState() =>
      _KidneyDiseaseDataPosterState();
}

class _KidneyDiseaseDataPosterState extends State<KidneyDiseaseDataPoster> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  late final ImagePicker picker;
  File? _image;
  String _responseData = '';
  bool _isLoading = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    picker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Kidney Disease Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _image != null
                  ? Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.cover,
                  ),
                ),
              )
                  : SizedBox(), // Show selected image if available
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: getImage,
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                ),
                child: Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  postKidneyDiseaseData();
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  ),
                ),
                child: Text(
                  'Submit Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 20),
              _isLoading
                  ? Column(
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.lightBlue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please wait...',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
                  : _errorMessage.isNotEmpty
                  ? Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              )
                  : Text(
                _responseData,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // Show image uploaded dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Image Uploaded'),
              content: Text('Image uploaded successfully!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print('No image selected.');
      }
    });
  }

  void postKidneyDiseaseData() async {
    if (_image == null) {
      setState(() {
        _errorMessage = 'No image selected.';
      });
      return;
    }

    final Map<String, String> data = {
      'name': nameController.text,
      'age': ageController.text,
      // Add other data fields as needed
    };

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    var request = http.MultipartRequest(
        'POST', Uri.parse('http://65.0.132.137:8080/predict'));
    request.headers['accept'] = 'application/json';
    request.files.add(await http.MultipartFile.fromPath('file', _image!.path,
        contentType: MediaType('image', _image!.path.split('.').last)));
    request.fields.addAll(data);

    try {
      // Show progress bar for uploading image
      setState(() {
        _responseData = '';
      });

      var streamedResponse = await request.send();
      var response = await streamedResponse.stream.bytesToString();
      setState(() {
        _responseData = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
        _isLoading = false;
      });
    }
  }
}
