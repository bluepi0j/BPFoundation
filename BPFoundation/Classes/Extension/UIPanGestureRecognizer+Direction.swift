import Foundation

extension UIPanGestureRecognizer {
    @objc public enum GestureDirection: Int {
        case up
        case down
        case left
        case right
    }

    @objc public func verticalDirection(target: UIView) -> GestureDirection {
        return self.velocity(in: target).y > 0 ? .down : .up
    }


    @objc public func horizontalDirection(target: UIView) -> GestureDirection {
        return self.velocity(in: target).x > 0 ? .right : .left
    }

    @objc public func direction(target: UIView) -> GestureDirection {
        let xVelocity = self.velocity(in: target).x
        let yVelocity = self.velocity(in: target).y

        if xVelocity > 0 && abs(xVelocity) > abs(yVelocity) {
            return .right
        } else if xVelocity < 0 && abs(xVelocity) > abs(yVelocity) {
            return .left
        } else if yVelocity > 0 && abs(yVelocity) > abs(xVelocity) {
            return .down
        } else {
            return .up
        }
    }

    public func versus(target: UIView) -> (horizontal: GestureDirection, vertical: GestureDirection) {
        return (self.horizontalDirection(target: target), self.verticalDirection(target: target))
    }
}
