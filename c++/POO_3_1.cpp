#include <iostream>
#include <vector>
using namespace std;

class Persona{
	string apellido, nombre, EsCivil;
protected:	
	int DNI, FechNac, _FechAct;
public:
	void cargardatos(int, int, int, string, string, string);
	void Edad();	
};
void Persona::cargardatos(int nac, int act, int _DNI, string nom, string ape, string Ecivil){
	_FechAct=act;
	FechNac=nac;
	DNI=_DNI;
	nombre=nom;
	apellido=ape;
	EsCivil=Ecivil;
}
void Persona::Edad(){
	cout << "Su edad es de " << _FechAct - FechNac << endl;
}
class Alumno: public Persona{
	int promedio, cantMatApr;
public:
	void MeritoAcademico(int, int);
	int obtenerprom(){
		return promedio;
	}
};
void Alumno::MeritoAcademico(int _prom, int _cantap){
	promedio=_prom;
	cantMatApr=_cantap;
	cout << "El merito academico es de: " << promedio*cantMatApr << endl;
}
class Docente: public Persona{
	int FechIngreso;
public:
	void Antiguedad(int);
};
void Docente::Antiguedad(int feching){
	cout << "La antiguedad es de: " << _FechAct-feching << endl;
}
class Curso{
	string nameclass, profesoracargo;
	vector <Alumno> Alm; 
	int i=0;
public:
	void AgregarAlumno(Alumno);
	void MejorPromedio(){
		int mejorprom=0;
		for(size_t i=0;i<Alm.size();i++) { 
			if(Alm[i].obtenerprom()>mejorprom){
				mejorprom=Alm[i].obtenerprom();
			}
		}
		cout << "El mejor promedio es " << mejorprom;
	}
};
void Curso::AgregarAlumno(Alumno a){
	Alm.push_back(a);
}
int main() {
	
	int _FechNac, DNI, FechAct, Prom, CantAp, FechIng;
	string _apellido, _nombre, _EsCivil, quees;
	
	cout << "Nombre y apellido" << endl;
	cin >> _nombre >> _apellido;
	cout << "DNI, fecha de nacimiernto y estado civil" << endl;
	cin >> DNI >> _FechNac >> _EsCivil;
	cout << "Es alumno o docente" << endl;
	cin >> quees;
	cout << "Fecha actual" << endl;
	cin >> FechAct;
	Curso c;
	if (quees == "alumno"){
		int p=1;
		while(p>0){
			cout << "Promedio y cantidad de materias aprobadas" << endl;
			cin >> Prom >> CantAp;
			Alumno a;
			a.cargardatos(_FechNac, FechAct, DNI, _nombre, _apellido, _EsCivil);
			a.Edad();
			a.MeritoAcademico(Prom, CantAp);
			c.AgregarAlumno(a);
			cout << "Para ingresar un nuevo alumno(1), si no(0) " << endl;
			cin >> p;
		};
		c.MejorPromedio();
		
	}else{
		cout << "Fecha de ingreso" << endl;
		cin >> FechIng;
		Docente b;
		b.cargardatos(_FechNac, FechAct, DNI, _nombre, _apellido, _EsCivil);
		b.Edad();
		b.Antiguedad(FechIng);
	}

	return 0;
}

