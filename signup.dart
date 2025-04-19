// import 'package:assignment1/auth.dart';
// import 'package:assignment1/author/homepage.dart';
// import 'package:assignment1/login.dart';
// import 'package:flutter/material.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   late String name;
//   late String email;
//   late String password;
//   Authservice authservice = Authservice();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlue,
//         title: Text("Signup"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) {
//                   name = value;
//                 },
//                 decoration: InputDecoration(
//                     labelText: "Name",
//                     hintText: "Your Name",
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2))),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) {
//                   email = value;
//                 },
//                 decoration: InputDecoration(
//                     hintText: "example@gmail.com",
//                     labelText: "Email",
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2))),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: TextField(
//                 onChanged: (value) {
//                   password = value;
//                 },
//                 decoration: InputDecoration(
//                     labelText: "password",
//                     hintText: "abcd.....",
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.red, width: 2))),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () async {
//                   authservice.signup(name, email, password);
//                    Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Homepage()));
//                 },
//                 child: Text("SignUp")),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Have Account? '),
//                   InkWell(
//                       onTap: () {
//                          Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Login()));
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(color: Colors.blue),
//                       )),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:assignment1/auth.dart';
// import 'package:assignment1/author/homepage.dart';
// import 'package:assignment1/login.dart';
// import 'package:flutter/material.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   late String name;
//   late String email;
//   late String password;
//   Authservice authservice = Authservice();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           // Background Image
//           Image.asset(
//             'assets/images/logo2.jpg',
//             fit: BoxFit.cover,
//           ),

//           // Semi-transparent overlay for better readability
//           Container(
//             color: Colors.black.withOpacity(0.3),
//           ),

//           // Signup Form
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white, // White input box
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       onChanged: (value) {
//                         name = value;
//                       },
//                       style: TextStyle(color: Colors.black), // Black text
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(16),
//                         hintText: "Your Name",
//                         labelText: "Name",
//                         labelStyle: TextStyle(color: Colors.black),
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white, // White input box
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       onChanged: (value) {
//                         email = value;
//                       },
//                       style: TextStyle(color: Colors.black), // Black text
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(16),
//                         hintText: "example@gmail.com",
//                         labelText: "Email",
//                         labelStyle: TextStyle(color: Colors.black),
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white, // White input box
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: TextField(
//                       onChanged: (value) {
//                         password = value;
//                       },
//                       obscureText: true,
//                       style: TextStyle(color: Colors.black), // Black text
//                       decoration: InputDecoration(
//                         contentPadding: EdgeInsets.all(16),
//                         labelText: "Password",
//                         hintText: "Enter your password",
//                         labelStyle: TextStyle(color: Colors.black),
//                         hintStyle: TextStyle(color: Colors.black54),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       authservice.signup(name, email, password);
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Homepage()),
//                       );
//                     },
//                     child: Text("SignUp"),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Have an Account? ',
//                         style: TextStyle(color: Colors.white), // White font
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:assignment1/auth.dart';
// import 'package:assignment1/author/homepage.dart';
// import 'package:assignment1/login.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final Authservice authservice = Authservice();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/images/logo2.jpg',
//             fit: BoxFit.cover,
//           ),
//           Container(
//             color: Colors.black.withOpacity(0.3),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   _buildTextField(nameController, "Name", "Your Name"),
//                   SizedBox(height: 20),
//                   _buildTextField(
//                       emailController, "Email", "example@gmail.com"),
//                   SizedBox(height: 20),
//                   _buildTextField(
//                       passwordController, "Password", "Enter your password",
//                       obscureText: true),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       try {
//                         await authservice.signup(
//                           nameController.text.trim(),
//                           emailController.text.trim(),
//                           passwordController.text.trim(),
//                         );
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => Homepage()),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text("Signup failed: \$e")),
//                         );
//                       }
//                     },
//                     child: Text("SignUp"),
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Have an Account? ',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(builder: (context) => Login()),
//                           );
//                         },
//                         child: Text(
//                           "Login",
//                           style: TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField(
//       TextEditingController controller, String label, String hint,
//       {bool obscureText = false}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         style: TextStyle(color: Colors.black),
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.all(16),
//           labelText: label,
//           hintText: hint,
//           labelStyle: TextStyle(color: Colors.black),
//           hintStyle: TextStyle(color: Colors.black54),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:assignment1/auth.dart';
// import 'package:assignment1/author/homepage.dart';
// import 'package:assignment1/login.dart';

// class Signup extends StatefulWidget {
//   const Signup({super.key});

//   @override
//   State<Signup> createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final Authservice authservice = Authservice();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Container(
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Sign Up to Continue",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.red,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 _buildTextField(nameController, "Name", "Enter Your Name"),
//                 SizedBox(height: 20),
//                 _buildTextField(emailController, "Email", "example@gmail.com"),
//                 SizedBox(height: 20),
//                 _buildTextField(
//                     passwordController, "Password", "Enter your password",
//                     obscureText: true),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     try {
//                       await authservice.signup(
//                         nameController.text.trim(),
//                         emailController.text.trim(),
//                         passwordController.text.trim(),
//                       );
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(builder: (context) => Homepage()),
//                       );
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text("Signup failed: \$e")),
//                       );
//                     }
//                   },
//                   child: Text("SignUp"),
//                   style: ElevatedButton.styleFrom(
//                     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
//                     textStyle: TextStyle(fontSize: 18),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Have an Account? ',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(builder: (context) => Login()),
//                         );
//                       },
//                       child: Text(
//                         "Login",
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       TextEditingController controller, String label, String hint,
//       {bool obscureText = false}) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       style: TextStyle(color: Colors.black),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//         contentPadding: EdgeInsets.all(16),
//         labelText: label,
//         hintText: hint,
//         labelStyle: TextStyle(color: Colors.black),
//         hintStyle: TextStyle(color: Colors.black54),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Colors.black12),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:assignment1/auth.dart';
import 'package:assignment1/author/homepage.dart';
import 'package:assignment1/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Authservice authservice = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Create Account",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(nameController, "Name", "Enter your name"),
                const SizedBox(height: 16),
                _buildTextField(emailController, "Email", "example@gmail.com"),
                const SizedBox(height: 16),
                _buildTextField(
                    passwordController, "Password", "Enter password",
                    obscureText: true),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await authservice.signup(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Signup failed: $e")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48, vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child:
                      Text("Sign Up", style: GoogleFonts.poppins(fontSize: 18)),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                        style: GoogleFonts.poppins(color: Colors.black)),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      ),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.poppins(
        color: Colors.black87,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.deepPurpleAccent),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      cursorColor: Colors.deepPurpleAccent,
    );
  }
}
