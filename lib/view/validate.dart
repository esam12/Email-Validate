import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class Validate extends StatefulWidget {
  const Validate({super.key});

  @override
  State<Validate> createState() => _ValidateState();
}

class _ValidateState extends State<Validate> {
  TextEditingController textController = TextEditingController();
  bool isEmailCorrect = false;

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          backgroundColor:
              isEmailCorrect == false ? Colors.redAccent : Colors.green,
          centerTitle: true,
          elevation: 2,
          title: const Text(
            'Email Validator',
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          width: size.width,
          height: size.height,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter Your Email : ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  onChanged: (val) {
                    setState(() {
                      isEmailCorrect = isEmail(val);
                    });
                  },
                  showCursor: true,
                  controller: textController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                    ),
                    hintText: 'anyThing@gmail.com',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    suffixIcon: Icon(
                      isEmailCorrect == false ? Icons.close : Icons.done,
                      color:
                          isEmailCorrect == false ? Colors.red : Colors.green,
                    ),
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:
                            isEmailCorrect == false ? Colors.red : Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
