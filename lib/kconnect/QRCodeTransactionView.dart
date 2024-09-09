/*import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';*/

/*class MbQrCodeGeneratePageCopyWidget extends StatefulWidget {
  const MbQrCodeGeneratePageCopyWidget({super.key});

  @override
  State<MbQrCodeGeneratePageCopyWidget> createState() => _MbQrCodeGeneratePageCopyWidgetState();
}

class _MbQrCodeGeneratePageCopyWidgetState extends State<MbQrCodeGeneratePageCopyWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  WidgetsToImageController controller = WidgetsToImageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _generatePdf(List<TransactionsRecord> gridViewTransactionsRecordList) async {
    final pdf = pw.Document();

    final fontData = await rootBundle.load('assets/fonts/Kanit-Regular.ttf');
    final ttf = pw.Font.ttf(fontData.buffer.asByteData());

    const int itemsPerPage = 12;

    final chunks = [];
    for (var i = 0; i < gridViewTransactionsRecordList.length; i += itemsPerPage) {
      chunks.add(gridViewTransactionsRecordList.sublist(
        i,
        i + itemsPerPage > gridViewTransactionsRecordList.length ? gridViewTransactionsRecordList.length : i + itemsPerPage,
      ));
    }

    for (var chunk in chunks) {
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.GridView(
              crossAxisCount: 3,
              childAspectRatio: 1,
              children: List.generate(chunk.length, (index) {
                final record = chunk[index];

                return pw.Container(
                  padding: const pw.EdgeInsets.all(8),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey),
                  ),
                  child: pw.Column(
                    children: [
                      pw.Expanded(
                        child: pw.Container(
                          child: pw.BarcodeWidget(
                            barcode: Barcode.qrCode(),
                            data: 'ticket:${record.billNo}',
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        record.contactNamePersonnel,
                        textAlign: pw.TextAlign.center,
                        maxLines: 1,
                        style: pw.TextStyle(font: ttf),
                      ),
                      pw.Text(
                        record.licensePlateId,
                        textAlign: pw.TextAlign.center,
                        maxLines: 1,
                        style: pw.TextStyle(font: ttf),
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ),
      );
    }

    final output = await getApplicationDocumentsDirectory(); // For Flutter, use path_provider
    final file = File("${output.path}/your_pdf.pdf");
    await file.writeAsBytes(await pdf.save());
  }

  saveImage(context, controller) async {
    final bytes = await controller.capture();
    final result = await ImageGallerySaver.saveImage(bytes!);
    print(result);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'บันทึกรูปภาพไปยังอัลบั้มแล้ว',
          style: GoogleFonts.getFont(
            'Kanit',
            color: FlutterFlowTheme.of(context).primaryBackground,
            fontSize: 24.0,
          ),
        ),
        duration: Duration(milliseconds: 2000),
        backgroundColor: FlutterFlowTheme.of(context).success,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<TransactionsRecord>>(
            future: queryTransactionsRecordOnce(
                queryBuilder: (transactionsRecord) => transactionsRecord.where(
                      'bill_no',
                      isGreaterThanOrEqualTo: '00000001',
                    )),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitThreeBounce(
                      color: Colors.transparent,
                      size: 50,
                    ),
                  ),
                );
              }
              List<TransactionsRecord> gridViewTransactionsRecordList = snapshot.data!;

              return InkWell(
                onTap: () {
                  _generatePdf(gridViewTransactionsRecordList);
                },
                child: Text("Let roll!!!!"),
              );
            },
          ),
        ),
      ),
    );
  }
}*/
