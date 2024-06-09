import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:lavender4/commen/appBar/app_Bar.dart';
import 'package:lavender4/features/purchases/home/presentation/ui/base_page.dart';

class InsertPersonalInformation extends StatefulWidget {
  const InsertPersonalInformation({Key? key}) : super(key: key);

  @override
  _InsertPersonalInformationState createState() =>
      _InsertPersonalInformationState();
}

class _InsertPersonalInformationState extends State<InsertPersonalInformation> {
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  XFile? _image;
  bool _isUploading = false;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    setState(() {
      _isUploading = true;
    });
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Insert Personal Information',
        leadingIcons: [IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            if (_image != null)
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(File(_image!.path)),
                  ),
                ),
              ),
            if (_isUploading) CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple.shade300,
                  shape: StadiumBorder(),
                ),
                icon: Icon(Icons.image),
                label: Text('Select Image'),
                onPressed: _pickImage,
              ),
            ),
            _buildTextFormField(_phoneController, 'Mobile Number', Icons.phone),
            _buildTextFormField(_addressController, 'Address', Icons.map),
            SizedBox(height: 40),
            Align(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BasePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green.shade400,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: StadiumBorder(),
                ),
                child: Text('Save', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType:
            label == 'Mobile Number' ? TextInputType.phone : TextInputType.text,
      ),
    );
  }
}
