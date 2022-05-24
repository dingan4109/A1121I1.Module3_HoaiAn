package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void add(Product product);
    void update(String name, Product product);
    void delete(String name);
    Product findByName(String name);
}
