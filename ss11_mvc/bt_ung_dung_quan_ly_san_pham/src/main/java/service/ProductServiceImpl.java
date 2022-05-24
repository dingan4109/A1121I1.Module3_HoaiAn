package service;

import model.Product;
import model.ProductRepo;
import model.ProductRepoImpl;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements ProductService{
    public static ProductRepo productRepo = new ProductRepoImpl();

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public void add(Product product) {
        productRepo.add(product);
    }

    @Override
    public void update(String name, Product product) {
        productRepo.update(name,product);
    }

    @Override
    public void delete(String name) {
        productRepo.delete(name);
    }

    @Override
    public Product findByName(String name) {
        return productRepo.findByName(name);
    }
}
