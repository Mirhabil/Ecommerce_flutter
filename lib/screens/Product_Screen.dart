import 'package:ecommerce_flutter/cubits/favorites/Favorites_Cubit.dart';
import 'package:ecommerce_flutter/cubits/home/Home_Cubit.dart';
import 'package:ecommerce_flutter/cubits/products/Product_Cubit.dart';
import 'package:ecommerce_flutter/cubits/products/Products_State.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Button.dart';
import 'package:ecommerce_flutter/custom_widgets/Custom_Icon_Container.dart';
import 'package:ecommerce_flutter/custom_widgets/Size_Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  final int clothesId;
  final FavoritesCubit? cubit;

  const ProductScreen({super.key, required this.clothesId, this.cubit});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) =>
                    ProductsCubit()..fetchClothesById(widget.clothesId),
          ),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is LoadedState) {
              final productsCubit = context.read<ProductsCubit>();
              final homeCubit = context.read<HomeCubit>();
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 106),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(188),
                            ),
                            child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(state.clothes.clothesImage),
                              height: 436,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            top: 48,
                            left: 34,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: CustomIconContainer(Icons.arrow_back),
                            ),
                          ),
                          Positioned(
                            right: 27,
                            top: 48,
                            child: InkWell(
                              onTap: () {
                                productsCubit.updateFavorite(
                                  state.clothes.clothesId,
                                  state.clothes.isFavorite,
                                  cubit: widget.cubit,
                                );
                              },
                              child: Container(
                                height: 30,
                                width: 62,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(1, 2),
                                      blurRadius: 3,
                                      color: Color(0xFF687C98).withAlpha(15),
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    color: Color(0xFF7C3375),
                                    state.clothes.isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 58),
                      Padding(
                        padding: EdgeInsets.only(left: 27, right: 31),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.clothes.clothesName,
                                  style: GoogleFonts.cormorantGaramond(
                                    fontSize: 27,
                                    color: Color(0xFF31405D),
                                  ),
                                ),
                                Text(
                                  "${state.clothes.price.toString()}\$",
                                  style: GoogleFonts.cormorantGaramond(
                                    fontSize: 27,
                                    color: Color(0xFF834E7F),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              state.clothes.clothesCompany,
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 18,
                                color: Color(0xFF31405D),
                              ),
                            ),
                            SizedBox(height: 22),
                            Text(
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 16,
                                color: Color(0xFF818181),
                              ),
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                              "Tempus, sed sociis at pellentesque adipiscing "
                              "tristique eu lectus venenatis.",
                            ),
                            SizedBox(height: 39),
                            Text(
                              "Choose Size",
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 20,
                                color: Color(0xFF31405D),
                              ),
                            ),
                            SizedBox(height: 31),
                            SizeWidget(),
                            SizedBox(height: 39),
                            Text(
                              "Choose Color",
                              style: GoogleFonts.cormorantGaramond(
                                fontSize: 20,
                                color: Color(0xFF31405D),
                              ),
                            ),
                            SizedBox(height: 28),
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                itemCount: colorsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final isSelected = currentIndex == index;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        left: index != 0 ? 20 : 0,
                                        right: 12,
                                      ),
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorsList[index],
                                        border:
                                            isSelected
                                                ? Border.all(
                                                  color: Colors.black,
                                                  width: 2,
                                                )
                                                : null,
                                      ),
                                      child:
                                          isSelected
                                              ? Center(
                                                child: Icon(
                                                  Icons.check,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                              )
                                              : null,
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 43),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (context) => AlertDialog(
                                            title: Text(
                                              "${state.clothes.price}\$ for all items",
                                            ),
                                            content: Text(
                                              "Do you want to purchase?",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(
                                                      context,
                                                      'Cancel',
                                                    ),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Successful Purchase",
                                                      ),
                                                      backgroundColor:
                                                          Colors.lightGreen,
                                                    ),
                                                  );

                                                  Navigator.pop(context, 'OK');
                                                },
                                                child: const Text('Purchase'),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                  child: CustomButton.black(
                                    "Buy Now",
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(9, 9),
                                        blurRadius: 16,
                                        color: Color(
                                          0xFF6295E2,
                                        ).withValues(alpha: 0.11),
                                      ),
                                      BoxShadow(
                                        offset: Offset(-9, -9),
                                        blurRadius: 16,
                                        color: Color(
                                          0xFFFFFFFF,
                                        ).withValues(alpha: 0.25),
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    productsCubit.updateChart(
                                      state.clothes.clothesId,
                                      state.clothes.isAddedToChart,
                                    );
                                  },
                                  child: Image(
                                    image:
                                        state.clothes.isAddedToChart
                                            ? AssetImage("assets/Group 187.png")
                                            : AssetImage(
                                              "assets/Group 167.png",
                                            ),
                                    width: 42,
                                    height: 36,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Column();
          },
        ),
      ),
    );
  }
}

List<Color> colorsList = [
  Colors.purple,
  Colors.purpleAccent,
  Colors.blue,
  Colors.lightBlue,
];
