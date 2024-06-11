import UIKit

class AnimatedBackgroundView: UIView {

    private var gradientLayer: CAGradientLayer!
    private var particleEmitter: CAEmitterLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
        setupParticleEffect()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
        setupParticleEffect()
    }

    private func setupGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 0.85, green: 0.30, blue: 0.45, alpha: 1.00).cgColor,
            UIColor(red: 0.99, green: 0.77, blue: 0.31, alpha: 1.00).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.insertSublayer(gradientLayer, at: 0)
        
        animateGradient()
    }

    private func animateGradient() {
        let color1 = UIColor(red: 0.99, green: 0.77, blue: 0.31, alpha: 1.00).cgColor
        let color2 = UIColor(red: 0.85, green: 0.30, blue: 0.45, alpha: 1.00).cgColor
        
        let color3 = UIColor(red: 0.31, green: 0.50, blue: 0.85, alpha: 1.00).cgColor
        let color4 = UIColor(red: 0.15, green: 0.30, blue: 0.65, alpha: 1.00).cgColor

        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = [color3, color4]
        gradientChangeAnimation.fillMode = .forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradientChangeAnimation.autoreverses = true
        gradientChangeAnimation.repeatCount = .infinity
        
        gradientLayer.add(gradientChangeAnimation, forKey: "colorChange")
    }

    private func setupParticleEffect() {
        particleEmitter = CAEmitterLayer()
        particleEmitter.emitterPosition = CGPoint(x: self.bounds.width / 2, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: self.bounds.width, height: 1)
        
        let cell = CAEmitterCell()
        cell.birthRate = 2
        cell.lifetime = 5.0
        cell.velocity = 100
        cell.velocityRange = 50
        cell.emissionLongitude = .pi
        cell.spinRange = 5.0
        cell.scale = 0.1
        cell.scaleRange = 0.2
        cell.contents = UIImage(named: "particle.png")?.cgImage
        
        particleEmitter.emitterCells = [cell]
        self.layer.addSublayer(particleEmitter)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
        particleEmitter.frame = self.bounds
    }
}
