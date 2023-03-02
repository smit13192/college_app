import 'package:flutter/material.dart';

import '../../model/gender.dart';
import '../widgets/radio_tile.dart';
import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool conformSeen = true;
  bool seen = true;

  Gender gender = Gender.male;

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNoController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  InputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.red),
  );
  InputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: Colors.grey.shade200),
  );
  InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.blueGrey),
  );
  InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: Colors.red),
  );

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNoController.dispose();
    dateController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (notification) {
            notification.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Kiran",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 2,
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Enter Valid Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            nameController.clear();
                          },
                        ),
                        hintText: "Enter Name",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            emailController.clear();
                          },
                        ),
                        hintText: "Enter Email",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      controller: phoneNoController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Enter Valid Phone Number";
                        }
                        if (value.length != 10) {
                          return "Phone Number Must Be 10 Number";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            phoneNoController.clear();
                          },
                        ),
                        hintText: "Enter Phone Number",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      readOnly: true,
                      keyboardType: TextInputType.datetime,
                      controller: dateController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Choose Date";
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() {
                            dateController.text =
                                "${date.day}-${date.month}-${date.year}";
                          });
                        }
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.clear,
                          ),
                          onPressed: () {
                            dateController.clear();
                          },
                        ),
                        hintText: "Enter Date Of Birth",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MyRadioTile(
                            value: Gender.male,
                            groupValue: gender,
                            onChanged: (changedValue) {
                              setState(
                                () {
                                  gender = changedValue!;
                                },
                              );
                            },
                            text: 'Male',
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: MyRadioTile(
                            value: Gender.female,
                            groupValue: gender,
                            onChanged: (changedValue) {
                              setState(
                                () {
                                  gender = changedValue!;
                                },
                              );
                            },
                            text: 'Female',
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: MyRadioTile(
                            value: Gender.others,
                            groupValue: gender,
                            onChanged: (changedValue) {
                              setState(
                                () {
                                  gender = changedValue!;
                                },
                              );
                            },
                            text: 'Others',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: seen,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Enter valid email";
                        }
                        if (value != conformPasswordController.text) {
                          return "Enter same password";
                        }
                        if (value.length < 8) {
                          return "Password length must be more than 7";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            seen ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            if (seen) {
                              seen = false;
                            } else {
                              seen = true;
                            }
                            setState(() {});
                          },
                        ),
                        hintText: "Password",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: conformSeen,
                      controller: conformPasswordController,
                      validator: (value) {
                        if (value!.isEmpty || value.contains(" ")) {
                          return "Enter valid email";
                        }
                        if (value != passwordController.text) {
                          return "Enter same password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            conformSeen
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            if (conformSeen) {
                              conformSeen = false;
                            } else {
                              conformSeen = true;
                            }
                            setState(() {});
                          },
                        ),
                        hintText: "Conform Password",
                        enabledBorder: enabledBorder,
                        focusedBorder: focusedBorder,
                        errorBorder: errorBorder,
                        focusedErrorBorder: focusedErrorBorder,
                        filled: true,
                        fillColor: Colors.grey[50],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(const EdgeInsets.all(15)),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          signIn();
                          Future.delayed(
                            const Duration(seconds: 2),
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                            },
                          );
                        }
                      },
                      child: const Text("Register"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "You have an account ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  signIn() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.grey[50],
        content: const Text(
          "Log In Successfully",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
