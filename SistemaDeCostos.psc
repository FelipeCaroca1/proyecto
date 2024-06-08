Algoritmo SistemaDeCostos
	//Definicion de variables para almacenar las diferentes operaciones que debe realizar el Algoritmo 
	Definir NumProductos, i Como Entero
	Dimension Precios[100], PorcentajeDscto[100], Cantidades[100], Peso[100], Destino[100]
	Definir Subtotal, TotalIVA, DescuentoCupon, CostoEnvio, CostoFinal, IVA, DsctoCantidad, DescuentoTotal, Descuento Como Real
	Definir CuponDscto como cadena
	//Leer numero de productos
	Escribir "Ingrese el número de variedad de productos"
	Leer NumProductos
	
	//Datos de entrada
	Para i=1 Hasta NumProductos con paso 1 Hacer
		Escribir "ingrese el precio original del producto ", i, ":"
		leer Precios[i]
		Escribir "¿Tiene algún cupon de descuento", i, "?(si/no)"
		Leer CuponDscto
		si CuponDscto= "si" Entonces
			Escribir "Ingrese el porcentaje del descuento (solo en numeros)"
			leer PorcentajeDscto[i]
		sino 
			PorcentajeDscto[i]=0
		FinSi
		Escribir "ingrese la cantidad de productos ", i, ":"
		leer Cantidades[i]
		Escribir "ingrese el destino del envio (santiago o region) del producto ", i, ":"
		Leer Destino[i]
		Escribir "ingrese el peso del paquete en kg del producto ", i,":"
		leer Peso[i]
	FinPara
	
	//Calculo costos para cada producto
	Para i=1 Hasta NumProductos con paso 1 Hacer
		//calcular Subtotal
		Subtotal= Precios[i] * Cantidades[i]
		//Subtotal con descuentos si aplica
		DescuentoCupon=0
		si PorcentajeDscto[i] > 0 Entonces
			DescuentoCupon= Subtotal * (PorcentajeDscto[i] / 100)
			Subtotal= Subtotal - DescuentoCupon
		FinSi
		//Aplicar descuentos por cantidad si corresponde
		DsctoCantidad = 0
		Descuento = 0;
		si  Cantidades[i] > 1 y Cantidades[i] <= 9 Entonces //descuento 10%
			Descuento = 0.1
		FinSi
		si  Cantidades[i] > 9 y Cantidades[i] <= 19 Entonces//desuento 20%
			Descuento = 0.2
		FinSi
		si  Cantidades[i] > 19 y Cantidades[1] <= 29 Entonces //descuento 30%
			Descuento = 0.3
		FinSi
		DsctoCantidad = Subtotal * Descuento //Descuento de un 30%
		Subtotal= Subtotal - DsctoCantidad
		Escribir "Se ha aplicado un ", Descuento * 100, "% de descuento por los ", Cantidades[1], " productos"
		
		//Aplicar IVA
		TotalIVA = Subtotal * 0.19
		Subtotal = Subtotal + TotalIVA
		//Calcular CostoEnvio
		si Destino[i] = "santiago" Entonces
			si Peso[i] <= 1 Entonces
				CostoEnvio = 3
			FinSi
			Si Peso[i]  <= 5 Entonces
				CostoEnvio = 8
			FinSi
			si peso[i] > 5 Entonces
				CostoEnvio = 15
			FinSi
		SiNo
			si Destino[i] = "region" Entonces
				si Peso[i] <= 1 Entonces
					CostoEnvio = 10
				FinSi
				si Peso[i] <= 5 Entonces
					CostoEnvio = 25
				FinSi
				si Peso[i] > 5 Entonces
					CostoEnvio = 50
				FinSi
			FinSi
		fin si
		//Calcular CostoFinal 
		CostoFinal = Subtotal + CostoEnvio
		//Descuento Total
		DescuentoTotal= DescuentoCupon + DsctoCantidad
		//Desglose de Costos
		Escribir "Desglose de costos para el producto ", i, ":"
		Escribir "Precio original: ", Precios[i] * Cantidades[i]
		Escribir "Descuento por cupon: ", DescuentoCupon
		Escribir "Descuento por cantidad: ", DsctoCantidad
		Escribir "Descuento aplicado: ", DescuentoTotal
		Escribir "IVA aplicado (19%): ", TotalIVA
		Escribir "Costo de envio: ", CostoEnvio
		Escribir "Costo final: ", CostoFinal
	Fin Para
FinAlgoritmo
