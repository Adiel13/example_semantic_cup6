package udv.compi;

import java.io.StringReader;

/**
 * Hello world!
 *
 */
public class app 
{
    public static void main( String[] args ) throws Exception
    {
        System.out.println( "Hello World Semantic 6!" );
        
        String entrada = "int var1 = 10 + \"holamundo\";";
        Scanner lex = new Scanner(new StringReader(entrada));
        Parser sintax = new Parser(lex);
        sintax.parse();

        String entrada2 = "String var2 = 10 + \"holamundo\";";
        Scanner lex2 = new Scanner(new StringReader(entrada2));
        Parser sintax2 = new Parser(lex2);
        sintax2.parse();
        
        String entrada3 = "double var3 = 10 + \"holamundo\";";
        Scanner lex3 = new Scanner(new StringReader(entrada3));
        Parser sintax3 = new Parser(lex3);
        sintax3.parse();

        String entrada4 = "int var4 = 10 + 15.2;";
        Scanner lex4 = new Scanner(new StringReader(entrada4));
        Parser sintax4 = new Parser(lex4);
        sintax4.parse();
        
        
        String entrada5 = "double var5 = 10 + 15.2;";
        Scanner lex5 = new Scanner(new StringReader(entrada5));
        Parser sintax5 = new Parser(lex5);
        sintax5.parse();
        
    }
}
