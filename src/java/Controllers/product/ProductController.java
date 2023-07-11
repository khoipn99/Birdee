/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.product;

import Controllers.ReloadController;
import DAL.CollectionDAO;
import DAL.ProductDAO;
import Model.Collection;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author dell
 */
public class ProductController extends ReloadController {

    int collectionID = -1;
    int categoryID = -1;
    int tagID = -1;
    public static String header = null;
    private int recordsPerPage = 5;
    double minPrice = 0;
    double maxPrice = 1000000000;
    String textSearch = "";
    int sortOption = -1;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        int page = 1;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(
                    request.getParameter("page"));
        }

        textSearch = (String) request.getSession().getAttribute("textSearch");
        if (textSearch == null) {
            textSearch = "";
        }

        if (request.getSession().getAttribute("categoryID") != null) {
            categoryID = (int) request.getSession().getAttribute("categoryID");
        }

        if (request.getSession().getAttribute("tagID") != null) {
            tagID = (int) request.getSession().getAttribute("tagID");
        }

        if (request.getSession().getAttribute("collectionID") != null) {
            collectionID = (int) request.getSession().getAttribute("collectionID");
        }

        ProductDAO pDao = new ProductDAO();

        ArrayList<Product> products = pDao.getAllProductParent((page - 1) * recordsPerPage,
                recordsPerPage, collectionID, categoryID, tagID, textSearch,
                minPrice, maxPrice, true, sortOption);

        int noOfRecords = pDao.getNoOfRecordsParent(collectionID, categoryID, tagID, textSearch, minPrice, maxPrice, true);

        int noOfPages = (int) Math.ceil((double) noOfRecords
                / recordsPerPage);

        //get all collection
        CollectionDAO clDao = new CollectionDAO();
        ArrayList<Collection> collections = clDao.getAllCollection(true);

        request.getSession().setAttribute("minPrice", minPrice);
        request.getSession().setAttribute("maxPrice", maxPrice);

        request.setAttribute("noOfPages", noOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("noOfRecords", noOfRecords);
        request.setAttribute("sortOption", sortOption);

        request.setAttribute("header", header);
        request.setAttribute("products", products);
        request.setAttribute("collections", collections);
        request.setAttribute("textSearch", textSearch);
        request.getRequestDispatcher("views/Product/Products.jsp").forward(request, response);

    }
//
//

    public static void main(String[] args) {
        ProductDAO pDao = new ProductDAO();
        ArrayList<Product> products = pDao.getAllProductParent(0,
                5, -1, -1, -1, "", 0.0, 250, true, -1);
        int noOfRecords = pDao.getNoOfRecordsParent(-1, 3, -1, "", 0, 250, true);
        System.out.println(products.size());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "searchByPrice":
                    minPrice = Double.parseDouble(request.getParameter("minPrice"));
                    maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
                    doGet(request, response);
                    break;
                case "sort":
                    sortOption = Integer.parseInt(request.getParameter("sortOption"));
                    doGet(request, response);
                    break;
            }
        }
    }

    public void searchCollection(int collectionID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.collectionID = collectionID;
        request.getSession().setAttribute("categoryID", null);
        request.getSession().setAttribute("tagID", null);
        request.getSession().setAttribute("collectionID", collectionID);
        request.getSession().setAttribute("textSearch", null);
        doGet(request, response);
    }

    public void searchCategory(int categoryID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.categoryID = categoryID;
        request.getSession().setAttribute("categoryID", categoryID);
        request.getSession().setAttribute("tagID", null);
        request.getSession().setAttribute("collectionID", null);
        request.getSession().setAttribute("textSearch", null);
        doGet(request, response);
    }

    public void searchTag(int tagID, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.tagID = tagID;
        request.getSession().setAttribute("categoryID", null);
        request.getSession().setAttribute("tagID", tagID);
        request.getSession().setAttribute("collectionID", null);
        request.getSession().setAttribute("textSearch", null);
        doGet(request, response);
    }

    public void searchByText(String textSearch, HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.textSearch = textSearch;
        request.getSession().setAttribute("categoryID", null);
        request.getSession().setAttribute("tagID", null);
        request.getSession().setAttribute("collectionID", null);
        request.getSession().setAttribute("textSearch", textSearch);
        doGet(request, response);
    }

    void listAllProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().setAttribute("categoryID", null);
        request.getSession().setAttribute("tagID", null);
        request.getSession().setAttribute("collectionID", null);
        request.getSession().setAttribute("textSearch", null);
        collectionID = -1;
        categoryID = -1;
        tagID = -1;
        header = null;
        recordsPerPage = 5;
        minPrice = 0;
        maxPrice = 1000000000;
        textSearch = "";
        sortOption = -1;
        doGet(request, response);
    }
}
