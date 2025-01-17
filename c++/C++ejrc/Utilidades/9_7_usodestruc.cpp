#include <iostream>
#include <matrix>
#include <algorithm>
using namespace std;

struct participante {
	int dni;
	vector<int> pts;
	int total;
};

int main() {
	
	int n;
	cin >> n;
	
	vector<participante> v(n);
	
	for(int i=0;i<n;++i) { 
		int dni, nro;
		cin >> dni >> nro;
		v[nro-1].dni = dni;
	}
	
	for(participante &p : v){
		p.pts.resize(3,0);
	}
	
	
	int nro;
	cin >> nro;
	while (nro!=0){
		int prueba, pts;
		cin >> prueba >> pts;
		v[nro-1].pts[prueba-1] = pts;
		cin >> nro;
	}
	
	for(int nro=0;nro<n;++nro) { 
		v[nro].total = v[nro].pts[0]+v[nro].pts[1]+v[nro].pts[2];
	}
	
	int nro_ganador = 0, nro_segundo = 1;
	if (v[1].total>v[0].total){
		swap(nro_ganador, nro_segundo);
	}
	for(int nro=2;nro<n;++nro) { 
		if (v[nro].total>v[nro_ganador].total){
			nro_segundo = nro_ganador;
			nro_ganador = nro;
		} else{
			if (v[nro].total>v[nro_segundo].total){
			nro_segundo = nro;
			}
		}
	}
	
	cout << "El participante que gano es el " << v[nro_ganador].dni << endl;
	cout << "El participante que obtuvo el segundo lugar " << v[nro_segundo].dni << endl;
	cout << "El ganador obtuvo los siguientes puntajes: " << endl;
	cout << "Matematicas: " << v[nro_ganador].pts[0] << endl;
	cout << "Fisica: " << v[nro_ganador].pts[1] << endl;
	cout << "Computacion: " << v[nro_ganador].pts[2] << endl;
	
	return 0;
}

