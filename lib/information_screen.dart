// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'input_screen.dart';

class InformationScreen extends StatelessWidget {
  // Properties to store selected category and blood sugar values
  final CategoryType selectedCategory;
  final int beforeMealValue;
  final int afterMealValue;

  // Constructor to initialize the properties
  const InformationScreen({
    required this.selectedCategory,
    required this.beforeMealValue,
    required this.afterMealValue,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize variables to store information and image path
    String information = '';
    String imagePath = '';

    // Switch statement to determine information based on selected category and blood sugar values
    switch (selectedCategory) {
      case CategoryType.Adults:
        if (beforeMealValue >= 80 &&
            beforeMealValue <= 130 &&
            afterMealValue >= 130 &&
            afterMealValue <= 180) {
          information = 'Adults with type 1 diabetes.\n';
          information +=
              'Your blood sugar levels are outside the Normal range.';
          imagePath = 'assets/images/bad.png';
        } 
          
          
        else if (beforeMealValue > 130 && afterMealValue > 180) {
          information = 'Adults with type 2 diabetes\n';
          information += 'Dangerous level!\n';
          information += 'Your blood sugar levels are very High.';
          imagePath = 'assets/images/bad.png';
        } else {
          information = 'No Diabetes!\n';
          information += 'Your blood sugar levels are in Normal range.';
          imagePath = 'assets/images/good.png';
        }
        break;

      case CategoryType.Pregnant:
        if (beforeMealValue >= 70 &&
            beforeMealValue < 95 &&
            afterMealValue >= 100 &&
            afterMealValue <= 140) {
          information = 'Pregnant people with T1D, gestational diabetes\n';
          information +=
              'Your blood sugar levels are outside the Normal range.';
          imagePath = 'assets/images/bad.png';
        } else if (beforeMealValue > 100 && afterMealValue > 140) {
          information = 'Dangerous level!\n';
          information += 'Your blood sugar levels are very High.';
          imagePath = 'assets/images/bad.png';
        } else {
          information = 'No Diabetes!\n';
          information += 'Your blood sugar levels are in Normal range.';
          imagePath = 'assets/images/good.png';
        }
        break;

      case CategoryType.WithoutDiabetes:
        if (beforeMealValue >= 70 &&
            beforeMealValue <= 99 &&
            afterMealValue >= 90 &&
            afterMealValue <= 140) {
          information = 'Pre diabetes\n';
          information +=
              'Your blood sugar levels are outside the Normal range.';
          imagePath = 'assets/images/bad.png';
        } else if (beforeMealValue > 99 && afterMealValue > 140) {
          information = 'Dangerous level!\n';
          information += 'Your blood sugar levels are very High.';
          imagePath = 'assets/images/bad.png';
        } else {
          information = 'No Diabetes!\n';
          information += 'Your blood sugar levels are in Normal range.';
          imagePath = 'assets/images/good.png';
        }
        break;

      case CategoryType.Children:
        if (beforeMealValue >= 90 &&
            beforeMealValue <= 130 &&
            afterMealValue >= 90 &&
            afterMealValue <= 150) {
          information = 'Children with type 1 Diabetes\n';
          information +=
              'Your blood sugar levels are outside the Normal range.';
          imagePath = 'assets/images/bad.png';
        } else if (beforeMealValue > 130 && afterMealValue > 150) {
          information = 'Dangerous level!\n';
          information += 'Your blood sugar levels are very High.';
          imagePath = 'assets/images/bad.png';
        } else {
          information = 'No Diabetes!\n';
          information += 'Your blood sugar levels are in Normal range.';
          imagePath = 'assets/images/good.png';
        }
        break;

      case CategoryType.Older_65year:
        if (beforeMealValue >= 80 &&
            beforeMealValue <= 180 &&
            afterMealValue >= 80 &&
            afterMealValue <= 200) {
          information = 'Adults Diabetes\n';
          information +=
              'Your blood sugar levels are outside the Normal range.';
          imagePath = 'assets/images/bad.png';
        } else if (beforeMealValue > 180 && afterMealValue > 200) {
          information = 'Dangerous level!\n';
          information += 'Your blood sugar levels are very High.';
          imagePath = 'assets/images/bad.png';
        } else {
          information = 'No Diabetes!\n';
          information += 'Your blood sugar levels are in Normal range.';
          imagePath = 'assets/images/good.png';
        }
        break;

      default:
        information = 'Your blood sugar levels are in Good range.\nGood Health';
        imagePath = 'assets/images/good.png';
    }

    // Return the UI of the screen
    return Container(
      // Container to hold the entire screen with a specific background color
      color: const Color.fromARGB(255, 222, 255, 252),
      child: Scaffold(
        appBar: AppBar(
          // App bar with a title
          title: const Text('Blood Sugar Level Monitor', textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(255, 1, 45, 47),
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),),
          toolbarHeight: 38.0, // Setting toolbar height
          backgroundColor:
              const Color.fromARGB(255, 59, 187, 187),// Setting app bar color
        ),
        body: Center(
          // Centering the content vertically and horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // Aligning column content in center vertically
            children: [
              // Displaying image based on blood sugar level
              Image.asset(
                imagePath,
                height: 150, // Setting image height
              ),
              const SizedBox(height: 20.0), // Adding vertical space
              // Displaying selected category
              Text(
                'Category: ${selectedCategory.toString().split('.').last}',
                style: const TextStyle(
                  fontSize: 20.0, // Setting font size
                  color: Color.fromARGB(255, 2, 94, 77), // Setting text color
                  fontWeight: FontWeight.bold, // Making text bold
                ),
              ),
              const SizedBox(height: 18.0), // Adding vertical space
              // Container to display information with a colored background
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 40.0), // Adding margin around the container
                padding: const EdgeInsets.all(
                    30.0), // Adding padding to the container
                decoration: BoxDecoration(
                  color: imagePath == 'assets/images/good.png'
                      ? Colors.green.withOpacity(0.5)
                      : Colors.red.withOpacity(
                          0.5), // Setting background color based on image path
                  borderRadius: BorderRadius.circular(
                      15.0), // Adding border radius to container
                ),
                child: Text(
                  information,
                  style: TextStyle(
                    fontSize: 18.0, // Setting font size
                    fontWeight: FontWeight.bold, // Making text bold
                    color: imagePath == 'assets/images/good.png'
                        ? Colors.green
                        : Colors.red, // Setting text color based on image path
                  ),
                  textAlign: TextAlign.center, // Centering text horizontally
                ),
              ),
              const SizedBox(height: 40.0), // Adding vertical space
              // Button to go back to the previous screen
              ElevatedButton(
                onPressed: () {
                  Get.back(); // Navigating back to the previous screen using GetX
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 255,
                          255)), // Setting button background color
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adding border radius to button
                    ),
                  ),
                ),
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 14.0, // Setting font size
                    fontWeight: FontWeight.bold, // Making text bold
                    color: Color.fromARGB(
                        255, 255, 134, 131), // Setting text color
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(bottom: 15.0, left: 12.0),
          child: SizedBox(
            width: 40.0,
            height: 40.0,
            child: FloatingActionButton(
              onPressed: () {
                // Handle home button press
                // You can navigate to the home screen or perform any other action here
              },
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              elevation: 20.0,
              child: const Icon(Icons.home,
                  size: 32.0, color: Color.fromARGB(255, 7, 207, 181)),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      ),
    );
  }
}
