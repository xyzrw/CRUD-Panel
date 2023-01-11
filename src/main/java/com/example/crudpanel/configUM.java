package com.example.crudpanel;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONArray;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "configUM", value = "/configUM")

public class configUM extends HttpServlet {
    String searchName;
    int mID;
    String AddReady;
    String dltRec;
    String searchBlock;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("sName")!=null){
            searchName=request.getParameter("sName").replaceAll("'","");
            searchBlock="1";
        }

        if(request.getParameter("AddReady")!=null){
            AddReady=request.getParameter("AddReady");
        }
        if(request.getParameter("dltRec")!=null){
            dltRec=request.getParameter("dltRec").replaceAll("'","");
        }

        if(dltRec!=null){

            try {
                Connection connection = null;
                Statement statement = null;

                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
                statement = connection.createStatement();

                Integer flag;
                flag=statement.executeUpdate("DELETE FROM upcoming_movies WHERE id = '" +Integer.parseInt(dltRec)+ "' ");

                if(flag!=1){
                    flag=0;
                }
                String flagString=flag.toString();
                System.out.println(flag);
                response.setContentType("text/plain");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(flagString);

                statement.close();
                connection.close();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            finally {
                dltRec=null;
            }
        }

        if(AddReady==null && searchName!=null && searchBlock!=null) {

            searchBlock=null;

            try {
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;

                Class.forName("com.mysql.jdbc.Driver");
                connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb", "root", "");
                statement = connection.createStatement();

                resultSet = statement.executeQuery("SELECT id,name FROM movies WHERE name LIKE '" + "%" + searchName + "%" + "' ");
                resultSet.next();

                List<String> list = new ArrayList<>();

                mID = Integer.parseInt(resultSet.getString(1));
                list.add(resultSet.getString(1));
                list.add(resultSet.getString(2));

                String jsonArrRes = new JSONArray(list).toString();

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonArrRes);
                //response.getWriter().flush();

                resultSet.close();
                statement.close();
                connection.close();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }


        if(mID!=0 && AddReady!=null){
            AddReady=null;
            try{

                Connection connection=null;
                Statement statement=null;

                Class.forName("com.mysql.jdbc.Driver");
                connection=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
                statement=connection.createStatement();

                Integer val;

                val=statement.executeUpdate("INSERT INTO upcoming_movies VALUES('"+mID+"')");

                if(val==1){
                    response.getWriter().println("RECORD ADDED");
                }
                else{
                    response.getWriter().println("FAILED TO ADD");
                }

                statement.close();
                connection.close();

            }
            catch (SQLException e) {
                throw new RuntimeException(e);
            }
            catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{

            Connection connection=null;
            Statement statement=null;
            ResultSet resultSet=null;

            Class.forName("com.mysql.jdbc.Driver");
            connection=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testmdb","root","");
            statement=connection.createStatement();

            resultSet=statement.executeQuery("SELECT movies.id,movies.name,movies.release_date,movies.genre FROM movies INNER JOIN upcoming_movies ON movies.id=upcoming_movies.id");

            List<String> listPost=new ArrayList<>();

            while(resultSet.next()){
                listPost.add(resultSet.getString(1));
                listPost.add(resultSet.getString(2));
                listPost.add(resultSet.getString(3));
                listPost.add(resultSet.getString(4));
            }

            String jsonArrRes= new JSONArray(listPost).toString();

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
    }
}
