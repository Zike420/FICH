#include <iostream>
#include <vector>
using namespace std;

int main() {
	vector<string> aprobado, noaprobado;
	
	
	int calificacion;
	cin >> calificacion;
	while(calificacion!=0){
		cin.ignore();
		string nombre;
		getline(cin, nombre);
		if (calificacion>=6){
			aprobado.push_back(nombre);
		}else{
			noaprobado.push_back(nombre);
		}
		cin >> calificacion;
	}
	cout << "Los aprobados:" << endl;
	for(string nom : aprobado){
		cout << nom << endl;
	}
	
	cout << "Los no aprobados:" << endl;
	for(string nom : noaprobado){
		cout << nom << endl;
	}
	
	return 0;
}

