import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:my_doctor_house_mobile_app/gen/assets.gen.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/app_bar_widget/app_bar_widget.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';
import 'package:sizer/sizer.dart';

class QRScannerScreen extends HookWidget {
  const QRScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isScanning = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Add controller state
    final cameraController = useState<MobileScannerController?>(null);

    // Initialize controller
    useEffect(() {
      cameraController.value = MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        facing: CameraFacing.back,
        torchEnabled: false,
      );

      return () => cameraController.value?.dispose();
    }, []);

    return Scaffold(
      appBar: const CustomAppBar(
        title: TextUtils('Scan QR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Gap(30),
          isScanning.value
              ? QrCodeScanWidget(
                  cameraController: cameraController,
                  isScanning: isScanning,
                  animationController: animationController)
              : ScanningOffWidget(
                  isScanning: isScanning,
                  animationController: animationController),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: InkWell(
                onTap: () {
                  isScanning.value = !isScanning.value;
                  if (isScanning.value) {
                    cameraController.value?.start();
                  } else {
                    cameraController.value?.stop();
                  }
                },
                child: SvgPicture.asset(
                  Assets.icons.qrCodeScan.path,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class QrCodeScanWidget extends StatelessWidget {
  const QrCodeScanWidget({
    super.key,
    required this.cameraController,
    required this.isScanning,
    required this.animationController,
  });

  final ValueNotifier<MobileScannerController?> cameraController;
  final ValueNotifier<bool> isScanning;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: 80.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: MobileScanner(
          controller: cameraController.value,
          fit: BoxFit.fill,
          placeholderBuilder: (context, size) => ScanningOffWidget(
              isScanning: isScanning, animationController: animationController),
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            for (final barcode in barcodes) {
              print('Barcode found! ${barcode.rawValue}');
            }
          },
          overlayBuilder: (context, constraints) => SizedBox(
            child: Center(
              child: AnimatedBuilder(
                animation: animationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, -150 + animationController.value * 300),
                    child: SvgPicture.asset(
                      Assets.images.scanLine.path,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ScanningOffWidget extends StatelessWidget {
  const ScanningOffWidget({
    super.key,
    required this.isScanning,
    required this.animationController,
  });

  final ValueNotifier<bool> isScanning;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340,
      width: 80.w,
      child: Stack(
        children: [
          !isScanning.value
              ? Center(
                  child: Image.asset(
                    Assets.images.screenerOff.path,
                  ),
                )
              : const SizedBox(),
          Center(
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -150 + animationController.value * 300),
                  child: SvgPicture.asset(
                    Assets.images.scanLine.path,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
