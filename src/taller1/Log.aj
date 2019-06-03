package taller1;


public aspect Log {
    
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //Aspecto1: Deben hacer los puntos de cortes (pointcut) para crear un log con los tipos de transacciones realizadas.
    
    pointcut transaction():execution(void Bank.make*(..));
    pointcut money():execution(void Bank.my*(..));
    pointcut user():execution(void Bank.create*(..));
    
    //Advices para escribir en el documento luego de: realizar la transacción, retirar dinero o crear un usuario
    after() : transaction(){
        writeFile("Transaccion realizada "+cal.getTime());
    }
    after() : money(){
        writeFile("Dinero retirado "+cal.getTime());
    }
    after() : user(){
        writeFile("Usuario creado "+cal.getTime());
    }

    public void writeFile(String mensaje){
        try {
            String content = mensaje;
            // if file doesnt exists, then create it
            if (!file.exists()) {
                file.createNewFile();
            }

            FileWriter fw = new FileWriter(file.getAbsoluteFile());
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(content);
            bw.close();

            System.out.println("Escritura exitosa");

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}