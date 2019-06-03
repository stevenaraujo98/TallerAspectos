public aspect Login {
    //Aspecto2: El login debe realizarse antes de la transacción
        private static Scanner input = new Scanner(System.in);
        pointcut needLogin():execution(void Bank.make*(..))
                            ||execution(void Bank.my*(..));
        
        before():needLogin(){
            System.out.println("Es necesario ingresar al sistema");
            readConsole("Nombre: ");
            readConsole("Id: ");
        }

        public static  String readConsole(String mensaje){
            System.out.println(mensaje);  
            String inputText;
            inputText = input.nextLine();           
            return inputText;
        }

}