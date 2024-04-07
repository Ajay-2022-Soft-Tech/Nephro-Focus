// import 'package:flutter/material.dart';
//
// import '../../../components/already_have_an_account_acheck.dart';
// import '../../../constants.dart';
// import '../../Login/login_screen.dart';
//
// class SignUpForm extends StatelessWidget {
//   const SignUpForm({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             textInputAction: TextInputAction.next,
//             cursorColor: Colors.blue,
//             onSaved: (email) {},
//             decoration: InputDecoration(
//               hintText: "Name",
//               prefixIcon: Icon(Icons.person),
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           SizedBox(height: 20.0),
//
//         TextFormField(
//         keyboardType: TextInputType.emailAddress,
//         textInputAction: TextInputAction.next,
//         cursorColor: Colors.blue,
//         onSaved: (email) {},
//         decoration: InputDecoration(
//           hintText: "Email",
//           prefixIcon: Icon(Icons.email_outlined),
//           filled: true,
//           fillColor: Colors.grey[200],
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//
//           SizedBox(height: 20.0),
//           TextFormField(
//             textInputAction: TextInputAction.done,
//             obscureText: true,
//             cursorColor: Colors.blue,
//             decoration: InputDecoration(
//               hintText: "Password",
//               prefixIcon: Icon(Icons.lock),
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 borderSide: BorderSide.none,
//               ),
//             ),
//           ),
//           const SizedBox(height:  20.0),
//           ElevatedButton(
//             onPressed: () {
//               // Add your onPressed logic here
//             },
//             style: ElevatedButton.styleFrom(
//               foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
//               padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Button padding
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0), // Rounded corners
//                 side: BorderSide(color: Colors.blue), // Border color
//               ),
//             ),
//             child: Text(
//               "Sign Up".toUpperCase(), // Button text
//               style: TextStyle(
//                 fontSize: 16.0, // Text size
//                 fontWeight: FontWeight.bold, // Text weight
//               ),
//             ),
//           ),
//
//            SizedBox(height: defaultPadding),
//           AlreadyHaveAnAccountCheck(
//             login: false,
//             press: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return const LoginScreen();
//                   },
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }