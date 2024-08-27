import 'package:assesment_project/presentation/bloc/blocs.dart';
import 'package:assesment_project/presentation/bloc/event.dart';
import 'package:assesment_project/presentation/bloc/state.dart';
import 'package:assesment_project/presentation/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends StatefulWidget {
  const HomePageBloc({super.key});

  @override
  State<HomePageBloc> createState() => _HomePageBlocState();
}

class _HomePageBlocState extends State<HomePageBloc> {
  @override
  void initState() {
    super.initState();
    context.read<GroceryBloc>().add(GetAllGroceryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroceryBloc, GroceryState>(
      listener: (context, state) {
        if (state is LoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Loading...')),
          );
        } else if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
          print('Error State: ${state.message}');
        }
      },
      builder: (context, state) {
        print('Current State: $state'); // Debug line
        if (state is LoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoadedState) {
          if (state.grocerys.isEmpty) {
            return const Scaffold(
              body: Center(
                child: Text('No groceries available'),
              ),
            );
          }
          return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 30, // Adjust height as needed
        ),
        const SizedBox(width: 8), // Spacing between logo and text
        const Text(
          "Burger",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ],
    ),
  ),
  body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0XFFE9EAEB), 
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  hintText: "Search",
                  hintStyle: const TextStyle(
                    color: Color(0xFF666666),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Color(0xFFD4E0D0),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16), // Spacing between search bar and grid view
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.75,
            ),
            itemCount: state.grocerys.length,
            itemBuilder: (context, index) {
              return GroceryCard(grocery: state.grocerys[index]);
            },
          ),
        ),
      ],
    ),
  ),
);

        } else {
          return const Scaffold(
            body: Center(
              child: Text('Unexpected state'),
            ),
          );
        }
      },
    );
  }
}
