part of 'widget.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final Function onTap;

  NewsCard(this.news, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.network(news.image, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      (news.title.length > 70)
                          ? Text(news.title.substring(0, 70) + '...',
                              style: blackFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold))
                          : Text(news.title,
                              style: blackFont.copyWith(fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      (news.description.length > 120)
                          ? Text(news.description.substring(0, 120) + '...',
                              style: blackFont.copyWith(fontSize: 12))
                          : Text(news.description,
                              style: blackFont.copyWith(fontSize: 12)),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Text(FunctionGlobal.convertDateWithDate(news.createdAt),
                          //     style: redTextFont.copyWith(fontSize: 12)),
                          Text(news.source,
                              style: yellowFont.copyWith(fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
