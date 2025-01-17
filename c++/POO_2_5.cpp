#include <iostream>
#include <vector>
using namespace std;

struct Alumno{
	string nombre;
	float nota;
};

class Curso{
	string Materia;
	int Tam;
	vector<Alumno> v;
public:
	Curso(string _Mat, int _Tam){
		Materia=_Mat;
		Tam=_Tam;
	}
	void AgregarAlumno(Alumno alm){
		v.push_back(alm);
	}
	int Prom(){
		int _prom=0;
		for(size_t i=0;i<v.size();i++) {
			_prom=v[i].nota+_prom;
		}
		return _prom/Tam;
	}
	void Calfi(){
		int mejornota=0, a=0;
		for(size_t i=0;i<v.size();i++) {
			if (v[i].nota>mejornota){
				mejornota=v[i].nota;
				a=i;
			}
		}
		cout << "El alumno con la mejor nota fue " << v[a].nombre << " con una nota de " << v[a].nota << endl;
	}
	~Curso(){
		cout << "Se destruyo una clase" << endl;
	}
};

int main() {
	int n, nota_;
	string clase, name_;
	cout << "Nombre de la clase" << endl;
	cin >> clase;
	cout << "Tamaño del curso" << endl;
	cin >> n;
	
	Curso c(clase, n);
	
	vector<Alumno>_Alm(n);
	
	for(size_t i=0;i<_Alm.size();i++) { 
		cout <<"Nombre del alumno " << i+1 << endl;
		cin >> name_;
		_Alm[i].nombre=name_;
		cout <<"Nota del alumno " << i+1 << endl;
		cin >> nota_;
		_Alm[i].nota=nota_;
	}
	
	for(size_t i=0;i<_Alm.size();i++) { 
		c.AgregarAlumno(_Alm[i]);
	}
	int promedio = c.Prom();
	cout << "el promedio del curso es de " << promedio << endl;
	c.Calfi();
	
	return 0;
}

