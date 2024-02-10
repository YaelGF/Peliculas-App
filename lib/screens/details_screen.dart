import 'package:flutter/material.dart';
import 'package:flutter_movie_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por una instancia de pelicula
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards()
            ],
          ),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: const EdgeInsets.all(0),
            title: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(bottom: 10),
              color: Colors.black12,
              child: const Text(
                'movie.title',
                style: TextStyle(fontSize: 16),
              ),
            ),
            background: const FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage('https://via.placeholder.com/500x300'),
              fit: BoxFit.cover,
            )));
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('movie.title',
                    style: textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Text('movie.originalTitle',
                    style: textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('movie.voteAverage', style: textTheme.bodySmall),
                  ],
                )
              ],
            )
          ],
        ));
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Sinopsis',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. mauris eget nunc sed. arcu cursus. In nulla dolore excepteur aliquip ullamco officia. Reprehenderit occaecat duis exercitation elit nulla aute velit pariatur nostrud irure ea. Consectetur nostrud eiusmod magna proident aute ut sint nulla quis aliqua eu. Exercitation consequat ipsum ullamco est qui occaecat. Laborum nostrud cillum eiusmod Lorem non sunt cupidatat consectetur. Laborum anim cillum ullamco consectetur aliquip. Pariatur magna anim consequat nisi.',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.justify,
            
          ),
        ],
      ),
    );
  }
}
