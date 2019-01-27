public protocol SwipeInteractionAnimatorDelegate {
    func registerGesture()
}

public class SwipeInteractionAnimator: UIPercentDrivenInteractiveTransition {

}

extension SwipeInteractionAnimator: SwipeInteractionViewDelegate {
    private func progress(_ offset: CGFloat) -> CGFloat {
        print("\(offset)")
        return offset / UIScreen.main.bounds.height
    }

    public func swipeDidEnd() {
        print("swipeDidEnd")
        if true {
            self.finish()
        } else {
            self.cancel()
        }
    }

    public func swiping(_ offset: CGFloat) {
        self.update(self.progress(offset))
    }
}
