part of 'pages.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita Peternakan"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout, color: Colors.redAccent),
              onPressed: () {
                AuthServices.signOut();
                context.read<PageBloc>().add(GoToLoginPage());
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<NewsBloc, NewsState>(
            builder: (_, newsState) {
              if (newsState is NewsLoaded) {
                List<NewsModel> news = newsState.news;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: news.length,
                    itemBuilder: (_, index) => Container(
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: NewsCard(
                        news[index],
                        onTap: () {
                          context
                              .read<PageBloc>()
                              .add(GoToNewsDetailPage(news[index]));
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return SpinKitFadingCircle(color: yellowColor1);
              }
            },
          )
        ],
      ),
    );
  }
}
