import 'dart:math';
import 'package:flutter/material.dart';
import 'package:teletalk_result_app/pages/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedExamination = "SSC/Dakhil/Equivalent";
  String? selectedYear = "Select One";
  String? selectedBoard = "Select One";

  final List<String> examinations = [
    "SSC/Dakhil/Equivalent",
    "JSC/JDC",
    "SSC/Dakhil",
    "SSC(Vocational)",
    "HSC/Alim",
    "HSC(Vocational)",
    "HSC(BM)",
    "Diploma in Commerce",
    "Diploma in Business Studies"
  ];

  final List<String> years = [
    "Select One",
    "2023",
    "2022",
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010",
    "2009",
    "2008",
    "2007",
    "2006",
    "2005",
    "2004",
    "2003",
    "2002",
    "2001",
    "2000",
    "1999",
    "1998",
    "1997",
    "1996"
  ];

  final List<String> boards = [
    "Select One",
    "Barisal",
    "Chittagong",
    "Comilla",
    "Dhaka",
    "Dinajpur",
    "Jessore",
    "Mymensingh",
    "Rajshahi",
    "Sylhet",
    "Madrasah",
    "Technical",
    "DIBS(Dhaka)"
  ];

  final TextEditingController rollController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController captchaController = TextEditingController();

  int _captchaNum1 = 0;
  int _captchaNum2 = 0;

  @override
  void initState() {
    super.initState();
    _generateCaptchaNumbers();
  }

  @override
  void dispose() {
    rollController.dispose();
    regNoController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  void _generateCaptchaNumbers() {
    final random = Random();
    _captchaNum1 =
        random.nextInt(10); // Generates random number between 0 and 9
    _captchaNum2 = random.nextInt(10);
  }

  void _resetForm() {
    setState(() {
      selectedExamination = "SSC/Dakhil/Equivalent";
      selectedYear = "Select One";
      selectedBoard = "Select One";
    });
    _formKey.currentState?.reset();
    rollController.clear();
    regNoController.clear();
    captchaController.clear();
    _generateCaptchaNumbers(); // Regenerate captcha numbers
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Result Form",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                // Implement your logout logic here
                // For example, you can navigate to the login page
                Navigator.pop(context); // Close the current screen
              },
              alignment: Alignment.centerRight, // Align the icon to the right
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDropdownField(
                    "Examination", examinations, selectedExamination,
                    (String? newValue) {
                  setState(() {
                    selectedExamination = newValue;
                  });
                }),
                const SizedBox(height: 16),
                buildDropdownField("Year", years, selectedYear,
                    (String? newValue) {
                  setState(() {
                    selectedYear = newValue;
                  });
                }),
                const SizedBox(height: 16),
                buildDropdownField("Board", boards, selectedBoard,
                    (String? newValue) {
                  setState(() {
                    selectedBoard = newValue;
                  });
                }),
                const SizedBox(height: 16),
                buildTextField("Roll", rollController),
                const SizedBox(height: 16),
                buildTextField("Reg. No", regNoController),
                const SizedBox(height: 16),
                buildCaptchaField(captchaController),
                const SizedBox(height: 48),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _resetForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            //fixedSize: const Size(150, 50),
                          ),
                          child: const Text("Reset",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Navigate to ResultView
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ResultView(),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            //fixedSize: const Size(150, 50),
                          ),
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String label, List<String> items,
      String? selectedItem, ValueChanged<String?> onChanged) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text("$label ")),
        Expanded(
          flex: 3,
          child: DropdownButtonFormField<String>(
            value: selectedItem,
            onChanged: onChanged,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            isExpanded: true,
            icon: const Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 14,
              color: Colors.green,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(4.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            menuMaxHeight: MediaQuery.of(context).size.height *
                0.5, // Adjust this as needed
          ),
        ),
      ],
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text("$label ")),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCaptchaField(TextEditingController controller) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text("$_captchaNum1 + $_captchaNum2  "),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
            validator: (value) {
              final sum = _captchaNum1 + _captchaNum2;
              if (value != null && value.isNotEmpty) {
                final enteredSum = int.tryParse(value);
                if (enteredSum == sum) {
                  return null; // Validation passed
                }
              }
              return 'Summation does not match';
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
