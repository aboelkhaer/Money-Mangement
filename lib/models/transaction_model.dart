import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mangement/exports.dart';

class TransactionModel extends Equatable {
  final String? id;
  final String? transactionType;
  final String? transactionCategory;
  final String? money;
  final Timestamp? date;
  const TransactionModel({
    required this.id,
    required this.transactionType,
    required this.transactionCategory,
    required this.money,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        transactionCategory,
        transactionType,
        money,
        date,
      ];

  Map<String, dynamic> toMap() => {
        'transaction_id': id,
        'transaction_type': transactionType,
        'transaction_category': transactionCategory,
        'date': date,
        'money': money,
      };

  factory TransactionModel.fromDocument(DocumentSnapshot doc) {
    return TransactionModel(
      transactionType: doc.data().toString().contains('transaction_type')
          ? doc.get('transaction_type')
          : '', //String
      transactionCategory:
          doc.data().toString().contains('transaction_category')
              ? doc.get('transaction_category')
              : '', //String
      money: doc.data().toString().contains('money')
          ? doc.get('money')
          : '', //String
      id: doc.id,
      date: doc.data().toString().contains('date')
          ? doc.get('date')
          : null, //String
      // amount: doc.data().toString().contains('amount') ? doc.get('amount') : 0,//Number
      // enable: doc.data().toString().contains('enable') ? doc.get('enable') : false,//Boolean
      // tags: doc.data().toString().contains('tags') ? doc.get('tags').entries.map((e) => TagModel(name: e.key, value: e.value)).toList() : [],//List<dynamic>
    );
  }
}
