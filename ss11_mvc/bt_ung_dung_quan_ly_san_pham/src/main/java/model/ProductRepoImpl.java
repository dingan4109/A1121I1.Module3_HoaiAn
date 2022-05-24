package model;

import java.util.ArrayList;
import java.util.List;

public class ProductRepoImpl implements ProductRepo{
    public static List<Product> productList = new ArrayList<>();
    {
        productList.add(new Product(1,"Iphone",2000,"Xs","Apple"));
        productList.add(new Product(2,"Galaxy",1000,"1.2.4","Samsung"));
        productList.add(new Product(3,"Ipad",1200,"Ver11","Apple"));
        productList.add(new Product(4,"Vivo",500,"VX","Vivo"));
        productList.add(new Product(5,"Macbook",3400,"Pro","Apple"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
    }

    @Override
    public void update(String name,Product product) {
        for(int i = 0;i<productList.size();i++) {
            if(name.equals(productList.get(i).getName())) {
                productList.set(i,product);
            }
        }
    }

    @Override
    public void delete(String name) {
        for(int i = 0;i<productList.size();i++) {
            if(name.equals(productList.get(i).getName())) {
                productList.remove(i);
            }
        }
    }

    @Override
    public Product findByName(String name) {
        for(int i = 0;i<productList.size();i++) {
            if(name.equals(productList.get(i).getName())) {
                return productList.get(i);
            }
        }
        return null;
    }
}
