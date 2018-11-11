import java.util.Stack;

class MinStack {
    Stack<Long> list;
    Long min;

    public MinStack() {
        this.list = new Stack<Long>();
    }

    public void push(int x) {
        Long val = Long.valueOf(x);
        if (this.list.isEmpty()) {
            this.min = val;
            this.list.push(val);
        } else {
            long re = this.min.longValue() - x;
            if (re > 0) {
                this.min = val;
            }
            this.list.push(re);
        }

    }

    public void pop() {
        long re = list.pop();
        if (list.isEmpty()) {
            this.min = null;
        } else {
            if (re > 0) {
                this.min = this.min + re;
            }
        }
    }

    public long top() {
        if (this.list.size() > 1) {
            if (this.list.peek() > 0) {
                return this.min.longValue();
            } else {
                return this.min - this.list.peek();
            }
        } else {
            return this.list.peek();
        }
    }

    public long getMin() {
        return this.min.longValue();
    }
}

/**
 * Your MinStack object will be instantiated and called as such: MinStack obj =
 * new MinStack(); 
 * obj.push(x); 
 * obj.pop(); 
 * int param_3 = obj.top(); 
 * int param_4 = obj.getMin();
 * 
 * 这道题 关键在于几个边界条件的确定
 * 1.通过引入差值变化，来保存和更新最小值
 * 2.push操做a时,如果 a - min < 0，说明a更小，则更新min; 初始时由于min的值为null,所以a就是最小值
 * 3.基于第二点，就引出了当栈中只有一个元素时，要判断这个边界条件的考虑
 * 4.pop操作时，如果栈顶的元素小于0（假设 push(a - min)）说明a更小，也说明min此时就是a,因而要更新min
 * 5.设计api时，因为是java要考虑长整型的用例
 */