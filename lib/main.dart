import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}//End Main
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Info App',
      theme: ThemeData(
        // MAIN COLOR - changed from blue to green
        primarySwatch: Colors.green,
        
        // APP BAR THEME - styles all app bars
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white, // Text/icon color
          centerTitle: true,
          elevation: 4, // Shadow depth
        ),
        
        // BUTTON THEME - styles all elevated buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        
        // TEXT THEME - styles all text
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

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
child: const Text("Change Subject"),
),
),
const SizedBox(height: 10),
// ========== BIRTHDAY BUTTON ==========
SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: increaseAge,
child: const Text(
"Happy Birthday! 🎂🎂",
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
