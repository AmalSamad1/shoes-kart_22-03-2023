import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


import 'Login/SignUp_test1.dart';

class Log1 extends StatefulWidget {
  const Log1({Key? key}) : super(key: key);

  @override
  State<Log1> createState() => _Log1State();
}

class _Log1State extends State<Log1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emaillog = new TextEditingController();
  TextEditingController passlog = new TextEditingController();
  bool _validate = false;
  bool _obscureText = true;
  RegExp pass_valid = RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!%*?&])[A-Za-z\d@!%*?&]{8,}");
  //A function that validate user entered password
  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

    bool isEmail(String input) => EmailValidator.validate(input);
  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);
  @override
  Widget build(BuildContext context) {
    bool register = true;
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(223, 82, 54, 43),
                  Color.fromARGB(223, 82, 54, 43),
                  Color.fromARGB(223, 82, 54, 43),
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                         Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                                children: <Widget>[
                                  SingleChildScrollView(child: Form(
                                    key: _formKey,
                                    child:Column(children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(

                                          controller: emaillog,
                                          validator: (value) {
                                            if (!isEmail(value!) && !isPhone(value)) {
                                              return 'Please enter the email or phone number.';
                                            }
                                            return null;
                                          },
                                          onSaved:(newValue) {
                                            emaillog=newValue as TextEditingController;
                                          } ,
                                          decoration: InputDecoration(
                                              hintText: "Email or Phone number",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(

                                          autocorrect: true,
                                          obscureText: _obscureText,

                                          validator: (value){
                                            if(value!.isEmpty){
                                              return "Please enter password";
                                            }else{
                                              //call function to check password
                                              bool result = validatePassword(value);
                                              if(result){
                                                // create account event
                                                return null;
                                              }else{
                                                return " Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character";
                                              }
                                            }
                                          },

                                          decoration: InputDecoration(suffixIcon: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                _obscureText = !_obscureText;
                                              });
                                            },
                                            child: Icon(
                                              _obscureText ? Icons.visibility : Icons.visibility_off,
                                              semanticLabel:
                                              _obscureText ? 'show password' : 'hide password',
                                            ),
                                          ),
                                              hintText: "Password",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                    ],
                                    ),
                                  ))])),
                        SizedBox(height: 40,),
                       Text("Forgot Password?", style: TextStyle(color: Colors.grey),),
                        SizedBox(height: 40,),

                        FloatingActionButton.extended(
                          isExtended: true,
                          backgroundColor:Color.fromARGB(223, 82, 54, 43) ,
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              print("successful");
                              Navigator.pushNamed(context, "/profile");
                              return;
                            } else {
                              print("UnSuccessfull");
                            }


                          },
                          label: Text('                       Login                            '),
                        ),
                        SizedBox(height: 50,),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                onEnter: (event) => SignUp(),
                                text: register
                                    ? "Don’t have an account yet? "
                                    : '',
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                              WidgetSpan(

                                child: InkWell(
                                  onTap: () => setState(() {
                                    Navigator.pushNamed(context, "/signup");
                                  }),
                                  child: register
                                      ? Text(
                                    "SignUp",

                                    style: TextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xffEEA4CE),
                                            Color(0xffC58BF2),
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                            0.0,
                                            0.0,
                                            200.0,
                                            70.0,
                                          ),
                                        ),
                                      fontSize: size.height * 0.018,
                                    ),
                                  )
                                      : Text(
                                    "Register",
                                    style: TextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xffEEA4CE),
                                            Color(0xffC58BF2),
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                              0.0, 0.0, 200.0, 70.0),
                                        ),
                                      // color: const Color(0xffC58BF2),
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class FadeAnimation extends StatelessWidget {
//   final double delay;
//   final Widget child;
//
//   FadeAnimation(this.delay, this.child);
//
//   @override
//   Widget build(BuildContext context) {
//     final tween = MultiTrackTween([
//       Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
//       Track("translateY").add(
//           Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
//           curve: Curves.easeOut)
//     ]);
//
//     return ControlledAnimation(
//       delay: Duration(milliseconds: (500 * delay).round()),
//       duration: tween.duration,
//       tween: tween,
//       child: child,
//       builderWithChild: (context, child, animation) => Opacity(
//         opacity: animation["opacity"],
//         child: Transform.translate(
//             offset: Offset(0, animation["translateY"]),
//             child: child
//         ),
//       ),
//     );
//   }
// }
