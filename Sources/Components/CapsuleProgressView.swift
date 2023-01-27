//
//  CapsuleProgressView.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

#warning("1) Test all of the descriptions through the Test App")
#warning("2) Add the README, GH Description and all that good stuff")

@available (iOS 15.0, *)
public struct CapsuleProgressView: View {
    
    let color: Color
    let totalStages: Int
    let currentStage: Int
    let capsuleWidth: CGFloat
    let capsuleHeight: CGFloat
    
    public var body: some View {
        ZStack(alignment: .leading) {
            baseLayer
            topLayer
        }
    }
    
    var baseLayer: some View {
        HStack(spacing: 3) {
            ForEach(0 ..< onlyPositive(totalStages - 1), id: \.self) { capsule in
                CapsuleBar(filled: false,
                           color: color,
                           capsuleWidth: capsuleWidth,
                           capsuleHeight: capsuleHeight)
            }
        }
    }
    
    var topLayer: some View {
        HStack(spacing: 3) {
            if currentStage <= totalStages {
                ForEach(0 ..< onlyPositive(currentStage - 1), id: \.self) { capsule in
                    CapsuleBar(filled: true,
                               color: color,
                               capsuleWidth: capsuleWidth,
                               capsuleHeight: capsuleHeight)
                }
                
            } else {
                ForEach(0 ..< onlyPositive(totalStages - 1), id: \.self) { capsule in
                    CapsuleBar(filled: true,
                               color: color,
                               capsuleWidth: capsuleWidth,
                               capsuleHeight: capsuleHeight)
                }
            }
        }
    }
    
    func onlyPositive(_ value: Int) -> Int { value < 0 ? 0 : value }
    
    /// Progress View consisting of Capsule Bars.
    /// Perfect for showing user the progress they have done for the task
    /// (e.g. how many screens are left to swipe through to complete onboarding).
    /// Pass in the Total Amount of Stages and the Current Stage of the progress.
    /// For more customization, pass in the Color as well as custom Width and Height for the bar.
    public init(totalStages: Int,
                currentStage: Int,
                color: Color = .green,
                capsuleWidth: CGFloat = 32,
                capsuleHeight: CGFloat = 8) {
        
        self.color = color
        self.totalStages = totalStages
        self.currentStage = currentStage
        self.capsuleWidth = capsuleWidth
        self.capsuleHeight = capsuleHeight
    }
}

@available (iOS 15.0, *)
struct CapsuleProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleProgressView(totalStages: 5, currentStage: 4)
    }
}

@available(iOS 15.0, *)
public struct CapsuleBar: View {
    
    @State var filled: Bool
    let color: Color
    
    let capsuleWidth: CGFloat
    let capsuleHeight: CGFloat
    
    public var body: some View {
        Capsule()
            .fill(filled ? color : .secondary.opacity(0.4))
            .frame(width: capsuleWidth, height: capsuleHeight)
    }
}
