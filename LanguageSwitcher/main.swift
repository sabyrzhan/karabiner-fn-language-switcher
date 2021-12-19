//
//  main.swift
//  LanguageSwitcher
//
//  Created by Sabyrzhan Tynybayev on 19.12.2021.
//

import Foundation
import Carbon

struct MyInputSource {
    let id: String
    let source: TISInputSource
}

func resolveInputSource(inputSource: TISInputSource) -> MyInputSource {
    let property = TISGetInputSourceProperty(inputSource, kTISPropertyInputSourceID)!
    let s = Unmanaged<AnyObject>.fromOpaque(property).takeUnretainedValue() as! String
    let result = MyInputSource(id: s, source: inputSource)
    return result
}

func getCurrentInputSource() -> MyInputSource {
    let current = TISCopyCurrentKeyboardInputSource().takeRetainedValue()
    let currentMyInputSource = resolveInputSource(inputSource: current)
    return currentMyInputSource
}

func getSupportedInputSources() -> [MyInputSource] {
    let keyboards = TISCreateInputSourceList(nil, true).takeRetainedValue() as NSArray as! [TISInputSource]
    return keyboards.map { source -> MyInputSource in
        let property = TISGetInputSourceProperty(source, kTISPropertyInputSourceID)!
        let s = Unmanaged<AnyObject>.fromOpaque(property).takeUnretainedValue() as! String
        let result = MyInputSource(id: s, source: source)
        return result
    }.filter { value -> Bool in
        return value.id == "com.apple.keylayout.ABC" || value.id == "com.apple.keylayout.Kazakh"
    };
}

let currentInputSource = getCurrentInputSource()
let supportedInputSources = getSupportedInputSources()

supportedInputSources.forEach { value in
    if value.id != currentInputSource.id {
        TISSelectInputSource(value.source)
    }
}
