import 'package:flutter/material.dart';

void main() {
  runApp(CreateCourse());
}

class CreateCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, // Set the text direction to left-to-right
      child: Material(
        child: Container(
          color: Color(0xFFEEECF6), // Background color
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20), // 20 margin around the container
              width: double.infinity, // Make the container full-width
              height: double.infinity, // Make the container full-height
              decoration: BoxDecoration(
                color: Colors.white, // White background for the container
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12, // Light shadow
                    blurRadius: 10,
                    offset: Offset(0, 5), // Offset for the shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding inside the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top section with Row for both icons and text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                      children: [
                        // Top-left section
                        Column( // Stack items vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.book, // Book icon
                                  color: Color(0xFF333333), // Color for the icon
                                ),
                                SizedBox(width: 8), // Space between icon and text
                                Text(
                                  'Create Course',
                                  style: TextStyle(
                                    color: Color(0xFF333333), // Color for the text
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10), // Space between the two texts
                            Text(
                              'Courses created : 1',
                              style: TextStyle(
                                color: Color(0xFF2810BF), // Color for the text
                                fontSize: 16, // Font size for the courses created text
                                fontWeight: FontWeight.bold, // Make it bold
                              ),
                            ),
                          ],
                        ),
                        // Top-right section
                        GestureDetector(
                          onTap: () {
                            // Action for "Create" button
                            print('Create button tapped');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF2810BF)), // Border color
                              borderRadius: BorderRadius.circular(8), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Padding for the button
                            child: Row(
                              mainAxisSize: MainAxisSize.min, // Button width adjusts to content
                              children: [
                                Icon(
                                  Icons.add, // Plus icon
                                  color: Color(0xFF2810BF), // Color for the icon
                                ),
                                SizedBox(width: 4), // Space between icon and text
                                Text(
                                  'Create',
                                  style: TextStyle(
                                    color: Color(0xFF2810BF), // Color for the text
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // Space between the top section and the new container
                    // Centered Container
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFB8ACFF), // Background color of the centered container
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                      padding: const EdgeInsets.all(16.0), // Padding inside the centered container
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between elements
                        children: [
                          Icon(
                            Icons.edit, // Pencil icon
                            color: Colors.grey, // Gray color for the icon
                          ),
                          Text(
                            'Title', // Title in the middle
                            style: TextStyle(
                              color: Color(0xFF2810BF), // Title color
                              fontSize: 18, // Font size for the title
                            ),
                          ),
                          Text(
                            '0', // Right section with "0"
                            style: TextStyle(
                              color: Color(0xFF2810BF), // Color for the number
                              fontSize: 18, // Font size for the number
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(), // Adds space between top and bottom sections
                    // Version text
                    Center( // Center the version text
                      child: Text(
                        'v0.1 (Beta)', // Version text
                        style: TextStyle(
                          color: Colors.black54, // A lighter shade for the version text
                          fontSize: 14, // Font size for the version text
                          fontWeight: FontWeight.w300, // Thin font weight
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
