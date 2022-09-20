import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';
import 'package:flutter_pokedex/widgets/poke_information.dart';
import 'package:flutter_pokedex/widgets/poke_type_and_name.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _buildPortraitBody(context, pokeballImageUrl)
        : _buildLandscapeBody(context, pokeballImageUrl);
  }

  Scaffold _buildLandscapeBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: ScreenUtil().orientation == Orientation.portrait
                      ? 24.w
                      : 12.w,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PokeNameType(pokemon: pokemon),
                    Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.25.sw,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PokeInformation(pokemon: pokemon),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Scaffold _buildPortraitBody(BuildContext context, String pokeballImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: ScreenUtil().orientation == Orientation.portrait
                      ? 24.w
                      : 12.w,
                ),
              ),
            ),
          ),
          PokeNameType(pokemon: pokemon),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  top: 0,
                  child: Image.asset(
                    pokeballImageUrl,
                    height: 0.15.sh,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  top: 0.12.sh,
                  child: PokeInformation(pokemon: pokemon),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: pokemon.id!,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.img ?? '',
                      height: 0.25.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
