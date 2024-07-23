import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nike_application/firebase_auth.dart/firebase_auth_services.dart';
import 'package:nike_application/home_page.dart';
import 'package:nike_application/sign_up_page.dart';

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text == _passwordController.text) {
        String email = _emailController.text;
        String password = _passwordController.text;

        User? user =
            await _auth.signInWithEmailAndPassword(context, email, password);

        if (user != null) {
          if (!mounted)
            return; // Ensure the widget is still mounted before using context
          print("User is successfully signed in");
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    MyHomePage(email: email)), // Pass the email to MyHomePage
          );
        } else {
          _showDialog();
        }
      }
    }
  }

  _signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId:
            '701818395387-var5512hldi7lapil82mv6822qqne55c.apps.googleusercontent.com');

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );

        UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        String email = userCredential.user?.email ?? "";
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomePage(email: email),
          ),
        );
      }
    } catch (e) {
      _showDialog();
    }
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid'),
        content: const Text('Incorrect email or password.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  String? _emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? _passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    } else if (!RegExp(
            r'((?=.*(\!|\@|\#|\$|\%|\^))(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z])(?=.*[a-zA-z0-9!@#$%^]*)){8,}')
        .hasMatch(password)) {
      return "Please provide atleast 8 characters, atleast one upper case letter, atleast one number, and atleast one special character";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/nike.png', // Make sure to add your Nike logo image to the assets folder
                    height: 100,
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: _emailValidator,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).shadowColor,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    validator: _passwordValidator,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _submit,
                    label: const Text(
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 17),
                        'Login'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('----- Or Sign in with -----'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _signInWithGoogle,
                    icon: Image.asset(
                      'assets/gicon.png', // Make sure to add your Google logo image to the assets folder
                      height: 24,
                    ),
                    label: const Text(
                      'Google',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "Don't have an account? ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 15)),
                        TextSpan(
                            text: 'Sign  up',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MySignUpPage()))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
      
//       Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Colors.white,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   'assets/nike.png',
//                   height: 250,
//                   width: 250,
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 const Text(
//                   "Sign In",
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     label: Text("Enter your Email"),
//                     labelStyle: TextStyle(color: Colors.black),
//                     filled: false,
//                     fillColor: Colors.black,
//                   ),
//                   style: const TextStyle(color: Colors.black),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: _emailValidator,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   controller: _passwordController,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     label: const Text("Enter your Password"),
//                     labelStyle: const TextStyle(color: Colors.black),
//                     filled: false,
//                     fillColor: Colors.black,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _passwordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Theme.of(context).canvasColor,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _passwordVisible = !_passwordVisible;
//                         });
//                       },
//                     ),
//                   ),
//                   style: const TextStyle(color: Colors.black),
//                   obscureText: !_passwordVisible,
//                   validator: _passwordValidator,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: _signInWithGoogle,
//                   icon: Image.asset(
//                     'assets/gicon.png',
//                     height: 24,
//                   ),
//                   label: const Text(
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 17),
//                       'Google'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: _submit,
//                   label: const Text(
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal,
//                           fontSize: 17),
//                       'Login'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       const TextSpan(
//                           text: "Don't have an account? ",
//                           style: TextStyle(color: Colors.black, fontSize: 15)),
//                       TextSpan(
//                           text: 'Sign  up',
//                           style: const TextStyle(
//                             color: Colors.blue,
//                             fontSize: 15,
//                             decoration: TextDecoration.underline,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) =>
//                                         const MySignUpPage()))),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
