import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {

  final VoidCallback showLoginPage;
  const RegistrationPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordconfirmationController = TextEditingController();

Future signUp() async{
if(passwordConfirmed()){

  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());

}
}
 bool passwordConfirmed(){
  if(_passwordController.text.trim() == _passwordconfirmationController.text.trim()){
    return true;
  }else{
    return false;
  }
  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordconfirmationController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Widget buildEmail(){
      return  Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3,3),
                  blurRadius: 6,
                  color: Colors.grey.shade400
              )
            ]
        ),
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return 'enter email address';
            }
          },
          controller: _emailController,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                  Icons.email_outlined
              ),
              hintText: 'Enter your email'
          ),
        ),
      );
    }


    Widget buildPassword(){
      return  Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(3,3),
                  blurRadius: 6,
                  color: Colors.grey.shade400
              )
            ]
        ),
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return 'enter your password';
            }
          },
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                  Icons.lock_outline_rounded
              ),
              hintText: 'Enter your password'
          ),
        ),
      );
    }


    Widget confirmPassword(){
      return  Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(3,3),
                  blurRadius: 6,
                  color: Colors.grey.shade400
              )
            ]
        ),
        child: TextFormField(
          validator: (value){
            if(value == null || value.isEmpty){
              return 'enter your confirmation password';
            }
          },
          controller: _passwordconfirmationController,
          obscureText: true,
          decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                  Icons.lock_outline_rounded
              ),
              hintText: 'Confirm your password'
          ),
        ),
      );
    }


    return  Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            children: [
              Stack(
                  children:[
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,300),
                    ),
                    Positioned(
                      top:220,
                      left:18,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const [
                            Text('Sign Up', style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 26,
                            )
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Please sign up to continue', style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                            ))
                          ]
                      ),

                    )
                  ]
              ),

              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 25,),
                      buildEmail(),
                      const SizedBox(height: 15,),
                      buildPassword(),
                      const SizedBox(height: 15,),
                      confirmPassword(),
                      const SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () => signUp(),
                        child: Container(
                          height: 50,
                          // width: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(0xfff7b858),
                                  Color(0xfffca148),
                                ]
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(width: 20,),
                              Center(
                                child: Text('Register', style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.white
                                ),),
                              ),
                              SizedBox(width: 20,),
                              Icon(Icons.arrow_forward_ios, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          SizedBox(height: 25,),
                          const Text('Have an account?', style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.black
                          ),
                          ),
                          const SizedBox(width: 20,),

                          GestureDetector(
                            onTap: widget.showLoginPage,
                            child: const Text('Login', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.blue

                            ),
                            ),
                          ),

                          const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                          const SizedBox(height: 20,),
                        ],
                      ),

                    ],
                  )
              ),

            ]
        ),
      ),
    );


  }
}
