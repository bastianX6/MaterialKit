//
//  MKButton.swift
//  MaterialKit
//
//  Created by LeVan Nghia on 11/14/14.
//  Copyright (c) 2014 Le Van Nghia. All rights reserved.
//

import UIKit


open class MKButton : UIButton
{
    open var maskEnabled: Bool = true {
        didSet {
            mkLayer.enableMask(maskEnabled)
        }
    }
    open var rippleLocation: MKRippleLocation = .tapLocation {
        didSet {
            mkLayer.rippleLocation = rippleLocation
        }
    }
    open var ripplePercent: Float = 0.9 {
        didSet {
            mkLayer.ripplePercent = ripplePercent
        }
    }
    open var backgroundLayerCornerRadius: CGFloat = 0.0 {
        didSet {
            mkLayer.setBackgroundLayerCornerRadius(backgroundLayerCornerRadius)
        }
    }
    // animations
    open var shadowAniEnabled: Bool = true
    open var backgroundAniEnabled: Bool = true {
        didSet {
            if !backgroundAniEnabled {
                mkLayer.enableOnlyCircleLayer()
            }
        }
    }
    open var rippleAniDuration: Float = 0.75
    open var backgroundAniDuration: Float = 1.0
    open var shadowAniDuration: Float = 0.65
    
    open var rippleAniTimingFunction: MKTimingFunction = .linear
    open var backgroundAniTimingFunction: MKTimingFunction = .linear
    open var shadowAniTimingFunction: MKTimingFunction = .easeOut

    open var cornerRadius: CGFloat = 2.5 {
        didSet {
            layer.cornerRadius = cornerRadius
            mkLayer.setMaskLayerCornerRadius(cornerRadius)
        }
    }
    // color
    open var rippleLayerColor: UIColor = UIColor(white: 0.45, alpha: 0.5) {
        didSet {
            mkLayer.setCircleLayerColor(rippleLayerColor)
        }
    }
    open var backgroundLayerColor: UIColor = UIColor(white: 0.75, alpha: 0.25) {
        didSet {
            mkLayer.setBackgroundLayerColor(backgroundLayerColor)
        }
    }
    override open var bounds: CGRect {
        didSet {
            mkLayer.superLayerDidResize()
        }
    }

    fileprivate lazy var mkLayer: MKLayer = MKLayer(superLayer: self.layer)

    // MARK - initilization
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayer()
    }

    // MARK - setup methods
    fileprivate func setupLayer() {
        adjustsImageWhenHighlighted = false
        cornerRadius = 2.5
        mkLayer.setBackgroundLayerColor(backgroundLayerColor)
        mkLayer.setCircleLayerColor(rippleLayerColor)
    }

    // MARK - location tracking methods
    override open func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if rippleLocation == .tapLocation {
            mkLayer.didChangeTapLocation(touch.location(in: self))
        }

        // rippleLayer animation
        mkLayer.animateScaleForCircleLayer(0.45, toScale: 1.0, timingFunction: rippleAniTimingFunction, duration: CFTimeInterval(self.rippleAniDuration))

        // backgroundLayer animation
        if backgroundAniEnabled {
            mkLayer.animateAlphaForBackgroundLayer(backgroundAniTimingFunction, duration: CFTimeInterval(self.backgroundAniDuration))
        }

        // shadow animation for self
        if shadowAniEnabled {
            let shadowRadius = layer.shadowRadius
            let shadowOpacity = layer.shadowOpacity
            let duration = CFTimeInterval(shadowAniDuration)
            mkLayer.animateSuperLayerShadow(10, toRadius: shadowRadius, fromOpacity: 0, toOpacity: shadowOpacity, timingFunction: shadowAniTimingFunction, duration: duration)
        }

        return super.beginTracking(touch, with: event)
    }
}
