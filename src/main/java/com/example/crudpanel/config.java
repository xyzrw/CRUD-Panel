package com.example.crudpanel;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.file.Files;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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
    String imgPath;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int counter=0;
        if(request.getParameter("mName")!=null){
            mName=request.getParameter("mName").replaceAll("'","");
        }

        try{
            if(mName!=null) {

                //First request : get movie ID from the search results
                HttpRequest getRequestId = HttpRequest.newBuilder()
                        .uri(new URI("https://api.themoviedb.org/3/search/movie?api_key=74ece71f29099445edc28c01f029bea5&query="+mName+""))
                        .build();

                HttpClient httpClientId = HttpClient.newHttpClient();
                HttpResponse<String> getResponseId = httpClientId.send(getRequestId, HttpResponse.BodyHandlers.ofString());

                JSONObject jsonId = new JSONObject(getResponseId.body());
                JSONArray jsonArrayId = (JSONArray) jsonId.get("results");
                JSONObject jsonObjectId = (JSONObject) jsonArrayId.get(0);

                //Second request : fetch full movie details using movie ID
                HttpRequest getRequest = HttpRequest.newBuilder()
                        .uri(new URI("https://api.themoviedb.org/3/movie/"+ jsonObjectId.getInt("id") +"?api_key=74ece71f29099445edc28c01f029bea5"))
                        .build();

                HttpClient httpClient = HttpClient.newHttpClient();
                HttpResponse<String> getResponse = httpClient.send(getRequest, HttpResponse.BodyHandlers.ofString());


                JSONObject json = new JSONObject(getResponse.body());

                //First 2 genres from response JSON
                String genreJson =  json.getJSONArray("genres").getJSONObject(0).getString("name")+"/"+
                                    json.getJSONArray("genres").getJSONObject(1).getString("name");

                //Runtime in minutes
                int runtime=json.getInt("runtime");

                //Adding data to a list
                List<String> list=new ArrayList<>();
                list.add(json.getString("title"));
                list.add(json.getString("release_date"));
                list.add(String.valueOf(json.getDouble("vote_average")));
                list.add(json.getString("overview"));
                list.add("https://image.tmdb.org/t/p/original"+json.getString("poster_path"));
                list.add(genreJson);
                list.add(runtime/60+"h "+runtime%60+"m");
                list.add("https://www.youtube.com/embed/");

                //passing the list as a json object to a string variable
                String jsonArrRes= new JSONArray(list).toString();

                //sending the data as json
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

        String mNamePOST=request.getParameter("mName");
        String rDate=request.getParameter("release-date");
        String genre=request.getParameter("genre");
        String rating=request.getParameter("rating");
        String ticketPrice=request.getParameter("ticket-price");
        String duration=request.getParameter("duration");
        String desc=request.getParameter("description").replaceAll("'","");
        String trUrl=request.getParameter("trailer_url");

        System.out.println(desc);

        /* Receive file uploaded to the Servlet from the HTML5 form */
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        String home=System.getProperty("user.home");
        String path= home +File.separator+ "Documents" +File.separator+ "web-img-dir";
        boolean dirFlag=false;
        File dir=new File(path);

        if(!dir.exists()){
            if(dir.mkdir()){
                System.out.println("Folder Created");
                dirFlag=true;
            }
            else{
                dirFlag=false;
                System.out.println("Failed");
            }
        }
        else{
            dirFlag=true;
            System.out.println("Folder already exist");
        }

        if(dirFlag){
            for (Part part : request.getParts()) {
                part.write(path +File.separator+ fileName);
            }
            response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--FILE WRITE SUCCESS--</center></h1>");

            try{
                File imgFile=new File(path +File.separator+ fileName);
                byte[] imgBytes = Files.readAllBytes(imgFile.toPath());

                URL url=new URL("https://www.filestackapi.com/api/store/S3?key=AgQ54ULwmQrOkb0OkzeVYz");
                HttpURLConnection connection=(HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);

                connection.setRequestProperty("Content-Type","image/jpeg");
                connection.setRequestProperty("Content-Length",
                        Integer.toString(imgBytes.length));

                OutputStream out = connection.getOutputStream();
                out.write(imgBytes);
                out.flush();
                out.close();

                int responseCode=connection.getResponseCode();

                if(responseCode==HttpURLConnection.HTTP_OK){
                    System.out.println("Success");
                    BufferedReader br=new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    StringBuilder sb=new StringBuilder();
                    String line;
                    while((line=br.readLine())!=null){
                        sb.append(line).append("\n");
                    }
                    br.close();

                    JSONObject resJson=new JSONObject(sb.toString());
                    System.out.println(resJson.getString("url"));
                    imgPath=resJson.getString("url");
                    response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--FILE SUCCESSFULLY UPLOADED--</center></h1>");
                }
                else{
                    System.out.println("Response Failed");
                    response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RESPONSE FAILED--</center></h1>");
                }
            }

            catch (Exception e)
            {
                throw new RuntimeException(e);
            }

        }
        else{
            response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--WRITE FAILED--</center></h1>");
        }



        if(mNamePOST!=null && rDate!=null && genre!=null && rating!=null && ticketPrice!=null && duration!=null && desc!=null && trUrl!=null && imgPath!=null) {

            System.out.println("passed to sql");

            Connection connection = null;
            Statement statement = null;
            int flag = 0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
                statement = connection.createStatement();
                String qry = "INSERT INTO movies(name,genre,rating,ticket_price,duration,description,img_path,url,release_date) VALUES('" + mNamePOST + "' , '" + genre + "' , '" + rating + "' , '" + ticketPrice + "' , '" + duration + "' , '" + desc + "' ,'" + imgPath + "' , '" + trUrl + "', '" + rDate + "')";
                flag = statement.executeUpdate(qry);
                System.out.println(flag);


            } catch (SQLException e) {
                response.getWriter().println(e);
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            } finally {
                if (flag == 1) {
                    response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--RECORD INSERTED--</center></h1>");
                } else {
                    response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RECORD FAILED TO INSERT--</center></h1>");
                }
            }
        }
        else{
            response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RECORD CONTAINS NULL VALUES--</center></h1>");
        }


    }
}
