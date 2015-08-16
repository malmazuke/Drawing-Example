import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var sliderBrush: UISlider!
  @IBOutlet weak var sliderOpacity: UISlider!

  @IBOutlet weak var imageViewBrush: UIImageView!
  @IBOutlet weak var imageViewOpacity: UIImageView!

  @IBOutlet weak var labelBrush: UILabel!
  @IBOutlet weak var labelOpacity: UILabel!

  @IBOutlet weak var sliderRed: UISlider!
  @IBOutlet weak var sliderGreen: UISlider!
  @IBOutlet weak var sliderBlue: UISlider!

  @IBOutlet weak var labelRed: UILabel!
  @IBOutlet weak var labelGreen: UILabel!
  @IBOutlet weak var labelBlue: UILabel!
  
  var brush: CGFloat = 10.0
  var opacity: CGFloat = 1.0
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func close(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
  }

  @IBAction func colorChanged(sender: UISlider) {
  }

  @IBAction func sliderChanged(sender: UISlider) {
    if sender == sliderBrush {
      brush = CGFloat(sender.value)
      labelBrush.text = NSString(format: "%.2f", brush.native) as String
    } else {
      opacity = CGFloat(sender.value)
      labelOpacity.text = NSString(format: "%.2f", opacity.native) as String
    }
    
    drawPreview()
  }

  func drawPreview() {
    UIGraphicsBeginImageContext(imageViewBrush.frame.size)
    var context = UIGraphicsGetCurrentContext()
    
    CGContextSetLineCap(context, kCGLineCapRound)
    CGContextSetLineWidth(context, brush)
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
    CGContextMoveToPoint(context, 45.0, 45.0)
    CGContextAddLineToPoint(context, 45.0, 45.0)
    CGContextStrokePath(context)
    imageViewBrush.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    UIGraphicsBeginImageContext(imageViewBrush.frame.size)
    context = UIGraphicsGetCurrentContext()
    
    CGContextSetLineCap(context, kCGLineCapRound)
    CGContextSetLineWidth(context, 20)
    CGContextMoveToPoint(context, 45.0, 45.0)
    CGContextAddLineToPoint(context, 45.0, 45.0)
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, opacity)
    CGContextStrokePath(context)
    imageViewOpacity.image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()
  }
}
