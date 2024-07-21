import 'package:ekdilo/ui/bottom_navigation.dart';
import 'package:ekdilo/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                const ProfilePicture(),
                const SizedBox(height: 10),
                const Text(
                  "StephCurry",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("stephcurry30@gmail.com"),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    Container(
                      height: 60,
                      color: const Color.fromARGB(255, 239, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Row(
                        children: [
                          Text("Primary City"),
                          Spacer(),
                          Text(
                            "Kumasi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      color: const Color.fromARGB(255, 239, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Row(
                        children: [
                          Text("Copy Events to Calendar"),
                          Spacer(),
                          CalenderToggle(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      color: const Color.fromARGB(255, 239, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text("Manage Events"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      color: const Color.fromARGB(255, 239, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text("Account"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      color: const Color.fromARGB(255, 239, 229, 229),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          const Text("Settings"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const HomePage(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavPage(),
    );
  }
}

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({super.key});

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  XFile? _imageFile; // Variable to hold the Image file
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  // Load the image path from shared_preferences
  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null) {
      setState(() {
        _imageFile = XFile(imagePath);
      });
    }
  }

  // Save the image path to shared_preferences
  Future<void> _saveImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profile_image', path);
  }

  // Method to pick image from Gallery
  Future<void> pickImageFromGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage;
      });
      _saveImage(pickedImage.path);
    }
  }

  // Method to Capture Image using Camera
  Future<void> captureImageFromCamera() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _imageFile = pickedImage;
      });
      _saveImage(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment
          .bottomRight, // Align pen icon to bottom right of the picture
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: _imageFile == null
              ? const AssetImage("files/images/steph.jpg") as ImageProvider
              : FileImage(File(_imageFile!.path)),
        ),
        // Add the pen icon for editing the profile picture
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon:
                  const Icon(Icons.add_a_photo, color: Colors.white, size: 20),
              onPressed: () {
                pickImageFromGallery();
              },
            ),
          ),
        ),
      ],
    );
  }
}

// TOGGLE SWITCH
class CalenderToggle extends StatefulWidget {
  const CalenderToggle({super.key});

  @override
  State<CalenderToggle> createState() => _CalenderToggleState();
}

class _CalenderToggleState extends State<CalenderToggle> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}
