import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}//End Main
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Student Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}//End MyApp

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
// ========== STATE VARIABLES ==========
String studentName = "Kabelo";
String favoriteSubject = "TPG316C";
int subjectIndex = 0;
int studentAge = 20;
List<String> subjects = ["TPG316C", "SOD316C", "PRG316C", "DCT316C"];
// ========== FUNCTION TO INCREASE AGE ==========
void increaseAge() {
setState(() {
studentAge++;
});
}
// ========== BUILD METHOD ==========
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text("My Student Card"),
backgroundColor: Colors.blue,
),
body: Center(
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
// ========== STUDENT INFO CARD ==========
// THIS IS THE CODE WE WILL EXTRACT (20+ lines)
Container(
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(
color: Colors.blue[50],
borderRadius: BorderRadius.circular(15),
border: Border.all(color: Colors.blue, width: 2),
),
child: Column(
children: [
Text(
"Student Name: $studentName",
style: const TextStyle(fontSize: 24),
),
const SizedBox(height: 10),
Text(
"Age: $studentAge",
style: const TextStyle(fontSize: 20, color: Colors.purple),
),
const SizedBox(height: 10),
Text(
"Favorite Subject: $favoriteSubject",
style: const TextStyle(fontSize: 20, color:
Colors.green),
),
],
),
),
// ========== END OF CODE TO EXTRACT ==========
const SizedBox(height: 30),
// ========== CHANGE SUBJECT BUTTON ==========
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: () {
setState(() {
subjectIndex = (subjectIndex + 1) % subjects.length;
favoriteSubject = subjects[subjectIndex];
});
},
child: const Text(
"Change Subject",
style: TextStyle(fontSize: 18),
),
),
),
const SizedBox(height: 10),
// ========== BIRTHDAY BUTTON ==========
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: increaseAge,
style: ElevatedButton.styleFrom(
backgroundColor: Colors.purple,
),
child: const Text(
"Happy Birthday! 🎂🎂",
style: TextStyle(fontSize: 18),
),
),
),
],
),
),
),
),
);
}
}
