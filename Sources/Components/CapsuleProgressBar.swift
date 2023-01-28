//
//  CapsuleProgressBar.swift
//  
//
//  Created by Daniel Berezhnoy on 1/9/23.
//

import SwiftUI

#warning("Add the README, GitHub Description and all that good stuff")

@available (iOS 15.0, *)
public struct CapsuleProgressBar: View {
    
    let color: Color
    let totalStages: Int
    let currentStage: Int
    let animation: Animation
    let capsuleWidth: CGFloat
    let capsuleHeight: CGFloat
    
    public var body: some View {
        ZStack(alignment: .leading) {
            baseLayer
            topLayer
        }
    }
    
    var baseLayer: some View {
        HStack(spacing: capsuleWidth / 10) {
            ForEach(0 ..< (totalStages - 1).onlyPositive(), id: \.self) { capsule in
                CapsuleBar(filled: false,
                           color: color,
                           capsuleWidth: capsuleWidth,
                           capsuleHeight: capsuleHeight)
            }
        }
    }
    
    var topLayer: some View {
        HStack(spacing: capsuleWidth / 10) {
            ForEach(progressRange, id: \.self) { capsule in
                CapsuleBar(filled: true,
                           color: color,
                           capsuleWidth: capsuleWidth,
                           capsuleHeight: capsuleHeight)
            }
        }
        .animation(animation, value: progressRange)
    }
    
    var progressRange: Range<Int> {
        let actualProgress = 0 ..< (currentStage - 1).onlyPositive()
        let fullProgress = 0 ..< (totalStages - 1).onlyPositive()
        return progressRangeIsValid ? actualProgress : fullProgress
    }
    
    var progressRangeIsValid: Bool { currentStage <= totalStages }
    
    /// Progress View consisting of Capsule Bars.
    /// To initialize, pass in the Current Stage of the progress and the Total Amount of Stages.
    /// For more control, customize the Color, Animation as well as Width and Height for each bar.
    public init(currentStage: Int,
                totalStages: Int,
                color: Color = .green,
                animation: Animation = .default,
                capsuleWidth: CGFloat = 32,
                capsuleHeight: CGFloat = 8) {
        
        self.color = color
        self.animation = animation
        self.totalStages = totalStages
        self.currentStage = currentStage
        self.capsuleWidth = capsuleWidth
        self.capsuleHeight = capsuleHeight
    }
}

@available (iOS 15.0, *)
struct CapsuleProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleProgressBar(currentStage: 4, totalStages: 5)
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
