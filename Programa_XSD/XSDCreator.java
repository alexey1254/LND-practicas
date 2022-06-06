package LND.Programa_XSD;
import java.util.Scanner;
public class XSDCreator {
    Scanner tcl=new Scanner(System.in);
    private String nombre;
    private String complejo;
    private String simple;
    private String type;
    private String min,max;
    private int numCont;
    private String atributo[];
    private String tipo[];

    public XSDCreator(){
        System.out.println("Nombre del elemento: ");
        this.nombre=tcl.nextLine();
        System.out.println("¿Cuanto es su minimo?: (0-1)");
        this.min=tcl.nextLine();
        System.out.println("¿Cuanto es su máximo?: (1-unbounded)");
        this.max=tcl.nextLine();
        System.out.println("¿Es complejo?: (S/N)");
        this.complejo=tcl.nextLine();
        switch(this.complejo){
            case "S":
            System.out.println("¿Tiene contenido simple? : (S/N)");
            this.simple=tcl.nextLine();
            switch(this.simple){
                case "S":
                System.out.println("¿Cuantos atributos son?:");
                this.numCont=tcl.nextInt();
                    this.atributo=new String[numCont];
                    this.tipo=new String[numCont];
                    for(int i=0;i<numCont;i++){
                        for(int j=0;j<numCont;j++){
                            System.out.println("Introduce el atributo número "+i);
                            this.atributo[i]=tcl.nextLine();
                            System.out.println("Introduce el tipo del atributo número "+j);
                            this.tipo[j]=tcl.nextLine();

                        }
                    }
                    System.out.println("Resultado:");
                    System.out.println(" ");
                    System.out.println("<xs:element name="+nombre+" minOccurs="+min+" maxOccurs="+max+" >");
                    System.out.println("    <xs:complexType>");
                    System.out.println("        <xs:sequence>");
                    System.out.println("                <xs:complexType>");
                    System.out.println("                    <xs:sequence>");
                    for(int i=0;i<numCont;i++){
                        for(int j=0;j<numCont;j++){
                    System.out.println("                        <xs:element name="+this.atributo[i]+" type= xs:"+this.tipo[j]+" />");
                            
                        }
                    }
                    System.out.println("                    </xs:sequence>");
                    System.out.println("                </xs:complexType>");
                    System.out.println("            </xs:element>");
                    System.out.println("        </xs:sequence>");
                    System.out.println("    </xs:complexType>");
                    System.out.println("</xs:element>");
                case "N":
                System.out.println("Resultado:");
                System.out.println(" ");
                System.out.println("<xs:element name="+nombre+" minOccurs="+min+" maxOccurs="+max+" >");
                System.out.println("    <xs:complexType>");
                System.out.println("        <xs:sequence>");
                System.out.println("            <xs:element name="+nombre+" minOccurs= maxOccurs=>");
                System.out.println("            </xs:element>");
                System.out.println("        </xs:sequence>");
                System.out.println("    </xs:complexType>");
                System.out.println("</xs:element>");
                break;
                default:
                System.out.println("No es correcto.");
            }
            case "N":
            simple="<xs:element name="+this.nombre+" type="+this.type+"/>";
            System.out.printf(simple);
            break;
            case "n":
            System.out.println("¿Que tipo de dato es el elemento? :");
            this.type=tcl.nextLine();
            simple="<xs:element name="+this.nombre+" type="+this.type+"/>";
            System.out.println("Resultado:");
            System.out.println(simple);
            break;
            default:
            System.out.println("No es correcto.");
        }
    }
    public static void main(String[] args) {
        try (Scanner tcl = new Scanner(System.in)) {
            System.out.println("Bienvenido al XSDCreator VER 0.0.1");
            System.out.println("A continuación indique los atributos de su XSD:");

            new XSDCreator();
        }

    }
    
}
