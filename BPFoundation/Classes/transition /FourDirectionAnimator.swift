import Foundation

public class FourDirectionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }

    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        let containerView = transitionContext.containerView

        toVC.view.transform = CGAffineTransform(translationX: 0, y: containerView.bounds.height)
        containerView.addSubview(toVC.view)
        UIView.animate(withDuration: 5.0, animations: {
            toVC.view.transform = CGAffineTransform.identity
            fromVC.view.transform = CGAffineTransform(translationX: 0, y: -containerView.bounds.height)
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }

    }

    
}
