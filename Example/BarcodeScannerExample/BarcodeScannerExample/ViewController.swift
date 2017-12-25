import UIKit
import BarcodeScanner

class ViewController: UIViewController {

  @IBOutlet var presentScannerButton: UIButton!
  @IBOutlet var pushScannerButton: UIButton!

  private let controller = BarcodeScannerController()

  override func viewDidLoad() {
    super.viewDidLoad()

    controller.codeDelegate = self
    controller.errorDelegate = self
<<<<<<< HEAD
//    controller.dismissalDelegate = self
//    controller.navigationController?.barHideOnTapGestureRecognizer = false
    controller.navigationController?.isToolbarHidden = false
    controller.navigationController?.isNavigationBarHidden = false
=======
    controller.dismissalDelegate = self
  }
>>>>>>> upstream/master

  @IBAction func handleScannerPresent(_ sender: Any, forEvent event: UIEvent) {
    controller.title = "Barcode Scanner"
    present(controller, animated: true, completion: nil)
  }

  @IBAction func handleScannerPush(_ sender: Any, forEvent event: UIEvent) {
    controller.title = "Barcode Scanner"
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension ViewController: BarcodeScannerCodeDelegate {

  func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
    print("Barcode Data: \(code)")
    print("Symbology Type: \(type)")

    let delayTime = DispatchTime.now() + Double(Int64(6 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime) {
      controller.resetWithError()
    }
  }
}

extension ViewController: BarcodeScannerErrorDelegate {

  func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
    print(error)
  }
}

extension ViewController: BarcodeScannerDismissalDelegate {

  func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
    controller.dismiss(animated: true, completion: nil)
  }
}
