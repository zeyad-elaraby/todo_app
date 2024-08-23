import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() {
    return FirebaseFirestore.instance.collection("Tasks").withConverter(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (TaskModel, _) {
        return TaskModel.toJson();
      },
    );
  }

  static void addTask(TaskModel model) {
    var collection = getTasksCollection();
    var docRef = collection.doc();
    model.id = docRef.id;
    docRef.set(model);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    var collection = getTasksCollection();
    return collection
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .snapshots();
  }

  static Future<void> deleteTask(String id) {
    return getTasksCollection().doc(id).delete();
  }

  static Future<void> updateTask(TaskModel model) {
    return getTasksCollection().doc(model.id).update(model.toJson());
  }
}
