#include <iostream>
#include <vector>
using namespace std;

struct fecha {
	int dia, mes, anio;
};

struct ficha_alumno{
	int dni;
	string nombre, apellido;
	string carrera;
	string telefono;
	string direccion;
	string email;
	fecha fecha_ingreso;
	vector<int> materias;
};

int main() {
	vector<ficha_alumno> a(200);
	for(size_t i=0;i<a.size++i) { /// ó (ficha_alumno &f : a)
		a[i].materias.resize(32);	
	}
	
	return 0;
}

