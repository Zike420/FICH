#include <iostream>
#include <matrix>
using namespace std;

int main() {
	matrix<int>m(12,10);
	int pais, mes, monto;
	cout << "pais: "<< endl;
	cin >> pais; 
	while (pais != -1) {
		cout << "mes: "<< endl;
		cin >> mes; 
		cout << "monto: "<< endl;
		cin >> monto;
		m[mes-1][pais-1]+=monto;
		cout << "pais: "<< endl;
		cin >> pais;
	}
	cout << "pais a calcular su primer trimeste: "<< endl;
	cin >> pais;
	int a = pais;
	int totaltrimestre;
	for(int mes=0;mes<3;++mes) { 
		totaltrimestre += m[mes][pais];
	}
	int menorseis=99999999, seismeses=0, fila = 0;
	for(int pais=0;pais<10;++pais) { 
		for(int mes=6;mes<12;++mes) { 
			seismeses+=m[mes][pais];
		}	
		if (seismeses<menorseis){
			menorseis=seismeses;
			fila=pais;
		}
	}
	cout << "Total del primer trimestre de " << a << " es: " <<  totaltrimestre << endl;
	cout << "La fila que menor ventas tuvo el segundo semestre es " << fila << endl;
	
	return 0;
}

