import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLesson extends StatefulWidget {
  const FormLesson({super.key});

  @override
  State<FormLesson> createState() => _FormLessonState();
}

class _FormLessonState extends State<FormLesson> {
  String request = '';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void _update () {
    setState(() {});
  }

  @override
  void initState() {
    _email.addListener(_update);
    _password.addListener(_update);
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key : _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 130),

                /// Email
                TextFormField(
                  controller: _email,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {

                    if(value == null || value.isEmpty) {
                      return 'Fill The Email';
                    }

                    if(!value.endsWith("@gmail.com")) {
                      return 'Write Email In Right Format';
                    }


                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email Address",
                    prefixIcon: Icon(Icons.email_outlined),
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                /// Password
                TextFormField(
                  controller: _password,
                  validator: (value) {
                    if(value == null || value.isEmpty) {
                      return 'Fill The Password';
                    }
                    if(value.length < 9) {
                      return 'Password Must be 9 numbers';
                    }
                    return null;
                  },
                  maxLength: 9,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_open),
                    suffixIcon: Icon(CupertinoIcons.eye),
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                /// Login
                GestureDetector(
                  onTap: () {
                    if(_formKey.currentState!.validate()) {
                      setState(() {
                        request = "Request";
                      });
                    } else {
                      return;
                    }

                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                      _email.text == "" && _password.text == ''
                      ? Colors.grey
                      : Colors.blue,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Center(child: Text("Login")),
                  ),
                ),

                SizedBox(height: 120),

                /// request
                Text("Request : $request" , style: TextStyle(color: Colors.white,),),

                SizedBox(height: 20),

                /// controllers effect
                Text("Email : ${_email.text.replaceAll(" ", "")}" , style: TextStyle(color: Colors.white,),),
                Text("Password : ${_password.text}" , style: TextStyle(color: Colors.white,),),


              ],


            ),
          ),
        ),

      ),
    );
  }
}
