enum ProductType {
  grocery,
  chilled,
  frozen,
  household,
  liquor;

  static ProductType fromString(String value) {
    switch (value) {
      case 'grocery':
        return grocery;
      case 'chilled':
        return chilled;
      case 'frozen':
        return frozen;
      case 'household':
        return household;
      case 'liquor':
        return liquor;

      default:
        throw ArgumentError('Invalid AccountType value: $value');
    }
  }

  @override
  String toString() {
    switch (this) {
      case grocery:
        return 'grocery';
      case chilled:
        return 'chilled';
      case frozen:
        return 'frozen';
      case household:
        return 'household';
      case liquor:
        return 'liquor';
    }
  }
}
