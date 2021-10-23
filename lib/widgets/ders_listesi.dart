import 'package:flutter/material.dart';
import 'package:ortalama_hesapla/constants/app_constants.dart';
import 'package:ortalama_hesapla/helper/data_helper.dart';
import 'package:ortalama_hesapla/model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi;
  const DersListesi({Key? key, required this.onElemanCikarildi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                // Yana kaydırarak yok etmeyi sağlıyor******************
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikarildi(
                      index); // Kendi oluşturduğumuz callBack fonksiyonu
                },
                key: UniqueKey(),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          '${tumDersler[index].krediDegeri} Kredi, Not Değeri ${tumDersler[index].harfDegeri}'),
                    ),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: Text(
                'Lütfen Ders Ekleyin',
                style: Sabitler.baslikStyle,
              ),
            ),
          );
  }
}
