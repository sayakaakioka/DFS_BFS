void setup() {
}

int[][] M = {
  {0, 1, 1, 0, 0, 0, 0, 0, 0, 0}, // A
  {1, 0, 0, 1, 1, 0, 0, 0, 0, 0}, // B
  {1, 0, 0, 0, 0, 1, 1, 0, 0, 0}, // C
  {0, 1, 0, 0, 0, 0, 0, 0, 0, 0}, // D
  {0, 1, 0, 0, 0, 0, 0, 1, 1, 0}, // E
  {0, 0, 1, 0, 0, 0, 0, 0, 0, 0}, // F
  {0, 0, 1, 0, 0, 0, 0, 0, 0, 1}, // G
  {0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, // H
  {0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, // I
  {0, 0, 0, 0, 0, 0, 1, 0, 0, 0}// J
};

ArrayList<Node> nodeList = new ArrayList<Node>();
void draw() {
  // ノードリストの作成
  for (int i=0; i<M[0].length; i++) {
    nodeList.add(createNode(i));
  }

  // 深さ優先探索
  pushStack(0);
  dfs();

  noLoop();
}

ArrayDeque<Integer> stack = new ArrayDeque<Integer>();
void dfs() {
  // 今、1番上に積まれているのは何番か見る
  int currentIdx = popStack();
  
  Node currentNode = nodeList.get(currentIdx);
  int nextIdx = currentNode.neighbors();
  while (nextIdx != -1) {
    // 現在のノードと繋がっているノードをひとつ取り出して
    // スタックに積み、探索を続ける
    pushStack(nextIdx);
    dfs();
    nextIdx = currentNode.neighbors();
  }

  // このノードの探索は終了
  print(currentNode.name());
}

void pushStack(int idx) {
  stack.addLast(idx);
}

int popStack() {
  int ret;
  try {
    ret = stack.removeLast();
  }
  catch(Exception e) {
    ret = -1;
  }
  return ret;
}


Node createNode(int idx) {
  String name[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
  Node node = new Node(name[idx]);
  for (int i=idx; i<M[0].length; i++) {
    if (M[idx][i] == 1) {
      node.neighbors(i);
    }
  }
  return node;
}
