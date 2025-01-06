import 'package:flutter/material.dart';
import 'package:tamerin/pages/detail_page.dart';

class BlogPage extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      "title": "Pentingnya Menyusun Anggaran Keuangan Pribadi",
      "image": "assets/blog1.jpg",
      "date": "2024-12-01 09:00:00",
      "content": """
Menyusun anggaran keuangan pribadi adalah langkah pertama menuju kestabilan finansial. Dengan anggaran, Anda dapat melacak pendapatan dan pengeluaran secara lebih efektif. 

Langkah pertama dalam membuat anggaran adalah mencatat semua sumber pendapatan Anda, baik itu gaji, bonus, atau pendapatan pasif. Setelah itu, catat semua pengeluaran rutin seperti tagihan listrik, air, sewa, dan kebutuhan harian.

Selain pengeluaran rutin, pastikan Anda juga menganggarkan dana untuk tabungan dan investasi. Menyisihkan 20% dari pendapatan untuk menabung adalah kebiasaan yang baik.

Penting juga untuk membuat alokasi dana darurat. Dana ini akan sangat membantu jika terjadi keadaan tak terduga seperti kehilangan pekerjaan atau sakit.

Terakhir, pantau dan evaluasi anggaran Anda setiap bulan untuk memastikan bahwa Anda tetap pada jalurnya dan dapat mencapai tujuan keuangan Anda.
    """
    },
    {
      "title": "Cara Memulai Investasi untuk Pemula",
      "image": "assets/blog2.jpg",
      "date": "2024-12-02 10:00:00",
      "content": """
Investasi adalah salah satu cara terbaik untuk mengembangkan uang Anda dalam jangka panjang. Namun, banyak pemula merasa bingung tentang bagaimana cara memulainya.

Langkah pertama adalah memahami tujuan investasi Anda. Apakah Anda ingin menabung untuk pensiun, membeli rumah, atau untuk tujuan lainnya? Tujuan ini akan menentukan jenis investasi yang sesuai.

Selanjutnya, pelajari tentang instrumen investasi seperti saham, obligasi, reksa dana, dan deposito. Pilih instrumen yang sesuai dengan profil risiko dan tujuan Anda.

Diversifikasi adalah kunci dalam investasi. Jangan menempatkan seluruh uang Anda pada satu jenis investasi saja. Sebarkan dana Anda untuk mengurangi risiko.

Pastikan juga untuk terus belajar dan memperbarui pengetahuan Anda tentang investasi. Membaca buku, mengikuti seminar, atau berkonsultasi dengan ahli keuangan dapat membantu Anda.

Akhirnya, mulailah dengan jumlah kecil dan tingkatkan investasi Anda seiring waktu. Konsistensi adalah kunci keberhasilan dalam investasi.
    """
    },
    {
      "title": "Strategi Mengatur Keuangan di Masa Pandemi",
      "image": "assets/blog3.jpg",
      "date": "2024-12-03 11:00:00",
      "content": """
Pandemi COVID-19 telah mengubah banyak aspek kehidupan, termasuk keuangan. Banyak orang kehilangan pekerjaan atau mengalami penurunan pendapatan.

Salah satu langkah pertama yang dapat dilakukan adalah membuat anggaran darurat. Prioritaskan kebutuhan pokok seperti makanan, tempat tinggal, dan kesehatan.

Jika Anda memiliki utang, coba negosiasikan ulang pembayaran dengan kreditur. Banyak lembaga keuangan menawarkan program restrukturisasi utang selama pandemi.

Penting juga untuk mencari sumber pendapatan tambahan. Ini bisa berupa pekerjaan lepas, menjual barang yang tidak terpakai, atau memulai usaha kecil.

Selain itu, periksa kembali portofolio investasi Anda. Jika Anda memiliki investasi, pastikan alokasinya sesuai dengan kondisi pasar saat ini.

Terakhir, jangan lupa untuk tetap menabung meskipun dalam jumlah kecil. Tabungan ini bisa menjadi penyelamat jika situasi memburuk.
    """
    },
    {
      "title": "Tips Mengelola Utang agar Tidak Membebani",
      "image": "assets/blog4.jpg",
      "date": "2024-12-04 12:00:00",
      "content": """
Utang adalah bagian dari kehidupan keuangan, tetapi jika tidak dikelola dengan baik, dapat menjadi beban berat. Berikut adalah beberapa tips untuk mengelola utang Anda dengan lebih baik.

Pertama, buat daftar semua utang Anda, termasuk jumlah yang harus dibayar, bunga, dan tanggal jatuh tempo. Ini akan membantu Anda mendapatkan gambaran lengkap tentang situasi keuangan Anda.

Prioritaskan pembayaran utang dengan bunga tertinggi terlebih dahulu, karena ini adalah utang yang paling mahal dalam jangka panjang. Jika memungkinkan, lakukan pembayaran lebih besar untuk mempercepat pelunasan.

Hindari mengambil utang baru kecuali benar-benar diperlukan. Fokuslah pada melunasi utang yang ada sebelum menambah beban keuangan Anda.

Jika merasa kesulitan, jangan ragu untuk mencari bantuan. Konsultasikan dengan penasihat keuangan atau lembaga yang menyediakan layanan manajemen utang.

Akhirnya, jadikan pengelolaan utang sebagai bagian dari kebiasaan keuangan Anda. Dengan disiplin dan perencanaan, Anda bisa mengatasi utang dan kembali pada jalur keuangan yang sehat.
    """
    },
    {
      "title": "Mengapa Dana Darurat Sangat Penting?",
      "image": "assets/blog5.jpg",
      "date": "2024-12-05 13:00:00",
      "content": """
Dana darurat adalah salah satu elemen penting dalam perencanaan keuangan, namun sering diabaikan. Dana ini berfungsi sebagai jaring pengaman keuangan Anda.

Jumlah ideal dana darurat adalah setara dengan 3-6 bulan pengeluaran rutin. Dana ini akan membantu Anda menghadapi situasi tak terduga seperti kehilangan pekerjaan, sakit, atau kerusakan rumah.

Salah satu cara membangun dana darurat adalah dengan menyisihkan sebagian pendapatan setiap bulan. Meskipun jumlahnya kecil, konsistensi adalah kunci keberhasilan.

Simpan dana darurat di tempat yang mudah diakses, seperti rekening tabungan. Hindari menginvestasikan dana ini dalam aset berisiko tinggi karena tujuannya adalah untuk likuiditas.

Ingat, dana darurat bukan untuk keperluan konsumtif. Gunakan hanya untuk keadaan darurat dan segera isi kembali setelah digunakan.

Dengan memiliki dana darurat, Anda akan merasa lebih tenang dalam menghadapi ketidakpastian hidup.
    """
    },
    {
      "title": "Keuntungan Menabung di Deposito Berjangka",
      "image": "assets/blog6.jpg",
      "date": "2024-12-06 14:00:00",
      "content": """
Deposito berjangka adalah salah satu instrumen tabungan yang populer di kalangan masyarakat Indonesia. Apa saja keuntungan dari menabung di deposito?

Pertama, deposito menawarkan tingkat bunga yang lebih tinggi dibandingkan tabungan biasa. Ini membuatnya menjadi pilihan menarik bagi mereka yang ingin mendapatkan penghasilan pasif.

Selain itu, deposito lebih aman karena dijamin oleh Lembaga Penjamin Simpanan (LPS) hingga batas tertentu. Ini memberikan ketenangan pikiran bagi para penabung.

Deposito juga memiliki tenor yang fleksibel, mulai dari 1 bulan hingga beberapa tahun. Anda dapat memilih tenor yang sesuai dengan kebutuhan Anda.

Namun, deposito tidak sefleksibel tabungan biasa karena ada penalti jika Anda mencairkan dana sebelum jatuh tempo. Oleh karena itu, gunakan deposito untuk dana yang tidak akan digunakan dalam waktu dekat.

Akhirnya, deposito adalah cara yang baik untuk mendisiplinkan diri dalam menyimpan uang. Dengan bunga yang kompetitif dan jangka waktu yang jelas, Anda bisa lebih terencana dalam mencapai tujuan keuangan.
    """
    },
    {
      "title": "Pentingnya Edukasi Keuangan Sejak Dini",
      "image": "assets/blog7.jpg",
      "date": "2024-12-07 15:00:00",
      "content": """
Edukasi keuangan adalah keterampilan hidup yang penting, dan semakin dini diajarkan, semakin baik. Anak-anak yang memahami nilai uang cenderung lebih bijak dalam mengelola keuangan saat dewasa.

Mulailah dengan mengajarkan konsep dasar seperti menabung. Berikan celengan dan dorong anak-anak untuk menyisihkan sebagian uang saku mereka.

Ajarkan juga perbedaan antara kebutuhan dan keinginan. Ini membantu anak-anak membuat keputusan yang lebih bijak tentang pengeluaran.

Selain itu, gunakan permainan atau aplikasi keuangan untuk membuat pembelajaran lebih menyenangkan. Ada banyak alat edukasi yang dirancang khusus untuk anak-anak.

Sebagai orang tua, jadilah contoh yang baik. Anak-anak belajar dari apa yang mereka lihat, jadi pastikan Anda juga menerapkan kebiasaan keuangan yang sehat.

Dengan edukasi keuangan sejak dini, generasi mendatang akan lebih siap menghadapi tantangan keuangan dan menciptakan masa depan yang lebih stabil.
    """
    },
    {
      "title": "Strategi Menabung untuk Membeli Rumah Impian",
      "image": "assets/blog8.jpg",
      "date": "2024-12-08 16:00:00",
      "content": """
Membeli rumah impian adalah salah satu tujuan keuangan besar bagi banyak orang. Namun, harga rumah yang terus meningkat membuatnya tampak seperti impian yang sulit dicapai.

Langkah pertama adalah menetapkan tujuan yang jelas. Tentukan berapa banyak uang yang Anda butuhkan untuk uang muka dan biaya lainnya.

Setelah itu, buat rencana tabungan yang realistis. Misalnya, Anda bisa menyisihkan 30% dari pendapatan setiap bulan untuk dana rumah.

Pertimbangkan untuk menempatkan tabungan ini dalam instrumen yang menghasilkan bunga lebih tinggi, seperti reksa dana pasar uang atau deposito. Ini akan membantu dana Anda tumbuh lebih cepat.

Hindari pengeluaran yang tidak perlu. Buat prioritas keuangan yang ketat dan fokus pada tujuan utama Anda.

Terakhir, pertimbangkan alternatif seperti program KPR dengan bunga rendah. Banyak bank menawarkan program khusus untuk membantu masyarakat membeli rumah dengan lebih mudah.
    """
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Blog",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: article["title"]!,
                    image: article["image"]!,
                    date: article["date"]!,
                    content: article["content"]!,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 16.0),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Colors.black, // Warna border
                  width: 0.2, // Ketebalan border
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    child: Image.asset(
                      article["image"]!,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article["title"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            article["date"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
