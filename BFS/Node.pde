import java.util.ArrayDeque;

class Node {
  private final String name;
  private ArrayDeque<Integer> neighbors = new ArrayDeque<Integer>();

  public Node(String name) {
    this.name = name;
  }

  public String name() {
    return this.name;
  }

  public void neighbors(int idx) {
    this.neighbors.addLast(idx);
  }

  public int neighbors() {
    int ret;
    try {
      ret = neighbors.removeFirst();
    }
    catch(Exception e) {
      ret = -1;
    }
    return ret;
  }
}
