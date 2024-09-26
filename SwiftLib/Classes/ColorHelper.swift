import ObjcLib
import UIKit

enum ColorHelper {
    static func getColorFromString(_ str: String) -> UIColor? {
        Util.color(from: str)
    }
}