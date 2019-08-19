package product.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import page.PageManager;
import page.PageSQL;
import product.dao.ProductDAO;
import product.dao.ProductDAOImpel;
import product.model.Product;


@WebServlet(name="ProductController", urlPatterns = {"/product_list_m","/product_list_price_desc_m","/product_list_price_asc_m","/product_search_m",
		"/product_detail_m","/product_list_manager_m","/product_update_m","/product_save_m","/product_input_m","/product_delete_m","/product_detail_cust_m","/product_req_list"})
@MultipartConfig
public class ProductController extends HttpServlet{

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req,resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		process(req,resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		String uri = req.getRequestURI();//주소값이 옴 주소값마다 처리할것을 코드할 것
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/"); //마지막 슬러시의 인덱스를 달라는 것
		String action = uri.substring(lastIndex+1);//7에다가 8인거부터 끝까지 달라는거
		
		req.setCharacterEncoding("utf-8");
		
		
		if(action.equals("product_list_m")) {
			
			ProductDAO dao = new ProductDAOImpel();			
			List<Product> products = dao.selectAll();
			for(Product p:products) {
				System.out.println(p);
			}
			
			req.setAttribute("products", products);
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productList.jsp");
			rd.forward(req, resp);
			
		}else if (action.equals("product_list_price_desc_m")){
			
			ProductDAO dao = new ProductDAOImpel();			
			List<Product> products = dao.selectAllpricedesc();
			for(Product p:products) {
				System.out.println(p);
			}
			
			req.setAttribute("products", products);
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productListPriceDesc.jsp");
			rd.forward(req, resp);
			
			
		}else if(action.equals("product_list_price_asc_m")) {
			ProductDAO dao = new ProductDAOImpel();			
			List<Product> products = dao.selectAllpriceasc();
			for(Product p:products) {
				System.out.println(p);
			}
			
			req.setAttribute("products", products);
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productListPriceAsc.jsp");
			rd.forward(req, resp);
			
			
		}else if(action.equals("product_search_m")) {
			String productname = req.getParameter("productname");
			
			ProductDAO dao = new ProductDAOImpel();
			List<Product> products = dao.SelectByName(productname);
			
			req.setAttribute("products", products);
			
			
			for(Product p : products) {
				System.out.println(p);
			}
				
					
			RequestDispatcher rd = req.getRequestDispatcher("/product/productList.jsp");
			rd.forward(req, resp);
			
			
		}else if(action.equals("product_detail_m")) {
			int productno = Integer.parseInt(req.getParameter("productno"));
			ProductDAO dao = new ProductDAOImpel();
			Product product =dao.selectByproductno(productno);
			System.out.println(product);
			
			req.setAttribute("product", product);
			
			RequestDispatcher rd= req.getRequestDispatcher("/product/productdetailForManager.jsp");
			rd.forward(req, resp);
			
			
			
		}else if (action.equals("product_list_manager_m")) {
			ProductDAO dao = new ProductDAOImpel();			
			List<Product> products = dao.selectAll();
			for(Product p:products) {
				System.out.println(p);
			}
			
			req.setAttribute("products", products);
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productListForManager.jsp");
			rd.forward(req, resp);
			
			
		}else if(action.equals("product_save_m")) {
			req.setCharacterEncoding("utf-8");
			
			Part part = req.getPart("filename");

			/* get NewfileName */
			String fileName = getFilename(part);
			System.out.println(fileName);
			
			/* file save */
			if (fileName != null && !fileName.isEmpty()) {
				part.write(getServletContext().getRealPath("/WEB-INF") + "/" + fileName);
			}
	
			ProductDAO dao = new ProductDAOImpel();
			Product product = new Product();
			product.setProductname(req.getParameter("productname"));
			product.setimgname(fileName);
			product.setDescription(req.getParameter("description"));
			product.setPrice(Integer.parseInt(req.getParameter("price")));

			boolean result = dao.productInsert(product);
			
			System.out.println(result);

			RequestDispatcher rd = req.getRequestDispatcher("product_list_manager_m");
			rd.forward(req, resp);
			
		}else if(action.equals("product_input_m")) {
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productInsert.jsp");
			rd.forward(req, resp);
		}else if(action.equals("product_update_m")) {
			Product product = new  Product();
			
			product.setProductno(Integer.parseInt(req.getParameter("productno")));
			product.setProductname(req.getParameter("productname"));
			product.setimgname(req.getParameter("imgname"));
			product.setDescription(req.getParameter("description"));
			product.setPrice(Integer.parseInt(req.getParameter("price")));
			
			ProductDAO dao = new ProductDAOImpel();
			boolean result = dao.productUpdate(product);
			
			System.out.println(result);
			
			RequestDispatcher rd = req.getRequestDispatcher("product_list_manager_m");
			rd.forward(req, resp);
					
		}else if(action.equals("product_delete_m")) {
			int productno = Integer.parseInt(req.getParameter("productno"));
			ProductDAO dao = new ProductDAOImpel();
			boolean result = dao.productDelete(productno);
			System.out.println(result);
			
			RequestDispatcher rd = req.getRequestDispatcher("/product_list_manager_m");
			rd.forward(req, resp);
			
		}else if(action.equals("product_detail_cust_m")) {
			int productno = Integer.parseInt(req.getParameter("productno"));
			ProductDAO dao = new ProductDAOImpel();
			Product product =dao.selectByproductno(productno);
			System.out.println(product);
			
			req.setAttribute("product", product);
			
			RequestDispatcher rd= req.getRequestDispatcher("/product/productdetail.jsp");
			rd.forward(req, resp);		
		}else if(action.equals("product_req_list")) {
			int requestPage = Integer.parseInt(req.getParameter("reqPage"));
			PageManager pm= new PageManager(requestPage);
			
			ProductDAO dao = new ProductDAOImpel();
			List<Product> products = dao.selectAll(pm.getPageRowResult().getRowStartNumber(), pm.getPageRowResult().getRowEndNumber());
			req.setAttribute("products", products);
			
			
			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.PRODUCT_SELECT_ALL_COUNT));
			
			RequestDispatcher rd = req.getRequestDispatcher("/product/productList.jsp");
			rd.forward(req, resp);
			
			
		}
		
	}
	

	private String getFilename(Part part) {

		String contentDispositionHeader = part.getHeader("content-disposition");

		String[] elements = contentDispositionHeader.split(";");

		for (String element : elements) {
			if (element.trim().startsWith("filename")) {

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmSSS");
				Date date = new Date();

				String filename = sdf.format(date);
				String extension = element.substring(element.indexOf('.'), element.length() - 1).trim();

				return filename + extension;
			}
		}
		return null;
	}
}
