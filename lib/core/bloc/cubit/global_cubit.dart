import 'package:flutter_bloc/flutter_bloc.dart';

import '../../database/cache/cache_helper.dart';
import '../../services/service_locator.dart';
import 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  String langCode = 'ar';

  void changeLang() async {
    emit(ChangeLangLoading());
    // isArabic=!isArabic;
    langCode = langCode == 'ar' ? 'en' : 'ar';
    await sl<CacheHelper>().cacheLanguage(langCode);
    emit(ChangeLangSucess());
  }

  void getCachedLang() {
    emit(ChangeLangLoading());
    final cachedLang = sl<CacheHelper>().getCachedLanguage();
    langCode = cachedLang;
    emit(ChangeLangSucess());
  }
}
