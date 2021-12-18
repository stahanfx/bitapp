queryGenerator({
  required Map<String, String> filter,
  required String select,
}) {
  var filterList = [];
  filter.forEach((key, value) {
    filterList.add('filter[$key]=$value&');
  });
  var filterResult = filterList.join("");
  var selectResult = 'select=$select';

  var list = [
    filterResult,
    selectResult,
  ];

  var stringList = list.join("");
  return stringList;
}
