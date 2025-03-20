//
//  StartLoadingView.swift
//  BookApplication
//
//  Created by Oksana Dionisieva on 20.03.2025.
//

import SwiftUI

struct StartLoadingView: View {
    let startX = 60.0
    let startY = 200.0
    let screenWidth = UIScreen.main.bounds.width - 60
    let screenHeight = UIScreen.main.bounds.height - 200
    
    var points: [CGPoint] {
        [
            CGPoint(x: startX, y: startY),
            CGPoint(x: screenWidth / 2, y: startY),
            CGPoint(x: screenWidth, y: startY),
            CGPoint(x: screenWidth / 2, y: screenHeight / 1.5),
            CGPoint(x: startX, y: screenHeight),
            CGPoint(x: screenWidth / 2, y: screenHeight),
            CGPoint(x: screenWidth, y: screenHeight)
        ]
    }
    
    var body: some View {
        ZStack {
            MirroredSShape(points: points)
                .stroke(Color.tundora, style: StrokeStyle(lineWidth: 3, dash: [9, 5]))
            PathAnimationView(bezierPath: makeBezierPath())
        }.background(Color.lilac)
    }
    
    func makeBezierPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addQuadCurve(to: points[3], controlPoint: points[2])
        path.addQuadCurve(to: points[5], controlPoint: points[4])
        path.addLine(to: points[6])
        return path
    }
}

// MARK: - Shape
struct MirroredSShape: Shape {
    let points: [CGPoint]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard points.count > 2 else { return path }
        
        path.move(to: points[0])
        path.addLine(to: points[1])
        path.addQuadCurve(to: points[3], control: points[2])
        path.addQuadCurve(to: points[5], control: points[4])
        path.addLine(to: points[6])
        
        return path
    }
}

// MARK: - UIViewRepresentable
struct PathAnimationView: UIViewRepresentable {
    let bezierPath: UIBezierPath
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        let animatedImageView = UIImageView(image: UIImage(systemName: "book"))
        animatedImageView.tintColor = UIColor(Color.thunderbird)
        animatedImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        containerView.addSubview(animatedImageView)
        
        startAnimation(for: animatedImageView)
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    private func startAnimation(for view: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = bezierPath.cgPath
        animation.duration = 6.0
        animation.repeatCount = 1
        animation.calculationMode = .paced
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        
        view.layer.add(animation, forKey: "move")
    }
}

#Preview {
    StartLoadingView()
}
