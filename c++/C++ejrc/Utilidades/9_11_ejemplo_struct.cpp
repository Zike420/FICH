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
	ficha_alumno a1, a2, a3;
	a1.materias.resize(32);
	a1.materias[6] = 8;
	a1.materias[11] = 7;
	a1.materias[12] = 10;
	
	a2.materias.resize(32);
	a3.materias.resize(32);
	
	return 0;
}

