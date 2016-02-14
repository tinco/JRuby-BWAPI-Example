public class Test {

    public static void main(String[] args) {
       System.out.println(System.getProperty("user.dir")); 
       System.load(System.getProperty("user.dir") + "\\bwapi_bridge2_4.dll");
    }
}
