import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Model_test/user/user.dart';
import 'package:untitled/profile_page1/profilepage_test1.dart';
import 'package:untitled/splashsceen_test/splashscreen.dart';


import 'Editprofile_test/editprofile_test1.dart';
import 'loginpage_test/Login/SignUp_test1.dart';
import 'loginpage_test/login_test1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: Home1(),
      // initialRoute:'/' ,
      // routes: {
      //   "/":(context) => SplashScreen1(),
      //   "/log":(context) => Log1(),
      //   "/signup":(context) => SignUp(),
      //   "/profile":(context) => ProfilePage(),
      //   "/editprofile":(context) => EditProfile()
      // },

    );
  }
}
class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => User(name: "Name"+ Provider.of<User>(context).name.toString(), email: 'email'+Provider.of<User>(context).email.toString(), phone: 'Mobile'+Provider.of<User>(context).phone.toString()),
    child: MaterialApp(home: SplashScreen1(),routes: {
      "/log":(context) => Log1(),
      "/signup":(context) => SignUp(),
      "/profile":(context) => ProfilePage(),
      "/editprofile":(context) => EditProfile()
    },));
  }
}




