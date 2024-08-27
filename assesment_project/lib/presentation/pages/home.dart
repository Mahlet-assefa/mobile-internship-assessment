import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Centers the title content
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 30, // Adjust height as needed
            ),
            const SizedBox(width: 8), // Spacing between logo and text
            const Text(
              "Burger",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0XFFE9EAEB), 
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Color(0xFF666666),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none, // No border side
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: Color(0xFFD4E0D0), // Focused border color
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
