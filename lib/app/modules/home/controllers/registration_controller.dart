import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  RxString readUserID = ''.obs;
  RxString readEmail = ''.obs;
  RxString readPassword = ''.obs;
  RxString readName = ''.obs;
  final formKey = GlobalKey<FormState>();
  final userIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  late final Databases database;
  final dbId = "656603c41c0e2873e3dc";
  RxString documentID = ''.obs;
  final collectionId = "65660404d9434def9d6c";
  final client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('6565f7e9d25c1dc8da91');

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    database = Databases(client);
    fetchData(); // Fetch data when the form loads
  }

  Future<void> fetchData() async {
    try {
      final response = await database.listDocuments(
          collectionId: collectionId,
          databaseId: dbId,
          queries: [
            Query.orderAsc('userId'), // Order by title in ascending order
            Query.orderDesc('email'), // Order by year in descending order
            Query.orderDesc('password'), // Order by
            Query.orderDesc('name'), // Order by
          ]);

      if (response != null) {
        final document = response.documents[0];
        documentID.value = document.$id;
        final data = document.data;
        userIdController.text = data['userId'];
        emailController.text = data['email'];
        passwordController.text = data['password'];
        nameController.text = data['name'];
        readUserID = userIdController.text.obs;
        readEmail = emailController.text.obs;
        readPassword = passwordController.text.obs;
        readName = nameController.text.obs;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }

  Future<void> submitForm() async {
    if (formKey.currentState!.validate()) {
      try {
        await database.createDocument(
          collectionId: collectionId,
          data: {
            'userId': userIdController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'name': nameController.text,
          },
          documentId: ID.unique(),
          databaseId: dbId,
        );

        Get.snackbar('Success', 'Form submitted successfully');
        fetchData();
        updateViewState();
        clearForm();
      } catch (e) {
        Get.snackbar('Error', 'Failed to submit form: $e');
      }
    }
  }

  Future<void> updateData(String documentId) async {
    if (formKey.currentState!.validate()) {
      try {
        await database.updateDocument(
          collectionId: collectionId,
          documentId: documentId,
          data: {
            'userId': userIdController.text,
            'email': emailController.text,
            'password': passwordController.text,
            'name': nameController.text,
          },
          databaseId: dbId,
        );

        Get.snackbar('Success', 'Data updated successfully');
        fetchData();
        updateViewState();
      } catch (e) {
        Get.snackbar('Error', 'Failed to update data: $e');
      }
    }
  }

  Future<void> deleteData(String documentId) async {
    try {
      await database.deleteDocument(
        collectionId: collectionId,
        documentId: documentId,
        databaseId: dbId,
      );

      Get.snackbar('Success', 'Data deleted successfully');
      fetchData();
      userIdController.text = '';
      emailController.text = '';
      passwordController.text = '';
      nameController.text = '';
      readUserID = ''.obs;
      readEmail = ''.obs;
      readPassword = ''.obs;
      readName = ''.obs;
      updateViewState();
      clearForm();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete data: $e');
    }
  }

  // Helper function to clear form fields
  void clearForm() {
    userIdController.clear();
    emailController.clear();
    passwordController.clear();
    nameController.clear();
  }

  void updateViewState() {
    update();
  }
}
