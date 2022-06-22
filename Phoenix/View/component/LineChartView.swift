//
//  LineChartView.swift
//  Phoenix
//
//  Created by Korakot Phaearaya on 13/5/2565 BE.
//

import Foundation
import SwiftUI
import CoreData
import CoreGraphics

struct LineChart: Shape {
    
    var dataPoint: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        
//        func point(at ix:Int) -> CGPoint{
//
//            let point = dataPoint[ix]
//            let x = rect.width * CGFloat(ix)/CGFloat(dataPoint.count-1)
//            let y = (1-point) * rect.height
//
//            return CGPoint(x: x, y: y)
//        }
        
        return Path{p in
            
            guard dataPoint.count > 1 else {return}
            
            let start = dataPoint[0]
            p.move(to: CGPoint(x: 0, y: (1-start) * rect.height) )
            
            for idx in dataPoint.indices{
                let point = dataPoint[idx]
                let x = rect.width * CGFloat(idx)/CGFloat(dataPoint.count-1)
                let y = (1-point) * rect.height
                
                let pt = CGPoint(x: x, y: y)
                p.addLine(to: pt)
            }
            
        }
    }
}

struct LineChartView: View {

    var data: [CGFloat]
    var frameWidth : Int
    var frameheight : Int
    var lineColor : Color
    
    var body: some View {
        
            LineChart(dataPoint: data.normalized)
                .stroke(lineColor)
                .frame(width: CGFloat(frameWidth), height: CGFloat(frameheight), alignment: .center)
    }
}

extension Array where Element == CGFloat {
    
    var normalized: [CGFloat] {
        if let min = self.min(), let max = self.max(){
            return self.map{ ($0-min)/(max - min) }
        }
        return[]
    }
}

