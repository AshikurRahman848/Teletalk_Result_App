import 'package:flutter/material.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Result View',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SSC/Dakhil/Equivalent Result 2014',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(2),
              },
              children: const [
                TableRow(
                  children: [
                    TableCell(child: Text('Roll No')),
                    TableCell(child: Text('105540')),
                    TableCell(child: Text('Name')),
                    TableCell(child: Text('MD. KOUSHIQ AHMED')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Board')),
                    TableCell(child: Text('RAJSHAHI')),
                    TableCell(child: Text('Father\'s Name')),
                    TableCell(child: Text('MD. FAJLUR RAHMAN')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Group')),
                    TableCell(child: Text('SCIENCE')),
                    TableCell(child: Text('Mother\'s Name')),
                    TableCell(child: Text('MST. ASHRAFUN NESA')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Type')),
                    TableCell(child: Text('REGULAR')),
                    TableCell(child: Text('Date of Birth')),
                    TableCell(child: Text('27-06-1998')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('Result')),
                    TableCell(child: Text('PASSED')),
                    TableCell(child: Text('Institute')),
                    TableCell(child: Text('PUTHIA P. N. HIGH SCHOOL')),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Text('GPA')),
                    TableCell(child: Text('5.00')),
                    TableCell(child: Text('')),
                    TableCell(child: Text('')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Grade Sheet',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(3),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: const [
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Code',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Subject',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Grade',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                    TableCell(
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Mark',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
                _buildGradeRow('101', 'BANGLA', 'A+', '95'),
                _buildGradeRow('107', 'ENGLISH', 'A+', '90'),
                _buildGradeRow('109', 'MATHEMATICS', 'A+', '100'),
                _buildGradeRow('145', 'SOCIAL SCIENCE', 'A+', '88'),
                _buildGradeRow('111', 'ISLAM STUDIES', 'A+', '92'),
                _buildGradeRow('136', 'PHYSICS', 'A+', '85'),
                _buildGradeRow('137', 'CHEMISTRY', 'A+', '89'),
                _buildGradeRow('126', 'HIGHER MATHEMATICS', 'A+', '97'),
                _buildGradeRow('138', 'BIOLOGY', 'A+', '91'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildGradeRow(
      String code, String subject, String grade, String mark) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(code),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(subject),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(grade),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mark),
          ),
        ),
      ],
    );
  }
}
