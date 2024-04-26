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
  enq(0);
  bfs();

  noLoop();
}

ArrayDeque<Integer> q = new ArrayDeque<Integer>();
void bfs() {
  // 今、先頭は何番か見る
  int currentIdx = deq();
  if(currentIdx == -1){
    return;
  }
  
  Node currentNode = nodeList.get(currentIdx);
  currentNode.arrived(true);
  
  int nextIdx = currentNode.neighbors();
  while (nextIdx != -1) {
    // 現在のノードから繋がっているノードをキューに入れる
    if(!nodeList.get(nextIdx).arrived()){
      enq(nextIdx);
    }
    nextIdx = currentNode.neighbors();
  }
  
  if(q.size() > 0){
    bfs();
  }
  
  // このノードの探索は終了
}

void enq(int idx) {
  q.addLast(idx);
  println("enq(): " + printQueue());
}

int deq() {
  int ret;
  try {
    ret = q.removeFirst();
  }
  catch(Exception e) {
    ret = -1;
  }
  
  println("deq(): " + printQueue());
  return ret;
}

String printQueue(){
  String ret = "";
  for(int idx: q){
    ret = ret + nodeList.get(idx).name() + " ";
  }
  return ret;
}


Node createNode(int idx) {
  String name[] = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J"};
  Node node = new Node(name[idx]);
  for (int i=0; i<M[0].length; i++) {
    if (M[idx][i] == 1) {
      node.neighbors(i);
    }
  }
  return node;
}
