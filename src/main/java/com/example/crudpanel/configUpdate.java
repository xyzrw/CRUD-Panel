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
    String imgPath;

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

        String mNamePOST = request.getParameter("mName2");
        String rDate = request.getParameter("release-date2");
        String genre = request.getParameter("genre2");
        String rating = request.getParameter("rating2");
        String ticketPrice = request.getParameter("ticket-price2");
        String duration = request.getParameter("duration2");
        String desc = request.getParameter("description2");
        String trUrl = request.getParameter("trailer_url2");


        Part filePart = request.getPart("file2");
        String fileName = filePart.getSubmittedFileName();

        String home = System.getProperty("user.home");
        String path = home + File.separator + "Documents" + File.separator + "web-img-dir";
        boolean dirFlag = false;
        File dir = new File(path);

        if (!dir.exists()) {
            if (dir.mkdir()) {
                System.out.println("Folder Created");
                dirFlag = true;
            } else {
                dirFlag = false;
                System.out.println("Failed");
            }
        } else {
            dirFlag = true;
            System.out.println("Folder already exist");
        }

        if (dirFlag) {
            for (Part part : request.getParts()) {
                part.write(path + File.separator + fileName);
            }
            response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--FILE WRITE SUCCESS--</center></h1>");

            try {
                File imgFile = new File(path + File.separator + fileName);
                byte[] imgBytes = Files.readAllBytes(imgFile.toPath());

                URL url = new URL("https://www.filestackapi.com/api/store/S3?key=AgQ54ULwmQrOkb0OkzeVYz");
                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);

                connection.setRequestProperty("Content-Type", "image/jpeg");
                connection.setRequestProperty("Content-Length",
                        Integer.toString(imgBytes.length));

                OutputStream out = connection.getOutputStream();
                out.write(imgBytes);
                out.flush();
                out.close();

                int responseCode = connection.getResponseCode();

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    System.out.println("Success");
                    BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        sb.append(line).append("\n");
                    }
                    br.close();

                    JSONObject resJson = new JSONObject(sb.toString());
                    System.out.println(resJson.getString("url"));
                    imgPath = resJson.getString("url");
                    response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--FILE SUCCESSFULLY UPLOADED--</center></h1>");
                } else {
                    System.out.println("Response Failed");
                    response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RESPONSE FAILED--</center></h1>");
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        } else {
            response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--WRITE FAILED--</center></h1>");
        }


        int flag = 0;
        if (mNamePOST != null && rDate != null && genre != null && rating != null && ticketPrice != null && duration != null && desc != null && trUrl != null && imgPath != null) {

            Connection connection = null;
            Statement statement = null;


            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
                statement = connection.createStatement();
                String qry = "UPDATE movies SET name='" + mNamePOST + "',genre='" + genre + "',release_date='" + rDate + "',rating='" + rating + "'," +
                        "ticket_price='" + ticketPrice + "',duration='" + duration + "',description='" + desc + "',img_path='" + imgPath + "',url='" + trUrl + "',release_date='" + rDate + "'" +
                        "WHERE id='" + mID + "'";
                flag = statement.executeUpdate(qry);
            } catch (Exception e) {
                throw new RuntimeException(e);
            } finally {
                if (flag == 1) {
                    response.getWriter().println("<h1 style='color:green;text-align=center;font-family:Arial;'><center>--RECORD UPDATED--</center></h1>");
                } else {
                    response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RECORD FAILED TO UPDATE--</center></h1>");
                }
            }

        }
        else{
            response.getWriter().println("<h1 style='color:red;text-align=center;font-family:Arial;'><center>--RECORD CONTAINS NULL VALUES--</center></h1>");
        }
    }
}
