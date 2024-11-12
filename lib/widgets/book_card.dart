import 'package:flutter/material.dart';
import 'package:dog_eared_books/screens/book_form.dart';

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Add this line

  ItemHomepage(this.name, this.icon, this.color); // Update constructor
}

class ItemCard extends StatelessWidget {
  // Display the card with an icon and name.

  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Update this line to use item.color
      // Round the card border.
      borderRadius: BorderRadius.circular(12),

      child: InkWell(
        // Touch-responsive area
        onTap: () {
          // Show SnackBar when clicked
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("You pressed the ${item.name} button!")));

          // Navigate to the appropriate route (depending on the button type)
          if (item.name == "Add Book") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BookFormPage()),
            );
          }
        },

        // Container to store the Icon and Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Place the Icon and Text in the center of the card.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
