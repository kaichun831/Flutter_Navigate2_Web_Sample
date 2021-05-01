// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:kaichun_profile/common/MyApplication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // CollectionReference? users;
  bool _toggleButton = true;
  double alpha = 0;
  TextEditingController? account;
  TextEditingController? password;
  @override
  Widget build(BuildContext context) {
    // users = FirebaseFirestore.instance.collection('GoogleAccount');
    account = TextEditingController();
    password = TextEditingController();
    Future.delayed(Duration(milliseconds: 800), () {
      setState(() {
        alpha = 1;
      });
    });
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyanAccent.withAlpha(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withAlpha(50),
                            offset: Offset(5, 5)),
                        BoxShadow(
                            color: Colors.grey.withAlpha(80),
                            offset: Offset(-5, -5))
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blueGrey, width: 2)),
                        onPressed: () {},
                        // onPressed:signInWithGoogle,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/google.png',
                                scale: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'LOGIN',
                                style: TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          Positioned(
            child: Align(
                child: Text(
              'KAI CHUN PROFILE',
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            )),
            top: 150,
            bottom: 0,
            right: 0,
            left: 0,
          ),
          Positioned(
            child: Align(
                child: InkWell(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Hero(
                  tag: 'me',
                  key: ValueKey(1),
                  child: AnimatedOpacity(
                      duration: Duration(milliseconds: 800),
                      opacity: alpha,
                      child: Image.asset('assets/me.jpg')),
                ),
              ),
              onTap: () {
                MyApplication.fastLogin = true;
                Navigator.pushNamed(context, '/main');
              },
            )),
            top: -300,
            bottom: 0,
            right: 0,
            left: 0,
          ),
        ],
      ),
    ));

    // return ProgressHUD(
    //   textStyle: Theme.of(context).accentTextTheme.subtitle,
    //   child: Builder(
    //     builder: (context) => Scaffold(
    //         // appBar: AppBar(
    //         //   title: Text('Demo'),
    //         // ),
    //         body: Stack(
    //             children[],: Container(
    //                 padding: EdgeInsets.all(25),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     // Text(
    //                     //   'Welcome',
    //                     //   style: TextStyle(fontSize: 30),
    //                     // ),
    //                     // SizedBox(
    //                     //   height: 30,
    //                     // ),
    //                     // TextFormField(
    //                     //   controller: account,
    //                     //   decoration: InputDecoration(
    //                     //       prefixIcon:
    //                     //           Icon(Icons.accessibility, color: Colors.grey),
    //                     //       labelText: 'Please Insert Your Account',
    //                     //       hintText: 'Account'),
    //                     // ),
    //                     // TextFormField(
    //                     //   controller: password,
    //                     //   decoration: InputDecoration(
    //                     //       prefixIcon: Icon(
    //                     //         Icons.lock,
    //                     //         color: Colors.grey,
    //                     //       ),
    //                     //       suffixIcon: IconButton(
    //                     //         icon: _toggleButton
    //                     //             ? Icon(Icons.visibility_off,
    //                     //                 color: Colors.grey)
    //                     //             : Icon(Icons.visibility,
    //                     //                 color: Colors.grey),
    //                     //         onPressed: toggleButton,
    //                     //       ),
    //                     //       labelText: 'Please Insert Your Password',
    //                     //       hintText: 'Password'),
    //                     //   obscureText: _toggleButton,
    //                     // ),
    //                     // SizedBox(
    //                     //   height: 15,
    //                     // ),
    //                     // RaisedButton(
    //                     //     child: Text('Sign In'),
    //                     //     onPressed: () async{
    //                     //       FocusScope.of(context).unfocus();
    //                     //       SignInRule(context,account.text,password.text);
    //                     //     }),
    //                     // RaisedButton(
    //                     //     child: Text('Sign Out'),
    //                     //     onPressed: () {
    //                     //       FocusScope.of(context).unfocus();
    //                     //         signOutWithGoogle();
    //                     //     }),
    //                     IconButton(
    //                       icon:Image.asset('assets/google.png'),
    //                       onPressed: signInWithGoogle,
    //                     ),
    //                   ],
    //                 )))),
    //   ),
    // );
  }

  //Google Sign In
  // Future<void> signInWithGoogle() async {
  //   MyApplication.fastLogin=false;
  //   var customer = GoogleSignIn();
  //   await customer.signIn();
  //   var user = customer.currentUser!;
  //     print("成功登入");
  //     googleAddUser(user.id, user.displayName!, user.email, user.photoUrl!);
  //     MyApplication.userName = user.displayName;
  //     MyApplication.userEmail = user.email;
  //     MyApplication.userPhotoUrl = user.photoUrl;
  //     Fluttertoast.showToast(
  //         msg: "Login Success",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //     Future.delayed(
  //         Duration(seconds: 2), () => Navigator.pushNamed(context, '/main'));
  // }

  //Google Sign Out
  // Future<void> signOutWithGoogle() async {
  //   GoogleSignIn().signOut();
  // }

  // Add User To fireBase Storage
  // Future<void> googleAddUser(
  //     String id, String name, String email, String photoUrl) {
  //   print(name);
  //   return users!
  //       .doc(id + name)
  //       .set({'id': id, 'name': name, "email": email, 'photoUrl': photoUrl})
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  //SignIn Rule
  Future<void> SignInRule(
      BuildContext context, String account, String password) async {
    var a = ProgressHUD.of(context);
    a!.showWithText('Loading');
    if (account == "account" && password == "password") {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamed(context, '/main');
        a.dismiss();
      });
    } else {
      a.dismiss();
      Fluttertoast.showToast(
          msg: "Sign In Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void toggleButton() {
    setState(() {
      _toggleButton = !_toggleButton;
    });
  }
}
