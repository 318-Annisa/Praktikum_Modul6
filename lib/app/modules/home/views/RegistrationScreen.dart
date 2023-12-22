import 'package:cake_baru/app/modules/home/controllers/registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  final RegistrationController controller = Get.put(
      RegistrationController()); // Assuming you've set up your bindings correctly

  // final TextEditingController userIdController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController nameController = TextEditingController();

  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: controller.userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
              ),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 16.5),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Call your createAccount function from the controller
                      // controller
                      controller.submitForm();
                    },
                    child: Text('Submit'),
                  ),
                  SizedBox(width: 16.5),
                  ElevatedButton(
                    onPressed: () {
                      // Call your createAccount function from the controller
                      // controller
                      controller.updateData(controller.documentID.string);
                    },
                    child: Text('Update'),
                  ),
                  SizedBox(width: 16.5),
                  ElevatedButton(
                    onPressed: () {
                      // Call your createAccount function from the controller
                      // controller
                      controller.deleteData(controller.documentID.string);
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
              SizedBox(height: 16.5),
              Text('User ID : ${controller.readUserID.obs}'),
              Text('Email : ${controller.readEmail.obs}'),
              Text('Password : ${controller.readPassword.obs}'),
              Text('Name : ${controller.readName.obs}')
            ],
          ),
        ),
      ),
    );
  }
}
