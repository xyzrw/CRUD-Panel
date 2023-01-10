package com.example.crudpanel;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "config", value = "/config")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)


public class config extends HttpServlet {

    static String mName="";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int counter=0;
        System.out.println("GET RECEIVED");
        if(request.getParameter("mName")!=null){
            mName=request.getParameter("mName").replaceAll("'","");
        }

        System.out.println(mName);
        try{
            if(mName!=null) {
                HttpRequest getRequest = HttpRequest.newBuilder()
                        .uri(new URI("https://api.themoviedb.org/3/search/multi?api_key=74ece71f29099445edc28c01f029bea5&query='"+mName+"'"))
                        .build();

                HttpClient httpClient = HttpClient.newHttpClient();
                HttpResponse<String> getResponse = httpClient.send(getRequest, HttpResponse.BodyHandlers.ofString());

                JSONObject json = new JSONObject(getResponse.body());
                JSONArray jsonArray = (JSONArray) json.get("results");
                JSONObject jsonObject = (JSONObject) jsonArray.get(0);


                List<String> list=new ArrayList<>();
                list.add(jsonObject.getString("title"));
                list.add(jsonObject.getString("release_date"));
                list.add(String.valueOf(jsonObject.getDouble("vote_average")));
                list.add(jsonObject.getString("overview"));
                list.add(jsonObject.getString("poster_path"));

                String jsonArrRes= new JSONArray(list).toString();
                System.out.println(jsonObject.getString("title"));


                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonArrRes);

            }
        }
        catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String mName=request.getParameter("mName");
        String rDate=request.getParameter("rDate");
        String genre=request.getParameter("genre");
        String rating=request.getParameter("rating");
        String ticketPrice=request.getParameter("ticketPrice");
        String duration=request.getParameter("duration");
        String desc=request.getParameter("desc");
        String trUrl=request.getParameter("trUrl");

        /* Receive file uploaded to the Servlet from the HTML5 form */
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        for (Part part : request.getParts()) {
            part.write("C:\\Users\\Sandman\\IdeaProjects\\testSrv\\src\\main\\webapp\\images\\" + fileName);
        }
        response.getWriter().println("The file uploaded successfully.");
        String imgPath="img/" + fileName;

        if(mName!=null && rDate!=null && genre!=null && rating!=null && ticketPrice!=null && duration!=null && desc!=null && trUrl!=null && imgPath!=null){

            Connection connection=null;
            Statement statement=null;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                connection=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
                statement=connection.createStatement();
                String qry="INSERT INTO movies(name,release_date,genre,rating,ticket_price,duration,description,img_path,url) VALUES('"+mName+"' , '"+rDate+"' , '"+genre+"' , '"+rating+"' , '"+ticketPrice+"' , '"+duration+"' , '"+desc+"' ,'"+imgPath+"' , '"+trUrl+"')";
                statement.executeUpdate(qry);
                response.getWriter().println("Record Inserted");
            }
            catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

    }
}
