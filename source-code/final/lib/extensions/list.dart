import 'dart:math';

extension FirstWhereOrNull<T> on List<T> {
  /// Returns the first element matching the provided predicate,
  /// or `null` if no such element is found.
  T? firstWhereOrNull(bool Function(T element) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}

extension GetRandomItems<T> on List<T> {
// get random items from the given list
  List<T> getRandomItems(int x) {
    if (x > length) {
      throw ArgumentError('x cannot be greater than the list length');
    }
    if (x <= 0) {
      throw ArgumentError('x must be a positive integer');
    }

    final random = Random();
    final selectedItems = <T>[];

    while (selectedItems.length < x) {
      final randomIndex = random.nextInt(length);
      final item = this[randomIndex];
      if (!selectedItems.contains(item)) {
        selectedItems.add(item);
      }
    }

    return selectedItems;
  }
}
