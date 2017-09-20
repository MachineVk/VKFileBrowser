//
// Constatnt.swift
// Highlight
//
// This file is automatically generated.
// DO NOT MODIFY THIS FILE MANUALLY
//
import UIKit
import ChameleonFramework

public let hlLangCount: UInt16 = 176

public let SCREEN_WIDTH = UIScreen.main.nativeBounds.size.width
public let SCREEN_HEIGHT = UIScreen.main.nativeBounds.size.height

public let IS_PAD = UIDevice.current.userInterfaceIdiom == .pad
public let IS_PHONE = UIDevice.current.userInterfaceIdiom == .phone

public let CGRectZero = CGRect()

public func LocalizedString(_ key:String) -> String {
    return NSLocalizedString(key, comment: key)
}

let HEADCOLOR : UIColor = .flatGreen
let localBranchColors : [UIColor] = [.flatSkyBlue,.flatBlue,.flatPowderBlue,.flatNavyBlue]

let remoteBranchColors : [UIColor] = [.flatSkyBlueDark,.flatBlueDark,.flatPowderBlueDark,.flatNavyBlueDark]


let appDelegate = UIApplication.shared.delegate as! AppDelegate
let spiltController = appDelegate.window?.rootViewController as! UISplitViewController


public let documentDir : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
public let resourceKeys = [URLResourceKey.nameKey,URLResourceKey.isDirectoryKey,URLResourceKey.pathKey,URLResourceKey.typeIdentifierKey,URLResourceKey.totalFileSizeKey,URLResourceKey.creationDateKey]


