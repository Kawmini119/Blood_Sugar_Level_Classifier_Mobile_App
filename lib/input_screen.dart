import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'information_screen.dart';
import 'package:google_fonts/google_fonts.dart';

// Define enum for different age categories
enum CategoryType {
  Adults,
  Children,
  Pregnant,
  Older_65year,
  WithoutDiabetes,
}

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
 
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  // Text editing controllers for input fields
  final _beforeController = TextEditingController();
  final _afterController = TextEditingController();

  // Selected category, initially set to Adults
  CategoryType _selectedCategory = CategoryType.Adults;

  // Error messages for input fields
  String? _beforeError;
  String? _afterError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title of the application
            Text(
              'Blood Sugar Level \nClassifier',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                color: const Color.fromARGB(255, 255, 134, 131),
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
                shadows: [
                  const Shadow(
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 129, 226, 218),
                    offset: Offset(10.0, 10.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0), // Adding space
            // Image section
            Image.asset(
              'assets/images/input5.png',
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
            ),
            const SizedBox(height: 2.0), // Adding space
            // Description text
            const Text(
              '"Testing your blood sugar levels before a meal & testing after a meal, typically 1 or 2 hours after your meal, using Blood sugar monitor"\n',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 3, 111, 141),
                fontSize: 13.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 9.0), // Adding space
            // Dropdown menu to select age category
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '     Select your Age \n     Category',
                    style: TextStyle(
                      color: Color.fromARGB(255, 109, 105, 105),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 4, 204, 209),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: DropdownButton<CategoryType>(
                      value: _selectedCategory,
                      dropdownColor: const Color.fromARGB(255, 249, 147, 146),
                      iconSize: 24,
                      onChanged: (CategoryType? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        }
                      },
                      items: CategoryType.values.map((CategoryType category) {
                        return DropdownMenuItem<CategoryType>(
                          value: category,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              category.toString().split('.').last,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 39, 61, 61),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      isExpanded: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(Icons.arrow_drop_down,
                          color: Color.fromARGB(255, 3, 56, 64)),
                      underline: Container(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0), // Adding space
            // Input field for before meal blood sugar value
            TextField(
              controller: _beforeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(
                  fontSize: 16.0, color: Color.fromARGB(255, 3, 102, 109)),
              decoration: InputDecoration(
                labelText: 'Before Meal Blood Sugar Value in mg/dL',
                labelStyle: const TextStyle(
                    fontSize: 15.0, color: Color.fromARGB(255, 3, 102, 109)),
                fillColor: Color.fromRGBO(220, 250, 250, 0.9),
                filled: true,
                errorText: _beforeError,
                errorStyle: const TextStyle(
                    fontSize: 12.0, color: Colors.red), // Error text style
              ),
            ),
            const SizedBox(height: 12.0), // Adding space
            // Input field for after meal blood sugar value
            TextField(
              controller: _afterController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: const TextStyle(
                  fontSize: 16.0, color: Color.fromARGB(255, 3, 102, 109)),
              decoration: InputDecoration(
                labelText: 'After Meal Blood Sugar Value in mg/dL',
                labelStyle: const TextStyle(
                    fontSize: 15.0, color: Color.fromARGB(255, 3, 102, 109)),
                fillColor: const Color.fromRGBO(220, 250, 250, 0.9),
                filled: true,
                errorText: _afterError,
                errorStyle: const TextStyle(
                    fontSize: 12.0, color: Colors.red), // Error text style
              ),
            ),
            const SizedBox(height: 20.0), // Adding space between text fields and button
            // Button to show information
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate input and navigate to InformationScreen
                  if (_validateInput()) {
                    Get.to(() => InformationScreen(
                          selectedCategory: _selectedCategory,
                          beforeMealValue:
                              int.tryParse(_beforeController.text) ?? 0,
                          afterMealValue:
                              int.tryParse(_afterController.text) ?? 0,
                        ))?.then((_) {
                      _beforeController.clear();
                      _afterController.clear();
                      setState(() {
                        _selectedCategory = CategoryType.Adults;
                      });
                    });
                  }
                },
                style: ButtonStyle(
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 252, 252, 252)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                child: const Text(
                  "Show Info",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 134, 131),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 15.0, left: 10.0),
        child: SizedBox(
          // Wrap the icon with SizedBox to set its size
          width: 40.0, // Set the desired size for the icon
          height: 40.0,
          // Set the desired size for the icon
          child: FloatingActionButton(
            onPressed: () {
              
            },
            backgroundColor: const Color.fromARGB(255, 255, 255, 255)
                .withOpacity(1), // Set background color to transparent
            elevation: 20.0, // Remove shadow
            child: const Icon(
              Icons.home,
              size: 32.0,
              color: Color.fromARGB(255, 4, 192, 209),
            ), // Set the size of the icon
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }

  // Function to validate input fields
  bool _validateInput() {
    // Validate input fields
    bool isValid = true;

    if (_beforeController.text.isEmpty ||
        int.tryParse(_beforeController.text) == null) {
      setState(() {
        _beforeError = 'Please enter a valid value between 0-600mg/dl';
      });
      isValid = false;
    } else {
      setState(() {
        _beforeError = null;
      });
    }

    if (_afterController.text.isEmpty ||
        int.tryParse(_afterController.text) == null) {
      setState(() {
        _afterError = 'Please enter a valid value between 0-600mg/dl';
      });
      isValid = false;
    } else {
      setState(() {
        _afterError = null;
      });
    }

    return isValid;
  }
}