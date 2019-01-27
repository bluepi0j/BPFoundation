import UIKit

@objc public protocol SwipeInteractionViewDelegate: AnyObject {
    @objc optional func swipeWillStart()
    @objc optional func swiping(_ offset: CGFloat)
    @objc optional func swipeDidEnd()

}

@objc public class SwipeInteractionView: UIView, UIGestureRecognizerDelegate {
    @objc public weak var swipeDelegate: SwipeInteractionViewDelegate?
    private var swipeRecognizer: UIPanGestureRecognizer!
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        swipeRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleSwipe(from:)))
        swipeRecognizer.delegate = self
        self.addGestureRecognizer(swipeRecognizer)
    }

    @objc func handleSwipe(from recognizer: UIPanGestureRecognizer) {
        let xOffset = recognizer.translation(in: self).x
        let yOffset = recognizer.translation(in: self).y
        switch recognizer.direction(target: self) {
        case .up:
            switch recognizer.state {
            case .changed:
                self.swipeDelegate?.swiping?(-yOffset)
            case .cancelled, .ended:
                self.swipeDelegate?.swipeDidEnd?()
            default: break
            }
        case .down:
            switch recognizer.state {
            case .changed:
                self.swipeDelegate?.swiping?(-yOffset)
            case .cancelled, .ended:
                self.swipeDelegate?.swipeDidEnd?()
            default: break
            }
        case .right:
            switch recognizer.state {
            case .changed:
                self.swipeDelegate?.swiping?(xOffset)
            case .cancelled, .ended:
                self.swipeDelegate?.swipeDidEnd?()
            default: break
            }
        case .left:
            switch recognizer.state {
            case .changed:
                self.swipeDelegate?.swiping?(xOffset)
            case .cancelled, .ended:
                self.swipeDelegate?.swipeDidEnd?()
            default: break
            }
        }

    }

    @objc public override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        self.swipeDelegate?.swipeWillStart?()
        return true
    }
}
