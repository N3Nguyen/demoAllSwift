import UIKit

class AnimatedButton: UIButton {

    internal var buttonGradientLayer: CAGradientLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradientLayer()
        setupButtonActions()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradientLayer()
        setupButtonActions()
    }

    func setupGradientLayer() {
        if buttonGradientLayer == nil {
            buttonGradientLayer = CAGradientLayer()
            buttonGradientLayer.colors = [
                UIColor(red: 0.15, green: 0.65, blue: 0.85, alpha: 1.00).cgColor,
                UIColor(red: 0.30, green: 0.85, blue: 0.55, alpha: 1.00).cgColor
            ]
            buttonGradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            buttonGradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
            self.layer.insertSublayer(buttonGradientLayer, at: 0)
            
            self.layer.cornerRadius = 10
            self.layer.masksToBounds = true
        }
        buttonGradientLayer.frame = self.bounds
    }

    func setupButtonActions() {
        self.addTarget(self, action: #selector(buttonPressed), for: .touchDown)
        self.addTarget(self, action: #selector(buttonReleased), for: [.touchUpInside, .touchUpOutside])
    }

    @objc public func buttonPressed() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        })
    }

    @objc public func buttonReleased() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity
        })
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        buttonGradientLayer?.frame = self.bounds
    }
}

extension UIButton {
    func applyAnimatedButtonStyle() {
        let animatedButton = AnimatedButton(frame: self.frame)
        animatedButton.setupGradientLayer()
        animatedButton.setupButtonActions()
        self.layer.insertSublayer(animatedButton.buttonGradientLayer, at: 0)
        self.layer.cornerRadius = animatedButton.layer.cornerRadius
        self.layer.masksToBounds = animatedButton.layer.masksToBounds
        self.addTarget(animatedButton, action: #selector(animatedButton.buttonPressed), for: .touchDown)
        self.addTarget(animatedButton, action: #selector(animatedButton.buttonReleased), for: [.touchUpInside, .touchUpOutside])
    }
}
