package model;

import java.util.List;

public interface ProductRepo {
    List<Product> findAll();
    void add(Product product);
    void update(String name,Product product);
    void delete(String name);
    Product findByName(String name);
}
