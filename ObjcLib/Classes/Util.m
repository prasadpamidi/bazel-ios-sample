#import "Util.h"

@implementation Util

+ (UIColor *)colorFromString:(NSString *)colorCodeString {
    if (!colorCodeString || ![colorCodeString isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    UIColor *color = nil;
    if ([colorCodeString hasPrefix:@"#"]) {
        // hex color
        unsigned long red =0;
        unsigned long green = 0;
        unsigned long blue = 0;
        
        if (colorCodeString.length == 4) {
            NSString *color1 = [colorCodeString substringWithRange:NSMakeRange(1, 1)];
            NSString *color2 = [colorCodeString substringWithRange:NSMakeRange(2, 1)];
            NSString *color3 = [colorCodeString substringWithRange:NSMakeRange(3, 1)];
            
            colorCodeString = [NSString stringWithFormat:@"#%@%@%@%@%@%@", color1, color1, color2, color2, color3, color3];
        }
        
        if (colorCodeString.length == 7) {
            sscanf([colorCodeString UTF8String], "#%2lX%2lX%2lX", &red, &green, &blue);
        }
        
        color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
    } else if ([colorCodeString hasPrefix:@"rgb"]) {
        // rgb
        NSScanner *scanner = [NSScanner scannerWithString:colorCodeString];
        NSString *junk;
        NSString *red;
        NSString *green;
        NSString *blue;
        NSString *alpha;
        
        [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&junk];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet punctuationCharacterSet] intoString:&red];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&junk];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet punctuationCharacterSet] intoString:&green];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&junk];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet punctuationCharacterSet] intoString:&blue];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:&junk];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet characterSetWithCharactersInString:@")"] intoString:&alpha];
        if (nil == alpha) {
            alpha = @"1.0";
        }
        color = [UIColor colorWithRed:red.intValue/255.0 green:green.intValue/255.0 blue:blue.intValue/255.0 alpha:alpha.doubleValue];
    }
    
    return color;
}

@end