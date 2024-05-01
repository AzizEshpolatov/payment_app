double height = 0.0;
double width = 0.0;

extension SizeUtils on int {
  double get h => (this / 812) * height;

  double get w => (this / 375) * width;
}


bool areListsEqual(List<dynamic> list1, List<dynamic> list2) {
  if (list1.length != list2.length) {
    return false;
  }

  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }
  return true;
}