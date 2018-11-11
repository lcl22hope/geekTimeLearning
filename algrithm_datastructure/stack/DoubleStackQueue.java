import java.util.Stack;

public class DoubleStackQueue {
    Stack<Integer> lStack;
    Stack<Integer> rStack;

    public DoubleStackQueue() {
        lStack = new Stack<>();
        rStack = new Stack<>();
    }

    public void push(int x) {
        while (!rStack.isEmpty()) {
            lStack.push(rStack.pop());
        }
        lStack.push(x);
    }

    public int pop() {
        while (!lStack.isEmpty()) {
            rStack.push(lStack.pop());
        }
        return rStack.pop();
    }

    public int peek() {
        if (!rStack.isEmpty()) {
            return rStack.peek();
        } else {
            return lStack.firstElement();
        }
    }

    public boolean empty() {
        return lStack.isEmpty() && rStack.isEmpty();
    }
}
/**
 * 在peek时候需要注意，因为一系列操作可能导致lStack已经为空了，则不能直接取lStack的栈底元素，需要额外判断
 * 
 */