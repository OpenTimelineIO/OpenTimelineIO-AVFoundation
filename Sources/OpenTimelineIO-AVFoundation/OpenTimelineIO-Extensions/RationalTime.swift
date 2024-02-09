//
//  File.swift
//  
//
//  Created by Anton Marini on 2/9/24.
//

import Foundation
import CoreMedia
import OpenTimelineIO

public extension RationalTime
{
    func toCMTime() -> CMTime
    {
        let valueDecimalPlaces = self.value.decimalPlaces()
        let rateDecimalPlaces = self.rate.decimalPlaces()
                
        let scale = pow(10.0, max( Double(rateDecimalPlaces), Double(valueDecimalPlaces) ) )
        let scaledValue = self.value.toTimeValue( scale )
        let scaledRate = self.rate.toTimeScale( scale )

        let cmTime = CMTime(value: scaledValue, timescale: scaledRate)
        
        return cmTime
    }
}
