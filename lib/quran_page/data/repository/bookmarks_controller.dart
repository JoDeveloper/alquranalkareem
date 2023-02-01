import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../l10n/app_localizations.dart';
<<<<<<< HEAD
import '../../../bookmarks_notes_db/databaseHelper.dart';
=======
import '../../../notes/db/databaseHelper.dart';
>>>>>>> e96a46eb4c68152ef511d7b809d9f7b4a4171eee
import '../../../shared/widgets/widgets.dart';
import '../model/bookmark.dart';

class BookmarksController extends GetxController {
  final RxList<Bookmarks> bookmarksList = <Bookmarks>[].obs;

  Future<int?> addBookmarks(Bookmarks? bookmarks) {
    return DatabaseHelper.addBookmark(bookmarks!);
  }

  Future<void> getBookmarks() async {
    final List<Map<String, dynamic>> bookmarks = await DatabaseHelper.queryB();
    bookmarksList
        .assignAll(bookmarks.map((data) => Bookmarks.fromJson(data)).toList());
  }

  void deleteBookmarks(Bookmarks? bookmarks, BuildContext context) async {
    await DatabaseHelper.deleteBookmark(bookmarks!).then((value) =>
        customSnackBar(context, AppLocalizations.of(context)!.deletedBookmark));
    getBookmarks();
  }

  void updateBookmarks(Bookmarks? bookmarks) async {
    await DatabaseHelper.updateBookmarks(bookmarks!);
    getBookmarks();
  }
}
