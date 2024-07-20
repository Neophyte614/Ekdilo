import 'package:ekdilo/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:ekdilo/ui/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final TextEditingController _passwordText = TextEditingController();
  final TextEditingController _emailText = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Hi, Welcome back!",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: EmailField(controller: _emailText),
                    ),
                    Center(
                      child: PasswordField(
                          controller: _passwordText,
                          hintText: "Enter your password"),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 400,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _rememberMe = !_rememberMe;
                          });
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                            const Text("Remember Me"),
                          ],
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const HomePage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 140),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    indent: 65,
                    endIndent: 65,
                    thickness: 2,
                    color: Colors.grey[300],
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      'Or With',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Login with Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "Login with Facebook",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const SignUpPage(),
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
                      child: const Text("Sign Up",
                          style: TextStyle(color: Colors.redAccent)),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // Ensure a fixed height
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: "Enter your email",
        ),
        validator: _validateEmail,
      ),
    );
  }
}

// PASSWORD TEXTFORM WIDGET
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const PasswordField(
      {super.key, required this.controller, required this.hintText});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 8) {
      return 'Password must be more than 8 characters';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character (!@#\$&*~)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        validator: _validatePassword,
      ),
    );
  }
}




// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   //bool _isPasswordVisible = false; // Start with false for obscured text
//   bool _rememberMe = false;
//   final TextEditingController _passwordText = TextEditingController();
//   final TextEditingController _emailText = TextEditingController();

//   // void _passwordVisibility() {
//   //   setState(() {
//   //     _isPasswordVisible = !_isPasswordVisible;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: ListView(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 50),
//               const Center(
//                 child: Text(
//                   "Hi, Welcome back!",
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Center(
//                 child: Container(
//                   height: 45,
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 20,
//                     vertical: 10,
//                   ),
//                   child: TextFormField(
//                     controller: _emailText,
//                     decoration: InputDecoration(
//                       icon: const Icon(Icons.person),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       hintText: "Enter your email",
//                     ),
//                   ),
//                   // child: TextField(
//                   //   controller: _emailText,
//                   //   decoration: InputDecoration(
//                   //     border: OutlineInputBorder(
//                   //       borderRadius: BorderRadius.circular(15),
//                   //     ),
//                   //     hintText: "Enter your email",
//                   //   ),
//                   // ),
//                 ),
//               ),
//               PasswordField(
//                   controller: _passwordText, hintText: "Enter your password"),
//               // Center(
//               //   child: Container(
//               //       height: 45,
//               //       margin: const EdgeInsets.symmetric(
//               //         horizontal: 20,
//               //       ),
//               //       child: TextFormField(
//               //         controller: _passwordText,
//               //         obscureText:
//               //             !_isPasswordVisible, // Toggle based on visibility state
//               //         decoration: InputDecoration(
//               //           icon: const Icon(Icons.lock),
//               //           border: OutlineInputBorder(
//               //             borderRadius: BorderRadius.circular(15),
//               //           ),
//               //           hintText: "Enter your password",
//               //           suffixIcon: IconButton(
//               //             icon: Icon(_isPasswordVisible
//               //                 ? Icons.visibility
//               //                 : Icons.visibility_off),
//               //             onPressed: () {
//               //               _passwordVisibility();
//               //             },
//               //           ),
//               //         ),
//               //         validator: (String? value) {
//               //           return (value!.length < 8)
//               //               ? "Pass must be more than 8 characters"
//               //               : null;
//               //         },
//               //       )
//               //       ),
//               // ),
//               Center(
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   width: 400,
//                   child: Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             _rememberMe = !_rememberMe;
//                           });
//                         },
//                         child: Row(
//                           children: [
//                             Checkbox(
//                               value: _rememberMe,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _rememberMe = value!;
//                                 });
//                               },
//                             ),
//                             const Text("Remember Me"),
//                           ],
//                         ),
//                       ),
//                       const Spacer(),
//                       TextButton(
//                         onPressed: () {},
//                         child: const Text(
//                           "Forgot Password?",
//                           style: TextStyle(color: Colors.redAccent),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         pageBuilder: (context, animation, secondaryAnimation) =>
//                             const HomePage(),
//                         transitionsBuilder:
//                             (context, animation, secondaryAnimation, child) {
//                           return FadeTransition(
//                             opacity: animation,
//                             child: child,
//                           );
//                         },
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blueAccent,
//                     padding: const EdgeInsets.symmetric(horizontal: 140),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text(
//                     "Login",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Divider(
//                     indent: 65,
//                     endIndent: 65,
//                     thickness: 2,
//                     color: Colors.grey[300],
//                   ),
//                   Container(
//                     color: Colors.white,
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: const Text(
//                       'Or With',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 100, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text(
//                     "Login with Google",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 90, vertical: 10),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: const Text(
//                     "Login with Facebook",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text("Don't have an account?"),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           PageRouteBuilder(
//                             pageBuilder:
//                                 (context, animation, secondaryAnimation) =>
//                                     const SignUpPage(),
//                             transitionsBuilder: (context, animation,
//                                 secondaryAnimation, child) {
//                               return FadeTransition(
//                                 opacity: animation,
//                                 child: child,
//                               );
//                             },
//                           ),
//                         );
//                       },
//                       child: const Text("Sign Up",
//                           style: TextStyle(color: Colors.redAccent)),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// // PASSWORD TEXTFORM WIDGET
// class PasswordField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintText;
//   const PasswordField(
//       {super.key, required this.controller, required this.hintText});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PasswordFieldState createState() => _PasswordFieldState();
// }

// class _PasswordFieldState extends State<PasswordField> {
//   bool _isPasswordVisible = false;

//   void _togglePasswordVisibility() {
//     setState(() {
//       _isPasswordVisible = !_isPasswordVisible;
//     });
//   }

//   String? _validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password cannot be empty';
//     } else if (value.length < 8) {
//       return 'Password must be more than 8 characters';
//     } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
//       return 'Password must contain at least one uppercase letter';
//     } else if (!RegExp(r'[a-z]').hasMatch(value)) {
//       return 'Password must contain at least one lowercase letter';
//     } else if (!RegExp(r'[0-9]').hasMatch(value)) {
//       return 'Password must contain at least one number';
//     } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
//       return 'Password must contain at least one special character (!@#\$&*~)';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(
//         horizontal: 20,
//       ),
//       child: TextFormField(
//         controller: widget.controller,
//         obscureText: !_isPasswordVisible,
//         decoration: InputDecoration(
//           icon: const Icon(Icons.lock),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           hintText: widget.hintText,
//           suffixIcon: IconButton(
//             icon: Icon(
//                 _isPasswordVisible ? Icons.visibility : Icons.visibility_off),
//             onPressed: _togglePasswordVisibility,
//           ),
//         ),
//         validator: _validatePassword,
//       ),
//     );
//   }
// }
