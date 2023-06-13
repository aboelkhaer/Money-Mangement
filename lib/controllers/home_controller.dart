import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_mangement/exports.dart';
import 'package:money_mangement/models/category_model.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
  AuthController authController = Get.put(AuthController());
  FocusNode focusNode = FocusNode();
  String transactionType = '';
  String transactionCategory = '';
  RxBool isAddTransactionLoading = false.obs;
  TextEditingController moneyController = TextEditingController();
  late CollectionReference allTransactionReference;
  late CollectionReference allCategoriesReference;
  RxList<TransactionModel> allTransactions = RxList<TransactionModel>([]);
  RxList<CategoryModel> allCategories = RxList<CategoryModel>([]);
  RxList<CategoryModel> userCategories = RxList<CategoryModel>([]);
  List<String> allCategoriesName = [];

  RxInt totalIncome = 0.obs;
  RxInt totalExpense = 0.obs;
  RxInt totalBalance = 0.obs;
  Timer? timer;
  RxBool isNotification = false.obs;
  late DocumentReference docRef;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 4);
    allTransactionReference = firebasefirestore.collection('transactions');
    allCategoriesReference = firebasefirestore.collection('category');
    allTransactions.bindStream(getAllTransactions());
    allCategories.bindStream(getAllCategories());

    userCategories.bindStream(getUserCategories());
    // sortedCategoryName();
    timer =
        Timer.periodic(const Duration(minutes: 2), (Timer t) => totalTypes());
    allTransactions.listen((p0) {
      totalTypes();
    });

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    timer!.cancel();

    super.onClose();
  }

  RxInt bottomNavIndex = 0.obs;

  late TabController tabController;

  void modalBottomSheetMenu(BuildContext context, String? defaultChoice) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (builder) {
        return BottomSheetBody(defaultChoice);
      },
    );
  }
  //! Overview Tab

  totalTypes() {
    totalBalance.value = 0;
    totalExpense.value = 0;
    totalIncome.value = 0;
    for (int i = 0; i < allTransactions.length; i++) {
      if (allTransactions[i].transactionType == 'Income') {
        totalIncome.value += int.parse(allTransactions[i].money!);
        totalBalance.value += int.parse(allTransactions[i].money!);
      }
      if (allTransactions[i].transactionType == 'Expense') {
        totalExpense.value += int.parse(allTransactions[i].money!);
        totalBalance.value -= int.parse(allTransactions[i].money!);
      }
    }
  }

//! Transaction Tab
  addTransaction() async {
    isAddTransactionLoading.value = true;
    if (transactionType != '' &&
        transactionCategory != '' &&
        moneyController.text != '' &&
        moneyController.text.isNumericOnly == true &&
        moneyController.text.isNotEmpty) {
      try {
        var result = await allTransactionReference.add({
          'date': DateTime.now(),
          'transaction_type': transactionType,
          'transaction_category': transactionCategory,
          'user_id': authController.user.value!.uid,
          'money': moneyController.text,
        });

        isAddTransactionLoading.value = false;
        Get.back();
        moneyController.text = '';
        Get.snackbar('Success', 'Added Transaction successfully.',
            snackPosition: SnackPosition.BOTTOM);
        return result;
      } on FirebaseException catch (e) {
        Get.snackbar('Error occurred', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
        isAddTransactionLoading.value = false;
      }
    } else {
      Get.snackbar('Error occurred', 'Add empty data.',
          snackPosition: SnackPosition.BOTTOM);
      isAddTransactionLoading.value = false;
    }
  }

  getAllTransactions() {
    return allTransactionReference
        .orderBy('date', descending: true)
        .where('user_id', isEqualTo: authController.user.value!.uid)
        .snapshots()
        .map((qShot) => qShot.docs
            .map((doc) => TransactionModel.fromDocument(doc))
            .toList());
  }

  deleteTransaction(String id) {
    allTransactionReference.doc(id).delete().whenComplete(() => log('done'));
  }

  getUserCategories() {
    return allCategoriesReference
        .orderBy('date', descending: true)
        .where('user_id', isEqualTo: authController.user.value!.uid)
        .snapshots()
        .map((qShot) =>
            qShot.docs.map((doc) => CategoryModel.fromDocument(doc)).toList());
  }

  getAllCategories() {
    return allCategoriesReference
        .orderBy('date', descending: false)
        .snapshots()
        .map((qShot) =>
            qShot.docs.map((doc) => CategoryModel.fromDocument(doc)).toList());
  }

  String getTimeDifferenceFromNow(DateTime dateTime) {
    Duration difference = DateTime.now().difference(dateTime);
    if (difference.inSeconds < 5) {
      return "Just now";
    } else if (difference.inMinutes < 1) {
      return "${difference.inSeconds} s ago";
    } else if (difference.inHours < 1) {
      return "${difference.inMinutes} m ago";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} h ago";
    } else {
      return "${difference.inDays} d ago";
    }
  }

  String daydata(double val) {
    switch (val.toInt()) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
    }
    return '';
  }

  String monthdata(double val) {
    switch (val.toInt()) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
    }
    return '';
  }
}
