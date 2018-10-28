// 单链表实现LRU思路：

// 1.首先维护一个有序的单链表，越靠近链表尾部的结点是越早之前访问的，当有一个新数据被访问时，就从链表头开始顺序遍历链表
// 1)如果此数据之前已经在缓存链表中了，我们遍历得到这个数据对应的结点，并将其从原来的位置删除，然后再插入到链表的开头
// 2)如果此数据没有存放在缓存链表中，又分为两种情况：
// -> 如果缓存未满，则将此结点插入到链表头部
// -> 如果缓存已满，则删除链表尾结点，将新数据插入到链表的头部


// 数组实现LRU的思路：
// 1.同样维护一个有序数组，数组的头部是最早使用的，数组的尾部是最近使用的，当有一个新数据被访问时，后向顺序遍历数组
// 1）如果数据存在于数组中，取出这个数据并将其从原位置移动到数组末尾，然后其他位置数据自动前移
// 2）如果此数据不在数组中，也是两种情况：
// -> 如果缓存未满，直接在数组尾部插入数据
// -> 如果缓存满了，删除数组头部，然后前移数据，在数组尾部插入新数据