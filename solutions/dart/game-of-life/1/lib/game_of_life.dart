class GameOfLife {
  List<List<int>> grid = [[]];

  GameOfLife(List<List<int>> input) {
    grid = input;
  }

  void tick() {
    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid.length; x++) {
        if (grid[y][x] == 1) {
          // cell is alive
          int neighbors = _neighborCount(x, y);
          if (neighbors == 2 || neighbors == 3) {
            // it lives
          } else {
            // it dies
            grid[y][x] = 0;
          }
        } else {
          // cell is dead
          int neighbors = _neighborCount(x, y);
          if (neighbors == 3) {
            // cell is alive now
            grid[y][x] = 1;
          }
        }
      }
    }
  }

  List<List<int>> matrix() {
    return grid;
  }

  int _neighborCount(int x, int y) {
    int count = 0;
    if (_isInBounds(x - 1, y - 1)) {
      count += grid[y - 1][x - 1];
    }
    if (_isInBounds(x, y - 1)) {
      count += grid[y - 1][x];
    }
    if (_isInBounds(x + 1, y - 1)) {
      count += grid[y - 1][x + 1];
    }
    if (_isInBounds(x - 1, y)) {
      count += grid[y][x - 1];
    }
    if (_isInBounds(x + 1, y)) {
      count += grid[y][x + 1];
    }
    if (_isInBounds(x + 1, y + 1)) {
      count += grid[y + 1][x + 1];
    }
    if (_isInBounds(x, y + 1)) {
      count += grid[y + 1][x];
    }
    if (_isInBounds(x + 1, y + 1)) {
      count += grid[y + 1][x + 1];
    }
    return count;
  }

  bool _isInBounds(int x, int y) {
    return x >= 0 && x < grid.length && y >= 0 && y < grid.length;
  }
}
