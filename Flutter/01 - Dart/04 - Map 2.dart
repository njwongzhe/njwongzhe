void main(List<String> args) {
  Map<String, int> scores = {
    "John": 90,
    "Steve": 80,
    "Tom": 70
  };


  /* Add */
  scores["Jack"] = 60;                      // Add new key-value pair.
  print("add           = $scores");         // Output: {John: 90, Steve: 80, Tom: 70, Jack: 60}

  scores.addAll({"Anna": 95, "Emma": 100}); // Add multiple key-value pairs.
  print("addAll        = $scores");         // Output: {John: 90, Steve: 80, Tom: 70, Jack: 60, Anna: 95, Emma: 100}

  scores.putIfAbsent("Mark", () => 100);    // Add only if key doesn't exist. (John Wxists, so no change)
  print("putIfAbsent   = $scores");         // Output: {John: 90, Steve: 80, Tom: 70, Jack: 60, Anna: 95, Emma: 100, Mark: 100}


  /* Remove Operations */
  scores.remove("Steve");           // Remove by key.
  print("remove        = $scores"); // Output: {John: 90, Tom: 75, Jack: 60, Anna: 95, Emma: 100, Mark: 100}


  /* Access & Query Operations */
  print("length        = ${scores.length}");             // Output: 6
  print("keys          = ${scores.keys.toList()}");      // Output: [John, Tom, Jack, Anna, Emma, Mark]
  print("values        = ${scores.values.toList()}");    // Output: [90, 75, 60, 95, 100, 100]
  print("containsKey   = ${scores.containsKey("Tom")}"); // Output: true
  print("containsValue = ${scores.containsValue(100)}"); // Output: true
  print("isEmpty       = ${scores.isEmpty}");            // Output: false
  print("isNotEmpty    = ${scores.isNotEmpty}");         // Output: true


  /* Filter Operations */
  scores.forEach((key, value) {            // Iterate over each key-value pair.
    print("forEach       = $key: $value"); // Output each key-value pair.
  });

  scores.removeWhere((key, value) {        // removeWhere modifies the map in place
    return value < 70;
  });  
  print("removeWhere   = $scores");        // Output: {John: 90, Tom: 75, Anna: 95, Emma: 100, Mark: 100}


  /* Map Operations */
  var bonusScores = scores.map((key, value) { // Create a new map with modified values.
    return MapEntry(key, value + 5);  
  });
  print("map           = $bonusScores");      // Output: {John: 95, Tom: 80, Anna: 100, Emma: 105, Mark: 105}


  /* Clear Operations */
  scores.clear();
  print("clear         = $scores"); // Output: {}
}