# Category Chips Integration Fix

## Problem

The issue was at line 113 in `menu_screen.dart` where `selectedCategory` was being referenced but:
1. The `CategoryChip` class in `category_chips.dart` was private (`_CategoryChip`)
2. The `menu_screen.dart` had a duplicate simple `_CategoryChip` class at the bottom
3. There was no state variable `selectedCategory` defined in `_MenuScreenState`

## Solution

### 1. Made CategoryChip Public (`category_chips.dart`)

Changed the class name from `_CategoryChip` to `CategoryChip` and added `super.key` to the constructor:

```dart
class CategoryChip extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,  // Added super.key
    required this.text,
    this.isSelected = false,
    required this.onTap,
  });
```

### 2. Added Import in `menu_screen.dart`

```dart
import 'package:uiapp/Components/category_chips.dart';
```

### 3. Added Selected Category State

Added a state variable in `_MenuScreenState`:

```dart
class _MenuScreenState extends State<MenuScreen> {
  // Selected category state
  String selectedCategory = "Sushi 🍣";

  // Food Menu
  List<FoodModel> foodMenu = [
    // ... existing code
  ];
```

### 4. Updated Category Chips Usage

Replaced the old category chips with the proper `CategoryChip` widget:

```dart
SizedBox(
  height: 40,
  child: ListView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 25),
    children: [
      CategoryChip(
        text: "Sushi 🍣",
        isSelected: selectedCategory == "Sushi 🍣",
        onTap: () => setState(() => selectedCategory = "Sushi 🍣"),
      ),
      CategoryChip(
        text: "Ramen 🍜",
        isSelected: selectedCategory == "Ramen 🍜",
        onTap: () => setState(() => selectedCategory = "Ramen 🍜"),
      ),
      CategoryChip(
        text: "Rice 🍚",
        isSelected: selectedCategory == "Rice 🍚",
        onTap: () => setState(() => selectedCategory = "Rice 🍚"),
      ),
      CategoryChip(
        text: "Seafood 🦐",
        isSelected: selectedCategory == "Seafood 🦐",
        onTap: () => setState(() => selectedCategory = "Seafood 🦐"),
      ),
    ],
  ),
),
```

### 5. Removed Duplicate Class

Removed the duplicate `_CategoryChip` class that was at the bottom of `menu_screen.dart`.

## How CategoryChip Works

The `CategoryChip` widget accepts three parameters:
- `text`: The label to display on the chip
- `isSelected`: Boolean to highlight the selected chip (true = red with white text)
- `onTap`: Callback function when the chip is tapped

When a user taps a category:
1. The `onTap` callback is triggered
2. `setState` is called to update `selectedCategory`
3. The widget rebuilds with the new selection
4. The selected chip turns red, others remain white

## Files Modified

1. `uiapp/lib/Components/category_chips.dart` - Made class public
2. `uiapp/lib/Screens/menu_screen.dart` - Added import, state, and updated usage

---

# Add to Cart in MenuAppBar

## How to Call addToCart in MenuAppBar

### 1. Add the addToCart Callback Parameter

Added an optional `addToCart` parameter to `MenuAppBar`:

```dart
class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String location;
  final String subtitle;
  final int cartCount;
  final VoidCallback onMenuTap;
  final VoidCallback onCartTap;
  final VoidCallback onLocationTap;
  final VoidCallback? addToCart;  // Added this parameter

  const MenuAppBar({
    super.key,
    required this.location,
    required this.subtitle,
    this.cartCount = 0,
    required this.onMenuTap,
    required this.onCartTap,
    required this.onLocationTap,
    this.addToCart,  // Optional parameter
  });
```

### 2. IconButton in actions[]

The `IconButton` is already wrapped in `actions[]`:

```dart
actions: [
  Stack(
    children: [
      IconButton(
        icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
        onPressed: () {
          onCartTap();
          addToCart?.call();  // Calls addToCart if provided
        },
      ),
      // Cart Badge
      if (cartCount > 0)
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            // ... badge styling
          ),
        ),
    ],
  ),
  SizedBox(width: 10),
],
```

### 3. Usage in Parent Widget

Pass the `addToCart` callback when using `MenuAppBar`:

```dart
MenuAppBar(
  location: 'Karachi',
  subtitle: "Chinese & Sushi",
  cartCount: 3,
  onMenuTap: () {},
  onCartTap: () {
    // Navigate to cart screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
  },
  onLocationTap: () {},
  addToCart: () {
    // Your add to cart logic here
    print("Item added to cart!");
    // You could update cart count, show snackbar, etc.
  },
),
```

## Key Points

- `addToCart` is optional - you don't have to provide it
- When the cart icon is pressed, both `onCartTap` and `addToCart` are triggered
- Use `addToCart` for adding items to cart logic
- Use `onCartTap` for navigation or showing the cart

## Files Modified

1. `uiapp/lib/Components/menu_app_bar.dart` - Added addToCart parameter