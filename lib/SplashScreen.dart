// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:math' as math;
//
// import 'onboarding_screen.dart';
//
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
//
//   late final AnimationController _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this)..repeat();
//   @override
//
//   void dispose(){
//     super.dispose();
//     _controller.dispose();
//   }
//
//   void initState(){
//     super.initState();
//
//     Timer(Duration(seconds: 2),() {
//
//       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> OnboardingScreen()));
//     },);
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue.shade50,
//       body: SafeArea(
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//
//           children: [
//
//             AnimatedBuilder(
//                 animation: _controller,
//                 child: Container(
//                   height: MediaQuery.of(context).size.height*0.8,
//                   child: const Center(
//                     child: Image(image: AssetImage('assets/icons/google-plus.png')),
//                   ),
//                 ),
//                 builder: (BuildContext context ,Widget? child){
//                   return Transform.rotate(
//                     angle: _controller.value*4.0*math.pi,
//                     child: child,
//                   );
//
//                 }),
//             SizedBox(height: MediaQuery.of(context).size.height*0,),
//             Align(
//                 alignment: Alignment.center,
//                 child: Text("Covid 19\nTracker App",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,),)
//
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
