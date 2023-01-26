class NetCache {
  //定义缓存变量
  var cache = Map<String, dynamic>();

  //实现put方法
  void put(String url, dynamic value) {
    cache[url] = value;
  }

  //实现get方法
  dynamic get(String url) {
    return cache[url];
  }

  //实现clear方法
  void clear() {
    cache.clear();
  }
}
