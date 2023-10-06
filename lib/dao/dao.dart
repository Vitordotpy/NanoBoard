abstract class DAO<T> {
  Future create(T value);
  Future change(T calue);
  Future<T> get(int id);
  Future<List<T>> getAll(int id);
  Future delete(T value);
}
