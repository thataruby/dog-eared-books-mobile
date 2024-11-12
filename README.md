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