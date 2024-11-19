# Welcome to Dog Eared Books!
By Athazahra Nabila Ruby - 2306173113  
Platform Based Programming KKI 2024/2025

<details>
<Summary><b>Assignment 7</b></summary>

## Step-by-Step Project Implementation
### Create a new Flutter application
1. To initialize a Flutter project, I ran the command:
```
flutter create aina_fnb_mobile.
```
2. I then connected it to this GitHup Repository.
3. Next, I created a new file called menu.dart in the dog_eared_books/lib directory in which I defined 3 widgets: MyHomePage, InfoCard, and ItemCard which was given in the main.dart file.
4. I then changed the main.dart contents to this:
```dart
import 'package:flutter/material.dart';
import 'package:dog_eared_books/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Eared Books',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: Colors.green[700]),
      ),
      home: MyHomePage(),
    );
  }
}
```
I set the title to 'Dog Eared Books' and the theme to the color green, as per my previous projects' theme.

### Create three simple buttons with icons and texts
5. On menu.dart, I created a new classed named ItemHomepage:
```dart
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}
```
6. I then created the 3 buttons within the items list in the MyHomePage class:
```dart
class MyHomePage extends StatelessWidget {
  ...
  final List<ItemHomepage> items = [
      ItemHomepage("View Available Books", Icons.list),
      ItemHomepage("Add Books", Icons.add),
      ItemHomepage("Logout", Icons.logout),
  ];
  ...
}
```

### Implement different colors for each button
6. In the GridView.count widget, the buttons are assigned with different colors based on their index:
```dart
class MyHomePage extends StatelessWidget {
  ...
  children: items.asMap().entries.map((entry) {
      int idx = entry.key;
      ItemHomepage item = entry.value;
      Color color;
      switch (idx) {
          case 0:
              color = Colors.green.shade800;
              break;
          case 1:
              color = Colors.green.shade400;
              break;
          case 2:
              color = Colors.green.shade200;
              break;
          default:
              color = Colors.green;
      }
      return ItemCard(item, color: color);
  }).toList(),
  ...
}
```

### Display a Snackbar with specific messages
7. In the ItemCard widget, the onTap callback displays a SnackBar with a specific message for each button:
```dart
class ItemCard extends StatelessWidget {
  ...
  onTap: () {
  // Display the SnackBar message when the card is pressed.
  ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar(
  SnackBar(content: Text("You have pressed the ${item.name} button!"))
  );
  },
  ...
}
```

## Explain what are stateless widgets and stateful widgets, and their differences
- Stateless widget: a widget that does not change on its own through actions or internal behaviors. It will only change if it is modified by its parent widget. Therefore, stateless widgets only have final properties defined at construction.
- Stateful widget: a widget that can dynamically change its data or description. It displays data through an initial description defined at the beginning. If there is a change in state, the widget component will re-render to display the new data.
In general, a stateless widget is static and does not change after it is created, making it suitable for elements that do not require data updates. While a stateful widget can change during the app’s runtime because it has a state that can be updated, making it ideal for dynamic or interactive elements.

## Mention the widgets that you have used for this project and its uses.
- MaterialApp: The root widget of the application, setting up the theme and the starting point of the app.
- Scaffold: The basic structure of a page, providing the AppBar, body, and other layout structures.
- AppBar: The top header of the page containing the application title.
- Text: Displays static text on the screen.
- Padding: Adds space around a widget.
- Column: Arranges widgets vertically.
- Row: Arranges widgets horizontally.
- InfoCard (Custom Widget/Component): A custom card widget to display information such as NPM, name, and class.
- SizedBox: Adds empty space or adjusts the size of a widget.
- Center: Positions its child widget in the center.
- GridView.count: Displays widgets in a grid with a fixed number of columns.
- Card: A card widget that can have shadows or borders.
- Container: A flexible widget for holding elements, adjusting size, padding, and background color.
- ItemCard (Custom Widget/Component): A custom card widget for menu items that uses InkWell to detect interactions.
- Material: Adds a material-style visual to a widget.
- InkWell: Adds a splash effect and detects taps for interaction.
- SnackBar: Displays a temporary pop-up message at the bottom of the screen.

## What is the use-case for setState()? Explain the variable that can be affected by setState().
setState() is a function that allows you to dynamically display a component/widget. When the setState() function is called, it notifies Flutter that there has been a change in state that requires a rebuild. When a widget rebuilds, it will be displayed based on the updated state values.

Variables affected by setState() are usually those that need to change when an event occurs. For example, when a counter value changes, this change is typically displayed directly to the user. Not only variables, but properties like the color of a widget may also change, depending on the purpose of the state change.

## Explain the difference between const and final keyword.
Both const and final indicate that a variable cannot be changed, but there are some differences between the two:
- The value of a final variable can be assigned at runtime (when the app is running), whereas the value of a const variable must be known at compile time.
- Variables declared with final are more suitable for values that can only be determined when the app is running, for example, if the variable depends on a condition or calculation. While const variables must be defined in the code beforehand.
- const variables are more optimized compared to final.
</details>

<details>
<Summary><b>Assignment 8</b></summary>
## Step-by-Step Project Implementation
### Create a new form page

1. I created two new directories: lib/screens and lib/widgets, moved menu.dart to lib/screens
2. Then I created a new file book_form.dart
```dart
  class BookFormPage extends StatefulWidget {
    const BookFormPage({super.key});

    @override
    State<BookFormPage> createState() => _BookFormPageState();
  }
```
3. I used 5 input elements (the same as my Django project) and did input validation for each. I also included a save button that displays the data after it is pressed.
```dart
class _BookFormPageState extends State<BookFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _author = "";
  String _genre = "";
  String _summary = "";
  int _price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Your Book',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Title",
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Title cannot be empty!";
                    }
                    return null;
                  },
                ),
              ),
              ...
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Book successfully saved'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Title: $_title'),
                                      Text('Author: $_author'),
                                      Text('Genre: $_genre'),
                                      Text('Summary: $_summary'),
                                      Text('price: $_price'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      _formKey.currentState!.reset();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### Redirect user when "Add Book" is pressed

4. I created a new file called book_card.dart on the widgets directory and moved ItemHomePage and ItemCard from menu.dart to there
5. I then added routing to BookFormPage when the 'Add Book' button is pressed
```dart
if (item.name == "Add Book") {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const BookFormPage()),
  );
}
```

### Create a drawer in the application

6. I created a new file on widgets/ named left_drawer.dart. I then created two options: 'Home Page' that redirects you to the homepage and 'Add Book' that redirects you to the form.
```dart
import 'package:flutter/material.dart';
import 'package:dog_eared_books/screens/menu.dart';
import 'package:dog_eared_books/screens/book_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Dog Eared Books',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  'See Available Books Here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Redirection part to MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: const Text('Add Book'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BookFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

## What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?
const makes widgets immutable, meaning they don’t rebuild or recalculate when the widget tree updates. This immutability can significantly improve performance by reducing unnecessary rebuilds, which in turn enhances efficiency, lowers memory usage, and improves readability. const is best used for widgets that remain unchanged throughout the app’s lifecycle, as this allows the Flutter framework to optimize these widgets. However, it should be avoided for widgets that need to rebuild or whose values depend on runtime variables.

## Explain and compare the usage of Column and Row in Flutter
Column: Lays out children vertically
```dart
Column(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
);
```

Row: Lays out children horizontally
```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Rating"),
  ],
);
```

## List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? 
Used: TextFormField for Title, Author, Genre, Summary, and Price.
Other Elements: Checkbox, Switch, Slider, DropdownButton etc. These can be useful for boolean inputs, selecting from multiple choices, or adjusting values on a sliding scale.

## How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?
You can use ThemeData in MaterialApp to define a consistent look across the app. And yes, I did implement a theme which was defined on main.dart
```dart
...
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: const Color.fromARGB(255, 36, 172, 43)),
      ),
...
```

</details>

<details>
<Summary><b>Assignment 9</b></summary>

## Step-by-Step Project Implementation
### Integrate the Django authentication system
1. I first created a new django app called authentication by running:
```
python manage.py startapp authentication
```
on the dog-eared-books Django project

2. I ran the command:
```
pip install django-cors-headers
```
3. In settings.py, I added 'authentication' and 'corsheaders' to INSTALLED_APPS, 'corsheaders.middleware.CorsMiddleware' to MIDDLEWARE, and also added this to the file:
```py
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
4. In authentication/views.py, I created 3 functions for login, logout, register:
```py
@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Successful login status.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, check email or password again."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)

        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)

        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()

        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)

    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
    
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout failed."
        }, status=401)
```
5. I then did url routing for those 3 functions on authentication/urls.py:
```py
from django.urls import path
from authentication.views import login, register, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),
]
```
6. I also added this path to book_store/urls.py:
```py
urlpatterns = [
  ...
  path('auth/', include('authentication.urls'))
  ...
]
```
### Create a login page
7. I first integrated the authentication system to flutter by running:
```
flutter pub add provider
flutter pub add pbp_django_auth
```
8. I then modified the myApp class on main.dart to provide the CookieRequest to all child widgets, and changed the landing page to the login page:
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Dog Eared Books',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(secondary: Colors.green[900]),
        ),
        home: LoginPage(),
      ),
    );
  }
}
```
9. I created a new file screens/login.dart for the login page:
```dart
import 'package:dog_eared_books/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:dog_eared_books/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
        ).copyWith(secondary: Colors.green[900]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

		  // Check credentials
		  // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
		  // To connect the Android emulator to Django on localhost,
		  // use the URL http://10.0.2.2/
                      final response = await request
                          .login("http://localhost:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Welcome, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
### Implement the registration feature
10. I created a new file screens/register.dart for the register page
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dog_eared_books/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      final response = await request.postJson(
                          "http://localhost:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
### Create a custom model according to your Django application
11. I first copied a JSON data from my previous assignment:
```
[
  {
    "model": "main.bookentry",
    "pk": "191a0f2c-6f4f-40c0-94c7-714cb7a760ed",
    "fields": {
      "user": 2,
      "title": "Slow Days, Fast Company",
      "author": "Eve Babitz",
      "price": 14,
      "genre": "Essays",
      "summary": "In ten sun-baked, Santa Ana wind–swept sketches, Babitz captures the voluptuous quality of L.A. in the 1960s."
    }
  }
]
```
12. I then pasted that to the copywrite website to create a model that adapts to JSON data, then moved that to a new file called models/book_entry.dart:
```dart
// To parse this JSON data, do
//
//     final bookEntry = bookEntryFromJson(jsonString);

import 'dart:convert';

List<BookEntry> bookEntryFromJson(String str) => List<BookEntry>.from(json.decode(str).map((x) => BookEntry.fromJson(x)));

String bookEntryToJson(List<BookEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookEntry {
    String model;
    String pk;
    Fields fields;

    BookEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory BookEntry.fromJson(Map<String, dynamic> json) => BookEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String title;
    String author;
    int price;
    String genre;
    String summary;

    Fields({
        required this.user,
        required this.title,
        required this.author,
        required this.price,
        required this.genre,
        required this.summary,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        title: json["title"],
        author: json["author"],
        price: json["price"],
        genre: json["genre"],
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "title": title,
        "author": author,
        "price": price,
        "genre": genre,
        "summary": summary,
    };
}
```

### Create a page containing a list of all items available at the JSON endpoint in Django
13. I created a new file on screens/ called list_bookentry.dart:
```dart
import 'package:flutter/material.dart';
import 'package:dog_eared_books/models/book_entry.dart';
import 'package:dog_eared_books/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class BookEntryPage extends StatefulWidget {
  const BookEntryPage({super.key});

  @override
  State<BookEntryPage> createState() => _BookEntryPageState();
}

class _BookEntryPageState extends State<BookEntryPage> {
  Future<List<BookEntry>> fetchBook(CookieRequest request) async {
    // TODO: Don't forget to add the trailing slash (/) at the end of the URL!
    final response = await request.get('http://localhost:8000/json/');
    
    // Decoding the response into JSON
    var data = response;
    
    // Convert json data to a BookEntry object
    List<BookEntry> listBook = [];
    for (var d in data) {
      if (d != null) {
        listBook.add(BookEntry.fromJson(d));
      }
    }
    return listBook;
  }
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchBook(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There is no book data in Dog Eared Books',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.title}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.author}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.genre}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.summary}")
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
```
14. I then added the page to left_drawer.dart and also modified the "View Books" button on the homepage to redirect to the list_bookentry page (on book_card.dart) :
```dart
else if (item.name == "View Books") {
  Navigator.push(context,
  MaterialPageRoute(
    builder: (context) => const BookEntryPage()
    ),
  );
}
```

### Create a detail page for each item listed on the Product list page
15. I created a new file on widgets/ called book_details.dart:
```dart
import 'package:flutter/material.dart';
import 'package:dog_eared_books/models/book_entry.dart';

class BookDetailPage extends StatelessWidget {
  final BookEntry book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.fields.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.fields.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Author: ${book.fields.author}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Genre: ${book.fields.genre}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Price: \$${book.fields.price}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              "Summary: ${book.fields.summary}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
```
16. I then modified list_bookentry.dart to display the books as cards and redirect it to the detail page when pressed:
```dart
...
return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final book = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(book: book),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Border color
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(12), // Border radius
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              book.fields.title,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("Author: ${book.fields.author}"),
                            const SizedBox(height: 10),
                            Text("Genre: ${book.fields.genre}"),
                            const SizedBox(height: 10),
                            Text("Price: \$${book.fields.price}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
...
```
### Filter the item list page to display only items associated with the currently logged-in user
17. This is already implemented as list_bookentry.dart retrives the JSON data from localhost:8000/json, which in the previous Django project it was defined as the routing for the show_json function, which already filters the data by user:
```py
def show_json(request):
    data = BookEntry.objects.filter(user=request.user) # this line
    return HttpResponse(serializers.serialize("json", data), content_type="application/json")
```

## Why we need to create a model to retrieve or send JSON data
A model represents the structure of our data, making it easier to parse and handle JSON objects in a consistent way. Without a model, manually extracting fields increases the risk of errors, especially with complex or nested JSON. While not strictly required, omitting a model may lead to runtime errors due to mismatched field names or missing attributes.

## Function of http library
The http library allows Flutter apps to make HTTP requests to fetch, send, or update data on a server. It provides simple methods like get and post for RESTful communication and handles request headers, body, and responses in an easy-to-use manner.

## Function of cookie request
CookieRequest manages HTTP requests with session cookies, enabling persistent authentication across different components of the app. Sharing the CookieRequest instance ensures that all components use the same session, maintaining user authentication and state across requests (e.g., login, fetch data).

## Mechanism of Data Transmission
Input: User submits data through a form in Flutter.  
Transmission: The app sends a request (e.g., POST) with data to a server endpoint via http or CookieRequest.  
Backend Processing: The server (Django) processes the request, updates the database, and returns a JSON response.  
Display: The app parses the response (using models if needed) and updates the UI dynamically.

## Authentication Mechanism
Login/Register: User inputs account details in Flutter, which are sent to Django via POST requests. Django validates the credentials, creates a session, and returns a success or error response.  
Session Management: CookieRequest stores the session cookie for future requests  
Logout: The session is invalidated by sending a logout request to Django, clearing the cookie in the app. Upon success, the app redirects to the login screen.  