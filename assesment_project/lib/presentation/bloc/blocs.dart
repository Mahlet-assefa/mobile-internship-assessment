import 'package:assesment_project/domain/usecase/get_a_grocery.dart';
import 'package:assesment_project/domain/usecase/get_all_grocery.dart';
import 'package:assesment_project/presentation/bloc/event.dart';
import 'package:assesment_project/presentation/bloc/state.dart';
import 'package:bloc/bloc.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllGroceryUseCase getAllGroceryUseCase;
  final GetGroceryUseCase getGroceryUseCase;

  GroceryBloc({
    required this.getAllGroceryUseCase,
    required this.getGroceryUseCase,
  }) : super(InitialState()) {
    on<GetAllGroceryEvent>((event, emit) async {
      emit(LoadingState());
      try {
        print("event is GetAllgroceryEvent");
        // print('Getting all grocery');
        final grocerys = await getAllGroceryUseCase.execute();
        print("$grocerys is the grocerys");
        grocerys.fold(
            (l) => emit(ErrorState(l.message)), (r) => emit(LoadedState(r)));
      } catch (e) {
        emit(ErrorState('Failed to get all products'));
      }
    });
    on<GetGroceryEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final grocery = await getGroceryUseCase.call(event.groceryId);
        grocery.fold((failure) => emit(ErrorState('Failed to get grocery')),
            (grocery) => emit(GetGroceryState(grocery)));
      } catch (e) {
        emit(ErrorState('Failed to get the grocery'));
      }
    });

    @override
    GroceryBloc copyWith({
      GetAllGroceryUseCase? getAllGroceryUseCase,
      GetGroceryUseCase? getGroceryUseCase,
    }) {
      return GroceryBloc(
        getAllGroceryUseCase: getAllGroceryUseCase ?? this.getAllGroceryUseCase,
        getGroceryUseCase: getGroceryUseCase ?? this.getGroceryUseCase,
      );
    }
  }
}
