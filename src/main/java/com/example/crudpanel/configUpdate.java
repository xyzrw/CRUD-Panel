package com.example.crudpanel;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "configUpdate", value = "/configUpdate")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class configUpdate extends HttpServlet {
    String mName="";
    int mID;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("mName2")!=null){
            mName=request.getParameter("mName2").replaceAll("'","");
        }

        System.out.println(mName);

        try{

            Connection connection=null;
            Statement statement=null;
            ResultSet resultSet=null;

            Class.forName("com.mysql.jdbc.Driver");
            connection=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            statement=connection.createStatement();

            String qry="SELECT * FROM movies WHERE name LIKE '"+"%"+mName+"%"+"' ";
            resultSet=statement.executeQuery("SELECT * FROM movies WHERE name LIKE '"+"%"+mName+"%"+"' ");
            resultSet.next();

            List<String> list=new ArrayList<>();

            mID=Integer.parseInt(resultSet.getString(1));
            list.add(resultSet.getString(2));
            list.add(resultSet.getString(4));
            list.add(resultSet.getString(5));
            list.add(resultSet.getString(6));
            list.add(resultSet.getString(7));
            list.add(resultSet.getString(8));
            list.add(resultSet.getString(9));
            list.add(resultSet.getString(10));
            list.add(resultSet.getString(11));

            String jsonArrRes= new JSONArray(list).toString();

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArrRes);


            }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }
            catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }


//                List<String> list=new ArrayList<>();
//                list.add(jsonObject.getString("title"));
//                list.add(jsonObject.getString("release_date"));
//                list.add(String.valueOf(jsonObject.getDouble("vote_average")));
//                list.add(jsonObject.getString("overview"));
//                list.add("https://image.tmdb.org/t/p/original"+jsonObject.getString("poster_path"));

//                String jsonArrRes= new JSONArray(list).toString();
//
//                response.setContentType("application/json");
//                response.setCharacterEncoding("UTF-8");
//                response.getWriter().write(jsonArrRes);

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mNamePOST=request.getParameter("mName2");
        String rDate=request.getParameter("release-date2");
        String genre=request.getParameter("genre2");
        String rating=request.getParameter("rating2");
        String ticketPrice=request.getParameter("ticket-price2");
        String duration=request.getParameter("duration2");
        String desc=request.getParameter("description2");
        String trUrl=request.getParameter("trailer_url2");

        /* Receive file uploaded to the Servlet from the HTML5 form */
        Part filePart = request.getPart("file2");
        String fileName = filePart.getSubmittedFileName();
        for (Part part : request.getParts()) {
            part.write("C:\\Users\\Sandman\\IdeaProjects\\testSrv\\src\\main\\webapp\\images\\" + fileName);
        }
        response.getWriter().println("The file uploaded successfully.");
        String imgPath="img/" + fileName;

        System.out.println(mID);

        if(mNamePOST!=null && rDate!=null && genre!=null && rating!=null && ticketPrice!=null && duration!=null && desc!=null && trUrl!=null){

            Connection connection=null;
            Statement statement=null;

            try{
                Class.forName("com.mysql.jdbc.Driver");
                connection=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
                statement=connection.createStatement();
                String qry="UPDATE movies SET name='"+mNamePOST+"',genre='"+genre+"',release_date='"+rDate+"',rating='"+rating+"'," +
                        "ticket_price='"+ticketPrice+"',duration='"+duration+"',description='"+desc+"',img_path='"+imgPath+"',url='"+trUrl+"',release_date='"+rDate+"'" +
                        "WHERE id='"+mID+"'";
                statement.executeUpdate(qry);
                response.getWriter().println("Record Updated");
            } catch (Exception e) {
                System.out.println(e);
                throw new RuntimeException(e);
            }
        }

    }
}
