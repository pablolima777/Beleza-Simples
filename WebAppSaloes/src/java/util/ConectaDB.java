package util;
/**
 *
 * @author Pablo Lima Pereira                 RGM: 11231100409
 *         Wendreu Bernardo dos Santos        RGM: 11231102590
 *         David da Silva Daniel              RGM: 11231103244 
 *         Guilherme Matos Andrade da Silva   RGM: 11231102539
 */
import java.sql.*;
public class ConectaDB {
    //Métodos
    public static Connection conectar() throws ClassNotFoundException{
        Connection conexao =null;
        try{
            Class.forName("com.mysql.jdbc.Driver");                 
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/salao_beleza","pma","");
            return conexao;
        }catch( SQLException ex){
            System.out.println("error: " + ex);
        }
        return conexao;
    }

    public static Connection getConexao() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
