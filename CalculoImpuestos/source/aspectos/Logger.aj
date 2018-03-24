package aspectos;

import uniandes.cupi2.impuestosCarro.mundo.Vehiculo;
	

public aspect Logger {

	Vehiculo[] cars;
	pointcut logger(): 
		call(uniandes.cupi2.impuestosCarro.mundo.* * (..));
	
	pointcut mailer():
		call(public double calcularPago (..));
	
	pointcut addCar():
		call(private void cargarVehiculos(..));
	
	before(): logger(){
		System.out.println("the method and signarute is: " + thisJoinPoint.getSignature());
	}
		
	after() returning(double d): mailer(){
		if(d > 2000000) {
			System.out.println("send mail");
		}
	}
	
	
	after() throwing(Throwable e): logger(){
		System.out.println("the error is: " + e);
	}
	
	/*
	Vehiculo[] around(String pArchivo): addCar(){
		proceed("data/vehiculos.txt");
		Vehiculo[] carList = cars;
		System.out.println("the error is: " + carList);
		return carList;
	}
	*/
}
