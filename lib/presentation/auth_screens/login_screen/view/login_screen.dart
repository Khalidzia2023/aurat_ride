import 'package:aurat_ride/utils/app_images.dart';
import 'package:aurat_ride/widgets/custom_container.dart';
import 'package:aurat_ride/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toastification/toastification.dart';
import '../../../../utils/app_colors.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../forgot_password/reset_password/reset_password.dart';
import '../../../home_screen/home_screen.dart';
import '../../signup_screen/view/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;
  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    setState(() => isLoading = true);

    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account disposed")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Login failed')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:   PreferredSize(
        preferredSize: Size(0, 60),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.blueColor.withValues(alpha: 0.77),
              borderRadius: BorderRadius.circular(16),
              border: Border(bottom: BorderSide(color: Colors.grey, width: 3))
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Aurat Rides Login', style: TextStyle(color: Colors.white),),
            centerTitle: true,
           automaticallyImplyLeading: false,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(AppImages.loginImage),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.email, color: Colors.blueGrey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(Icons.lock, color: Colors.blueGrey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              isLoading
                  ? CircularProgressIndicator()
                  : CustomContainer(
                height: 46,
                width: double.infinity,
                onTap: (){
                  if(_login() == true)
                  ToastHelper.showCustomToast(
                    context: context,
                    message: 'You successfully LoggedIn to Aurat Ride',
                    type: ToastificationType.info,
                    icon: Icons.check,
                    primaryColor: Colors.green,
                  );
                  },
                bgColor: AppColors.blueColor.withValues(alpha: 0.77),
                boxBorder: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10),
                child: Center(
                  child: regularTextWidget(
                    title: 'Login',
                    textSize: 18,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
                  },
                  child: regularTextWidget(
                    title: 'Forget Password?',
                    textSize: 16,
                    textColor: Colors.black54,
                    fontWeight: FontWeight.w600,
                    shadowColor: Colors.blueGrey.shade400,
                    blurRadius: 10,
                    shadowOffset: Offset(1.0, 1.2),
                    spreadRadius: 12,

                  ),
                ),
              ),
          SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                regularTextWidget(
                  title: 'Don\'t have an account',
                  textSize: 16,
                  textColor:  Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                  },
                  child: regularTextWidget(
                    title: 'Register?',
                    textSize: 18,
                    textColor: AppColors.blueColor.withValues(alpha: 0.77),
                    fontWeight: FontWeight.w600,
                    shadowColor: Colors.blueGrey.shade400,
                    blurRadius: 16,
                    shadowOffset: Offset(1.4, 1.9),
                    spreadRadius: 17,
                  ),
                ),
              ],
            )
            ],
          ),
        ),
      ),
    );
  }
}

