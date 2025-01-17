#include <iostream>
using namespace std;

int ReqMin(int Mat, double Pro, double P);
double Puntaje(int Mat, double Pro, double P, double NotIng);

int main() {
	int N, CantMatAp;
	double Prom, PPT, NotIngles, PuntMax=0, PuntMax1=0;
	string Nom, NomMax, NomMax1;
	
	cout << "Ingrese la cantidad de alumnos a registrar" << endl;
	cin >> N;
	
	for(int i=0;i<N;++i){
		cout << "ingrese en el siguiente orden: el nombre del alumno, la cantidad de materias aprobadas, su promedio, el puntaje que obtuvo su plan de trabajo" << endl; 
		cin >> Nom >> CantMatAp >> Prom >> PPT;
		int x = ReqMin(CantMatAp, Prom, PPT);
		if (x==1){
			cout << "Ingrese la nota de Ingles" << endl;
			cin >>  NotIngles;
			double Punt = Puntaje(CantMatAp,Prom,PPT,NotIngles);
			if (Punt>PuntMax){
				PuntMax=Punt;
				NomMax=Nom;
			} else {
				if(Punt>PuntMax1){
					PuntMax1=Punt;
					NomMax1=Nom;
				}
			}
		}
	}
	cout << "Los dos mejores alumnos son: " << NomMax << " con " << PuntMax << " y " << NomMax1 << " con " << PuntMax1;
	return 0;
}

int ReqMin(int Mat, double Pro, double P){
	if (Mat >= 15){
		if (Pro>=7){
			if (P>=6){
				return (1);
			}
			return (0);
		}
		return (0);
	}
	return (0);
}
double Puntaje(int Mat, double Pro, double P, double NotIng){
	Mat=Mat*2;
	Pro=(Pro-7)*10;
	P=(P-6)*5;
	if (NotIng>=7){
		NotIng=8;
	}
	double suma=Mat+Pro+P+NotIng;
	return (suma);
}
