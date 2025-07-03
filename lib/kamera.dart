import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import '../utils/tflite_helper.dart';

class KameraPage extends StatefulWidget {
  final String username;

  const KameraPage({Key? key, this.username = "pengguna"}) : super(key: key);

  @override
  State<KameraPage> createState() => _KameraPageState();
}

class _KameraPageState extends State<KameraPage> {
  File? _capturedImage;
  File? _faceOnlyImage;
  final ImagePicker _picker = ImagePicker();
  bool _isProcessing = false;
  String _resultText = "N/A";
  String _confidenceText = "N/A";

  late final FaceDetector _faceDetector;

  @override
  void initState() {
    super.initState();
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: false,
        enableClassification: false,
        enableLandmarks: false,
      ),
    );
  }

  @override
  void dispose() {
    _faceDetector.close();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final image = await _picker.pickImage(source: source);
    if (image == null) return;

    setState(() {
      _isProcessing = true;
      _capturedImage = File(image.path);
      _faceOnlyImage = null;
    });

    await _processImage();
  }

  Future<void> _processImage() async {
    if (_capturedImage == null) return;

    try {
      final inputImage = InputImage.fromFile(_capturedImage!);
      final faces = await _faceDetector.processImage(inputImage);

      if (faces.isEmpty) {
        setState(() {
          _resultText = "Wajah tidak ditemukan";
          _confidenceText = "N/A";
          _isProcessing = false;
        });
        return;
      }

      final imageBytes = await _capturedImage!.readAsBytes();
      final decodedImage = img.decodeImage(imageBytes)!;
      final face = faces.first;
      final boundingBox = face.boundingBox;

      final cropped = img.copyCrop(
        decodedImage,
        x: boundingBox.left.toInt().clamp(0, decodedImage.width),
        y: boundingBox.top.toInt().clamp(0, decodedImage.height),
        width: boundingBox.width.toInt().clamp(0, decodedImage.width),
        height: boundingBox.height.toInt().clamp(0, decodedImage.height),
      );

      final tempDir = await Directory.systemTemp.createTemp();
      final croppedFile = File('${tempDir.path}/face.png');
      await croppedFile.writeAsBytes(img.encodePng(cropped));

      setState(() {
        _faceOnlyImage = croppedFile;
      });

      final tfliteHelper = TFLiteHelper();
      final result = await tfliteHelper.classifyImage(croppedFile);

      if (result.isNotEmpty) {
        final best = result.entries.reduce((a, b) => a.value > b.value ? a : b);
        setState(() {
          _resultText = best.key;
          _confidenceText = "${(best.value * 100).toStringAsFixed(1)}%";
        });
      } else {
        setState(() {
          _resultText = "Tidak terdeteksi";
          _confidenceText = "0%";
        });
      }
    } catch (e) {
      setState(() {
        _resultText = "Error: $e";
        _confidenceText = "0%";
      });
    }

    setState(() => _isProcessing = false);
  }

  Future<void> _showImagePickerOptions() async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Pilih Sumber Gambar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.photo_library, color: Colors.blue),
                  title: const Text('Galeri'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera, color: Colors.green),
                  title: const Text('Kamera'),
                  onTap: () {
                    Navigator.of(context).pop();
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "FeelCheck",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  fontFamily: 'Cursive',
                ),
              ),
            ),
            const SizedBox(height: 1),
            Center(child: 
            Image.asset('assets/logo/logo edit.png', width: 100)),
            const SizedBox(height: 20),
            const SizedBox(height: 1),
            const Text(
              "Selamat Datang Di FeelCheck",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 35),
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[300]!, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: _isProcessing
                    ? const Center(child: CircularProgressIndicator())
                    : _faceOnlyImage != null
                        ? Image.file(_faceOnlyImage!, fit: BoxFit.cover)
                        : const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.image, size: 64, color: Colors.grey),
                                SizedBox(height: 12),
                                Text(
                                  'Gambar Belum Diunggah',
                                  style: TextStyle(color: Colors.grey, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
              ),
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Emosi:', style: TextStyle(color: Colors.grey)),
                      Text(_resultText, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Kepercayaan:', style: TextStyle(color: Colors.grey)),
                      Text(_confidenceText, style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: _isProcessing ? null : _showImagePickerOptions,
                icon: _isProcessing
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.camera_alt_outlined, color: Colors.white),
                label: Text(
                  _isProcessing ? 'Memproses...' : 'Unggah Gambar',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/example'),
              child: const Text(
                'Lihat Contoh Gambar Yang Disarankan?',
                style: TextStyle(color: Color(0xFF02243D), fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
