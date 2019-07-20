//
//  RadialGradientLayer.swift
//  LoadingProgressHUD
//
//  Created by Leyee.H on 2019/7/20.
//

//import Foundation
import QuartzCore

/*
class RadialGradientLayer:CALayer {
    
    let gradientCenter:CGPoint = CGPoint(x:0, y:0)
    
    func drawInContext(context:CGContext) {
        let locationsCount:size_t = 2;
        let locations:[CGFloat] = [0.0, 1.0];
        let colors:[CGFloat] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75];
        let colorSpace:CGColorSpace = CGColorSpaceCreateDeviceRGB();
        let gradient:CGGradient = CGGradient(colorSpace: colorSpace, colorComponents: colors, locations: locations, count: locationsCount)!;
//    CoreGraphics.CGColorSpaceRelease(colorSpace);
    
        let radius:Float = Float(min(self.bounds.size.width , self.bounds.size.height))
        context.drawRadialGradient (gradient, startCenter: self.gradientCenter, startRadius: 0, endCenter: self.gradientCenter, endRadius: CGFloat(radius), options: .drawsAfterEndLocation);
//    CoreGraphics.CGGradientRelease(gradient);
    }
    
}
*/

class RadialGradientLayer: CALayer {
    var gradientCenter = CGPoint.zero
    override func draw(in context: CGContext) {
        super.draw(in: context)
        let locationsCount = 2
        let locations : [CGFloat] = [0.0, 1.0]
        let colors : [CGFloat] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75]
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        if let gradient = CGGradient.init(colorSpace: colorSpace, colorComponents: colors, locations: locations, count: locationsCount) {
            let radius = min(bounds.size.width, bounds.size.height)
            
            context.drawRadialGradient(gradient, startCenter: gradientCenter, startRadius: 0, endCenter: gradientCenter, endRadius: radius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
        }
    }
}
