import 'package:flutter/material.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF563FE8), // Using hex color #563FE8
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF563FE8), // Ensure it's used throughout the app
        ),
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username, _email, _password, _confirmPassword;
  String? _selectedDay, _selectedMonth, _selectedYear;

  // Dropdown values for day, month (numbers), and year
  final List<String> _days = List.generate(31, (index) => (index + 1).toString());
  final List<String> _months = List.generate(12, (index) => (index + 1).toString()); // Months as numbers
  final List<String> _years = List.generate(100, (index) => (DateTime.now().year - index).toString());

  // Password visibility
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Focus nodes to handle focus states
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Check if passwords match
      if (_password != _confirmPassword) {
        print("Passwords do not match!");
      } else {
        print("Username: $_username");
        print("Email: $_email");
        print("Date of Birth: $_selectedDay / $_selectedMonth / $_selectedYear");
        print("Password: $_password");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Add listeners to handle focus changes
  }

  @override
  void dispose() {
    _usernameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFFEEECF6), // Background color of the page
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(20), // Margin around the container
                padding: const EdgeInsets.all(16), // Padding inside the container
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
                constraints: BoxConstraints(maxWidth: 400), // Limiting width
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Minimize height of the column
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Centered Sign Up text at the top
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sign ',
                                style: TextStyle(
                                  color: Color(0xFF333333), // Color for "Sign"
                                  fontSize: 28, // Font size
                                  fontWeight: FontWeight.bold, // Bold text
                                ),
                              ),
                              TextSpan(
                                text: 'Up',
                                style: TextStyle(
                                  color: Color(0xFF2810BF), // Color for "Up"
                                  fontSize: 28, // Font size
                                  fontWeight: FontWeight.bold, // Bold text
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Space below the title
                      _buildTextField(
                        label: 'Username',
                        focusNode: _usernameFocusNode,
                        onSaved: (value) => _username = value,
                      ),
                      SizedBox(height: 10), // Space between text boxes
                      _buildTextField(
                        label: 'Email',
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (value) => _email = value,
                      ),
                      SizedBox(height: 10), // Space between text boxes
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              label: 'Day',
                              items: _days,
                              value: _selectedDay,
                              onChanged: (value) => setState(() {
                                _selectedDay = value;
                              }),
                            ),
                          ),
                          SizedBox(width: 10), // Space between dropdowns
                          Expanded(
                            child: _buildDropdownField(
                              label: 'Month',
                              items: _months,
                              value: _selectedMonth,
                              onChanged: (value) => setState(() {
                                _selectedMonth = value;
                              }),
                            ),
                          ),
                          SizedBox(width: 10), // Space between dropdowns
                          Expanded(
                            child: _buildDropdownField(
                              label: 'Year',
                              items: _years,
                              value: _selectedYear,
                              onChanged: (value) => setState(() {
                                _selectedYear = value;
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10), // Space between dropdowns and password fields
                      _buildPasswordField(
                        label: 'Password',
                        focusNode: _passwordFocusNode,
                        onSaved: (value) => _password = value,
                      ),
                      SizedBox(height: 10), // Space between password fields
                      _buildPasswordField(
                        label: 'Confirm Password',
                        focusNode: _confirmPasswordFocusNode,
                        onSaved: (value) => _confirmPassword = value,
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: SizedBox(
                          width: double.infinity, // Make the button full-width
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 18), // Vertical padding for the button
                            ),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFF5F5F5), // Set text color to #F5F5F5
                                fontSize: 18,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Below the Sign Up button
                      SizedBox(height: 20), // Space between button and text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the text
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Color(0xFF1D1D1D), // Color for "Already have an account?"
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Handle login tap action
                              print('Login tapped!'); // Replace this with actual navigation to the login page
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF563FE8), // Color for "Login"
                                fontWeight: FontWeight.bold, // Optional: make it bold
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, FocusNode? focusNode, TextInputType? keyboardType, required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust vertical padding
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA99BFF)), // Border color
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2810BF)), // Color when focused
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }

  Widget _buildDropdownField({required String label, required List<String> items, String? value, required ValueChanged<String?> onChanged}) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust vertical padding
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA99BFF)), // Border color
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2810BF)), // Color when focused
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
      ),
      value: value,
      onChanged: onChanged,
      items: items.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select your $label';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField({required String label, required FocusNode focusNode, required FormFieldSetter<String> onSaved}) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12), // Adjust vertical padding
        suffixIcon: IconButton(
          icon: Icon(
            label == 'Password' ? _isPasswordVisible ? Icons.visibility : Icons.visibility_off : _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              if (label == 'Password') {
                _isPasswordVisible = !_isPasswordVisible;
              } else {
                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
              }
            });
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFA99BFF)), // Border color
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF2810BF)), // Color when focused
          borderRadius: BorderRadius.circular(8), // Border radius
        ),
      ),
      obscureText: label == 'Password' ? !_isPasswordVisible : !_isConfirmPasswordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        } else if (label == 'Confirm Password' && value != _password) {
          return 'Passwords do not match';
        } else if (label == 'Password' && value.length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
