//
//  Example
//  man.li
//
//  Created by man.li on 11/11/2018.
//  Copyright © 2020 man.li. All rights reserved.
//

import UIKit

struct Color {

    static var colorGradientHead: [CGColor] {
        return [UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.00).cgColor,
                 UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.00).cgColor]
    }

    static var mainGreen: UIColor {
        return CocoaDebug.mainColor.hexColor
    }
}

extension UIColor {
    
    static let elephant =            #colorLiteral(red: 0.1337452531, green: 0.1422285736, blue: 0.1936765313, alpha: 1) // #222432
    static let cyanishGray =         #colorLiteral(red: 0.3882352941, green: 0.3960784314, blue: 0.4588235294, alpha: 1) // #636575
    static let coolGrey =            #colorLiteral(red: 0.7110919129, green: 0.7164562389, blue: 0.7983151291, alpha: 1) // #A1A2B4
    static let whiteShimmer =        #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 1, alpha: 1) // #F3F5FF
    static let whiteSmoke =          #colorLiteral(red: 0.9529411765, green: 0.9607843137, blue: 1, alpha: 1) // #F3F5FF
    static let pureRed =             #colorLiteral(red: 0.768627451, green: 0.1490196078, blue: 0.01176470588, alpha: 1) // #C42603
    static let ocher =               #colorLiteral(red: 0.7490196078, green: 0.5647058824, blue: 0.06666666667, alpha: 1) // #B78513
    static let strongLimeGreen =     #colorLiteral(red: 0.5725490196, green: 0.7490196078, blue: 0.1254901961, alpha: 1) // #92BF20
    static let limeGreenHeader =     #colorLiteral(red: 0.1137254902, green: 0.7882352941, blue: 0.6705882353, alpha: 1) // #1DC9AB
    static let cerulean =            #colorLiteral(red: 0.06274509804, green: 0.3529411765, blue: 0.8823529412, alpha: 1) // #105AE1
    static let rustyOrange =         #colorLiteral(red: 1, green: 0.2941176471, blue: 0, alpha: 1) // #FF4B00
    static let rustyYellow =         #colorLiteral(red: 1, green: 0.7725490196, blue: 0.007843137255, alpha: 1) // #FFC502
    static let offWhite =            #colorLiteral(red: 1, green: 0.9764705882, blue: 0.8823529412, alpha: 1) // #FFF9E1
    
    /// The RGBA components associated with a `UIColor` instance.
    var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        let components = self.cgColor.components!
        
        switch components.count == 2 {
        case true : return (r: components[0], g: components[0], b: components[0], a: components[1])
        case false: return (r: components[0], g: components[1], b: components[2], a: components[3])
        }
    }
    
    /**
     Returns a `UIColor` by interpolating between two other `UIColor`s.
     - Parameter fromColor: The `UIColor` to interpolate from
     - Parameter toColor:   The `UIColor` to interpolate to (e.g. when fully interpolated)
     - Parameter progress:  The interpolation progess; must be a `CGFloat` from 0 to 1
     - Returns: The interpolated `UIColor` for the given progress point
     */
    static func interpolate(from fromColor: UIColor, to toColor: UIColor, with progress: CGFloat) -> UIColor {
        let fromComponents = fromColor.components
        let toComponents = toColor.components
        
        let r = (1 - progress) * fromComponents.r + progress * toComponents.r
        let g = (1 - progress) * fromComponents.g + progress * toComponents.g
        let b = (1 - progress) * fromComponents.b + progress * toComponents.b
        let a = (1 - progress) * fromComponents.a + progress * toComponents.a
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    // calculates intermediate color, percent should in between 0.0 - 1.0
    func colorBetween(col1: UIColor, col2: UIColor, percent: CGFloat) -> UIColor {
        let c1 = CIColor(color: col1)
        let c2 = CIColor(color: col2)
        
        let alpha = (c2.alpha - c1.alpha) * percent + c1.alpha
        let red = (c2.red - c1.red) * percent + c1.red
        let blue = (c2.blue - c1.blue) * percent + c1.blue
        let green = (c2.green - c1.green) * percent + c1.green
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

public enum ColorsType {
    case limeGreenHeader
    case rustyOrange
    case rustyYellow
}

extension ColorsType: RawRepresentable {
    public typealias RawValue = UIColor
    
    public init?(rawValue: RawValue) {
        switch rawValue {
        case #colorLiteral(red: 0.1137254902, green: 0.7882352941, blue: 0.6705882353, alpha: 1): self = .limeGreenHeader
        case #colorLiteral(red: 1, green: 0.2941176471, blue: 0, alpha: 1): self = .rustyOrange
        case #colorLiteral(red: 1, green: 0.7725490196, blue: 0.007843137255, alpha: 1): self = .rustyYellow
        default: return nil
        }
    }
    
    public var rawValue: RawValue {
        switch self {
        case .limeGreenHeader: return #colorLiteral(red: 0.1137254902, green: 0.7882352941, blue: 0.6705882353, alpha: 1)
        case .rustyOrange: return #colorLiteral(red: 1, green: 0.2941176471, blue: 0, alpha: 1)
        case .rustyYellow: return #colorLiteral(red: 1, green: 0.7725490196, blue: 0.007843137255, alpha: 1)
        }
    }
}
