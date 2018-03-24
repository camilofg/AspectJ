package aspectos;

import uniandes.cupi2.impuestosCarro.mundo.Vehiculo;

public aspect Logger {
	pointcut logger(): 
		call(uniandes.cupi2.impuestosCarro.mundo.* * (..));
	
	pointcut valueTax():
		call(public double calcularPago (..));
	/*
	before(): logger(){
		System.out.println("print something " + thisJoinPoint.getSignature());
	}
	*/
	
	after() returning(Vehiculo v): logger(){
		System.out.println("result is" + v.darLinea());
	}
	
	
	after() returning(double d): valueTax(){
		if(d > 2000000) {
			System.out.println("result is " + d);
		}
	}
	//after() throwing(Throwable e): logger(){
	//	System.out.println("error is" + e);
	//}
	
}
