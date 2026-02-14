# Firebase

## 1.0 Firestore Database

### 1.1 Firestore Setup

```dart
// flutter pub add cloud_firestore | Run in terminal to add the Firestore package to your Flutter project.

import 'package:cloud_firestore/cloud_firestore.dart';

// Create an instance of Firestore
final FirebaseFirestore firestore = FirebaseFirestore.instance;

// Read data from Firestore
Future<void> readData() async {
  try {
    DocumentSnapshot snapshot = await firestore.collection('your_collection').doc('your_document_id').get();
    if(snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      print("Data: $data");
    } else {
      print("Document does not exist!");
    }
  } catch (e) {
    print("Error reading data: $e");
  }
}
```

### 1.2 Firestore Security Rules

```js
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if false; // Deny all access by default

      /* Can Read But Cannot Write */
      /*
        allow read: if true; // Allow read access to all documents
        allow write: if false; // Deny write access to all documents
      */
    }
  }
}
```

