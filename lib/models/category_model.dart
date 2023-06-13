import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mangement/exports.dart';

class CategoryModel extends Equatable {
  final String? id;
  final String? name;
  final String? counterUsage;
  final Timestamp? date;
  final String? userID;
  final bool? isGeneral;
  const CategoryModel(
      {required this.name,
      required this.id,
      required this.counterUsage,
      required this.date,
      required this.isGeneral,
      required this.userID});

  @override
  List<Object?> get props => [
        name,
        counterUsage,
        date,
        userID,
        isGeneral,
        id,
      ];

  Map<String, dynamic> toMap() => {
        'category_name': name,
        'counter_usage': counterUsage,
        'date': date,
        'user_id': userID,
        'is_general': isGeneral,
      };

  factory CategoryModel.fromDocument(DocumentSnapshot doc) {
    return CategoryModel(
      name: doc.data().toString().contains('category_name')
          ? doc.get('category_name')
          : '', //String
      counterUsage: doc.data().toString().contains('counter_usage')
          ? doc.get('counter_usage')
          : '', //String
      date: doc.data().toString().contains('date')
          ? doc.get('date')
          : '', //String
      userID: doc.data().toString().contains('user_id')
          ? doc.get('user_id')
          : '', //String
      isGeneral: doc.data().toString().contains('is_general')
          ? doc.get('is_general')
          : true, //Boolean
      id: doc.id, //String

      // amount: doc.data().toString().contains('amount') ? doc.get('amount') : 0,//Number
      // enable: doc.data().toString().contains('enable') ? doc.get('enable') : false,//Boolean
      // tags: doc.data().toString().contains('tags') ? doc.get('tags').entries.map((e) => TagModel(name: e.key, value: e.value)).toList() : [],//List<dynamic>
    );
  }
}
