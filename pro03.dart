import 'package:flutter/material.dart'; 
void main() { 
runApp(MyResponsiveApp()); 
} 
class MyResponsiveApp extends StatelessWidget { 
@override 
Widget build(BuildContext context) { 
return MaterialApp( 
title: 'Responsive Design App', 
home: HomeScreen(), 
debugShowCheckedModeBanner: false, 
); 
} 
} 
class HomeScreen extends StatefulWidget { 
@override 
_HomeScreenState createState() => _HomeScreenState(); 
} 
class _HomeScreenState extends State<HomeScreen> { 
String selectedPage = 'Home'; 
final Map<String, Widget> pageContents = { 
'Home': Center(child: Text('Welcome to the Home Page!', style: TextStyle(fontSize: 24))), 
'About': Center(child: Text('This is the About Page.', style: TextStyle(fontSize: 24))), 
'Services': Center(child: Text('Here are our Services.', style: TextStyle(fontSize: 24))), 
'Contact': Center(child: Text('Contact us at example@flutter.dev', style: 
TextStyle(fontSize: 24))), 
'Feedback': Center(child: Text('Give us your Feedback!', style: TextStyle(fontSize: 24))), 
}; 
void onMenuSelect(String page) { 
setState(() { 
selectedPage = page; 
}); 
} 
Widget buildMenuButton(String title) { 
return TextButton( 
onPressed: () => onMenuSelect(title), 
child: Text( 
        title.toUpperCase(), 
        style: TextStyle( 
          fontWeight: selectedPage == title ? FontWeight.bold : FontWeight.normal, 
          color: selectedPage == title ? Colors.white : Colors.white70, 
        ), 
      ), 
    ); 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    final screenWidth = MediaQuery.of(context).size.width; 
    final isSmallScreen = screenWidth < 600; 
 
    return Scaffold( 
      appBar: AppBar( 
        backgroundColor: Colors.green[800], 
        title: Text('Design', style: TextStyle(fontWeight: FontWeight.bold, 
                                                fontSize: 35, 
                                                color: Colors.white)), 
        actions: isSmallScreen 
            ? [ 
          PopupMenuButton<String>( 
            icon: Icon(Icons.menu, color: Colors.white), 
            onSelected: onMenuSelect, 
            itemBuilder: (BuildContext context) { 
              return ['Home', 'About', 'Services', 'Contact', 'Feedback'] 
                  .map((String choice) => PopupMenuItem<String>( 
                value: choice, 
                child: Center( 
                  child: Text( 
                    choice.toUpperCase(), 
                    style: TextStyle( 
                      fontWeight: selectedPage == choice ? FontWeight.bold : FontWeight.normal, 
                      color: selectedPage == choice ? Colors.green[900] : Colors.red[800], 
                      fontSize: 15 
                    ), 
                  ), 
                ), 
              )) 
                  .toList(); 
            }, 
          ), 
        ] 
            : ['Home', 'About', 'Services', 'Contact', 'Feedback'] 
            .map((title) => buildMenuButton(title)) 
            .toList(), 
      ), 
      body: Container( 
        decoration: BoxDecoration( 
image: DecorationImage( 
image: AssetImage("assets/images/bg.jpg"), // Make sure to include this in 
pubspec.yaml 
fit: BoxFit.cover, 
), 
), 
child: Center( 
child: Container( 
padding: EdgeInsets.all(20), 
width: isSmallScreen ? double.infinity : screenWidth * 0.7, 
color: Colors.white.withOpacity(0.85), 
child: pageContents[selectedPage], 
), 
), 
), 
); 
} 
}
