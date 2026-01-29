import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_helper.dart';
import 'package:go_metro/core/Helper/cashe_helper/cache_keys.dart';

bool isArabic() {
  return GetIt.instance<CacheHelper>().getData(CacheKeys.lang) == "ar";
}

bool isDark(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}
