package product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import product.model.Product;

public class ProductDAOImpel extends BaseDAO implements ProductDAO {
	private static final String PRODUCT_SELECTALL_PRODUCTNO_SQL
	="select * from product order by productno desc";
	private static final String PRODUCT_SELECTALL_PRICE_DESC_SQL="select* from product order by price desc";
	private static final String PRODUCT_SELECTALL_PRICE_ASC_SQL="select* from product order by price asc";
	private static final String PRODUCT_SELECT_BY_NAME= "SELECT * from product where productname like ?";
	private static final String PRODUCT_SELECT_BY_PRODUCTNO="SELECT * from product where productno=?";
	private static final String PRODUCT_INSERT_SQL="insert into product values(seq_product.nextval,?,?,?,?)";
	private static final String PRODUCT_UPDATE_SQL="UPDATE product SET productname=?,imgname=?,description=?,price=? where productno=?";
	private static final String PRODUCT_DELETE_SQL="DELETE FROM product WHERE productno=?";
	
	@Override
	public Product selectByproductno(int productno) {
		Product product = null;
;		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(PRODUCT_SELECT_BY_PRODUCTNO);
		
			preparedStatement.setInt(1, productno);
			resultSet=preparedStatement.executeQuery();
		
			if(resultSet.next()) {
				product=new Product();			
				product.setProductno(resultSet.getInt("productno"));			
				product.setProductname(resultSet.getString("productname"));			
				product.setimgname(resultSet.getString("imgname"));		
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("price"));
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return product;
		
	}


	@Override
	public List<Product> selectAllpricedesc() {
		List<Product> products = new ArrayList<Product>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(PRODUCT_SELECTALL_PRICE_DESC_SQL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Product product = new Product();
				product.setProductno(resultSet.getInt("productno"));
				product.setProductname(resultSet.getString("productname"));
				product.setimgname(resultSet.getString("imgname"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("price"));
				
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return products;
	}


	@Override
	public List<Product> selectAllpriceasc() {
		List<Product> products = new ArrayList<Product>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(PRODUCT_SELECTALL_PRICE_ASC_SQL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Product product = new Product();
				product.setProductno(resultSet.getInt("productno"));
				product.setProductname(resultSet.getString("productname"));
				product.setimgname(resultSet.getString("imgname"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("price"));
				
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return products;
	}


	@Override
	public Product SelectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<Product> SelectByName(String productname) {
		List<Product>products = new ArrayList<Product>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(PRODUCT_SELECT_BY_NAME);
			preparedStatement.setString(1, '%'+productname+'%');
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Product product = new Product();
				product.setProductno(resultSet.getInt("productno"));
				product.setProductname(resultSet.getString("productname"));
				product.setimgname(resultSet.getString("imgname"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("price"));
				
				products.add(product);
				
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		
		return products;
	}


	@Override
	public boolean productInsert(Product product) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(PRODUCT_INSERT_SQL);
			preparedStatement.setString(1, product.getProductname());			
			preparedStatement.setString(2, product.getimgname());
			preparedStatement.setString(3, product.getDescription());
			preparedStatement.setInt(4, product.getPrice());
			int rowCount= preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}


	@Override
	public boolean productUpdate(Product product) {
	
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection =getConnection();
			preparedStatement =connection.prepareStatement(PRODUCT_UPDATE_SQL);
			preparedStatement.setString(1, product.getProductname());
			preparedStatement.setString(2, product.getimgname());
			preparedStatement.setString(3, product.getDescription());			
			preparedStatement.setInt(4, product.getPrice());			
			preparedStatement.setInt(5, product.getProductno());
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}


	@Override
	public boolean productDelete(int productno) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection=getConnection();
			preparedStatement = connection.prepareStatement(PRODUCT_DELETE_SQL);
			preparedStatement.setInt(1, productno);
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}		
		return result;
	}


	@Override
	public List<Product> selectAll() {
		List<Product> products = new ArrayList<Product>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(PRODUCT_SELECTALL_PRODUCTNO_SQL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Product product = new Product();
				product.setProductno(resultSet.getInt("productno"));
				product.setProductname(resultSet.getString("productname"));
				product.setimgname(resultSet.getString("imgname"));
				product.setDescription(resultSet.getString("description"));
				product.setPrice(resultSet.getInt("price"));
				
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		
		return products;
	}

/*	@Override
	public List<Product> selectAllpricedesc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> selectAllpriceasc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product SelectById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> SelectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}*/

}
