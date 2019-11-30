/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecpg.hotel;
    
import java.util.ArrayList;
import java.util.Date;

public class Period {
    private long id;
    private String client_name;
    private String room;
    private Date check_in;
    private Date check_out;
    private double price;

    public Period(long id, String client_name, String room, Date check_in) {
        this.id = id;
        this.client_name = client_name;
        this.room = room;
        this.check_in = check_in;
    }

    public Period(long id, String client_name, String room, Date check_in, Date check_out, double price) {
        this.id = id;
        this.client_name = client_name;
        this.room = room;
        this.check_in = check_in;
        this.check_out = check_out;
        this.price = price;
    }


    
        public static Period getPeriod(long id) throws Exception{
        String SQL = "SELECT * FROM HOST_PERIODS WHERE ID = ?";
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{id});
        if(list.isEmpty()){
            return null;
        }else{
            Object row[] = list.get(0);
            Period p = new Period (
                    (long) row[0]
                    , (String) row[1]
                    , (String) row[2]
                    , (Date) row[3]);
                   
                    
                    return p;   
        }
       
        }
        
  /*public static ArrayList<Period> getHistory(String date, String plate) throws Exception{
      String SQL = "SELECT * FROM PARKING_PERIODS WHERE END_PERIOD IS NOT NULL ORDER BY BEGIN_PERIOD";
        ArrayList<Period> periods = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
       /* ArrayList<Object[]> list = null;
        if (date == null && plate != null){
            String SQL = "SELECT * FROM PARKING_PERIODS ";
            SQL += " WHERE plate = ?";
            SQL += " ORDER BY BEGIN_PERIOD";
            list = DatabaseConnector.getQuery(SQL, new Object[]{plate});
            
        }else if (date != null && plate == null){
            String SQL = "SELECT * FROM PARKING_PERIODS ";
            SQL += " WHERE VARCHAR(DATE(BEGIN_PERIOD)) = ?";
            SQL += " ORDER BY BEGIN_PERIOD";
            list = DatabaseConnector.getQuery(SQL, new Object[]{date});      
         }else if (date != null && plate != null){
            String SQL = "SELECT * FROM PARKING_PERIODS ";
            SQL += " WHERE VARCHAR(DATE(BEGIN_PERIOD)) = ? AND plate= ?";
            SQL += " ORDER BY BEGIN_PERIOD";
            list = DatabaseConnector.getQuery(SQL, new Object[]{date, plate});   
        }else{
             String SQL = "SELECT * FROM PARKING_PERIODS ";
            SQL += " ORDER BY BEGIN_PERIOD";
            list = DatabaseConnector.getQuery(SQL, new Object[]{});
        }

       // ArrayList<Period> periods = new ArrayList<>();
       for (int i = 0; i<list.size(); i++) {
            Object row[] = list.get(i);
            Period p = new Period (
                    (long) row[0]
                    , (String) row[1]
                    , (String) row[2]
                    , (Date) row[3]
                    , (Date) row[4]
                    , (Double) row[5]);
                   
                    periods.add(p);
        }     
            return periods;
        }
*/
        public static ArrayList<Period> getPeriods() throws Exception{
        String SQL = "SELECT * FROM HOST_PERIODS WHERE CHECK_OUT IS NULL ORDER BY CHECK_in";
        ArrayList<Period> periods = new ArrayList<>();
        ArrayList<Object[]> list = DatabaseConnector.getQuery(SQL, new Object[]{});
       for (int i = 0; i<list.size(); i++) {
            Object row[] = list.get(i);
            Period p = new Period (
                    (long) row[0]
                    , (String) row[1]
                    , (String) row[2]
                    , (Date) row[3]);
                   
                    periods.add(p);
        }     
            return periods;
        }
     
      public static void addPeriod(String client_name, String room)throws Exception{
          String SQL = "INSERT INTO HOST_PERIODS VALUES("
               + "default"
               + ", ?"
               + ", ?"
               + ", ?"
               + ", null"
               + ", null"
               + ")";
          
          Object parameters[] = {client_name, room, new Date()};
          DatabaseConnector.execute(SQL, parameters);      
      }
      
        public static void finishPeriod(long id, double price)throws Exception{
          String SQL = "UPDATE HOST_PERIODS "
               + " SET CHECK_OUT = ? "
               + ", PRICE = ? "
               + " WHERE ID = ?";
                 
          Object parameters[] = {new Date(), price, id};
          DatabaseConnector.execute(SQL, parameters);      
      }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getClient_name() {
        return client_name;
    }

    public void setClient_name(String client_name) {
        this.client_name = client_name;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public Date getCheck_in() {
        return check_in;
    }

    public void setCheck_in(Date check_in) {
        this.check_in = check_in;
    }

    public Date getCheck_out() {
        return check_out;
    }

    public void setCheck_out(Date check_out) {
        this.check_out = check_out;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
