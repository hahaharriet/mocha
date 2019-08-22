package product.dao;

import java.util.List;


import product.model.Product;

public interface ProductDAO {

		Product selectByproductno(int productno);
		List<Product> selectAll();
		List<Product> selectAllpricedesc(int rowStartNumber, int rowEndNumber);
		List<Product> selectAllpriceasc(int rowStartNumber, int rowEndNumber);
		Product SelectById(int productno);
		List<Product>SelectByName(String productname);
		boolean productInsert(Product product);
		boolean productUpdate(Product product);
		boolean productDelete(int id);
		List<Product> selectAll(int rowStartNumber, int rowEndNumber);
		List<Product>selectAllHot();

}


