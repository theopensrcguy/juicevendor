import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.trim(), password: _passwordController.text.trim());
}

@override
  void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
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
                                          Text('Login', style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 26,
                                          )
                                          ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Please sign in to continue', style: TextStyle(
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
                              const SizedBox(height: 25,),
                              buildPassword(),
                              const SizedBox(height: 10,),
                              const Text('Not A  Member? Register Now', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Color(0xffFCA148),

                              )),

                              const SizedBox(height: 20,),

                           GestureDetector(
                             onTap: () => login(),
                             child: Container(
                               height: 50,
                               width: 150,
                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.circular(30),
                                   gradient: const LinearGradient(
                                     colors: [
                                       Color(0xfff7b858),
                                       Color(0xfffca148),
                                     ]
                                   ),
                               ),
                               child: Row(
                                 children: const [
                                   SizedBox(width: 20,),
                                   Text('LOGIN', style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                     fontSize: 17,
                                     color: Colors.white
                                   ),),
                                   SizedBox(width: 20,),
                                   Icon(Icons.arrow_forward_ios, color: Colors.white,),

                                 ],
                               ),
                             ),
                           ),
                              const SizedBox(height: 20,),
                              Row(
                                children: const [
                                  SizedBox(height: 20,),
                                  Text('Dont have an account?', style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.white
                                  ),),
                                  SizedBox(width: 20,),
                                  Icon(Icons.arrow_forward_ios, color: Colors.white,),
                                  SizedBox(height: 20,),
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
