import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/cat/data/repositories/cat_repository.dart';
import '../features/cat/domain/use_cases/cat_use_case.dart';
import '../features/cat/presentation/cubits/cat_cubit.dart';

class LocatorDi {
  static get instance => [
        BlocProvider(create: (_) => CatCubit(catUseCase: CatUseCase(catRepository: CatRepository()))..init()),
      ];
}
